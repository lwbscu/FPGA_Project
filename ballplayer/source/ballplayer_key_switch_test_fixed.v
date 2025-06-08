// ============================================================================
// Module: ballplayer_key_switch_test
// Description: ballplayer项目按键切换图片显示模块 - 使用16个矩阵按键手动切换图片
// Author: GitHub Copilot
// Date: 2025-06-07
// ============================================================================

module ballplayer_key_switch_test_fixed(
    // 系统时钟和复位
    input           clk,            // 12MHz系统时钟 PIN_J5
    input           rst_n,          // 低电平复位信号 PIN_J14
    
    // 矩阵键盘接口 (4x4)
    input   [3:0]   col,            // 列检测信号 [3:0] PIN_P6,PIN_R5,PIN_L7,PIN_P4
    output  [3:0]   row,            // 行扫描信号 [3:0] PIN_R7,PIN_P7,PIN_P8,PIN_P9
    
    // LCD显示接口 - SPI协议
    output          lcd_rst,        // LCD复位 PIN_P15
    output          lcd_blk,        // LCD背光控制 PIN_D7
    output          lcd_dc,         // 数据/命令选择 PIN_R14
    output          lcd_sclk,       // SPI时钟 PIN_R11
    output          lcd_mosi,       // SPI数据输出 PIN_P12
    output          lcd_cs,         // LCD片选 PIN_R9
    
    // LED指示灯
    output  [7:0]   led             // 状态指示LED [7:0]
);

// 内部信号定义
wire            clk_25mhz;          // PLL生成的25MHz时钟
wire [2:0]      current_image_id;   // 当前图片ID
wire            display_active;     // 显示活动状态

// 矩阵键盘信号
wire [15:0]     key_out;            // 键盘状态输出
wire [15:0]     key_pulse;          // 键盘脉冲信号
wire            any_key_pressed;    // 任意键按下信号

// PLL时钟生成 - 为LCD提供25MHz时钟
ballplayer_pll pll_inst(
    .inclk0(clk),           // 12MHz输入时钟
    .c0(),                  // 24MHz输出时钟（未使用）
    .c1(clk_25mhz)         // 25MHz输出时钟（LCD使用）
);

// 复制矩阵键盘模块到ballplayer项目
array_keyboard_fixed #(
    .CNT_200HZ(60000)       // 12MHz时钟下5ms计数值
) keyboard_inst (
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .key_out(key_out),
    .key_pulse(key_pulse)
);

// 任意键按下检测 - 16个按键中任意一个按下都产生脉冲
assign any_key_pressed = |key_pulse; // 对所有按键脉冲进行或运算

// LCD多图片显示模块 - 修改为按键触发切换
lcd_key_switch_display_240x160_fixed lcd_display_inst(
    .clk_25MHz(clk_25mhz),
    .rst_n(rst_n),
    .key_switch(any_key_pressed),   // 按键切换信号
    .lcd_rst(lcd_rst),
    .lcd_blk(lcd_blk),
    .lcd_dc(lcd_dc),
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs),
    .current_image_id(current_image_id),
    .display_active(display_active)
);

// LED状态指示
assign led[0] = rst_n;              // 系统复位状态指示（正常时应该亮）
assign led[1] = display_active;     // 显示活动状态
assign led[2] = current_image_id[0]; // 当前图片ID bit 0
assign led[3] = current_image_id[1]; // 当前图片ID bit 1
assign led[4] = current_image_id[2]; // 当前图片ID bit 2
assign led[5] = any_key_pressed;    // 按键按下指示
assign led[6] = |key_out[15:8];     // 高8位按键状态
assign led[7] = |key_out[7:0];      // 低8位按键状态

endmodule
