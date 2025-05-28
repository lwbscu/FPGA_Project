// LCD_Controller.v - 液晶屏可视化控制器模块
// 功能：基于示例代码优化的LCD音乐可视化系统
// 支持：多种灯效图案、实时音符可视化、动态背景效果
// 参考：示例代码中的lcd_init.v, lcd_write.v, lcd_show_pic.v

module LCD_Controller(
    input           clk,            // 12MHz系统时钟
    input           rst_n,          // 复位信号
    input           mode,           // 播放模式（0=手动，1=自动）
    input   [15:0]  current_tone,   // 当前音符值
    input           playing,        // 播放状态
    input   [7:0]   progress,       // 播放进度（0-160）
    input   [3:0]   song_id,        // 当前歌曲ID
    input   [15:0]  key_state,      // 按键状态
    
    // LCD SPI接口（基于示例代码引脚定义）
    output          lcd_sclk,       // SPI时钟
    output          lcd_mosi,       // SPI数据
    output          lcd_cs,         // 片选信号
    output          lcd_rst,        // 复位信号
    output          lcd_dc,         // 数据/命令选择
    output          lcd_blk         // 背光控制
);

// 基于示例代码的LCD控制参数（参考lcd_init.v）
parameter   WHITE   = 16'hFFFF,     // 白色
            BLACK   = 16'h0000,     // 黑色
            BLUE    = 16'h001F,     // 蓝色
            BRED    = 16'hF81F,     // 蓝红色
            GRED    = 16'hFFE0,     // 绿红色
            GBLUE   = 16'h07FF,     // 绿蓝色
            RED     = 16'hF800,     // 红色
            MAGENTA = 16'hF81F,     // 洋红色
            GREEN   = 16'h07E0,     // 绿色
            CYAN    = 16'h7FFF,     // 青色
            YELLOW  = 16'hFFE0,     // 黄色
            BROWN   = 16'hBC40,     // 棕色
            BRRED   = 16'hFC07,     // 棕红色
            GRAY    = 16'h8430;     // 灰色

// LCD尺寸参数
parameter   LCD_WIDTH  = 8'd240,    // LCD宽度
            LCD_HEIGHT = 9'd320;    // LCD高度

// 可视化效果类型
parameter   EFFECT_SPECTRUM     = 4'h1,    // 频谱效果
            EFFECT_WAVEFORM     = 4'h2,    // 波形效果
            EFFECT_PARTICLES    = 4'h3,    // 粒子效果
            EFFECT_RIPPLE       = 4'h4,    // 水波纹效果
            EFFECT_STARFIELD    = 4'h5,    // 星空效果
            EFFECT_PLASMA       = 4'h6,    // 等离子效果
            EFFECT_MANDALA      = 4'h7,    // 曼陀罗效果
            EFFECT_BREATHING    = 4'h8;    // 呼吸灯效果

// 控制状态机
parameter   INIT_LCD        = 4'h0,
            CLEAR_SCREEN    = 4'h1,
            DRAW_BACKGROUND = 4'h2,
            DRAW_EFFECTS    = 4'h3,
            DRAW_UI         = 4'h4,
            UPDATE_DISPLAY  = 4'h5,
            IDLE            = 4'h6;

// 添加缺失的状态常量
parameter   INIT            = 4'h0,
            DRAW_HEADER     = 4'h1,
            DRAW_CONTENT    = 4'h2,
            UPDATE          = 4'h3;

reg [3:0]   lcd_state;
reg [3:0]   next_state;

// SPI写入控制（参考lcd_write.v）
reg [7:0]   spi_data;       // 修正位宽为8位
reg         spi_start;      // SPI开始信号
wire        spi_ready;      // SPI就绪信号
reg         spi_cmd_mode;   // 命令/数据模式选择
reg [15:0]  spi_counter;    // SPI计数器
reg [7:0]   breath_counter; // 呼吸灯计数器
reg [7:0]   brightness;     // 亮度值

// 显示控制信号
reg [7:0]   pixel_x;
reg [8:0]   pixel_y;
reg [15:0]  pixel_color;
reg [3:0]   current_effect;

// 效果生成器信号
wire [15:0] effect_color;
wire [7:0]  effect_brightness;
wire        effect_ready;

// 音符到颜色映射（基于音乐理论）
reg [15:0] note_colors [0:11];
initial begin
    note_colors[0]  = RED;      // C - 红色
    note_colors[1]  = 16'hF400; // C# - 橙红色  
    note_colors[2]  = YELLOW;   // D - 黄色
    note_colors[3]  = 16'h8FE0; // D# - 黄绿色
    note_colors[4]  = GREEN;    // E - 绿色
    note_colors[5]  = 16'h07F0; // F - 青绿色
    note_colors[6]  = CYAN;     // F# - 青色
    note_colors[7]  = 16'h03FF; // G - 蓝青色
    note_colors[8]  = BLUE;     // G# - 蓝色
    note_colors[9]  = 16'h801F; // A - 蓝紫色
    note_colors[10] = MAGENTA;  // A# - 紫色
    note_colors[11] = 16'hF81F; // B - 紫红色
end
reg [7:0]   flow_position;
reg [15:0]  effect_counter;

// 歌曲名称ROM（简化版）
reg [7:0] song_name_rom [0:255];
initial begin
    // 歌曲0 - "Twinkle Star"
    song_name_rom[0] = "T"; song_name_rom[1] = "w"; song_name_rom[2] = "i"; song_name_rom[3] = "n";
    song_name_rom[4] = "k"; song_name_rom[5] = "l"; song_name_rom[6] = "e"; song_name_rom[7] = " ";
    song_name_rom[8] = "S"; song_name_rom[9] = "t"; song_name_rom[10] = "a"; song_name_rom[11] = "r";
    
    // 歌曲1 - "Happy Birthday" 
    song_name_rom[16] = "H"; song_name_rom[17] = "a"; song_name_rom[18] = "p"; song_name_rom[19] = "p";
    song_name_rom[20] = "y"; song_name_rom[21] = " "; song_name_rom[22] = "B"; song_name_rom[23] = "i";
    song_name_rom[24] = "r"; song_name_rom[25] = "t"; song_name_rom[26] = "h"; song_name_rom[27] = "d";
    song_name_rom[28] = "a"; song_name_rom[29] = "y";
    
    // 更多歌曲名称...
    song_name_rom[32] = "T"; song_name_rom[33] = "w"; song_name_rom[34] = "o"; song_name_rom[35] = " ";
    song_name_rom[36] = "T"; song_name_rom[37] = "i"; song_name_rom[38] = "g"; song_name_rom[39] = "e";
    song_name_rom[40] = "r"; song_name_rom[41] = "s";
end

// 音符到颜色映射
function [15:0] tone_to_color;
    input [15:0] tone_value;
    begin
        case (tone_value)
            16'd45872: tone_to_color = 16'hF800; // C4 - 红色
            16'd40858: tone_to_color = 16'hFD20; // D4 - 橙色
            16'd36408: tone_to_color = 16'hFFE0; // E4 - 黄色
            16'd34364: tone_to_color = 16'h07E0; // F4 - 绿色
            16'd30612: tone_to_color = 16'h07FF; // G4 - 青色
            16'd27273: tone_to_color = 16'h001F; // A4 - 蓝色
            16'd24296: tone_to_color = 16'hF81F; // B4 - 紫色
            16'd22931: tone_to_color = 16'hFFFF; // C5 - 白色
            default:   tone_to_color = 16'h0000; // 静音 - 黑色
        endcase
    end
endfunction

// SPI控制器实例
SPI_Master u_spi(
    .clk        (clk),
    .rst_n      (rst_n),
    .spi_data   (spi_data),
    .spi_start  (spi_start),
    .spi_ready  (spi_ready),
    .sclk       (lcd_sclk),
    .mosi       (lcd_mosi)
);

// 状态机控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        lcd_state <= IDLE;
    end else begin
        lcd_state <= next_state;
    end
end

// 状态转换逻辑
always @(*) begin
    case (lcd_state)
        IDLE: begin
            if (rst_n) next_state = INIT;
            else next_state = IDLE;
        end
        INIT: begin
            if (spi_counter >= 16'd1000) next_state = CLEAR_SCREEN;
            else next_state = INIT;
        end
        CLEAR_SCREEN: begin
            if (pixel_x >= 240 && pixel_y >= 320) next_state = DRAW_HEADER;
            else next_state = CLEAR_SCREEN;
        end
        DRAW_HEADER: begin
            next_state = DRAW_CONTENT;
        end
        DRAW_CONTENT: begin
            next_state = DRAW_EFFECTS;
        end
        DRAW_EFFECTS: begin
            next_state = UPDATE;
        end
        UPDATE: begin
            if (effect_counter >= 16'd4000) next_state = CLEAR_SCREEN; // 约30FPS刷新
            else next_state = UPDATE;
        end
        default: next_state = IDLE;
    endcase
end

// 呼吸灯效果生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        breath_counter <= 8'h0;
        brightness <= 8'h0;
    end else begin
        breath_counter <= breath_counter + 1'b1;
        
        // 简化的正弦波近似（三角波）
        if (breath_counter < 128) begin
            brightness <= breath_counter * 2;       // 渐亮
        end else begin
            brightness <= (255 - breath_counter) * 2; // 渐暗
        end
    end
end

// 流水灯效果生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        flow_position <= 8'h0;
        effect_counter <= 16'h0;
    end else begin
        effect_counter <= effect_counter + 1'b1;
        
        if (effect_counter >= 16'd1000) begin // 流水速度控制
            flow_position <= (flow_position >= 239) ? 0 : flow_position + 1;
            effect_counter <= 16'h0;
        end
    end
end

// 像素颜色生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pixel_color <= 16'h0000;
    end else begin
        case (lcd_state)
            CLEAR_SCREEN: begin
                pixel_color <= 16'h0000; // 黑色背景
            end
            DRAW_HEADER: begin
                if (mode == 1'b0) 
                    pixel_color <= 16'h07E0; // 手动模式 - 绿色
                else 
                    pixel_color <= 16'h001F; // 自动模式 - 蓝色
            end
            DRAW_CONTENT: begin
                if (current_tone != 16'h0000) begin
                    // 显示当前音符颜色
                    pixel_color <= tone_to_color(current_tone);
                end else begin
                    pixel_color <= 16'h2104; // 深灰色
                end
            end
            DRAW_EFFECTS: begin
                if (mode == 1'b1 && playing) begin
                    // 自动模式：呼吸灯效果
                    pixel_color <= {brightness[7:3], brightness[7:2], brightness[7:3]};
                end else if (mode == 1'b0 && (|key_state)) begin
                    // 手动模式：流水灯效果
                    if (pixel_x == flow_position) begin
                        pixel_color <= tone_to_color(current_tone);
                    end else begin
                        pixel_color <= 16'h0000;
                    end
                end else begin
                    pixel_color <= 16'h0000;
                end
            end
            default: pixel_color <= 16'h0000;
        endcase
    end
end

// 片选和数据/命令控制
assign lcd_cs = (lcd_state == IDLE) ? 1'b1 : 1'b0;
assign lcd_dc = spi_cmd_mode;
assign lcd_rst = rst_n;
assign lcd_blk = 1'b1; // 背光常亮

// SPI数据发送控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        spi_data <= 8'h00;
        spi_start <= 1'b0;
        spi_cmd_mode <= 1'b1;
        spi_counter <= 16'h0;
        pixel_x <= 8'h0;
        pixel_y <= 9'h0;
    end else begin
        case (lcd_state)
            INIT: begin
                // LCD初始化命令序列（简化版）
                if (spi_ready && spi_counter < 16'd10) begin
                    case (spi_counter)
                        16'd0: begin spi_data <= 8'h01; spi_cmd_mode <= 1'b1; end // 软复位
                        16'd1: begin spi_data <= 8'h11; spi_cmd_mode <= 1'b1; end // 退出睡眠
                        16'd2: begin spi_data <= 8'h29; spi_cmd_mode <= 1'b1; end // 显示开启
                        16'd3: begin spi_data <= 8'h3A; spi_cmd_mode <= 1'b1; end // 像素格式
                        16'd4: begin spi_data <= 8'h55; spi_cmd_mode <= 1'b0; end // 16位RGB565
                        default: begin spi_data <= 8'h00; spi_cmd_mode <= 1'b1; end
                    endcase
                    spi_start <= 1'b1;
                    spi_counter <= spi_counter + 1'b1;
                end else begin
                    spi_start <= 1'b0;
                    if (spi_counter >= 16'd10) spi_counter <= spi_counter + 1'b1;
                end
            end
            
            CLEAR_SCREEN, DRAW_EFFECTS: begin
                // 发送像素数据
                if (spi_ready) begin
                    spi_data <= pixel_color[15:8];     // 高字节
                    spi_cmd_mode <= 1'b0;              // 数据模式
                    spi_start <= 1'b1;
                    
                    // 更新像素坐标
                    if (pixel_x >= 239) begin
                        pixel_x <= 8'h0;
                        if (pixel_y >= 319) begin
                            pixel_y <= 9'h0;
                        end else begin
                            pixel_y <= pixel_y + 1'b1;
                        end
                    end else begin
                        pixel_x <= pixel_x + 1'b1;
                    end
                end else begin
                    spi_start <= 1'b0;
                end
            end
            
            default: begin
                spi_start <= 1'b0;
                spi_counter <= 16'h0;
            end
        endcase
    end
end

endmodule

// SPI主机控制器
module SPI_Master(
    input           clk,
    input           rst_n,
    input   [7:0]   spi_data,
    input           spi_start,
    output reg      spi_ready,
    output          sclk,
    output reg      mosi
);

reg [3:0] bit_counter;
reg [7:0] shift_reg;
reg [7:0] clk_divider;
reg       spi_clk;
reg       transmission_active;

// 时钟分频生成SPI时钟（约1.5MHz）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        clk_divider <= 8'h0;
        spi_clk <= 1'b0;
    end else begin
        clk_divider <= clk_divider + 1'b1;
        if (clk_divider >= 8'd4) begin  // 12MHz/8 = 1.5MHz
            spi_clk <= ~spi_clk;
            clk_divider <= 8'h0;
        end
    end
end

// SPI传输控制
always @(posedge spi_clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_counter <= 4'h0;
        shift_reg <= 8'h00;
        mosi <= 1'b0;
        spi_ready <= 1'b1;
        transmission_active <= 1'b0;
    end else begin
        if (spi_start && spi_ready) begin
            shift_reg <= spi_data;
            bit_counter <= 4'h0;
            spi_ready <= 1'b0;
            transmission_active <= 1'b1;
        end else if (transmission_active) begin
            mosi <= shift_reg[7];
            shift_reg <= {shift_reg[6:0], 1'b0};
            bit_counter <= bit_counter + 1'b1;
            
            if (bit_counter >= 4'd7) begin
                spi_ready <= 1'b1;
                transmission_active <= 1'b0;
            end
        end
    end
end

assign sclk = transmission_active ? spi_clk : 1'b0;

endmodule
