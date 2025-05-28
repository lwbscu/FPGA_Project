// ============================================================================
// Module: lcd_debug_test
// Description: 极简LCD调试测试模块 - 用于诊断LCD显示问题
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_debug_test (
    input           clk_50mhz,
    input           rst_n,
    
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs,
    output          led1,      // 工作状态指示
    output          led2       // 初始化状态指示
);

// 状态机定义
reg [3:0] state;
reg [23:0] delay_counter;
reg [15:0] pixel_counter;
reg [7:0] init_step;

// 状态定义
parameter RESET         = 4'h0;
parameter DELAY1        = 4'h1;
parameter INIT_START    = 4'h2;
parameter INIT_CMD      = 4'h3;
parameter INIT_WAIT     = 4'h4;
parameter FILL_SCREEN   = 4'h5;
parameter FILL_DATA     = 4'h6;
parameter DONE          = 4'h7;

// LCD复位和背光控制
reg lcd_rst_reg;
assign lcd_rst = lcd_rst_reg;
assign lcd_blk = 1'b1;  // 背光常开

// 内部信号
reg [8:0] write_data;
reg write_enable;
wire write_done;

// LED状态指示
assign led1 = (state != RESET && state != DELAY1);  // 非复位状态
assign led2 = (state == DONE);                      // 完成状态

// 主状态机
always @(posedge clk_50mhz or negedge rst_n) begin
    if (!rst_n) begin
        state <= RESET;
        delay_counter <= 0;
        pixel_counter <= 0;
        init_step <= 0;
        lcd_rst_reg <= 1'b0;
        write_data <= 0;
        write_enable <= 1'b0;
    end
    else begin
        case (state)
            RESET: begin
                lcd_rst_reg <= 1'b0;
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h10000) begin // 短延时
                    state <= DELAY1;
                    delay_counter <= 0;
                end
            end
            
            DELAY1: begin
                lcd_rst_reg <= 1'b1;
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h20000) begin
                    state <= INIT_START;
                    delay_counter <= 0;
                end
            end
            
            INIT_START: begin
                // 发送基本初始化命令
                case (init_step)
                    0: begin
                        write_data <= 9'h011;  // 睡眠退出
                        write_enable <= 1'b1;
                        init_step <= 1;
                    end
                    1: begin
                        if (write_done) begin
                            write_enable <= 1'b0;
                            state <= INIT_WAIT;
                            delay_counter <= 0;
                        end
                    end
                endcase
            end
            
            INIT_WAIT: begin
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h100000) begin // 等待LCD稳定
                    state <= FILL_SCREEN;
                    delay_counter <= 0;
                    init_step <= 0;
                end
            end
            
            FILL_SCREEN: begin
                // 设置显示开启
                case (init_step)
                    0: begin
                        write_data <= 9'h029;  // 显示开启
                        write_enable <= 1'b1;
                        init_step <= 1;
                    end
                    1: begin
                        if (write_done) begin
                            write_enable <= 1'b0;
                            state <= FILL_DATA;
                            pixel_counter <= 0;
                        end
                    end
                endcase
            end
            
            FILL_DATA: begin
                // 循环发送白色像素数据
                if (!write_enable) begin
                    if (pixel_counter < 16'h4B00) begin // 240*320/4个像素
                        write_data <= 9'h1FF;  // 白色数据
                        write_enable <= 1'b1;
                        pixel_counter <= pixel_counter + 1;
                    end else begin
                        state <= DONE;
                    end
                end else if (write_done) begin
                    write_enable <= 1'b0;
                end
            end
            
            DONE: begin
                // 完成状态，保持不变
            end
            
            default: state <= RESET;
        endcase
    end
end

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .data(write_data),
    .en_write(write_enable),
    .wr_done(write_done),
    .cs(lcd_cs),
    .sclk(lcd_sclk),
    .dc(lcd_dc),
    .mosi(lcd_mosi)
);

endmodule
