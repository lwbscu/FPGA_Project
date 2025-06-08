// ============================================================================
// Module: lcd_color_test_240x160
// Description: LCD纯色测试模块 - 240x160分辨率，用于验证LCD基本显示功能
// Author: GitHub Copilot
// Date: 2025-06-01
// ============================================================================

module lcd_color_test_240x160 (
    input wire          clk_25MHz,      // 25MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [2:0]   test_color_id,  // 当前测试颜色ID
    output wire         display_active  // 显示活动指示
);

// 内部信号
wire    [8:0]   data;   
wire            en_write;
wire            wr_done;

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

// 状态定义
parameter IDLE = 2'b00, INIT = 2'b01, DISPLAY = 2'b10;
reg [1:0] state;

// 颜色切换定时器 (每1秒切换一次颜色)
reg [24:0] color_timer;
parameter COLOR_SWITCH_TIME = 25'd25000000; // 1秒切换间隔 (25MHz * 1s = 25M)
reg [2:0] current_color; // 3位支持8种颜色

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 简化的坐标计算 - 避免除法运算
reg [7:0] x_pos;  // 0-239
reg [7:0] y_pos;  // 0-159
reg [17:0] x_counter, y_counter;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// 输出状态信号
assign test_color_id = current_color;
assign display_active = (state == DISPLAY);

// 颜色定义（RGB332格式）
parameter [7:0] BLACK   = 8'h00;  // 000_000_00
parameter [7:0] WHITE   = 8'hFF;  // 111_111_11
parameter [7:0] RED     = 8'hE0;  // 111_000_00
parameter [7:0] GREEN   = 8'h1C;  // 000_111_00
parameter [7:0] BLUE    = 8'h03;  // 000_000_11
parameter [7:0] YELLOW  = 8'hFC;  // 111_111_00
parameter [7:0] CYAN    = 8'h1F;  // 000_111_11
parameter [7:0] MAGENTA = 8'hE3;  // 111_000_11

// 主状态机
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        x_counter <= 18'h0;
        y_counter <= 18'h0;
        display_en <= 1'b0;
        current_color <= 3'b000;
        color_timer <= 25'h0;
    end else begin
        case (state)
            IDLE: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'h0;
                    x_counter <= 18'h0;
                    y_counter <= 18'h0;
                    display_en <= 1'b1;
                end else begin
                    state <= INIT;
                end
            end
            
            INIT: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'h0;
                    x_counter <= 18'h0;
                    y_counter <= 18'h0;
                    display_en <= 1'b1;
                end
            end
            
            DISPLAY: begin
                // 颜色切换计时
                if (color_timer >= COLOR_SWITCH_TIME) begin
                    color_timer <= 25'h0;
                    // 循环切换颜色
                    if (current_color >= 3'd7) begin
                        current_color <= 3'd0;
                    end else begin
                        current_color <= current_color + 1'b1;
                    end
                end else begin
                    color_timer <= color_timer + 1'b1;
                end
                
                // 像素计数器逻辑 - 简化的坐标计算
                if (wr_done) begin
                    if (x_counter < 18'd239) begin
                        x_counter <= x_counter + 1'b1;
                    end else begin
                        x_counter <= 18'h0;
                        if (y_counter < 18'd159) begin
                            y_counter <= y_counter + 1'b1;
                        end else begin
                            y_counter <= 18'h0;
                        end
                    end
                    
                    if (pixel_counter < 18'd38399) begin // 240*160-1
                        pixel_counter <= pixel_counter + 1'b1;
                    end else begin
                        pixel_counter <= 18'h0;
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

// 像素数据处理 - 根据当前颜色输出相应颜色
always @(*) begin
    // 直接使用计数器作为坐标
    x_pos = x_counter[7:0];
    y_pos = y_counter[7:0];
    
    // 根据当前颜色选择输出数据
    case (current_color)
        3'd0: display_data = {1'b1, BLACK};    // 黑色
        3'd1: display_data = {1'b1, WHITE};    // 白色
        3'd2: display_data = {1'b1, RED};      // 红色
        3'd3: display_data = {1'b1, GREEN};    // 绿色
        3'd4: display_data = {1'b1, BLUE};     // 蓝色
        3'd5: display_data = {1'b1, YELLOW};   // 黄色
        3'd6: display_data = {1'b1, CYAN};     // 青色
        3'd7: display_data = {1'b1, MAGENTA};  // 洋红色
        default: display_data = {1'b1, BLACK};
    endcase
end

// 输出控制逻辑
assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// LCD初始化模块实例化
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_25MHz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_25MHz),
    .sys_rst_n(rst_n),
    .data(data),
    .en_write(en_write),
    .wr_done(wr_done),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi)
);

endmodule
