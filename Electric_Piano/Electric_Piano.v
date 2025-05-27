// Electric_Piano.v - 顶层模块
// 简易电子琴设计，通过矩阵键盘输入，驱动蜂鸣器发出不同音调

module Electric_Piano(
    input           clk,        // 系统时钟 12MHz
    input           rst_n,      // 复位信号，低电平有效
    input   [3:0]   col,        // 矩阵键盘列输入
    output  [3:0]   row,        // 矩阵键盘行输出
    output          beeper      // 蜂鸣器输出
);

// 内部信号定义
wire [15:0] key_out;           // 键盘输出状态
wire [15:0] key_pulse;         // 键盘脉冲输出（本设计中未使用）

// 实例化矩阵键盘驱动模块
Array_KeyBoard u1(
    .clk        (clk),
    .rst_n      (rst_n),
    .col        (col),
    .row        (row),
    .key_out    (key_out),
    .key_pulse  (key_pulse)
);

// 实例化蜂鸣器驱动模块
// 注意：key_out是低电平有效，需要取反
Beeper u2(
    .clk_in     (clk),
    .rst_n_in   (rst_n),
    .key_out    (~key_out),    // 按位取反，转换为高电平有效
    .beeper     (beeper)
);

endmodule