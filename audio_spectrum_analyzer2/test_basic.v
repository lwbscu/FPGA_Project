// 基础硬件测试模块
module test_basic(
    input           clk,        // 12MHz时钟
    input           rst_n,      // 复位按键
    
    // 按键输入
    input   [3:0]   col,
    output  [3:0]   row,
    
    // 数码管
    output          seg_rck,
    output          seg_sck,
    output          seg_din,
    
    // LED测试
    output  reg     led         // 使用LED1作为测试
);

// 测试1：LED闪烁，验证时钟
reg [23:0] led_cnt;
always @(posedge clk) begin
    led_cnt <= led_cnt + 1'b1;
    led <= led_cnt[23];  // 约0.7秒闪烁一次
end

// 测试2：简单数码管显示
reg [3:0] test_num = 4'd5;  // 显示固定数字5

// 简化的数码管控制
segment_scan u_seg(
    .clk        (clk),
    .rst_n      (1'b1),     // 暂时不用复位
    .dat_1      (4'd0),
    .dat_2      (4'd0),
    .dat_3      (4'd0),
    .dat_4      (4'd0),
    .dat_5      (4'd0),
    .dat_6      (4'd0),
    .dat_7      (test_num), // 在第7位显示
    .dat_8      (4'd8),     // 在第8位显示8
    .dat_en     (8'b00000011), // 只显示最后两位
    .dot_en     (8'b00000000),
    .seg_rck    (seg_rck),
    .seg_sck    (seg_sck),
    .seg_din    (seg_din)
);

// 矩阵键盘扫描（简化版）
assign row = 4'b1110;  // 只扫描第一行

endmodule