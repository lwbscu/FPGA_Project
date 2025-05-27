// Beeper.v - 蜂鸣器驱动模块
// 根据按键输入产生对应频率的PWM信号驱动蜂鸣器

module Beeper(
    input           clk_in,     // 系统时钟
    input           rst_n_in,   // 复位信号
    input   [15:0]  key_out,    // 按键输入（高电平有效）
    output          beeper      // 蜂鸣器输出
);

// 内部信号
wire [15:0] cycle;              // PWM周期值
wire [15:0] duty;               // PWM占空比值

// 实例化音调转换模块
tone u_tone(
    .key_in     (key_out),
    .cycle      (cycle)
);

// 占空比设为周期的一半（50%占空比）
assign duty = cycle >> 1;

// 实例化PWM发生器模块
PWM #(
    .WIDTH(16)                  // 使用16位宽度
) u_pwm (
    .clk        (clk_in),
    .rst_n      (rst_n_in),
    .cycle      (cycle),
    .duty       (duty),
    .pwm_out    (beeper)
);

endmodule