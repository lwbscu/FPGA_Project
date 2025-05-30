// LCD_Enhanced_Controller.v - 增强版液晶屏可视化控制器
// 功能：基于示例代码实现的多种LCD灯效图案系统
// 支持：频谱、波形、粒子、水波纹、星空、等离子体、曼陀罗、呼吸灯等8种效果
// 参考：示例代码lcd_init.v, lcd_write.v, lcd_show_pic.v

module LCD_Enhanced_Controller(
    input           clk,            // 50MHz系统时钟（与示例代码一致）
    input           rst_n,          // 复位信号
    input           mode,           // 播放模式（0=手动，1=自动）
    input   [15:0]  current_tone,   // 当前音符值
    input           playing,        // 播放状态
    input   [7:0]   progress,       // 播放进度
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

// 基于示例代码的颜色定义（参考lcd_init.v）
parameter   WHITE   = 16'hFFFF,     BLACK   = 16'h0000,
            BLUE    = 16'h001F,     BRED    = 16'hF81F,
            GRED    = 16'hFFE0,     GBLUE   = 16'h07FF,
            RED     = 16'hF800,     MAGENTA = 16'hF81F,
            GREEN   = 16'h07E0,     CYAN    = 16'h7FFF,
            YELLOW  = 16'hFFE0,     BROWN   = 16'hBC40,
            BRRED   = 16'hFC07,     GRAY    = 16'h8430;

// LCD尺寸参数
parameter   LCD_WIDTH = 240, LCD_HEIGHT = 320;

// 8种可视化效果类型
parameter   EFFECT_SPECTRUM    = 3'h0,    // 频谱柱状图
            EFFECT_WAVEFORM    = 3'h1,    // 波形显示
            EFFECT_PARTICLES   = 3'h2,    // 粒子系统
            EFFECT_RIPPLE      = 3'h3,    // 水波纹效果
            EFFECT_STARFIELD   = 3'h4,    // 星空效果
            EFFECT_PLASMA      = 3'h5,    // 等离子体效果
            EFFECT_MANDALA     = 3'h6,    // 曼陀罗图案
            EFFECT_BREATHING   = 3'h7;    // 呼吸灯效果

// 状态机
parameter   INIT_STATE      = 4'h0,
            CLEAR_DISPLAY   = 4'h1,
            DRAW_BACKGROUND = 4'h2,
            DRAW_EFFECTS    = 4'h3,
            UPDATE_FRAME    = 4'h4,
            IDLE_STATE      = 4'h5;

reg [3:0]   state, next_state;
reg [2:0]   current_effect;

// SPI控制（参考lcd_write.v结构）
reg [8:0]   spi_data;
reg         spi_start;
wire        spi_done;
reg         dc_mode;        // 0=命令，1=数据

// 显示坐标和颜色
reg [7:0]   pixel_x;
reg [8:0]   pixel_y;
reg [15:0]  pixel_color;

// 动画参数
reg [31:0]  animation_timer;
reg [7:0]   frame_counter;
reg [7:0]   effect_speed;
reg [7:0]   effect_intensity;

// 音符分析
wire [3:0]  note_index;
wire [7:0]  note_amplitude;
wire        note_active;

assign note_index = current_tone[3:0];
assign note_amplitude = current_tone[15:8];
assign note_active = (current_tone != 16'h0000);

// 效果选择逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_effect <= EFFECT_SPECTRUM;
        effect_speed <= 8'h60;
        effect_intensity <= 8'h80;
    end else begin
        if (mode == 1'b0) begin  // 手动模式：根据音符选择效果
            case(note_index)
                4'h0, 4'h1: current_effect <= EFFECT_SPECTRUM;   // C, C# - 频谱
                4'h2, 4'h3: current_effect <= EFFECT_WAVEFORM;   // D, D# - 波形
                4'h4, 4'h5: current_effect <= EFFECT_PARTICLES;  // E, F - 粒子
                4'h6, 4'h7: current_effect <= EFFECT_RIPPLE;     // F#, G - 水波纹
                4'h8, 4'h9: current_effect <= EFFECT_STARFIELD;  // G#, A - 星空
                4'hA, 4'hB: current_effect <= EFFECT_PLASMA;     // A#, B - 等离子
                default:    current_effect <= EFFECT_BREATHING;  // 静音 - 呼吸灯
            endcase
            effect_speed <= note_amplitude;
            effect_intensity <= note_active ? 8'hFF : 8'h40;
        end else begin  // 自动模式：循环切换效果
            case(frame_counter[7:5])  // 每32帧切换一种效果
                3'h0: current_effect <= EFFECT_SPECTRUM;
                3'h1: current_effect <= EFFECT_WAVEFORM;
                3'h2: current_effect <= EFFECT_PARTICLES;
                3'h3: current_effect <= EFFECT_RIPPLE;
                3'h4: current_effect <= EFFECT_STARFIELD;
                3'h5: current_effect <= EFFECT_PLASMA;
                3'h6: current_effect <= EFFECT_MANDALA;
                3'h7: current_effect <= EFFECT_BREATHING;
            endcase
            effect_speed <= 8'h80;
            effect_intensity <= playing ? 8'hE0 : 8'h60;
        end
    end
end

// 动画时序控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        animation_timer <= 32'h0;
        frame_counter <= 8'h0;
    end else begin
        animation_timer <= animation_timer + 1;
          // 每16.67ms更新一帧（60FPS）
        if (animation_timer >= 32'd833333) begin  // 50MHz时钟下约16.67ms
            animation_timer <= 32'h0;
            frame_counter <= frame_counter + 1;
        end
    end
end

// 状态机控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state <= INIT_STATE;
    else state <= next_state;
end

// 状态转换逻辑
always @(*) begin
    case (state)
        INIT_STATE:     next_state = (animation_timer > 32'd50000) ? CLEAR_DISPLAY : INIT_STATE;
        CLEAR_DISPLAY:  next_state = (pixel_x >= LCD_WIDTH-1 && pixel_y >= LCD_HEIGHT-1) ? DRAW_BACKGROUND : CLEAR_DISPLAY;
        DRAW_BACKGROUND: next_state = DRAW_EFFECTS;
        DRAW_EFFECTS:   next_state = (pixel_x >= LCD_WIDTH-1 && pixel_y >= LCD_HEIGHT-1) ? UPDATE_FRAME : DRAW_EFFECTS;
        UPDATE_FRAME:   next_state = IDLE_STATE;
        IDLE_STATE:     next_state = (frame_counter[1:0] == 2'b00) ? CLEAR_DISPLAY : IDLE_STATE;
        default:        next_state = INIT_STATE;
    endcase
end

// 多种LCD灯效图案生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pixel_color <= BLACK;
    end else begin
        case (current_effect)
            EFFECT_SPECTRUM: begin
                // 频谱柱状图效果
                if (pixel_x < 192 && pixel_y > LCD_HEIGHT - note_amplitude) begin
                    case(pixel_x[7:5])  // 8个频段
                        3'h0: pixel_color <= RED;
                        3'h1: pixel_color <= YELLOW;
                        3'h2: pixel_color <= GREEN;
                        3'h3: pixel_color <= CYAN;
                        3'h4: pixel_color <= BLUE;
                        3'h5: pixel_color <= MAGENTA;
                        3'h6: pixel_color <= WHITE;
                        3'h7: pixel_color <= BRED;
                    endcase
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_WAVEFORM: begin
                // 波形显示效果
                reg [8:0] wave_y;
                wave_y = LCD_HEIGHT/2 + (note_amplitude * 
                         $signed({1'b0, pixel_x[7:0]} + frame_counter)) / 128;
                if (pixel_y >= wave_y-2 && pixel_y <= wave_y+2) begin
                    pixel_color <= {note_index, 4'h0, note_amplitude[7:3], note_index, 3'h0};
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_PARTICLES: begin
                // 粒子系统效果
                reg [7:0] particle_dist;
                particle_dist = (pixel_x - frame_counter) + (pixel_y - note_amplitude);
                if (particle_dist < 16 && note_active) begin
                    pixel_color <= {frame_counter[4:0], particle_dist[5:0], frame_counter[4:0]};
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_RIPPLE: begin
                // 水波纹效果
                reg [15:0] ripple_dist;
                ripple_dist = (pixel_x - LCD_WIDTH/2) * (pixel_x - LCD_WIDTH/2) + 
                             (pixel_y - LCD_HEIGHT/2) * (pixel_y - LCD_HEIGHT/2);
                if ((ripple_dist[15:8] + frame_counter) % 32 < 4) begin
                    pixel_color <= CYAN + {note_amplitude[3:0], 8'h00, 4'h0};
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_STARFIELD: begin
                // 星空效果
                if (((pixel_x + pixel_y + frame_counter) % 97) < 3 && note_active) begin
                    pixel_color <= WHITE;
                end else if (((pixel_x * 2 + pixel_y + frame_counter) % 127) < 2) begin
                    pixel_color <= BLUE;
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_PLASMA: begin
                // 等离子体效果
                reg [7:0] plasma_val;
                plasma_val = (pixel_x + frame_counter) ^ (pixel_y + note_amplitude);
                pixel_color <= {plasma_val[7:3], plasma_val[7:2], plasma_val[7:3]};
            end
            
            EFFECT_MANDALA: begin
                // 曼陀罗图案效果
                reg [7:0] mandala_pattern;
                mandala_pattern = ((pixel_x * pixel_y) + frame_counter) % 256;
                if ((mandala_pattern + note_amplitude) % 64 < 8) begin
                    pixel_color <= {mandala_pattern[7:3], mandala_pattern[5:0], note_amplitude[7:3]};
                end else begin
                    pixel_color <= BLACK;
                end
            end
            
            EFFECT_BREATHING: begin
                // 呼吸灯效果
                reg [7:0] breath_intensity;
                breath_intensity = (frame_counter[6]) ? 
                                  (255 - frame_counter[5:0] * 4) : 
                                  (frame_counter[5:0] * 4);
                pixel_color <= {breath_intensity[7:3], breath_intensity[7:2], breath_intensity[7:3]};
            end
            
            default: pixel_color <= BLACK;
        endcase
    end
end

// 像素坐标更新
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pixel_x <= 8'h0;
        pixel_y <= 9'h0;
    end else begin
        if (state == CLEAR_DISPLAY || state == DRAW_EFFECTS) begin
            if (pixel_x >= LCD_WIDTH-1) begin
                pixel_x <= 8'h0;
                if (pixel_y >= LCD_HEIGHT-1) begin
                    pixel_y <= 9'h0;
                end else begin
                    pixel_y <= pixel_y + 1;
                end
            end else begin
                pixel_x <= pixel_x + 1;
            end
        end
    end
end

// SPI数据发送控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        spi_data <= 9'h000;
        spi_start <= 1'b0;
        dc_mode <= 1'b1;
    end else begin        case (state)
            INIT_STATE: begin
                // 完整的LCD初始化序列（基于示例代码lcd_init.v）
                if (animation_timer == 32'd50000) begin
                    spi_data <= 9'h001; dc_mode <= 1'b0; spi_start <= 1'b1; // 软复位
                end else if (animation_timer == 32'd100000) begin
                    spi_data <= 9'h011; dc_mode <= 1'b0; spi_start <= 1'b1; // 睡眠退出
                end else if (animation_timer == 32'd150000) begin
                    spi_data <= 9'h03A; dc_mode <= 1'b0; spi_start <= 1'b1; // 像素格式设置
                end else if (animation_timer == 32'd160000) begin
                    spi_data <= 9'h055; dc_mode <= 1'b1; spi_start <= 1'b1; // 16位/像素
                end else if (animation_timer == 32'd200000) begin
                    spi_data <= 9'h029; dc_mode <= 1'b0; spi_start <= 1'b1; // 显示开启
                end else if (animation_timer == 32'd250000) begin
                    spi_data <= 9'h02C; dc_mode <= 1'b0; spi_start <= 1'b1; // 内存写入
                end else begin
                    spi_start <= 1'b0;
                end
            end
            
            CLEAR_DISPLAY, DRAW_EFFECTS: begin
                // 发送像素数据
                if (spi_done) begin
                    spi_data <= {1'b0, pixel_color[15:8]};  // 高字节
                    dc_mode <= 1'b0;  // 数据模式
                    spi_start <= 1'b1;
                end else begin
                    spi_start <= 1'b0;
                end
            end
            
            default: spi_start <= 1'b0;
        endcase
    end
end

// SPI控制器实例（基于示例代码lcd_write.v）
SPI_LCD_Driver u_spi_driver(
    .clk        (clk),
    .rst_n      (rst_n),
    .data_in    (spi_data[7:0]),
    .start      (spi_start),
    .done       (spi_done),
    .sclk       (lcd_sclk),
    .mosi       (lcd_mosi)
);

// 输出控制
assign lcd_cs = (state == IDLE_STATE) ? 1'b1 : 1'b0;
assign lcd_dc = dc_mode;
assign lcd_rst = rst_n;
assign lcd_blk = 1'b1;  // 背光常亮

endmodule

// SPI驱动模块（基于示例代码lcd_write.v优化）
module SPI_LCD_Driver(
    input           clk,
    input           rst_n,
    input   [7:0]   data_in,
    input           start,
    output reg      done,
    output          sclk,
    output reg      mosi
);

parameter CPOL = 1'b0, CPHA = 1'b0;
parameter CLK_DIV = 4'd12;  // 50MHz/25 = 2MHz SPI时钟（适合LCD）

reg [3:0]   bit_count;
reg [7:0]   shift_reg;
reg [3:0]   clk_div;
reg         spi_clk;
reg         active;

// SPI时钟生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        clk_div <= 4'h0;
        spi_clk <= CPOL;
    end else if (active) begin
        if (clk_div >= CLK_DIV) begin
            spi_clk <= ~spi_clk;
            clk_div <= 4'h0;
        end else begin
            clk_div <= clk_div + 1;
        end
    end else begin
        spi_clk <= CPOL;
        clk_div <= 4'h0;
    end
end

// SPI传输控制
always @(posedge spi_clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_count <= 4'h0;
        shift_reg <= 8'h00;
        mosi <= 1'b0;
        done <= 1'b1;
        active <= 1'b0;
    end else begin
        if (start && done) begin
            shift_reg <= data_in;
            bit_count <= 4'h0;
            done <= 1'b0;
            active <= 1'b1;
        end else if (active) begin
            mosi <= shift_reg[7];
            shift_reg <= {shift_reg[6:0], 1'b0};
            bit_count <= bit_count + 1;
            
            if (bit_count >= 4'd7) begin
                done <= 1'b1;
                active <= 1'b0;
            end
        end
    end
end

assign sclk = active ? spi_clk : CPOL;

endmodule
