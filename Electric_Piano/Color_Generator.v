// Color_Generator.v - 颜色生成器模块
// 功能：根据音符和效果类型生成对应的RGB颜色值
// 支持：HSV到RGB转换、音符颜色映射、动态颜色变换
// 作者：电子琴项目团队

module Color_Generator(
    input           clk,            // 12MHz系统时钟
    input           rst_n,          // 复位信号
    input   [15:0]  current_tone,   // 当前音符值
    input   [7:0]   effect_type,    // 效果类型
    input   [15:0]  effect_data,    // 效果数据
    input   [7:0]   brightness,     // 亮度控制
    input           playing,        // 播放状态
    
    // RGB颜色输出（RGB565格式）
    output  [15:0]  rgb_color,      // 16位RGB565颜色
    output  [7:0]   red_value,      // 8位红色分量
    output  [7:0]   green_value,    // 8位绿色分量
    output  [7:0]   blue_value,     // 8位蓝色分量
    output          color_valid     // 颜色数据有效
);

// 效果类型定义（与Visual_Effects.v保持一致）
parameter EFFECT_BREATHING  = 8'h01;
parameter EFFECT_FLOWING    = 8'h02;
parameter EFFECT_SPECTRUM   = 8'h03;
parameter EFFECT_WAVEFORM   = 8'h04;
parameter EFFECT_BEAT       = 8'h05;
parameter EFFECT_RAINBOW    = 8'h06;
parameter EFFECT_SPARKLE    = 8'h07;
parameter EFFECT_PULSE      = 8'h08;

// 音符到颜色映射表（基于音乐理论的颜色关联）
reg [23:0] note_color_map [0:11];
initial begin
    note_color_map[0]  = 24'hFF0000;  // C - 红色
    note_color_map[1]  = 24'hFF4000;  // C# - 橙红色
    note_color_map[2]  = 24'hFF8000;  // D - 橙色
    note_color_map[3]  = 24'hFFBF00;  // D# - 橙黄色
    note_color_map[4]  = 24'hFFFF00;  // E - 黄色
    note_color_map[5]  = 24'h80FF00;  // F - 黄绿色
    note_color_map[6]  = 24'h00FF00;  // F# - 绿色
    note_color_map[7]  = 24'h00FF80;  // G - 青绿色
    note_color_map[8]  = 24'h00FFFF;  // G# - 青色
    note_color_map[9]  = 24'h0080FF;  // A - 蓝青色
    note_color_map[10] = 24'h0000FF;  // A# - 蓝色
    note_color_map[11] = 24'h8000FF;  // B - 蓝紫色
end

// 内部信号
reg [7:0]   base_red, base_green, base_blue;
reg [7:0]   final_red, final_green, final_blue;
reg [15:0]  rgb565_reg;
reg         color_valid_reg;
reg [3:0]   note_index;
reg [23:0]  base_color;

// HSV颜色空间参数
reg [7:0]   hue;        // 色相 (0-255)
reg [7:0]   saturation; // 饱和度 (0-255)
reg [7:0]   value;      // 明度 (0-255)

// 音符索引提取
always @(*) begin
    note_index = current_tone[3:0];
    if (note_index > 4'hB)
        note_index = 4'h0;
end

// 基础颜色获取
always @(*) begin
    base_color = note_color_map[note_index];
    base_red   = base_color[23:16];
    base_green = base_color[15:8];
    base_blue  = base_color[7:0];
end

// HSV参数计算
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        hue <= 8'h00;
        saturation <= 8'hFF;
        value <= 8'h80;
    end else begin
        case(effect_type)
            EFFECT_BREATHING: begin
                hue <= note_index * 8'd21;  // 每个音符间隔21度
                saturation <= 8'hE0;
                value <= brightness;
            end
            
            EFFECT_FLOWING: begin
                hue <= (note_index * 8'd21 + effect_data[7:0]) % 8'd255;
                saturation <= 8'hD0;
                value <= brightness;
            end
            
            EFFECT_SPECTRUM: begin
                hue <= note_index * 8'd21;
                saturation <= 8'hFF;
                value <= (effect_data[11:0] > 12'd0) ? brightness : 8'h20;
            end
            
            EFFECT_WAVEFORM: begin
                hue <= effect_data[15:8];
                saturation <= 8'hC0;
                value <= brightness;
            end
            
            EFFECT_BEAT: begin
                hue <= note_index * 8'd21;
                saturation <= 8'hFF;
                value <= effect_data[7] ? brightness : brightness >> 2;
            end
            
            EFFECT_RAINBOW: begin
                hue <= effect_data[7:0];
                saturation <= 8'hFF;
                value <= brightness;
            end
            
            EFFECT_SPARKLE: begin
                hue <= effect_data[15:8];
                saturation <= effect_data[7] ? 8'hFF : 8'h40;
                value <= effect_data[0] ? brightness : 8'h00;
            end
            
            EFFECT_PULSE: begin
                hue <= note_index * 8'd21;
                saturation <= 8'hE0;
                value <= effect_data[7] ? brightness : 8'h10;
            end
            
            default: begin
                hue <= 8'h00;
                saturation <= 8'h80;
                value <= brightness >> 1;
            end
        endcase
    end
end

// HSV到RGB转换（简化版本）
wire [7:0] region;
wire [7:0] remainder;
wire [7:0] p, q, t;

assign region = hue / 8'd43;  // 将360度分为6个区域，每区域43度
assign remainder = (hue - (region * 8'd43)) * 8'd6;

assign p = (value * (8'd255 - saturation)) / 8'd255;
assign q = (value * (8'd255 - ((saturation * remainder) / 8'd255))) / 8'd255;
assign t = (value * (8'd255 - ((saturation * (8'd255 - remainder)) / 8'd255))) / 8'd255;

// RGB颜色计算
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        final_red <= 8'h00;
        final_green <= 8'h00;
        final_blue <= 8'h00;
        color_valid_reg <= 1'b0;
    end else begin
        color_valid_reg <= 1'b1;
        
        if (!playing && effect_type != EFFECT_RAINBOW) begin
            // 非播放状态使用基础颜色的暗淡版本
            final_red <= base_red >> 3;
            final_green <= base_green >> 3;
            final_blue <= base_blue >> 3;
        end else begin
            // HSV到RGB的转换
            case(region)
                3'd0: begin  // 红色到黄色
                    final_red <= value;
                    final_green <= t;
                    final_blue <= p;
                end
                3'd1: begin  // 黄色到绿色
                    final_red <= q;
                    final_green <= value;
                    final_blue <= p;
                end
                3'd2: begin  // 绿色到青色
                    final_red <= p;
                    final_green <= value;
                    final_blue <= t;
                end
                3'd3: begin  // 青色到蓝色
                    final_red <= p;
                    final_green <= q;
                    final_blue <= value;
                end
                3'd4: begin  // 蓝色到紫色
                    final_red <= t;
                    final_green <= p;
                    final_blue <= value;
                end
                3'd5: begin  // 紫色到红色
                    final_red <= value;
                    final_green <= p;
                    final_blue <= q;
                end
                default: begin
                    final_red <= value;
                    final_green <= value;
                    final_blue <= value;
                end
            endcase
        end
    end
end

// RGB565格式转换
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rgb565_reg <= 16'h0000;
    end else begin
        // 8位RGB转换为5-6-5格式
        rgb565_reg <= {final_red[7:3], final_green[7:2], final_blue[7:3]};
    end
end

// 输出赋值
assign rgb_color = rgb565_reg;
assign red_value = final_red;
assign green_value = final_green;
assign blue_value = final_blue;
assign color_valid = color_valid_reg;

endmodule
