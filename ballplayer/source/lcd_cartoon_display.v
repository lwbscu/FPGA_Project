// ============================================================================
// Module: lcd_cartoon_display
// Description: 卡通图案显示模块 - 定时切换各种搞笑图案
// Author: GitHub Copilot
// Date: 2025-05-29
// ============================================================================

module lcd_cartoon_display (
    input wire          clk_50MHz,      // 50MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [2:0]   pattern_id      // 当前图案ID
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

// 图案切换定时器 (每2秒切换一次 @ 50MHz)
reg [25:0] pattern_timer;
parameter PATTERN_SWITCH_TIME = 26'd100000000; // 2秒

// 图案选择 (8种图案)
reg [2:0] current_pattern;
assign pattern_id = current_pattern;

// 显示坐标和计数器
reg [16:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 当前像素的坐标计算
wire [7:0] pixel_x = (pixel_counter >> 1) % 240; // X坐标 (0-239)
wire [8:0] pixel_y = (pixel_counter >> 1) / 240; // Y坐标 (0-319)

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// LCD SPI写入模块
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50MHz),
    .sys_rst_n(rst_n),
    .data(data),
    .en_write(en_write),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .wr_done(wr_done)
);

// LCD初始化模块
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_50MHz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// 主状态机
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= INIT;
        pixel_counter <= 17'd0;
        pattern_timer <= 26'd0;
        current_pattern <= 3'd0;
    end
    else begin
        case (state)
            INIT: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 17'd0;
                end
            end
            
            DISPLAY: begin
                if (wr_done && display_en) begin
                    pixel_counter <= pixel_counter + 17'd1;
                    if (pixel_counter >= 17'd153600) begin // 240*320*2 = 153600
                        pixel_counter <= 17'd0;
                        
                        // 图案切换定时器
                        pattern_timer <= pattern_timer + 26'd1;
                        if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                            pattern_timer <= 26'd0;
                            current_pattern <= current_pattern + 3'd1;
                            if (current_pattern >= 3'd7)
                                current_pattern <= 3'd0;
                        end
                    end
                end
            end
            
            default: state <= INIT;
        endcase
    end
end

// 数据输出控制
always @(*) begin
    if (state == INIT) begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
    else if (state == DISPLAY) begin
        display_en = 1'b1;
        display_data = get_pixel_color(pixel_x, pixel_y, current_pattern);
    end
    else begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
end

assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// 简化的图案颜色生成函数 - 避免复杂数学运算
function [8:0] get_pixel_color;
    input [7:0] x;      // X坐标 (0-239)
    input [8:0] y;      // Y坐标 (0-319)
    input [2:0] pattern; // 图案ID
    
    reg [15:0] color_16bit;
    
    begin
        // 默认背景色（黑色）
        color_16bit = 16'h0000;
        
        case (pattern)
            // 图案0: 简单红色方块
            3'd0: begin
                if (x >= 60 && x <= 180 && y >= 80 && y <= 240) begin
                    color_16bit = 16'hF800; // 纯红色
                end
            end
            
            // 图案1: 简单绿色方块
            3'd1: begin
                if (x >= 60 && x <= 180 && y >= 80 && y <= 240) begin
                    color_16bit = 16'h07E0; // 纯绿色
                end
            end
            
            // 图案2: 简单蓝色方块
            3'd2: begin
                if (x >= 60 && x <= 180 && y >= 80 && y <= 240) begin
                    color_16bit = 16'h001F; // 纯蓝色
                end
            end
            
            // 图案3: 黄色方块
            3'd3: begin
                if (x >= 60 && x <= 180 && y >= 80 && y <= 240) begin
                    color_16bit = 16'hFFE0; // 黄色
                end
            end
            
            // 图案4: 白色方块
            3'd4: begin
                if (x >= 60 && x <= 180 && y >= 80 && y <= 240) begin
                    color_16bit = 16'hFFFF; // 白色
                end
            end
            
            // 图案5: 条纹图案
            3'd5: begin
                if (x[4]) begin // 每16个像素一条纹
                    color_16bit = 16'hF800; // 红色条纹
                end else begin
                    color_16bit = 16'h07E0; // 绿色条纹
                end
            end
            
            // 图案6: 棋盘图案
            3'd6: begin
                if ((x[5] ^ y[5]) == 1'b1) begin // 每32个像素一格
                    color_16bit = 16'hFFFF; // 白色
                end else begin
                    color_16bit = 16'h0000; // 黑色
                end
            end
            
            // 图案7: 彩色渐变
            3'd7: begin
                case (x[7:5]) // 根据X坐标分成8个区域
                    3'd0: color_16bit = 16'hF800; // 红色
                    3'd1: color_16bit = 16'hFC00; // 橙色
                    3'd2: color_16bit = 16'hFFE0; // 黄色
                    3'd3: color_16bit = 16'h07E0; // 绿色
                    3'd4: color_16bit = 16'h07FF; // 青色
                    3'd5: color_16bit = 16'h001F; // 蓝色
                    3'd6: color_16bit = 16'h781F; // 紫色
                    3'd7: color_16bit = 16'hF81F; // 粉色
                endcase
            end
            
            default: begin
                color_16bit = 16'h0000; // 黑色
            end
        endcase
        
        // 输出像素数据 (16位转9位格式)
        if (pixel_counter[0] == 1'b0) begin
            // 高8位
            get_pixel_color = {1'b1, color_16bit[15:8]};
        end
        else begin
            // 低8位  
            get_pixel_color = {1'b1, color_16bit[7:0]};
        end
    end
endfunction

endmodule
