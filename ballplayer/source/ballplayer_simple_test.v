// ============================================================================
// Module: ballplayer_simple_test
// Description: 简单的LCD测试顶层模块
// Author: GitHub Copilot  
// Date: 2025-05-31
// ============================================================================

module ballplayer_simple_test (
    input wire clk,         // 12MHz时钟输入
    input wire rst_n,       // 复位信号
    
    // LCD接口
    output wire lcd_rst,    // LCD复位
    output wire lcd_blk,    // LCD背光
    output wire lcd_dc,     // LCD数据/命令选择
    output wire lcd_sclk,   // LCD SPI时钟
    output wire lcd_mosi,   // LCD SPI数据
    output wire lcd_cs,     // LCD片选
    
    // LED状态指示
    output wire [7:0] led   // LED指示
);

// 实例化LCD简单测试模块
lcd_simple_black_white_test lcd_test_inst(
    .clk_12MHz(clk),
    .rst_n(rst_n),
    .lcd_rst(lcd_rst),
    .lcd_blk(lcd_blk), 
    .lcd_dc(lcd_dc),
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs),
    .led(led)
);

endmodule
