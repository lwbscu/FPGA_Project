// ============================================================================
// Module: lcd_simple_test
// Description: 简化的LCD测试模块 - 只显示纯色测试
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_simple_test (
    input           clk_50mhz,
    input           rst_n,
    
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs,
    output          test_led
);

// 测试状态
reg [2:0] test_state;
reg [23:0] delay_counter;
reg [15:0] color_data;

parameter INIT = 3'b000;
parameter FILL_WHITE = 3'b001;
parameter FILL_RED = 3'b010;
parameter FILL_GREEN = 3'b011;
parameter FILL_BLUE = 3'b100;

// 颜色定义
parameter WHITE = 16'hFFFF;
parameter RED   = 16'hF800;
parameter GREEN = 16'h07E0;
parameter BLUE  = 16'h001F;

// 背光常开
assign lcd_blk = 1'b1;

// 简单的测试逻辑
always @(posedge clk_50mhz or negedge rst_n) begin
    if (!rst_n) begin
        test_state <= INIT;
        delay_counter <= 0;
        color_data <= WHITE;
    end
    else begin
        delay_counter <= delay_counter + 1;
        
        // 每隔一段时间切换颜色
        if (delay_counter == 24'hFFFFFF) begin
            delay_counter <= 0;
            case (test_state)
                INIT: begin
                    test_state <= FILL_WHITE;
                    color_data <= WHITE;
                end
                FILL_WHITE: begin
                    test_state <= FILL_RED;
                    color_data <= RED;
                end
                FILL_RED: begin
                    test_state <= FILL_GREEN;
                    color_data <= GREEN;
                end
                FILL_GREEN: begin
                    test_state <= FILL_BLUE;
                    color_data <= BLUE;
                end
                FILL_BLUE: begin
                    test_state <= FILL_WHITE;
                    color_data <= WHITE;
                end
            endcase
        end
    end
end

// 测试LED指示
assign test_led = delay_counter[23];

// 这里应该连接到实际的LCD驱动模块
// 为了测试，先将信号置为默认值
assign lcd_rst = rst_n;
assign lcd_dc = 1'b0;
assign lcd_sclk = 1'b0;
assign lcd_mosi = 1'b0;
assign lcd_cs = 1'b1;

endmodule
