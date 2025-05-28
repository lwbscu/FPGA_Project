// ============================================================================
// Module: lcd_full_init_test
// Description: 完整的LCD初始化测试模块 - 专门用于解决深蓝色显示问题
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_full_init_test (
    input           clk_50mhz,
    input           rst_n,
    
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs,
    output          led1,      // 工作状态指示
    output          led2       // 初始化完成指示
);

// 状态机定义
reg [3:0] state;
reg [23:0] delay_counter;
reg [15:0] pixel_counter;
reg [7:0] init_step;

// 状态定义
parameter RESET         = 4'h0;
parameter DELAY1        = 4'h1; 
parameter INIT_CMD      = 4'h2;
parameter INIT_WAIT     = 4'h3;
parameter SET_WINDOW    = 4'h4;
parameter FILL_WHITE    = 4'h5;
parameter DONE          = 4'h6;

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

// ST7789V完整初始化序列
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
                if (delay_counter == 24'h50000) begin // 较长复位时间
                    state <= DELAY1;
                    delay_counter <= 0;
                end
            end
            
            DELAY1: begin
                lcd_rst_reg <= 1'b1;
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h100000) begin // 复位释放后延时
                    state <= INIT_CMD;
                    delay_counter <= 0;
                    init_step <= 0;
                end
            end
            
            INIT_CMD: begin
                if (!write_enable) begin
                    case (init_step)
                        // ST7789V初始化序列
                        0: begin
                            write_data <= 9'h011;  // Sleep Out
                            write_enable <= 1'b1;
                            init_step <= 1;
                        end
                        1: begin
                            write_data <= 9'h03A;  // Pixel Format Set
                            write_enable <= 1'b1;
                            init_step <= 2;
                        end
                        2: begin
                            write_data <= 9'h155;  // 16bit RGB565
                            write_enable <= 1'b1;
                            init_step <= 3;
                        end
                        3: begin
                            write_data <= 9'h036;  // Memory Access Control
                            write_enable <= 1'b1;
                            init_step <= 4;
                        end
                        4: begin
                            write_data <= 9'h100;  // 正常方向
                            write_enable <= 1'b1;
                            init_step <= 5;
                        end
                        5: begin
                            write_data <= 9'h021;  // Inversion On
                            write_enable <= 1'b1;
                            init_step <= 6;
                        end
                        6: begin
                            write_data <= 9'h013;  // Normal Display Mode On
                            write_enable <= 1'b1;
                            init_step <= 7;
                        end
                        7: begin
                            write_data <= 9'h029;  // Display On
                            write_enable <= 1'b1;
                            init_step <= 8;
                        end
                        8: begin
                            state <= INIT_WAIT;
                            init_step <= 0;
                        end
                    endcase
                end else if (write_done) begin
                    write_enable <= 1'b0;
                end
            end
            
            INIT_WAIT: begin
                delay_counter <= delay_counter + 1;
                if (delay_counter == 24'h200000) begin // 等待LCD稳定
                    state <= SET_WINDOW;
                    delay_counter <= 0;
                    init_step <= 0;
                end
            end
            
            SET_WINDOW: begin
                if (!write_enable) begin
                    case (init_step)
                        // 设置显示窗口 240x320
                        0: begin
                            write_data <= 9'h02A;  // Column Address Set
                            write_enable <= 1'b1;
                            init_step <= 1;
                        end
                        1: begin
                            write_data <= 9'h100;  // Start Column High
                            write_enable <= 1'b1;
                            init_step <= 2;
                        end
                        2: begin
                            write_data <= 9'h100;  // Start Column Low
                            write_enable <= 1'b1;
                            init_step <= 3;
                        end
                        3: begin
                            write_data <= 9'h100;  // End Column High
                            write_enable <= 1'b1;
                            init_step <= 4;
                        end
                        4: begin
                            write_data <= 9'h1EF;  // End Column Low (239)
                            write_enable <= 1'b1;
                            init_step <= 5;
                        end
                        5: begin
                            write_data <= 9'h02B;  // Row Address Set
                            write_enable <= 1'b1;
                            init_step <= 6;
                        end
                        6: begin
                            write_data <= 9'h100;  // Start Row High
                            write_enable <= 1'b1;
                            init_step <= 7;
                        end
                        7: begin
                            write_data <= 9'h100;  // Start Row Low
                            write_enable <= 1'b1;
                            init_step <= 8;
                        end
                        8: begin
                            write_data <= 9'h101;  // End Row High
                            write_enable <= 1'b1;
                            init_step <= 9;
                        end
                        9: begin
                            write_data <= 9'h13F;  // End Row Low (319)
                            write_enable <= 1'b1;
                            init_step <= 10;
                        end
                        10: begin
                            write_data <= 9'h02C;  // Memory Write
                            write_enable <= 1'b1;
                            init_step <= 11;
                        end
                        11: begin
                            state <= FILL_WHITE;
                            pixel_counter <= 0;
                        end
                    endcase
                end else if (write_done) begin
                    write_enable <= 1'b0;
                end
            end
            
            FILL_WHITE: begin
                if (!write_enable) begin
                    if (pixel_counter < 16'hFFFF) begin // 填充足够的像素
                        write_data <= 9'h1FF;  // 白色像素数据
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
                // 完成状态，继续输出白色
                if (!write_enable) begin
                    write_data <= 9'h1FF;  // 持续输出白色
                    write_enable <= 1'b1;
                end else if (write_done) begin
                    write_enable <= 1'b0;
                end
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
