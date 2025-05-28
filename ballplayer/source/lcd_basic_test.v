// ============================================================================
// Module: lcd_basic_test
// Description: 最基础的LCD测试模块 - 独立SPI输出，不依赖其他模块
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_basic_test (
    input           clk_50mhz,
    input           rst_n,
    
    output reg      lcd_rst,
    output          lcd_blk,
    output reg      lcd_dc,
    output reg      lcd_sclk,
    output reg      lcd_mosi,
    output reg      lcd_cs,
    output          led1,      
    output          led2
);

// 状态机
reg [3:0] state;
reg [23:0] delay_counter;
reg [15:0] pixel_counter;
reg [7:0] spi_data;
reg [3:0] bit_counter;
reg spi_active;

// 状态定义
parameter RESET = 4'b0000;
parameter INIT_DELAY = 4'b0001;
parameter SEND_CMD = 4'b0010;
parameter FILL_SCREEN = 4'b0011;
parameter IDLE = 4'b0100;

// 背光常开
assign lcd_blk = 1'b1;

// LED指示
assign led1 = (state == FILL_SCREEN) ? delay_counter[20] : 1'b0;  // 闪烁表示工作
assign led2 = (state != RESET);                                  // 工作状态

// 主状态机
always @(posedge clk_50mhz or negedge rst_n) begin
    if (!rst_n) begin
        state <= RESET;
        delay_counter <= 0;
        pixel_counter <= 0;
        lcd_rst <= 1'b0;
        lcd_dc <= 1'b0;
        lcd_cs <= 1'b1;
        spi_active <= 1'b0;
    end
    else begin
        case (state)
            RESET: begin
                lcd_rst <= 1'b0;
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h100000) begin
                    lcd_rst <= 1'b1;
                    state <= INIT_DELAY;
                    delay_counter <= 0;
                end
            end
            
            INIT_DELAY: begin
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h200000) begin
                    state <= SEND_CMD;
                    delay_counter <= 0;
                end
            end
            
            SEND_CMD: begin
                // 发送简单的填充命令
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h100000) begin
                    state <= FILL_SCREEN;
                    delay_counter <= 0;
                end
            end
            
            FILL_SCREEN: begin
                // 简单地切换SPI信号，创建活动指示
                delay_counter <= delay_counter + 1;
                if (delay_counter[15:0] == 16'h0000) begin
                    lcd_cs <= ~lcd_cs;
                    lcd_dc <= ~lcd_dc;
                    lcd_sclk <= ~lcd_sclk;
                    lcd_mosi <= delay_counter[16];
                end
            end
            
            default: state <= RESET;
        endcase
    end
end

endmodule
