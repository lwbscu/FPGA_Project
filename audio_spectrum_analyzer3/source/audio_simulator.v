// --------------------------------------------------------------------
// Module: audio_simulator
// Description: 模拟音频输入，用于测试
// --------------------------------------------------------------------
module audio_simulator(
    input           clk,
    input           rst_n,
    input   [1:0]   mode,           // 模拟模式
    output  [7:0]   audio_data,
    output          audio_valid
);

// 参数定义
parameter CNT_48KHZ = 250;  // 12MHz / 48kHz = 250

// 内部信号
reg [7:0]  cnt_48khz;
reg        clk_48khz;
reg [7:0]  phase_acc;
reg [7:0]  audio_reg;

// 48kHz采样时钟生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_48khz <= 8'd0;
        clk_48khz <= 1'b0;
    end else if (cnt_48khz >= CNT_48KHZ - 1) begin
        cnt_48khz <= 8'd0;
        clk_48khz <= 1'b1;
    end else begin
        cnt_48khz <= cnt_48khz + 1'b1;
        clk_48khz <= 1'b0;
    end
end

// 相位累加器
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        phase_acc <= 8'd0;
    end else if (clk_48khz) begin
        case (mode)
            2'b00: phase_acc <= phase_acc + 8'd1;  // 低频
            2'b01: phase_acc <= phase_acc + 8'd4;  // 中频
            2'b10: phase_acc <= phase_acc + 8'd16; // 高频
            2'b11: phase_acc <= phase_acc + 8'd64; // 超高频
        endcase
    end
end

// 波形生成（简单正弦波近似）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        audio_reg <= 8'd128;
    end else if (clk_48khz) begin
        // 简单的三角波生成
        if (phase_acc < 128)
            audio_reg <= phase_acc + 64;
        else
            audio_reg <= 320 - phase_acc;
    end
end

assign audio_data = audio_reg;
assign audio_valid = clk_48khz;

endmodule