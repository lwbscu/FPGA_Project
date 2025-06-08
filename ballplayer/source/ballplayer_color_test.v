// ============================================================================
// Module: ballplayer_color_test
// Description: 球员液晶屏颜色测试顶层模块 - 测试240x160分辨率纯色显示
// Author: GitHub Copilot
// Date: 2025-06-01
// ============================================================================

module ballplayer_color_test (
    input wire          clk,            // 12MHz输入时钟
    input wire          rst_n,          // 复位信号
    
    // LCD接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // LED状态指示
    output wire [7:0]   led             // LED指示灯
);

// PLL生成的时钟信号
wire clk_25MHz;
wire pll_locked;

// 实例化PLL
ballplayer_pll pll_inst (
    .inclk0(clk),           // 12MHz输入
    .c0(),                  // 未使用
    .c1(clk_25MHz),         // 25MHz输出
    .locked(pll_locked)     // PLL锁定信号
);

// 颜色测试信号
wire [2:0] test_color_id;
wire display_active;

// 实例化LCD颜色测试显示模块
lcd_color_test_240x160 lcd_test_inst (
    .clk_25MHz(clk_25MHz),
    .rst_n(rst_n & pll_locked),
    .lcd_rst(lcd_rst),
    .lcd_blk(lcd_blk),
    .lcd_dc(lcd_dc),
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs),
    .test_color_id(test_color_id),
    .display_active(display_active)
);

// LED状态指示
assign led[2:0] = test_color_id;    // 显示当前颜色ID
assign led[3] = display_active;     // 显示活动指示
assign led[4] = pll_locked;         // PLL锁定指示
assign led[7:5] = 3'b000;           // 未使用的LED，保持关闭

endmodule
