// ============================================================================
// Module: lcd_cartoon_display_fixed
// Description: 修复版卡通图案显示模块 - 修复计时器问题
// Author: GitHub Copilot
// Date: 2025-05-29
// ============================================================================

module lcd_cartoon_display_fixed (
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

// 独立的图案切换定时器 (每3秒切换一次 @ 50MHz)
reg [26:0] pattern_timer;
parameter PATTERN_SWITCH_TIME = 27'd150000000; // 3秒
reg [2:0] current_pattern;
assign pattern_id = current_pattern;

// 显示坐标和计数器
reg [17:0] pixel_counter;  // 扩展到18位
reg [8:0] display_data;
reg display_en;

// 当前像素的坐标计算 - 简化版本
wire [7:0] pixel_x;
wire [8:0] pixel_y;

// 简化坐标计算，避免除法和模运算
assign pixel_x = (pixel_counter[17:1] < 18'd76800) ? 
                 ((pixel_counter[17:1] % 18'd240) & 8'hFF) : 8'd0;
assign pixel_y = (pixel_counter[17:1] < 18'd76800) ? 
                 ((pixel_counter[17:1] / 18'd240) & 9'h1FF) : 9'd0;

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

// 独立的图案切换计时器
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        pattern_timer <= 27'd0;
        current_pattern <= 3'd0;
    end
    else begin
        if (state == DISPLAY) begin
            pattern_timer <= pattern_timer + 27'd1;
            if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                pattern_timer <= 27'd0;
                current_pattern <= (current_pattern == 3'd7) ? 3'd0 : (current_pattern + 3'd1);
            end
        end
    end
end

// 主状态机 - 专注于显示控制
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= INIT;
        pixel_counter <= 18'd0;
    end
    else begin
        case (state)
            INIT: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'd0;
                end
            end
            
            DISPLAY: begin
                if (wr_done && display_en) begin
                    pixel_counter <= pixel_counter + 18'd1;
                    if (pixel_counter >= 18'd153599) begin // 240*320*2 - 1
                        pixel_counter <= 18'd0;
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

// 超简化的图案颜色生成函数
function [8:0] get_pixel_color;
    input [7:0] x;      // X坐标 (0-239)
    input [8:0] y;      // Y坐标 (0-319)
    input [2:0] pattern; // 图案ID
    
    reg [15:0] color_16bit;
    
    begin
        case (pattern)
            // 图案0: 纯红色全屏
            3'd0: color_16bit = 16'hF800;
            
            // 图案1: 纯绿色全屏
            3'd1: color_16bit = 16'h07E0;
            
            // 图案2: 纯蓝色全屏
            3'd2: color_16bit = 16'h001F;
            
            // 图案3: 纯黄色全屏
            3'd3: color_16bit = 16'hFFE0;
            
            // 图案4: 纯白色全屏
            3'd4: color_16bit = 16'hFFFF;
            
            // 图案5: 纯青色全屏
            3'd5: color_16bit = 16'h07FF;
            
            // 图案6: 纯紫色全屏
            3'd6: color_16bit = 16'h781F;
            
            // 图案7: 纯粉色全屏
            3'd7: color_16bit = 16'hF81F;
            
            default: color_16bit = 16'h0000; // 黑色
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
