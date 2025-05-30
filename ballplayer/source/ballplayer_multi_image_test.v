// ============================================================================
// Module: ballplayer_multi_image_test
// Description: ballplayer项目多图片显示测试模块 - 专门用于五张图片循环显示
// Author: GitHub Copilot
// Date: 2025-05-30
// ============================================================================

module ballplayer_multi_image_test(
    // 系统时钟和复位
    input           clk,            // 12MHz系统时钟 PIN_J5
    input           rst_n,          // 低电平复位信号 PIN_J14
    
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

// PLL时钟生成 - 为LCD提供25MHz时钟（降低时钟频率以改善时序）
ballplayer_pll pll_inst(
    .inclk0(clk),           // 12MHz输入时钟
    .c0(),                  // 24MHz输出时钟（未使用）
    .c1(clk_25mhz)         // 25MHz输出时钟（LCD使用）
);

// LCD多图片显示模块
lcd_multi_image_display_240x160 lcd_multi_display_inst(
    .clk_25MHz(clk_25mhz),
    .rst_n(rst_n),
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
assign led[5] = 1'b0;               // 预留
assign led[6] = 1'b0;               // 预留
assign led[7] = 1'b1;               // 电源指示

endmodule
