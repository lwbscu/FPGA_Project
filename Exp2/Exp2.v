// Module: Exp2.v
// Function: Top-level module for the 0-99 stopwatch.

module Exp2 (
    input clk,       // 12MHz 板载时钟
    input rst_n,     // 低电平有效复位按键
	 input key2,		// 暂停计数按键
    // 直接驱动两个数码管的9位输出信号
    output [8:0] segment_led_1,
    output [8:0] segment_led_2
    // ===============================================
);

    // 用于连接模块的内部信号线
    wire sec_pulse;
    wire [3:0] bcd_tens_w;
    wire [3:0] bcd_ones_w;
	 wire count_en;

	 reg key2_prev;
	 wire key2_negedge;
	 reg is_paused;
	 
	 // 简化的边沿检测逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            key2_prev <= 1'b1; // 按键默认未按下（高电平）
        end else begin
            key2_prev <= key2; // 每个时钟周期更新一次状态
        end
    end
	 
	 // 当 key2 从 1 (上一周期) 变为 0 (当前周期) 时，产生一个下降沿脉冲
    assign key2_negedge = key2_prev && !key2;

    // 暂停状态切换逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            is_paused <= 1'b0; // 复位后，默认进入运行状态
        end else begin
            if (key2_negedge) begin // 每当检测到KEY2被按下
                is_paused <= ~is_paused; // 翻转暂停状态
            end
        end
    end
    
    // 生成最终的计数使能信号
    assign count_en = sec_pulse && !is_paused;
	 
    // 实例化秒脉冲发生器 (此模块无改动)
    second_pulse_generator u_pulse_gen (
        .clk        (clk),
        .rst_n      (rst_n),
        .sec_pulse  (sec_pulse)
    );

    // 实例化 0-99 BCD 计数器 (此模块无改动)
    counter_0_to_99 u_counter (
        .clk        (clk),
        .rst_n      (rst_n),
        .count_en  (count_en),
        .bcd_tens   (bcd_tens_w), // 十位 BCD 输出
        .bcd_ones   (bcd_ones_w)  // 个位 BCD 输出
    );

    // ==================== 已修改 ====================
    // 实例化新的直接驱动显示模块
    segment u_segment (
        .bcd_tens_in        (bcd_tens_w),      // 连接来自计数器的"十位"码
        .bcd_ones_in        (bcd_ones_w),      // 连接来自计数器的"个位"码
        .segment_led_tens   (segment_led_1),   // 连接到顶层"十位"数码管输出
        .segment_led_ones   (segment_led_2)    // 连接到顶层"个位"数码管输出
    );
    // ===============================================

endmodule