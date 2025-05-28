// Visual_Effects.v - 视觉效果生成模块
// 功能：生成多种音乐可视化效果，包括频谱、波形、节拍等
// 作者：电子琴项目团队
// 版本：v1.0

module Visual_Effects(
    input           clk,            // 12MHz系统时钟
    input           rst_n,          // 复位信号
    input           mode,           // 播放模式（0=手动，1=自动）
    input   [15:0]  current_tone,   // 当前音符值
    input           playing,        // 播放状态
    input   [7:0]   progress,       // 播放进度
    input   [15:0]  key_state,      // 按键状态
    
    // 效果输出接口
    output  [7:0]   effect_type,    // 当前效果类型
    output  [15:0]  effect_data,    // 效果数据
    output  [7:0]   brightness,     // 亮度控制
    output  [7:0]   speed,          // 效果速度
    output          effect_ready    // 效果数据就绪
);

// 效果类型定义
parameter EFFECT_BREATHING  = 8'h01;   // 呼吸灯效果
parameter EFFECT_FLOWING    = 8'h02;   // 流水灯效果
parameter EFFECT_SPECTRUM   = 8'h03;   // 频谱效果
parameter EFFECT_WAVEFORM   = 8'h04;   // 波形效果
parameter EFFECT_BEAT       = 8'h05;   // 节拍效果
parameter EFFECT_RAINBOW    = 8'h06;   // 彩虹效果
parameter EFFECT_SPARKLE    = 8'h07;   // 闪烁效果
parameter EFFECT_PULSE      = 8'h08;   // 脉冲效果

// 内部信号
reg [7:0]   current_effect;
reg [15:0]  effect_counter;
reg [7:0]   brightness_reg;
reg [7:0]   speed_reg;
reg [31:0]  timer_counter;
reg [7:0]   beat_counter;
reg [15:0]  effect_data_reg;
reg         effect_ready_reg;

// 频率到效果映射
wire [2:0] tone_category;
assign tone_category = (current_tone[15:8] > 8'h80) ? 3'h7 :  // 高音
                       (current_tone[15:8] > 8'h40) ? 3'h4 :  // 中音
                       (current_tone[15:8] > 8'h20) ? 3'h2 :  // 低音
                       3'h1;                                  // 静音

// 效果选择逻辑
always @(*) begin
    case(mode)
        1'b0: begin  // 手动模式
            case(tone_category)
                3'h7: current_effect = EFFECT_SPARKLE;    // 高音-闪烁
                3'h4: current_effect = EFFECT_FLOWING;    // 中音-流水
                3'h2: current_effect = EFFECT_BREATHING;  // 低音-呼吸
                default: current_effect = EFFECT_PULSE;   // 静音-脉冲
            endcase
        end
        1'b1: begin  // 自动模式
            if (playing) begin
                case(progress[7:5])  // 根据播放进度选择效果
                    3'h0: current_effect = EFFECT_RAINBOW;
                    3'h1: current_effect = EFFECT_SPECTRUM;
                    3'h2: current_effect = EFFECT_WAVEFORM;
                    3'h3: current_effect = EFFECT_BEAT;
                    3'h4: current_effect = EFFECT_FLOWING;
                    3'h5: current_effect = EFFECT_BREATHING;
                    3'h6: current_effect = EFFECT_SPARKLE;
                    3'h7: current_effect = EFFECT_PULSE;
                endcase
            end else begin
                current_effect = EFFECT_BREATHING;  // 暂停时显示呼吸灯
            end
        end
    endcase
end

// 定时器生成
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        timer_counter <= 32'h0;
        effect_counter <= 16'h0;
        beat_counter <= 8'h0;
    end else begin
        timer_counter <= timer_counter + 1;
        
        // 效果计数器更新（每8192个时钟周期更新一次，约1.5ms@12MHz）
        if (timer_counter[12:0] == 13'h0) begin
            effect_counter <= effect_counter + 1;
        end
        
        // 节拍计数器（音符变化时重置）
        if (current_tone != 16'h0) begin
            beat_counter <= beat_counter + 1;
        end else begin
            beat_counter <= 8'h0;
        end
    end
end

// 呼吸灯效果生成
reg [7:0] breathing_brightness;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        breathing_brightness <= 8'h00;
    end else begin
        // 三角波生成，周期约为256个效果计数周期
        if (effect_counter[7]) begin
            breathing_brightness <= 8'hFF - effect_counter[6:0] - effect_counter[6:0];
        end else begin
            breathing_brightness <= effect_counter[6:0] + effect_counter[6:0];
        end
    end
end

// 流水灯效果生成
reg [7:0] flowing_position;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        flowing_position <= 8'h00;
    end else begin
        // 位置随效果计数器线性增加
        flowing_position <= effect_counter[9:2];  // 较慢的流动速度
    end
end

// 频谱效果生成
reg [15:0] spectrum_data;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        spectrum_data <= 16'h0000;
    end else begin
        // 根据音符高低生成不同的频谱条
        case(current_tone[3:0])
            4'h0: spectrum_data <= 16'h0001;  // C
            4'h1: spectrum_data <= 16'h0003;  // C#
            4'h2: spectrum_data <= 16'h0007;  // D
            4'h3: spectrum_data <= 16'h000F;  // D#
            4'h4: spectrum_data <= 16'h001F;  // E
            4'h5: spectrum_data <= 16'h003F;  // F
            4'h6: spectrum_data <= 16'h007F;  // F#
            4'h7: spectrum_data <= 16'h00FF;  // G
            4'h8: spectrum_data <= 16'h01FF;  // G#
            4'h9: spectrum_data <= 16'h03FF;  // A
            4'hA: spectrum_data <= 16'h07FF;  // A#
            4'hB: spectrum_data <= 16'h0FFF;  // B
            default: spectrum_data <= 16'h0000;
        endcase
    end
end

// 彩虹效果生成
reg [7:0] rainbow_hue;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rainbow_hue <= 8'h00;
    end else begin
        // 色相值随时间变化
        if (timer_counter[15:0] == 16'h0) begin
            rainbow_hue <= rainbow_hue + 1;
        end
    end
end

// 闪烁效果生成
reg [7:0] sparkle_pattern;
reg [15:0] sparkle_lfsr;  // 线性反馈移位寄存器产生随机数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sparkle_pattern <= 8'h00;
        sparkle_lfsr <= 16'hACE1;  // 初始种子
    end else begin
        // LFSR生成伪随机数
        sparkle_lfsr <= {sparkle_lfsr[14:0], sparkle_lfsr[15] ^ sparkle_lfsr[13] ^ 
                        sparkle_lfsr[12] ^ sparkle_lfsr[10]};
        
        // 每32个时钟周期更新一次闪烁模式
        if (timer_counter[4:0] == 5'h0) begin
            sparkle_pattern <= sparkle_lfsr[7:0];
        end
    end
end

// 效果数据输出逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        effect_data_reg <= 16'h0000;
        brightness_reg <= 8'h80;
        speed_reg <= 8'h40;
        effect_ready_reg <= 1'b0;
    end else begin
        effect_ready_reg <= 1'b1;
        
        case(current_effect)
            EFFECT_BREATHING: begin
                effect_data_reg <= {8'h00, breathing_brightness};
                brightness_reg <= breathing_brightness;
                speed_reg <= 8'h20;  // 较慢速度
            end
            
            EFFECT_FLOWING: begin
                effect_data_reg <= {8'h00, flowing_position};
                brightness_reg <= 8'hC0;
                speed_reg <= 8'h60;  // 中等速度
            end
            
            EFFECT_SPECTRUM: begin
                effect_data_reg <= spectrum_data;
                brightness_reg <= 8'hFF;
                speed_reg <= 8'h80;  // 快速响应
            end
            
            EFFECT_WAVEFORM: begin
                effect_data_reg <= {effect_counter[7:0], effect_counter[15:8]};
                brightness_reg <= 8'hA0;
                speed_reg <= 8'h40;
            end
            
            EFFECT_BEAT: begin
                effect_data_reg <= {beat_counter, beat_counter};
                brightness_reg <= beat_counter;
                speed_reg <= 8'h70;
            end
            
            EFFECT_RAINBOW: begin
                effect_data_reg <= {rainbow_hue, rainbow_hue};
                brightness_reg <= 8'hE0;
                speed_reg <= 8'h30;
            end
            
            EFFECT_SPARKLE: begin
                effect_data_reg <= {sparkle_pattern, sparkle_pattern};
                brightness_reg <= sparkle_pattern;
                speed_reg <= 8'hFF;  // 最快速度
            end
            
            EFFECT_PULSE: begin
                effect_data_reg <= {8'h00, timer_counter[7:0]};
                brightness_reg <= timer_counter[7] ? 8'hFF : 8'h00;
                speed_reg <= 8'h50;
            end
            
            default: begin
                effect_data_reg <= 16'h0000;
                brightness_reg <= 8'h00;
                speed_reg <= 8'h40;
            end
        endcase
    end
end

// 输出赋值
assign effect_type = current_effect;
assign effect_data = effect_data_reg;
assign brightness = brightness_reg;
assign speed = speed_reg;
assign effect_ready = effect_ready_reg;

endmodule
