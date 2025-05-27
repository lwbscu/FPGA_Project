module audio_simulator(
    input           clk,
    input           rst_n,
    output reg [15:0] audio_data,
    output reg      data_valid
);

// 采样率分频器 - 生成48kHz采样率
parameter CLK_FREQ = 12_000_000;
parameter SAMPLE_RATE = 48_000;
parameter DIV_FACTOR = CLK_FREQ / SAMPLE_RATE;

reg [7:0] div_cnt;
reg sample_clk;

// 生成采样时钟
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        div_cnt <= 8'd0;
        sample_clk <= 1'b0;
    end else begin
        if (div_cnt >= DIV_FACTOR - 1) begin
            div_cnt <= 8'd0;
            sample_clk <= 1'b1;
        end else begin
            div_cnt <= div_cnt + 1'b1;
            sample_clk <= 1'b0;
        end
    end
end

// 相位累加器 - 生成不同频率的正弦波
reg [15:0] phase_acc_1;  // 1kHz
reg [15:0] phase_acc_2;  // 2kHz
reg [15:0] phase_acc_3;  // 5kHz
reg [7:0]  noise_lfsr;   // 伪随机噪声

// 频率控制字
parameter FREQ_1K = 16'd1365;   // 1kHz @ 48kHz采样率
parameter FREQ_2K = 16'd2731;   // 2kHz
parameter FREQ_5K = 16'd6827;   // 5kHz

// 正弦查找表（简化版，16个点）
reg [7:0] sin_lut [0:15];
initial begin
    sin_lut[0]  = 8'd128;
    sin_lut[1]  = 8'd177;
    sin_lut[2]  = 8'd218;
    sin_lut[3]  = 8'd246;
    sin_lut[4]  = 8'd255;
    sin_lut[5]  = 8'd246;
    sin_lut[6]  = 8'd218;
    sin_lut[7]  = 8'd177;
    sin_lut[8]  = 8'd128;
    sin_lut[9]  = 8'd79;
    sin_lut[10] = 8'd38;
    sin_lut[11] = 8'd10;
    sin_lut[12] = 8'd0;
    sin_lut[13] = 8'd10;
    sin_lut[14] = 8'd38;
    sin_lut[15] = 8'd79;
end

// 生成模拟音频数据
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        audio_data <= 16'd0;
        data_valid <= 1'b0;
        phase_acc_1 <= 16'd0;
        phase_acc_2 <= 16'd0;
        phase_acc_3 <= 16'd0;
        noise_lfsr <= 8'hFF;
    end else if (sample_clk) begin
        // 更新相位累加器
        phase_acc_1 <= phase_acc_1 + FREQ_1K;
        phase_acc_2 <= phase_acc_2 + FREQ_2K;
        phase_acc_3 <= phase_acc_3 + FREQ_5K;
        
        // 生成噪声（LFSR）
        noise_lfsr <= {noise_lfsr[6:0], noise_lfsr[7] ^ noise_lfsr[5]};
        
        // 混合信号：3个正弦波 + 噪声
        audio_data <= {sin_lut[phase_acc_1[15:12]], 8'd0} +
                     {sin_lut[phase_acc_2[15:12]], 8'd0} +
                     {sin_lut[phase_acc_3[15:12]], 8'd0} +
                     {noise_lfsr, 8'd0};
        
        data_valid <= 1'b1;
    end else begin
        data_valid <= 1'b0;
    end
end

endmodule