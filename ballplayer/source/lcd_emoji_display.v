// ============================================================================
// Module: lcd_emoji_display
// Description: 简单颜文字表情显示模块 - 慢速切换，适配低电平LED
// Author: GitHub Copilot
// Date: 2025-05-29
// ============================================================================

module lcd_emoji_display (
    input wire          clk_50MHz,      // 50MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示（反向逻辑，适配低电平点亮LED）
    output wire [2:0]   pattern_id_inv  // 当前图案ID（反向）
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

// 图案切换定时器 (每5秒切换一次 @ 50MHz)
reg [28:0] pattern_timer;
parameter PATTERN_SWITCH_TIME = 29'd250000000; // 5秒，快速切换
reg [2:0] current_pattern;

// LED输出反向逻辑（低电平点亮）
assign pattern_id_inv = ~current_pattern;

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

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
        pattern_timer <= 29'd0;
        current_pattern <= 3'd0;
    end
    else begin
        if (state == DISPLAY) begin
            pattern_timer <= pattern_timer + 29'd1;
            if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                pattern_timer <= 29'd0;
                current_pattern <= (current_pattern == 3'd5) ? 3'd0 : (current_pattern + 3'd1);
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
        display_data = get_emoji_color(pixel_counter, current_pattern);
    end
    else begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
end

assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// 简单颜文字图案生成函数
function [8:0] get_emoji_color;
    input [17:0] counter;   // 像素计数器
    input [2:0] pattern;    // 图案ID
    
    reg [15:0] color_16bit;
    reg [7:0] x, y;
    
    begin
        // 简化坐标计算
        x = (counter[17:1] % 240) & 8'hFF;
        y = (counter[17:1] / 240) & 8'hFF;
        
        case (pattern)
            // 表情0: 笑脸 ^_^ (黄色背景)
            3'd0: begin
                if ((x >= 80 && x <= 160) && (y >= 120 && y <= 200)) begin
                    // 眼睛
                    if ((x >= 95 && x <= 105 && y >= 140 && y <= 150) ||
                        (x >= 135 && x <= 145 && y >= 140 && y <= 150)) begin
                        color_16bit = 16'h0000; // 黑色眼睛
                    end
                    // 嘴巴 (弧形简化为直线)
                    else if (x >= 100 && x <= 140 && y >= 170 && y <= 175) begin
                        color_16bit = 16'h0000; // 黑色嘴巴
                    end
                    else begin
                        color_16bit = 16'hFFE0; // 黄色脸
                    end
                end
                else begin
                    color_16bit = 16'h07E0; // 绿色背景
                end
            end
            
            // 表情1: 哭脸 T_T (蓝色背景)
            3'd1: begin
                if ((x >= 80 && x <= 160) && (y >= 120 && y <= 200)) begin
                    // 眼睛和眼泪
                    if ((x >= 95 && x <= 105 && y >= 140 && y <= 160) ||
                        (x >= 135 && x <= 145 && y >= 140 && y <= 160)) begin
                        color_16bit = 16'h001F; // 蓝色眼泪
                    end
                    // 嘴巴 (倒弧形)
                    else if (x >= 110 && x <= 130 && y >= 175 && y <= 180) begin
                        color_16bit = 16'h0000; // 黑色嘴巴
                    end
                    else begin
                        color_16bit = 16'hFFE0; // 黄色脸
                    end
                end
                else begin
                    color_16bit = 16'h07FF; // 青色背景
                end
            end
            
            // 表情2: 惊讶 O_O (橙色背景)
            3'd2: begin
                if ((x >= 80 && x <= 160) && (y >= 120 && y <= 200)) begin
                    // 大眼睛
                    if ((x >= 90 && x <= 110 && y >= 135 && y <= 155) ||
                        (x >= 130 && x <= 150 && y >= 135 && y <= 155)) begin
                        color_16bit = 16'h0000; // 黑色眼睛
                    end
                    // 嘴巴 (圆形)
                    else if (x >= 115 && x <= 125 && y >= 170 && y <= 180) begin
                        color_16bit = 16'h0000; // 黑色嘴巴
                    end
                    else begin
                        color_16bit = 16'hFFE0; // 黄色脸
                    end
                end
                else begin
                    color_16bit = 16'hFC00; // 橙色背景
                end
            end
            
            // 表情3: 眯眼笑 ^o^ (粉色背景)
            3'd3: begin
                if ((x >= 80 && x <= 160) && (y >= 120 && y <= 200)) begin
                    // 眯起的眼睛
                    if ((x >= 95 && x <= 105 && y >= 145 && y <= 148) ||
                        (x >= 135 && x <= 145 && y >= 145 && y <= 148)) begin
                        color_16bit = 16'h0000; // 黑色眼睛
                    end
                    // 圆嘴巴
                    else if (x >= 115 && x <= 125 && y >= 165 && y <= 175) begin
                        color_16bit = 16'hF800; // 红色嘴巴
                    end
                    else begin
                        color_16bit = 16'hFFE0; // 黄色脸
                    end
                end
                else begin
                    color_16bit = 16'hF81F; // 粉色背景
                end
            end
            
            // 表情4: 酷脸 -_- (紫色背景)
            3'd4: begin
                if ((x >= 80 && x <= 160) && (y >= 120 && y <= 200)) begin
                    // 一条线的眼睛
                    if ((x >= 95 && x <= 105 && y >= 147 && y <= 150) ||
                        (x >= 135 && x <= 145 && y >= 147 && y <= 150)) begin
                        color_16bit = 16'h0000; // 黑色眼睛
                    end
                    // 一条线的嘴巴
                    else if (x >= 110 && x <= 130 && y >= 172 && y <= 175) begin
                        color_16bit = 16'h0000; // 黑色嘴巴
                    end
                    else begin
                        color_16bit = 16'hFFE0; // 黄色脸
                    end
                end
                else begin
                    color_16bit = 16'h781F; // 紫色背景
                end
            end
            
            // 表情5: 心形 <3 (红色背景)
            3'd5: begin
                // 简化心形为红色方块
                if ((x >= 100 && x <= 140) && (y >= 140 && y <= 180)) begin
                    color_16bit = 16'hF800; // 红色心形
                end
                else begin
                    color_16bit = 16'hFFFF; // 白色背景
                end
            end
            
            default: begin
                color_16bit = 16'h0000; // 黑色
            end
        endcase
        
        // 输出像素数据 (16位转9位格式)
        if (pixel_counter[0] == 1'b0) begin
            // 高8位
            get_emoji_color = {1'b1, color_16bit[15:8]};
        end
        else begin
            // 低8位  
            get_emoji_color = {1'b1, color_16bit[7:0]};
        end
    end
endfunction

endmodule
