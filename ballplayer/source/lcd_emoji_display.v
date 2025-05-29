// ============================================================================
// Module: lcd_30_emoji_display
// Description: 30种搞笑颜文字表情显示模块 - 2秒自动切换，线条优化
// Author: AI Assistant
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
    output wire [2:0]   pattern_id_inv  // 当前图案ID（反向，3位显示0-7）
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
reg [28:0] pattern_timer;
parameter PATTERN_SWITCH_TIME = 29'd100000000; // 2秒快速切换
reg [4:0] current_pattern; // 5位支持32种表情，使用0-29

// LED输出反向逻辑（低电平点亮）- 只显示低3位
assign pattern_id_inv = ~current_pattern[2:0];

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
        current_pattern <= 5'd0;
    end
    else begin
        if (state == DISPLAY) begin
            pattern_timer <= pattern_timer + 29'd1;
            if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                pattern_timer <= 29'd0;
                current_pattern <= (current_pattern == 5'd29) ? 5'd0 : (current_pattern + 5'd1);
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
        display_data = get_funny_emoji(pixel_counter, current_pattern);
    end
    else begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
end

assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// 30种搞笑颜文字表情生成函数
function [8:0] get_funny_emoji;
    input [17:0] counter;   // 像素计数器
    input [4:0] pattern;    // 图案ID (0-29)
    
    reg [15:0] color_16bit;
    reg [7:0] x, y;
    reg is_emoji; // 是否为表情像素
    
    begin
        // 坐标计算
        x = (counter[17:1] % 240) & 8'hFF;
        y = (counter[17:1] / 240) & 8'hFF;
        
        // 默认黑色背景
        color_16bit = 16'h0000;
        is_emoji = 1'b0;
        
        case (pattern)
            // 1. ^_^ - 经典笑脸
            5'd0: begin
                // 脸部区域
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ^
                    if ((x >= 100 && x <= 120) && (y >= 130 && y <= 140)) begin
                        if ((x-110 + y-135) <= 5 && (x-110 + y-135) >= -5) is_emoji = 1'b1;
                        if ((x-110 - y+135) <= 5 && (x-110 - y+135) >= -5) is_emoji = 1'b1;
                    end
                    // 右眼 ^  
                    if ((x >= 130 && x <= 150) && (y >= 130 && y <= 140)) begin
                        if ((x-140 + y-135) <= 5 && (x-140 + y-135) >= -5) is_emoji = 1'b1;
                        if ((x-140 - y+135) <= 5 && (x-140 - y+135) >= -5) is_emoji = 1'b1;
                    end
                    // 嘴巴弧线 _
                    if ((x >= 110 && x <= 140) && (y >= 155 && y <= 165)) begin
                        if (((x-125)*(x-125))/100 + ((y-160)*(y-160))/25 <= 4) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hFFE0; // 黄色线条
                    else color_16bit = 16'h0000; // 黑色背景
                end
            end
            
            // 2. T_T - 哭泣
            5'd1: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 T
                    if ((x >= 105 && x <= 115) && (y >= 125 && y <= 135)) is_emoji = 1'b1; // 横线
                    if ((x >= 108 && x <= 112) && (y >= 135 && y <= 150)) is_emoji = 1'b1; // 竖线
                    if ((x >= 108 && x <= 112) && (y >= 155 && y <= 170)) is_emoji = 1'b1; // 眼泪
                    // 右眼 T
                    if ((x >= 135 && x <= 145) && (y >= 125 && y <= 135)) is_emoji = 1'b1; // 横线
                    if ((x >= 138 && x <= 142) && (y >= 135 && y <= 150)) is_emoji = 1'b1; // 竖线
                    if ((x >= 138 && x <= 142) && (y >= 155 && y <= 170)) is_emoji = 1'b1; // 眼泪
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 160 && y <= 165)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h07FF; // 青色
                end
            end
            
            // 3. O_O - 惊讶
            5'd2: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 O (圆圈)
                    if (((x-110)*(x-110) + (y-135)*(y-135) >= 80) && 
                        ((x-110)*(x-110) + (y-135)*(y-135) <= 120)) is_emoji = 1'b1;
                    // 右眼 O (圆圈)
                    if (((x-140)*(x-140) + (y-135)*(y-135) >= 80) && 
                        ((x-140)*(x-140) + (y-135)*(y-135) <= 120)) is_emoji = 1'b1;
                    // 嘴巴 O (小圆圈)
                    if (((x-125)*(x-125) + (y-160)*(y-160) >= 15) && 
                        ((x-125)*(x-125) + (y-160)*(y-160) <= 35)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hF800; // 红色
                end
            end
            
            // 4. -_- - 无聊
            5'd3: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 -
                    if ((x >= 100 && x <= 120) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 右眼 -
                    if ((x >= 130 && x <= 150) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 嘴巴 -
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h07E0; // 绿色
                end
            end
            
            // 5. @_@ - 眩晕
            5'd4: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 @ (螺旋简化)
                    if (((x-110)*(x-110) + (y-135)*(y-135) >= 60) && 
                        ((x-110)*(x-110) + (y-135)*(y-135) <= 100)) is_emoji = 1'b1;
                    if ((x >= 108 && x <= 112) && (y >= 133 && y <= 137)) is_emoji = 1'b1; // 中心点
                    // 右眼 @
                    if (((x-140)*(x-140) + (y-135)*(y-135) >= 60) && 
                        ((x-140)*(x-140) + (y-135)*(y-135) <= 100)) is_emoji = 1'b1;
                    if ((x >= 138 && x <= 142) && (y >= 133 && y <= 137)) is_emoji = 1'b1; // 中心点
                    // 嘴巴波浪 ~
                    if ((x >= 110 && x <= 140) && (y >= 158 && y <= 162)) begin
                        if ((x % 6) < 3) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hF81F; // 洋红
                end
            end
            
            // 6. >_< - 生气
            5'd5: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 >
                    if ((x >= 105 && x <= 115) && (y >= 130 && y <= 140)) begin
                        if (x + y >= 240) is_emoji = 1'b1; // 上半部分
                        if (x - y >= -30) is_emoji = 1'b1; // 下半部分
                    end
                    // 右眼 <
                    if ((x >= 135 && x <= 145) && (y >= 130 && y <= 140)) begin
                        if (x - y <= 5) is_emoji = 1'b1; // 上半部分
                        if (x + y <= 275) is_emoji = 1'b1; // 下半部分
                    end
                    // 嘴巴锯齿
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 165)) begin
                        if (((x-115) % 4) < 2) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hFC00; // 橙色
                end
            end
            
            // 7. X_X - 昏倒
            5'd6: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 X
                    if ((x >= 105 && x <= 115) && (y >= 130 && y <= 140)) begin
                        if ((x-110) == (y-135)) is_emoji = 1'b1; // 对角线1
                        if ((x-110) == -(y-135)) is_emoji = 1'b1; // 对角线2
                    end
                    // 右眼 X
                    if ((x >= 135 && x <= 145) && (y >= 130 && y <= 140)) begin
                        if ((x-140) == (y-135)) is_emoji = 1'b1; // 对角线1
                        if ((x-140) == -(y-135)) is_emoji = 1'b1; // 对角线2
                    end
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h8410; // 灰色
                end
            end
            
            // 8. *_* - 兴奋
            5'd7: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 * (星形)
                    if ((x >= 105 && x <= 115) && (y >= 130 && y <= 140)) begin
                        if ((x == 110) || (y == 135)) is_emoji = 1'b1; // 十字
                        if ((x-110) == (y-135)) is_emoji = 1'b1; // 对角线1
                        if ((x-110) == -(y-135)) is_emoji = 1'b1; // 对角线2
                    end
                    // 右眼 *
                    if ((x >= 135 && x <= 145) && (y >= 130 && y <= 140)) begin
                        if ((x == 140) || (y == 135)) is_emoji = 1'b1; // 十字
                        if ((x-140) == (y-135)) is_emoji = 1'b1; // 对角线1
                        if ((x-140) == -(y-135)) is_emoji = 1'b1; // 对角线2
                    end
                    // 兴奋的嘴 (大笑)
                    if ((x >= 110 && x <= 140) && (y >= 155 && y <= 165)) begin
                        if (((x-125)*(x-125))/100 + ((y-160)*(y-160))/25 <= 9) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hFFE0; // 明黄色
                end
            end
            
            // 9. $_$ - 贪财
            5'd8: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 $ (美元符号简化)
                    if ((x >= 108 && x <= 112) && (y >= 125 && y <= 145)) is_emoji = 1'b1; // 竖线
                    if ((x >= 105 && x <= 115) && (y >= 128 && y <= 132)) is_emoji = 1'b1; // 上横线
                    if ((x >= 105 && x <= 115) && (y >= 138 && y <= 142)) is_emoji = 1'b1; // 下横线
                    // 右眼 $
                    if ((x >= 138 && x <= 142) && (y >= 125 && y <= 145)) is_emoji = 1'b1; // 竖线
                    if ((x >= 135 && x <= 145) && (y >= 128 && y <= 132)) is_emoji = 1'b1; // 上横线
                    if ((x >= 135 && x <= 145) && (y >= 138 && y <= 142)) is_emoji = 1'b1; // 下横线
                    // 贪婪的笑
                    if ((x >= 115 && x <= 135) && (y >= 155 && y <= 165)) begin
                        if (((x-125)*(x-125))/100 + ((y-160)*(y-160))/25 <= 6) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h07E0; // 绿色（金钱色）
                end
            end
            
            // 10. ._. - 尴尬
            5'd9: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼点 .
                    if ((x >= 108 && x <= 112) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 右眼点 .
                    if ((x >= 138 && x <= 142) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 嘴巴点 .
                    if ((x >= 123 && x <= 127) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hF800; // 红色
                end
            end
            
            // 11. =_= - 困倦
            5'd10: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼双线 =
                    if ((x >= 105 && x <= 115) && (y >= 131 && y <= 133)) is_emoji = 1'b1;
                    if ((x >= 105 && x <= 115) && (y >= 137 && y <= 139)) is_emoji = 1'b1;
                    // 右眼双线 =
                    if ((x >= 135 && x <= 145) && (y >= 131 && y <= 133)) is_emoji = 1'b1;
                    if ((x >= 135 && x <= 145) && (y >= 137 && y <= 139)) is_emoji = 1'b1;
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h4208; // 暗蓝色
                end
            end
            
            // 12. ಠ_ಠ - 不满
            5'd11: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼方块 ಠ
                    if (((x >= 105 && x <= 115) && (y >= 128 && y <= 132)) || 
                        ((x >= 105 && x <= 115) && (y >= 138 && y <= 142)) ||
                        ((x >= 105 && x <= 109) && (y >= 128 && y <= 142)) ||
                        ((x >= 111 && x <= 115) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    // 右眼方块 ಠ
                    if (((x >= 135 && x <= 145) && (y >= 128 && y <= 132)) || 
                        ((x >= 135 && x <= 145) && (y >= 138 && y <= 142)) ||
                        ((x >= 135 && x <= 139) && (y >= 128 && y <= 142)) ||
                        ((x >= 141 && x <= 145) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hF800; // 红色不满
                end
            end
            
            // 13. (╯°□°）╯ - 愤怒掀桌
            5'd12: begin
                // 左手臂 (╯
                if ((x >= 70 && x <= 80) && (y >= 110 && y <= 150)) begin
                    if (((x-75)*(x-75) + (y-130)*(y-130)) >= 300) is_emoji = 1'b1;
                end
                // 右手臂 ╯)
                if ((x >= 160 && x <= 170) && (y >= 110 && y <= 130)) is_emoji = 1'b1;
                if ((x >= 155 && x <= 170) && (y >= 125 && y <= 130)) is_emoji = 1'b1;
                // 脸部区域
                if ((x >= 90 && x <= 150) && (y >= 120 && y <= 160)) begin
                    // 眼睛 ° °
                    if (((x-105)*(x-105) + (y-135)*(y-135) >= 15) && 
                        ((x-105)*(x-105) + (y-135)*(y-135) <= 25)) is_emoji = 1'b1;
                    if (((x-135)*(x-135) + (y-135)*(y-135) >= 15) && 
                        ((x-135)*(x-135) + (y-135)*(y-135) <= 25)) is_emoji = 1'b1;
                    // 嘴巴 □
                    if (((x >= 115 && x <= 125) && (y >= 148 && y <= 152)) || 
                        ((x >= 115 && x <= 125) && (y >= 156 && y <= 160)) ||
                        ((x >= 115 && x <= 119) && (y >= 148 && y <= 160)) ||
                        ((x >= 121 && x <= 125) && (y >= 148 && y <= 160))) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hF800; // 红色愤怒
                end
            end
            
            // 14. ヽ(°〇°)ﾉ - 惊恐举手
            5'd13: begin
                // 左手 ヽ
                if ((x >= 75 && x <= 85) && (y >= 100 && y <= 120)) begin
                    if (x - y >= -35) is_emoji = 1'b1;
                end
                // 右手 ﾉ
                if ((x >= 155 && x <= 165) && (y >= 100 && y <= 120)) begin
                    if (x + y <= 275) is_emoji = 1'b1;
                end
                // 脸部
                if ((x >= 90 && x <= 150) && (y >= 120 && y <= 160)) begin
                    // 眼睛 ° °
                    if (((x-105)*(x-105) + (y-135)*(y-135) >= 20) && 
                        ((x-105)*(x-105) + (y-135)*(y-135) <= 40)) is_emoji = 1'b1;
                    if (((x-135)*(x-135) + (y-135)*(y-135) >= 20) && 
                        ((x-135)*(x-135) + (y-135)*(y-135) <= 40)) is_emoji = 1'b1;
                    // 嘴巴 〇
                    if (((x-120)*(x-120) + (y-150)*(y-150) >= 25) && 
                        ((x-120)*(x-120) + (y-150)*(y-150) <= 45)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hFFE0; // 黄色惊恐
                end
            end
            
            // 15. (づ￣³￣)づ - 爱心拥抱
            5'd14: begin
                // 左手 (づ
                if ((x >= 75 && x <= 85) && (y >= 125 && y <= 145)) is_emoji = 1'b1;
                if ((x >= 85 && x <= 95) && (y >= 140 && y <= 145)) is_emoji = 1'b1;
                // 右手 づ)
                if ((x >= 155 && x <= 165) && (y >= 125 && y <= 145)) is_emoji = 1'b1;
                if ((x >= 145 && x <= 155) && (y >= 140 && y <= 145)) is_emoji = 1'b1;
                // 脸部
                if ((x >= 95 && x <= 145) && (y >= 120 && y <= 160)) begin
                    // 眼睛 ￣ ￣
                    if ((x >= 105 && x <= 115) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    if ((x >= 125 && x <= 135) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 嘴巴 ³ (心形)
                    if ((x >= 115 && x <= 125) && (y >= 148 && y <= 158)) begin
                        if (((x-120)*(x-120) + (y-153)*(y-153)) <= 25) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hF81F; // 粉色爱心
                end
            end
            
            // 16. ¯\_(ツ)_/¯ - 耸肩
            5'd15: begin
                // 左肩 ¯\
                if ((x >= 70 && x <= 90) && (y >= 105 && y <= 110)) is_emoji = 1'b1;
                if ((x >= 85 && x <= 95) && (y >= 110 && y <= 125)) begin
                    if (x - y >= -30) is_emoji = 1'b1;
                end
                // 右肩 /¯
                if ((x >= 145 && x <= 155) && (y >= 110 && y <= 125)) begin
                    if (x + y <= 270) is_emoji = 1'b1;
                end
                if ((x >= 150 && x <= 170) && (y >= 105 && y <= 110)) is_emoji = 1'b1;
                // 脸 ツ
                if ((x >= 100 && x <= 140) && (y >= 125 && y <= 155)) begin
                    // 眼睛
                    if ((x >= 108 && x <= 112) && (y >= 133 && y <= 143)) is_emoji = 1'b1;
                    if ((x >= 128 && x <= 132) && (y >= 133 && y <= 143)) is_emoji = 1'b1;
                    // 笑
                    if ((x >= 115 && x <= 125) && (y >= 145 && y <= 150)) begin
                        if (((x-120)*(x-120) + (y-147)*(y-147)) <= 25) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h07E0; // 绿色耸肩
                end
            end
            
            // 17. (ᵔᴥᵔ) - 可爱动物脸
            5'd16: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 圆脸轮廓 ()
                    if (((x-120)*(x-120) + (y-140)*(y-140) >= 1200) && 
                        ((x-120)*(x-120) + (y-140)*(y-140) <= 1400)) is_emoji = 1'b1;
                    // 眼睛 ᵔ ᵔ
                    if (((x-105)*(x-105) + (y-130)*(y-130) >= 15) && 
                        ((x-105)*(x-105) + (y-130)*(y-130) <= 25)) is_emoji = 1'b1;
                    if (((x-135)*(x-135) + (y-130)*(y-130) >= 15) && 
                        ((x-135)*(x-135) + (y-130)*(y-130) <= 25)) is_emoji = 1'b1;
                    // 鼻子 ᴥ
                    if ((x >= 118 && x <= 122) && (y >= 140 && y <= 145)) is_emoji = 1'b1;
                    if ((x >= 115 && x <= 125) && (y >= 143 && y <= 147)) begin
                        if (((x-120)*(x-120) + (y-145)*(y-145)) <= 10) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hFFE0; // 黄色可爱
                end
            end
            
            // 18. ಥ_ಥ - 大哭流泪
            5'd17: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ಥ + 泪珠
                    if (((x >= 105 && x <= 115) && (y >= 125 && y <= 129)) || 
                        ((x >= 105 && x <= 115) && (y >= 135 && y <= 139)) ||
                        ((x >= 105 && x <= 109) && (y >= 125 && y <= 139))) is_emoji = 1'b1;
                    if ((x >= 107 && x <= 111) && (y >= 145 && y <= 165)) is_emoji = 1'b1; // 左眼泪
                    // 右眼 ಥ + 泪珠
                    if (((x >= 135 && x <= 145) && (y >= 125 && y <= 129)) || 
                        ((x >= 135 && x <= 145) && (y >= 135 && y <= 139)) ||
                        ((x >= 141 && x <= 145) && (y >= 125 && y <= 139))) is_emoji = 1'b1;
                    if ((x >= 137 && x <= 141) && (y >= 145 && y <= 165)) is_emoji = 1'b1; // 右眼泪
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h07FF; // 青色眼泪
                end
            end
            
            // 19. ʘ‿ʘ - 奇怪眼神
            5'd18: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ʘ
                    if (((x-110)*(x-110) + (y-135)*(y-135) >= 40) && 
                        ((x-110)*(x-110) + (y-135)*(y-135) <= 60)) is_emoji = 1'b1;
                    if ((x >= 108 && x <= 112) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 右眼 ʘ
                    if (((x-140)*(x-140) + (y-135)*(y-135) >= 40) && 
                        ((x-140)*(x-140) + (y-135)*(y-135) <= 60)) is_emoji = 1'b1;
                    if ((x >= 138 && x <= 142) && (y >= 133 && y <= 137)) is_emoji = 1'b1;
                    // 嘴巴弧线 ‿
                    if ((x >= 115 && x <= 135) && (y >= 155 && y <= 165)) begin
                        if (((x-125)*(x-125))/100 + ((y-160)*(y-160))/25 <= 4) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hF81F; // 洋红奇怪
                end
            end
            
            // 20. (⌐■_■) - 酷炫墨镜
            5'd19: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 墨镜框架
                    if ((x >= 95 && x <= 145) && (y >= 128 && y <= 142)) begin
                        // 墨镜边框
                        if ((y >= 128 && y <= 132) || (y >= 138 && y <= 142) ||
                            (x >= 95 && x <= 99) || (x >= 118 && x <= 122) || (x >= 141 && x <= 145)) is_emoji = 1'b1;
                    end
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hFFFF; // 白色框架
                    // 墨镜镜片（黑色）
                    else if ((x >= 100 && x <= 117) && (y >= 133 && y <= 137)) color_16bit = 16'h0000;
                    else if ((x >= 123 && x <= 140) && (y >= 133 && y <= 137)) color_16bit = 16'h0000;
                end
            end
            
            // 21-30: 继续添加更多搞笑表情
            
            // 21. ( ͡° ͜ʖ ͡°) - 坏笑脸
            5'd20: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ͡°
                    if (((x-105)*(x-105) + (y-130)*(y-130) >= 15) && 
                        ((x-105)*(x-105) + (y-130)*(y-130) <= 25)) is_emoji = 1'b1;
                    // 右眼 ͡°
                    if (((x-135)*(x-135) + (y-130)*(y-130) >= 15) && 
                        ((x-135)*(x-135) + (y-130)*(y-130) <= 25)) is_emoji = 1'b1;
                    // 鼻子 ͜
                    if ((x >= 118 && x <= 122) && (y >= 145 && y <= 150)) is_emoji = 1'b1;
                    // 嘴巴 ʖ (坏笑)
                    if ((x >= 110 && x <= 130) && (y >= 155 && y <= 165)) begin
                        if (((x-120)*(x-120))/100 + ((y-160)*(y-160))/25 <= 4) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h07E0; // 绿色坏笑
                end
            end
            
            // 22. ಠ╭╮ಠ - 忧郁眉毛
            5'd21: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 眉毛 ╭╮
                    if ((x >= 100 && x <= 120) && (y >= 118 && y <= 125)) begin
                        if (((x-110)*(x-110) + (y-121)*(y-121)) >= 40) is_emoji = 1'b1;
                    end
                    if ((x >= 130 && x <= 150) && (y >= 118 && y <= 125)) begin
                        if (((x-140)*(x-140) + (y-121)*(y-121)) >= 40) is_emoji = 1'b1;
                    end
                    // 左眼 ಠ
                    if (((x >= 105 && x <= 115) && (y >= 133 && y <= 137)) || 
                        ((x >= 105 && x <= 115) && (y >= 143 && y <= 147)) ||
                        ((x >= 105 && x <= 109) && (y >= 133 && y <= 147)) ||
                        ((x >= 111 && x <= 115) && (y >= 133 && y <= 147))) is_emoji = 1'b1;
                    // 右眼 ಠ
                    if (((x >= 135 && x <= 145) && (y >= 133 && y <= 137)) || 
                        ((x >= 135 && x <= 145) && (y >= 143 && y <= 147)) ||
                        ((x >= 135 && x <= 139) && (y >= 133 && y <= 147)) ||
                        ((x >= 141 && x <= 145) && (y >= 133 && y <= 147))) is_emoji = 1'b1;
                    // 倒嘴
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 168)) begin
                        if (((x-125)*(x-125))/100 + ((y-163)*(y-163))/25 >= 2) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h4208; // 暗蓝忧郁
                end
            end
            
            // 23. (╯︵╰) - 沮丧
            5'd22: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 眼睛向下弯
                    if ((x >= 105 && x <= 115) && (y >= 130 && y <= 145)) begin
                        if (((x-110)*(x-110))/25 + ((y-137)*(y-137))/100 >= 2) is_emoji = 1'b1;
                    end
                    if ((x >= 135 && x <= 145) && (y >= 130 && y <= 145)) begin
                        if (((x-140)*(x-140))/25 + ((y-137)*(y-137))/100 >= 2) is_emoji = 1'b1;
                    end
                    // 倒嘴
                    if ((x >= 115 && x <= 135) && (y >= 155 && y <= 165)) begin
                        if (((x-125)*(x-125))/100 + ((y-160)*(y-160))/25 >= 2) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h8410; // 灰色沮丧
                end
            end
            
            // 24. ◔_◔ - 侧目
            5'd23: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ◔ (半圆)
                    if (((x-110)*(x-110) + (y-135)*(y-135) >= 30) && 
                        ((x-110)*(x-110) + (y-135)*(y-135) <= 50) && (x <= 110)) is_emoji = 1'b1;
                    // 右眼 ◔
                    if (((x-140)*(x-140) + (y-135)*(y-135) >= 30) && 
                        ((x-140)*(x-140) + (y-135)*(y-135) <= 50) && (x <= 140)) is_emoji = 1'b1;
                    // 嘴巴 _
                    if ((x >= 115 && x <= 135) && (y >= 158 && y <= 162)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hFC00; // 橙色侧目
                end
            end
            
            // 25. ಠoಠ - 震惊不满
            5'd24: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ಠ
                    if (((x >= 105 && x <= 115) && (y >= 128 && y <= 132)) || 
                        ((x >= 105 && x <= 115) && (y >= 138 && y <= 142)) ||
                        ((x >= 105 && x <= 109) && (y >= 128 && y <= 142)) ||
                        ((x >= 111 && x <= 115) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    // 右眼 ಠ
                    if (((x >= 135 && x <= 145) && (y >= 128 && y <= 132)) || 
                        ((x >= 135 && x <= 145) && (y >= 138 && y <= 142)) ||
                        ((x >= 135 && x <= 139) && (y >= 128 && y <= 142)) ||
                        ((x >= 141 && x <= 145) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    // 嘴巴 o
                    if (((x-125)*(x-125) + (y-160)*(y-160) >= 15) && 
                        ((x-125)*(x-125) + (y-160)*(y-160) <= 35)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'hF800; // 红色震惊
                end
            end
            
            // 26. (ಠ_ಠ) - 严肃审视
            5'd25: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 括号 ( )
                    if (((x-85)*(x-85) + (y-140)*(y-140) >= 400) && 
                        ((x-85)*(x-85) + (y-140)*(y-140) <= 500) && (x <= 85)) is_emoji = 1'b1;
                    if (((x-155)*(x-155) + (y-140)*(y-140) >= 400) && 
                        ((x-155)*(x-155) + (y-140)*(y-140) <= 500) && (x >= 155)) is_emoji = 1'b1;
                    // 眼睛 ಠ_ಠ
                    if (((x >= 105 && x <= 115) && (y >= 128 && y <= 132)) || 
                        ((x >= 105 && x <= 115) && (y >= 138 && y <= 142)) ||
                        ((x >= 105 && x <= 109) && (y >= 128 && y <= 142)) ||
                        ((x >= 111 && x <= 115) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    if (((x >= 135 && x <= 145) && (y >= 128 && y <= 132)) || 
                        ((x >= 135 && x <= 145) && (y >= 138 && y <= 142)) ||
                        ((x >= 135 && x <= 139) && (y >= 128 && y <= 142)) ||
                        ((x >= 141 && x <= 145) && (y >= 128 && y <= 142))) is_emoji = 1'b1;
                    if ((x >= 115 && x <= 135) && (y >= 133 && y <= 137)) is_emoji = 1'b1; // _
                    if (is_emoji) color_16bit = 16'hFFFF; // 白色严肃
                end
            end
            
            // 27. ಥ﹏ಥ - 极度悲伤
            5'd26: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 左眼 ಥ + 大泪珠
                    if (((x >= 105 && x <= 115) && (y >= 125 && y <= 129)) || 
                        ((x >= 105 && x <= 115) && (y >= 135 && y <= 139)) ||
                        ((x >= 105 && x <= 109) && (y >= 125 && y <= 139))) is_emoji = 1'b1;
                    if ((x >= 105 && x <= 115) && (y >= 145 && y <= 170)) is_emoji = 1'b1; // 大眼泪
                    // 右眼 ಥ + 大泪珠
                    if (((x >= 135 && x <= 145) && (y >= 125 && y <= 129)) || 
                        ((x >= 135 && x <= 145) && (y >= 135 && y <= 139)) ||
                        ((x >= 141 && x <= 145) && (y >= 125 && y <= 139))) is_emoji = 1'b1;
                    if ((x >= 135 && x <= 145) && (y >= 145 && y <= 170)) is_emoji = 1'b1; // 大眼泪
                    // 嘴巴 ﹏ (波浪形向下)
                    if ((x >= 110 && x <= 140) && (y >= 155 && y <= 165)) begin
                        if ((((x-110) % 8) < 4) && (y >= 160)) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'h07FF; // 青色大哭
                end
            end
            
            // 28. ᕕ( ᐛ )ᕗ - 举手欢呼
            5'd27: begin
                // 左手 ᕕ
                if ((x >= 70 && x <= 85) && (y >= 105 && y <= 125)) begin
                    if (x + y >= 180) is_emoji = 1'b1;
                end
                if ((x >= 80 && x <= 90) && (y >= 100 && y <= 110)) is_emoji = 1'b1;
                // 右手 ᕗ
                if ((x >= 155 && x <= 170) && (y >= 105 && y <= 125)) begin
                    if (x - y <= 45) is_emoji = 1'b1;
                end
                if ((x >= 150 && x <= 160) && (y >= 100 && y <= 110)) is_emoji = 1'b1;
                // 脸 ( ᐛ )
                if ((x >= 90 && x <= 150) && (y >= 120 && y <= 160)) begin
                    // 括号
                    if (((x-95)*(x-95) + (y-140)*(y-140) >= 300) && (x <= 95)) is_emoji = 1'b1;
                    if (((x-145)*(x-145) + (y-140)*(y-140) >= 300) && (x >= 145)) is_emoji = 1'b1;
                    // 眼睛和嘴 ᐛ
                    if ((x >= 108 && x <= 112) && (y >= 133 && y <= 137)) is_emoji = 1'b1; // 左眼点
                    if ((x >= 128 && x <= 132) && (y >= 133 && y <= 137)) is_emoji = 1'b1; // 右眼点
                    if ((x >= 115 && x <= 125) && (y >= 145 && y <= 155)) begin // 大笑嘴
                        if (((x-120)*(x-120) + (y-150)*(y-150)) <= 25) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hFFE0; // 黄色欢呼
                end
            end
            
            // 29. (つ◕౪◕)つ - 拥抱准备
            5'd28: begin
                // 左手 (つ
                if ((x >= 75 && x <= 85) && (y >= 125 && y <= 145)) is_emoji = 1'b1;
                if ((x >= 85 && x <= 95) && (y >= 135 && y <= 145)) is_emoji = 1'b1;
                // 右手 つ)
                if ((x >= 155 && x <= 165) && (y >= 125 && y <= 145)) is_emoji = 1'b1;
                if ((x >= 145 && x <= 155) && (y >= 135 && y <= 145)) is_emoji = 1'b1;
                // 脸部
                if ((x >= 95 && x <= 145) && (y >= 120 && y <= 160)) begin
                    // 眼睛 ◕ ◕
                    if (((x-108)*(x-108) + (y-133)*(y-133) >= 15) && 
                        ((x-108)*(x-108) + (y-133)*(y-133) <= 25)) is_emoji = 1'b1;
                    if ((x >= 106 && x <= 110) && (y >= 131 && y <= 135)) is_emoji = 1'b1; // 左眼点
                    if (((x-132)*(x-132) + (y-133)*(y-133) >= 15) && 
                        ((x-132)*(x-132) + (y-133)*(y-133) <= 25)) is_emoji = 1'b1;
                    if ((x >= 130 && x <= 134) && (y >= 131 && y <= 135)) is_emoji = 1'b1; // 右眼点
                    // 嘴巴 ౪ (波浪笑)
                    if ((x >= 110 && x <= 130) && (y >= 148 && y <= 155)) begin
                        if (((x-110) % 4) < 2) is_emoji = 1'b1;
                    end
                    if (is_emoji) color_16bit = 16'hF81F; // 粉色拥抱
                end
            end
            
            // 30. (°o°) - 最后一个惊讶表情
            5'd29: begin
                if ((x >= 80 && x <= 160) && (y >= 100 && y <= 180)) begin
                    // 括号 ( )
                    if (((x-85)*(x-85) + (y-140)*(y-140) >= 400) && 
                        ((x-85)*(x-85) + (y-140)*(y-140) <= 500) && (x <= 85)) is_emoji = 1'b1;
                    if (((x-155)*(x-155) + (y-140)*(y-140) >= 400) && 
                        ((x-155)*(x-155) + (y-140)*(y-140) <= 500) && (x >= 155)) is_emoji = 1'b1;
                    // 眼睛 ° °
                    if (((x-110)*(x-110) + (y-130)*(y-130) >= 20) && 
                        ((x-110)*(x-110) + (y-130)*(y-130) <= 40)) is_emoji = 1'b1;
                    if (((x-140)*(x-140) + (y-130)*(y-130) >= 20) && 
                        ((x-140)*(x-140) + (y-130)*(y-130) <= 40)) is_emoji = 1'b1;
                    // 嘴巴 o
                    if (((x-125)*(x-125) + (y-155)*(y-155) >= 20) && 
                        ((x-125)*(x-125) + (y-155)*(y-155) <= 40)) is_emoji = 1'b1;
                    if (is_emoji) color_16bit = 16'h07E0; // 绿色最终惊讶
                end
            end
            
            default: begin
                color_16bit = 16'h0000; // 默认黑色
            end
        endcase
        
        // 输出像素数据 (16位转9位格式)
        if (pixel_counter[0] == 1'b0) begin
            // 高8位
            get_funny_emoji = {1'b1, color_16bit[15:8]};
        end
        else begin
            // 低8位  
            get_funny_emoji = {1'b1, color_16bit[7:0]};
        end
    end
endfunction

endmodule