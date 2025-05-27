// --------------------------------------------------------------------
// Module: db_calculator
// Description: 计算音频信号的分贝值
// --------------------------------------------------------------------
module db_calculator(
    input           clk,
    input           rst_n,
    input   [7:0]   audio_data,
    input           audio_valid,
    output  [15:0]  db_value
);

// 参数定义
parameter WINDOW_SIZE = 1024;  // 计算窗口大小

// 内部信号
reg [31:0] sum_square;         // 平方和
reg [10:0] sample_count;       // 采样计数
reg [15:0] rms_value;          // RMS值
reg [15:0] db_reg;             // 分贝值寄存器

// 查找表简化对数计算（16个值）
reg [7:0] log_lut [0:15];
initial begin
    log_lut[0]  = 8'd0;    // log(1)
    log_lut[1]  = 8'd30;   // log(2)
    log_lut[2]  = 8'd48;   // log(3)
    log_lut[3]  = 8'd60;   // log(4)
    log_lut[4]  = 8'd70;   // log(5)
    log_lut[5]  = 8'd78;   // log(6)
    log_lut[6]  = 8'd85;   // log(7)
    log_lut[7]  = 8'd90;   // log(8)
    log_lut[8]  = 8'd95;   // log(9)
    log_lut[9]  = 8'd100;  // log(10)
    log_lut[10] = 8'd104;  // log(11)
    log_lut[11] = 8'd108;  // log(12)
    log_lut[12] = 8'd111;  // log(13)
    log_lut[13] = 8'd114;  // log(14)
    log_lut[14] = 8'd117;  // log(15)
    log_lut[15] = 8'd120;  // log(16)
end

// RMS计算
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sum_square <= 32'd0;
        sample_count <= 11'd0;
        rms_value <= 16'd0;
    end else if (audio_valid) begin
        // 累加平方值
        sum_square <= sum_square + audio_data * audio_data;
        
        if (sample_count == WINDOW_SIZE - 1) begin
            // 计算RMS（简化：取平均后开方）
            rms_value <= sum_square[31:16]; // 简化处理
            sum_square <= 32'd0;
            sample_count <= 11'd0;
        end else begin
            sample_count <= sample_count + 1'b1;
        end
    end
end

// 分贝计算（简化）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        db_reg <= 16'd0;
    end else if (rms_value > 0) begin
        // 简化的dB计算：20*log10(rms_value/reference)
        // 使用查找表近似
        if (rms_value[15:12] < 16)
            db_reg <= {8'd0, log_lut[rms_value[15:12]]};
        else
            db_reg <= 16'd120; // 最大120dB
    end
end

assign db_value = db_reg;

endmodule