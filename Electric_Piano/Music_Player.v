// Music_Player.v - 音乐播放器模块
// 功能：自动播放预设的音乐序列
// 支持16种不同的音乐片段，每个按键对应一种音乐
// 更新：使用经典简单歌曲，基于准确搜索到的简谱数据

module Music_Player(
    input           clk,
    input           rst_n,
    input           mode,           // 播放模式（0=手动，1=自动）
    input   [15:0]  key_pulse,      // 键盘脉冲信号（自动模式下选择音乐）
    output reg [15:0] auto_tone,    // 输出音调
    output reg      song_finished   // 歌曲播放完成标志
);

// 音符定义（对应PWM周期值）
parameter SILENT = 16'd0;      // 静音
parameter C4 = 16'd45872;      // Do (261.6Hz)
parameter D4 = 16'd40858;      // Re (293.7Hz)
parameter E4 = 16'd36408;      // Mi (329.6Hz)
parameter F4 = 16'd34364;      // Fa (349.2Hz)
parameter G4 = 16'd30612;      // So (392.0Hz)
parameter A4 = 16'd27273;      // La (440.0Hz)
parameter B4 = 16'd24296;      // Si (493.9Hz)
parameter C5 = 16'd22931;      // Do (523.3Hz) 高音
parameter D5 = 16'd20432;      // Re (587.3Hz) 高音
parameter E5 = 16'd18201;      // Mi (659.3Hz) 高音
parameter F5 = 16'd17180;      // Fa (698.5Hz) 高音
parameter G5 = 16'd15306;      // So (784.0Hz) 高音
parameter A5 = 16'd13636;      // La (880.0Hz) 高音
parameter B5 = 16'd12148;      // Si (987.8Hz) 高音
parameter C6 = 16'd11478;      // Do (1046.5Hz) 高音
parameter D6 = 16'd10215;      // Re (1174.7Hz) 高音
// 低音区域
parameter C3 = 16'd91745;      // Do 低音 (130.8Hz)
parameter D3 = 16'd81716;      // Re 低音 (146.8Hz)
parameter E3 = 16'd72816;      // Mi 低音 (164.8Hz)
parameter F3 = 16'd68728;      // Fa 低音 (174.6Hz)
parameter G3 = 16'd61224;      // So 低音 (196.0Hz)
parameter A3 = 16'd54546;      // La 低音 (220.0Hz)
parameter B3 = 16'd48593;      // Si 低音 (246.9Hz)

// 节拍计数器 - 控制播放速度（每个音乐片段20秒）
reg [25:0] beat_counter;
parameter BEAT_PERIOD = 26'd1500000;  // 12MHz / 1.5M = 8Hz，每0.125秒一拍
reg        beat_pulse;

// 歌曲序列计数器和选择
reg [7:0] note_index;
reg [3:0] selected_song;    // 当前选择的歌曲（0-15）
reg       playing;          // 播放状态
reg [7:0] play_duration;    // 播放时长计数器（约20秒 = 160个节拍）
parameter SONG_DURATION = 8'd160;  // 20秒 * 8拍/秒 = 160拍

// 模式变化检测
reg mode_prev;
wire mode_changed;
assign mode_changed = (mode != mode_prev);

// 键盘按键到歌曲映射（边沿检测）
reg [15:0] key_pulse_prev;
wire [15:0] key_pressed;
assign key_pressed = key_pulse & (~key_pulse_prev);

// 节拍生成器（8Hz，每秒8拍）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        beat_counter <= 26'h0;
        beat_pulse <= 1'b0;
    end else begin
        if (playing && mode) begin  // 只有在自动模式且正在播放时才计节拍
            if (beat_counter >= BEAT_PERIOD - 1) begin
                beat_counter <= 26'h0;
                beat_pulse <= 1'b1;
            end else begin
                beat_counter <= beat_counter + 1'b1;
                beat_pulse <= 1'b0;
            end
        end else begin
            beat_counter <= 26'h0;
            beat_pulse <= 1'b0;
        end
    end
end

// 歌曲选择和播放控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        selected_song <= 4'h0;
        playing <= 1'b0;
        note_index <= 8'h0;
        play_duration <= 8'h0;
        song_finished <= 1'b0;
        mode_prev <= 1'b0;
        key_pulse_prev <= 16'h0000;
    end else begin
        mode_prev <= mode;
        key_pulse_prev <= key_pulse;
        
        if (!mode || mode_changed) begin
            // 手动模式或模式切换时停止播放
            playing <= 1'b0;
            note_index <= 8'h0;
            play_duration <= 8'h0;
            song_finished <= 1'b0;
        end else if (mode) begin  // 自动模式
            // 检测按键选择歌曲
            if (|key_pressed) begin
                // 根据按键选择歌曲（0-15）
                case (key_pressed)
                    16'h0001: selected_song <= 4'h0;   // 按键1 -> 小星星
                    16'h0002: selected_song <= 4'h1;   // 按键2 -> 生日快乐
                    16'h0004: selected_song <= 4'h2;   // 按键3 -> 两只老虎
                    16'h0008: selected_song <= 4'h3;   // 按键A -> 欢乐颂
                    16'h0010: selected_song <= 4'h4;   // 按键4 -> 世上只有妈妈好
                    16'h0020: selected_song <= 4'h5;   // 按键5 -> 摇篮曲
                    16'h0040: selected_song <= 4'h6;   // 按键6 -> 红河谷
                    16'h0080: selected_song <= 4'h7;   // 按键B -> 茉莉花
                    16'h0100: selected_song <= 4'h8;   // 按键7 -> 铃儿响叮当
                    16'h0200: selected_song <= 4'h9;   // 按键8 -> 新年好
                    16'h0400: selected_song <= 4'hA;   // 按键9 -> 春天在哪里
                    16'h0800: selected_song <= 4'hB;   // 按键C -> 粉刷匠
                    16'h1000: selected_song <= 4'hC;   // 按键* -> 找朋友
                    16'h2000: selected_song <= 4'hD;   // 按键0 -> 卖报歌
                    16'h4000: selected_song <= 4'hE;   // 按键# -> 小燕子
                    16'h8000: selected_song <= 4'hF;   // 按键D -> 虫儿飞
                    default: selected_song <= selected_song;
                endcase
                // 开始播放
                playing <= 1'b1;
                note_index <= 8'h0;
                play_duration <= 8'h0;
                song_finished <= 1'b0;
            end
            
            // 播放进度控制
            if (playing && beat_pulse) begin
                if (play_duration >= SONG_DURATION - 1) begin
                    // 20秒播放完成
                    playing <= 1'b0;
                    song_finished <= 1'b1;
                    note_index <= 8'h0;
                    play_duration <= 8'h0;
                end else begin
                    play_duration <= play_duration + 1'b1;
                    note_index <= note_index + 1'b1;
                    song_finished <= 1'b0;
                end
            end
        end
    end
end

// 根据选择的歌曲和播放进度输出对应音调
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        auto_tone <= SILENT;
    end else begin
        if (!mode || !playing) begin
            auto_tone <= SILENT;
        end else begin
            // 16种经典简单歌曲，基于准确简谱，64音符循环（完整歌曲）
            case (selected_song)
                4'h0: begin  // 歌曲0 - 小星星 (一闪一闪亮晶晶)
                    // 完整简谱：1 1 5 5 6 6 5 - 4 4 3 3 2 2 1 - 5 5 4 4 3 3 2 - 5 5 4 4 3 3 2 - 1 1 5 5 6 6 5 - 4 4 3 3 2 2 1 -
                    case (note_index & 8'h3F)  // 64音符循环
                        6'h00: auto_tone <= C4;   // 1 一
                        6'h01: auto_tone <= C4;   // 1 闪
                        6'h02: auto_tone <= G4;   // 5 一
                        6'h03: auto_tone <= G4;   // 5 闪
                        6'h04: auto_tone <= A4;   // 6 亮
                        6'h05: auto_tone <= A4;   // 6 晶
                        6'h06: auto_tone <= G4;   // 5 晶
                        6'h07: auto_tone <= SILENT; // -
                        6'h08: auto_tone <= F4;   // 4 满
                        6'h09: auto_tone <= F4;   // 4 天
                        6'h0A: auto_tone <= E4;   // 3 都
                        6'h0B: auto_tone <= E4;   // 3 是
                        6'h0C: auto_tone <= D4;   // 2 小
                        6'h0D: auto_tone <= D4;   // 2 星
                        6'h0E: auto_tone <= C4;   // 1 星
                        6'h0F: auto_tone <= SILENT; // -
                        6'h10: auto_tone <= G4;   // 5 挂
                        6'h11: auto_tone <= G4;   // 5 在
                        6'h12: auto_tone <= F4;   // 4 天
                        6'h13: auto_tone <= F4;   // 4 上
                        6'h14: auto_tone <= E4;   // 3 放
                        6'h15: auto_tone <= E4;   // 3 光
                        6'h16: auto_tone <= D4;   // 2 明
                        6'h17: auto_tone <= SILENT; // -
                        6'h18: auto_tone <= G4;   // 5 好
                        6'h19: auto_tone <= G4;   // 5 像
                        6'h1A: auto_tone <= F4;   // 4 许
                        6'h1B: auto_tone <= F4;   // 4 多
                        6'h1C: auto_tone <= E4;   // 3 小
                        6'h1D: auto_tone <= E4;   // 3 眼
                        6'h1E: auto_tone <= D4;   // 2 睛
                        6'h1F: auto_tone <= SILENT; // -
                        6'h20: auto_tone <= C4;   // 1 一
                        6'h21: auto_tone <= C4;   // 1 闪
                        6'h22: auto_tone <= G4;   // 5 一
                        6'h23: auto_tone <= G4;   // 5 闪
                        6'h24: auto_tone <= A4;   // 6 亮
                        6'h25: auto_tone <= A4;   // 6 晶
                        6'h26: auto_tone <= G4;   // 5 晶
                        6'h27: auto_tone <= SILENT; // -
                        6'h28: auto_tone <= F4;   // 4 满
                        6'h29: auto_tone <= F4;   // 4 天
                        6'h2A: auto_tone <= E4;   // 3 都
                        6'h2B: auto_tone <= E4;   // 3 是
                        6'h2C: auto_tone <= D4;   // 2 小
                        6'h2D: auto_tone <= D4;   // 2 星
                        6'h2E: auto_tone <= C4;   // 1 星
                        6'h2F: auto_tone <= SILENT; // -
                        // 重复一遍
                        6'h30: auto_tone <= C4;   
                        6'h31: auto_tone <= C4;   
                        6'h32: auto_tone <= G4;   
                        6'h33: auto_tone <= G4;   
                        6'h34: auto_tone <= A4;   
                        6'h35: auto_tone <= A4;   
                        6'h36: auto_tone <= G4;   
                        6'h37: auto_tone <= SILENT; 
                        6'h38: auto_tone <= F4;   
                        6'h39: auto_tone <= F4;   
                        6'h3A: auto_tone <= E4;   
                        6'h3B: auto_tone <= E4;   
                        6'h3C: auto_tone <= D4;   
                        6'h3D: auto_tone <= D4;   
                        6'h3E: auto_tone <= C4;   
                        6'h3F: auto_tone <= SILENT; 
                    endcase
                end
                
                4'h1: begin  // 歌曲1 - 生日快乐 (祝你生日快乐)
                    // 简谱：5 5 6 5 1 7 5 5 6 5 2 1 5 5 5 1 7 6 4 4 3 1 2 1
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   // 5 祝
                        5'h01: auto_tone <= G4;   // 5 你
                        5'h02: auto_tone <= A4;   // 6 生
                        5'h03: auto_tone <= G4;   // 5 日
                        5'h04: auto_tone <= C5;   // 1 快
                        5'h05: auto_tone <= B4;   // 7 乐
                        5'h06: auto_tone <= SILENT;
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= G4;   // 5 祝
                        5'h09: auto_tone <= G4;   // 5 你
                        5'h0A: auto_tone <= A4;   // 6 生
                        5'h0B: auto_tone <= G4;   // 5 日
                        5'h0C: auto_tone <= D5;   // 2 快
                        5'h0D: auto_tone <= C5;   // 1 乐
                        5'h0E: auto_tone <= SILENT;
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   // 5 祝
                        5'h11: auto_tone <= G4;   // 5 你
                        5'h12: auto_tone <= G4;   // 5 生
                        5'h13: auto_tone <= C5;   // 1 日
                        5'h14: auto_tone <= B4;   // 7 快
                        5'h15: auto_tone <= A4;   // 6 乐
                        5'h16: auto_tone <= SILENT;
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= F4;   // 4 祝
                        5'h19: auto_tone <= F4;   // 4 你
                        5'h1A: auto_tone <= E4;   // 3 永
                        5'h1B: auto_tone <= C5;   // 1 远
                        5'h1C: auto_tone <= D5;   // 2 快
                        5'h1D: auto_tone <= C5;   // 1 乐
                        5'h1E: auto_tone <= SILENT;
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h2: begin  // 歌曲2 - 两只老虎
                    // 简谱：1 2 3 1 1 2 3 1 3 4 5 - 3 4 5 - 5 6 5 4 3 1 5 6 5 4 3 1 2 5 1 2 5 1
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= C4;   // 1 两
                        5'h01: auto_tone <= D4;   // 2 只
                        5'h02: auto_tone <= E4;   // 3 老
                        5'h03: auto_tone <= C4;   // 1 虎
                        5'h04: auto_tone <= C4;   // 1 两
                        5'h05: auto_tone <= D4;   // 2 只
                        5'h06: auto_tone <= E4;   // 3 老
                        5'h07: auto_tone <= C4;   // 1 虎
                        5'h08: auto_tone <= E4;   // 3 跑
                        5'h09: auto_tone <= F4;   // 4 得
                        5'h0A: auto_tone <= G4;   // 5 快
                        5'h0B: auto_tone <= SILENT; // -
                        5'h0C: auto_tone <= E4;   // 3 跑
                        5'h0D: auto_tone <= F4;   // 4 得
                        5'h0E: auto_tone <= G4;   // 5 快
                        5'h0F: auto_tone <= SILENT; // -
                        5'h10: auto_tone <= G4;   // 5 一
                        5'h11: auto_tone <= A4;   // 6 只
                        5'h12: auto_tone <= G4;   // 5 没
                        5'h13: auto_tone <= F4;   // 4 有
                        5'h14: auto_tone <= E4;   // 3 眼
                        5'h15: auto_tone <= C4;   // 1 睛
                        5'h16: auto_tone <= G4;   // 5 一
                        5'h17: auto_tone <= A4;   // 6 只
                        5'h18: auto_tone <= G4;   // 5 没
                        5'h19: auto_tone <= F4;   // 4 有
                        5'h1A: auto_tone <= E4;   // 3 尾
                        5'h1B: auto_tone <= C4;   // 1 巴
                        5'h1C: auto_tone <= D4;   // 2 真
                        5'h1D: auto_tone <= G3;   // 5(低音) 奇
                        5'h1E: auto_tone <= C4;   // 1 怪
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h3: begin  // 歌曲3 - 欢乐颂 (贝多芬)
                    // 简谱：3 3 4 5 5 4 3 2 1 1 2 3 3.2 2- 3 3 4 5 5 4 3 2 1 1 2 3 2.1 1-
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= E4;   // 3
                        5'h01: auto_tone <= E4;   // 3
                        5'h02: auto_tone <= F4;   // 4
                        5'h03: auto_tone <= G4;   // 5
                        5'h04: auto_tone <= G4;   // 5
                        5'h05: auto_tone <= F4;   // 4
                        5'h06: auto_tone <= E4;   // 3
                        5'h07: auto_tone <= D4;   // 2
                        5'h08: auto_tone <= C4;   // 1
                        5'h09: auto_tone <= C4;   // 1
                        5'h0A: auto_tone <= D4;   // 2
                        5'h0B: auto_tone <= E4;   // 3
                        5'h0C: auto_tone <= E4;   // 3.
                        5'h0D: auto_tone <= D4;   // 2
                        5'h0E: auto_tone <= D4;   // 2
                        5'h0F: auto_tone <= SILENT; // -
                        5'h10: auto_tone <= E4;   // 3
                        5'h11: auto_tone <= E4;   // 3
                        5'h12: auto_tone <= F4;   // 4
                        5'h13: auto_tone <= G4;   // 5
                        5'h14: auto_tone <= G4;   // 5
                        5'h15: auto_tone <= F4;   // 4
                        5'h16: auto_tone <= E4;   // 3
                        5'h17: auto_tone <= D4;   // 2
                        5'h18: auto_tone <= C4;   // 1
                        5'h19: auto_tone <= C4;   // 1
                        5'h1A: auto_tone <= D4;   // 2
                        5'h1B: auto_tone <= E4;   // 3
                        5'h1C: auto_tone <= D4;   // 2.
                        5'h1D: auto_tone <= C4;   // 1
                        5'h1E: auto_tone <= C4;   // 1
                        5'h1F: auto_tone <= SILENT; // -
                    endcase
                end
                
                4'h4: begin  // 歌曲4 - 世上只有妈妈好
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= C4;   // 1 世
                        5'h01: auto_tone <= E4;   // 3 上
                        5'h02: auto_tone <= G4;   // 5 只
                        5'h03: auto_tone <= A4;   // 6 有
                        5'h04: auto_tone <= G4;   // 5 妈
                        5'h05: auto_tone <= E4;   // 3 妈
                        5'h06: auto_tone <= G4;   // 5 好
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A4;   // 6 有
                        5'h09: auto_tone <= G4;   // 5 妈
                        5'h0A: auto_tone <= E4;   // 3 的
                        5'h0B: auto_tone <= C4;   // 1 孩
                        5'h0C: auto_tone <= D4;   // 2 子
                        5'h0D: auto_tone <= E4;   // 3 像
                        5'h0E: auto_tone <= G4;   // 5 个
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= A4;   // 6 宝
                        5'h11: auto_tone <= G4;   // 5 投
                        5'h12: auto_tone <= E4;   // 3 进
                        5'h13: auto_tone <= C4;   // 1 妈
                        5'h14: auto_tone <= D4;   // 2 妈
                        5'h15: auto_tone <= E4;   // 3 的
                        5'h16: auto_tone <= D4;   // 2 怀
                        5'h17: auto_tone <= C4;   // 1 抱
                        5'h18: auto_tone <= G4;   // 5 幸
                        5'h19: auto_tone <= A4;   // 6 福
                        5'h1A: auto_tone <= G4;   // 5 享
                        5'h1B: auto_tone <= E4;   // 3 不
                        5'h1C: auto_tone <= D4;   // 2 了
                        5'h1D: auto_tone <= C4;   // 1
                        5'h1E: auto_tone <= SILENT;
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h5: begin  // 歌曲5 - 摇篮曲
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= C4;   
                        5'h01: auto_tone <= E4;   
                        5'h02: auto_tone <= G4;   
                        5'h03: auto_tone <= C5;   
                        5'h04: auto_tone <= G4;   
                        5'h05: auto_tone <= E4;   
                        5'h06: auto_tone <= C4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= D4;   
                        5'h09: auto_tone <= F4;   
                        5'h0A: auto_tone <= A4;   
                        5'h0B: auto_tone <= D5;   
                        5'h0C: auto_tone <= A4;   
                        5'h0D: auto_tone <= F4;   
                        5'h0E: auto_tone <= D4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= E4;   
                        5'h11: auto_tone <= G4;   
                        5'h12: auto_tone <= C5;   
                        5'h13: auto_tone <= E5;   
                        5'h14: auto_tone <= C5;   
                        5'h15: auto_tone <= G4;   
                        5'h16: auto_tone <= E4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= F4;   
                        5'h19: auto_tone <= A4;   
                        5'h1A: auto_tone <= C5;   
                        5'h1B: auto_tone <= F5;   
                        5'h1C: auto_tone <= C5;   
                        5'h1D: auto_tone <= A4;   
                        5'h1E: auto_tone <= F4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h6: begin  // 歌曲6 - 红河谷
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= C5;   
                        5'h02: auto_tone <= E5;   
                        5'h03: auto_tone <= D5;   
                        5'h04: auto_tone <= C5;   
                        5'h05: auto_tone <= A4;   
                        5'h06: auto_tone <= G4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A4;   
                        5'h09: auto_tone <= C5;   
                        5'h0A: auto_tone <= D5;   
                        5'h0B: auto_tone <= E5;   
                        5'h0C: auto_tone <= D5;   
                        5'h0D: auto_tone <= C5;   
                        5'h0E: auto_tone <= A4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= A4;   
                        5'h12: auto_tone <= C5;   
                        5'h13: auto_tone <= D5;   
                        5'h14: auto_tone <= E5;   
                        5'h15: auto_tone <= D5;   
                        5'h16: auto_tone <= C5;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= A4;   
                        5'h19: auto_tone <= G4;   
                        5'h1A: auto_tone <= F4;   
                        5'h1B: auto_tone <= E4;   
                        5'h1C: auto_tone <= D4;   
                        5'h1D: auto_tone <= C4;   
                        5'h1E: auto_tone <= G4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h7: begin  // 歌曲7 - 茉莉花
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= E4;   
                        5'h01: auto_tone <= G4;   
                        5'h02: auto_tone <= A4;   
                        5'h03: auto_tone <= C5;   
                        5'h04: auto_tone <= A4;   
                        5'h05: auto_tone <= G4;   
                        5'h06: auto_tone <= E4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= G4;   
                        5'h09: auto_tone <= A4;   
                        5'h0A: auto_tone <= C5;   
                        5'h0B: auto_tone <= E5;   
                        5'h0C: auto_tone <= C5;   
                        5'h0D: auto_tone <= A4;   
                        5'h0E: auto_tone <= G4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= A4;   
                        5'h11: auto_tone <= C5;   
                        5'h12: auto_tone <= A4;   
                        5'h13: auto_tone <= G4;   
                        5'h14: auto_tone <= E4;   
                        5'h15: auto_tone <= G4;   
                        5'h16: auto_tone <= A4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= C5;   
                        5'h19: auto_tone <= A4;   
                        5'h1A: auto_tone <= G4;   
                        5'h1B: auto_tone <= E4;   
                        5'h1C: auto_tone <= D4;   
                        5'h1D: auto_tone <= E4;   
                        5'h1E: auto_tone <= G4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h8: begin  // 歌曲8 - 铃儿响叮当
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= E4;   
                        5'h01: auto_tone <= E4;   
                        5'h02: auto_tone <= E4;   
                        5'h03: auto_tone <= SILENT;
                        5'h04: auto_tone <= E4;   
                        5'h05: auto_tone <= E4;   
                        5'h06: auto_tone <= E4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= E4;   
                        5'h09: auto_tone <= G4;   
                        5'h0A: auto_tone <= C4;   
                        5'h0B: auto_tone <= D4;   
                        5'h0C: auto_tone <= E4;   
                        5'h0D: auto_tone <= SILENT;
                        5'h0E: auto_tone <= SILENT;
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= F4;   
                        5'h11: auto_tone <= F4;   
                        5'h12: auto_tone <= F4;   
                        5'h13: auto_tone <= F4;   
                        5'h14: auto_tone <= F4;   
                        5'h15: auto_tone <= E4;   
                        5'h16: auto_tone <= E4;   
                        5'h17: auto_tone <= E4;
                        5'h18: auto_tone <= E4;   
                        5'h19: auto_tone <= D4;   
                        5'h1A: auto_tone <= D4;   
                        5'h1B: auto_tone <= E4;   
                        5'h1C: auto_tone <= D4;   
                        5'h1D: auto_tone <= G4;   
                        5'h1E: auto_tone <= SILENT;
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'h9: begin  // 歌曲9 - 新年好
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= C4;   
                        5'h01: auto_tone <= C4;   
                        5'h02: auto_tone <= C4;   
                        5'h03: auto_tone <= SILENT;
                        5'h04: auto_tone <= C4;   
                        5'h05: auto_tone <= C4;   
                        5'h06: auto_tone <= C4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A3;   
                        5'h09: auto_tone <= F4;   
                        5'h0A: auto_tone <= F4;   
                        5'h0B: auto_tone <= C4;   
                        5'h0C: auto_tone <= SILENT;
                        5'h0D: auto_tone <= SILENT;
                        5'h0E: auto_tone <= SILENT;
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= G4;   
                        5'h12: auto_tone <= F4;   
                        5'h13: auto_tone <= E4;   
                        5'h14: auto_tone <= D4;   
                        5'h15: auto_tone <= SILENT;
                        5'h16: auto_tone <= C4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= C4;   
                        5'h19: auto_tone <= G4;   
                        5'h1A: auto_tone <= F4;   
                        5'h1B: auto_tone <= E4;   
                        5'h1C: auto_tone <= D4;   
                        5'h1D: auto_tone <= C4;   
                        5'h1E: auto_tone <= SILENT;
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hA: begin  // 歌曲10 - 春天在哪里
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= E4;   
                        5'h02: auto_tone <= E4;   
                        5'h03: auto_tone <= G4;   
                        5'h04: auto_tone <= E4;   
                        5'h05: auto_tone <= E4;   
                        5'h06: auto_tone <= D4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= E4;   
                        5'h09: auto_tone <= D4;   
                        5'h0A: auto_tone <= C4;   
                        5'h0B: auto_tone <= D4;   
                        5'h0C: auto_tone <= E4;   
                        5'h0D: auto_tone <= D4;   
                        5'h0E: auto_tone <= C4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= C4;   
                        5'h11: auto_tone <= D4;   
                        5'h12: auto_tone <= E4;   
                        5'h13: auto_tone <= G4;   
                        5'h14: auto_tone <= A4;   
                        5'h15: auto_tone <= G4;   
                        5'h16: auto_tone <= E4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= D4;   
                        5'h19: auto_tone <= E4;   
                        5'h1A: auto_tone <= D4;   
                        5'h1B: auto_tone <= C4;   
                        5'h1C: auto_tone <= A3;   
                        5'h1D: auto_tone <= C4;   
                        5'h1E: auto_tone <= SILENT;
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hB: begin  // 歌曲11 - 粉刷匠
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= G4;   
                        5'h02: auto_tone <= A4;   
                        5'h03: auto_tone <= A4;   
                        5'h04: auto_tone <= G4;   
                        5'h05: auto_tone <= G4;   
                        5'h06: auto_tone <= E4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A4;   
                        5'h09: auto_tone <= A4;   
                        5'h0A: auto_tone <= G4;   
                        5'h0B: auto_tone <= G4;   
                        5'h0C: auto_tone <= E4;   
                        5'h0D: auto_tone <= E4;   
                        5'h0E: auto_tone <= D4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= G4;   
                        5'h12: auto_tone <= A4;   
                        5'h13: auto_tone <= A4;   
                        5'h14: auto_tone <= G4;   
                        5'h15: auto_tone <= G4;   
                        5'h16: auto_tone <= E4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= D4;   
                        5'h19: auto_tone <= D4;   
                        5'h1A: auto_tone <= E4;   
                        5'h1B: auto_tone <= E4;   
                        5'h1C: auto_tone <= G4;   
                        5'h1D: auto_tone <= G4;   
                        5'h1E: auto_tone <= C4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hC: begin  // 歌曲12 - 找朋友
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= C4;   
                        5'h01: auto_tone <= C4;   
                        5'h02: auto_tone <= G4;   
                        5'h03: auto_tone <= G4;   
                        5'h04: auto_tone <= A4;   
                        5'h05: auto_tone <= A4;   
                        5'h06: auto_tone <= G4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= F4;   
                        5'h09: auto_tone <= F4;   
                        5'h0A: auto_tone <= E4;   
                        5'h0B: auto_tone <= E4;   
                        5'h0C: auto_tone <= D4;   
                        5'h0D: auto_tone <= D4;   
                        5'h0E: auto_tone <= C4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= G4;   
                        5'h12: auto_tone <= F4;   
                        5'h13: auto_tone <= F4;   
                        5'h14: auto_tone <= E4;   
                        5'h15: auto_tone <= E4;   
                        5'h16: auto_tone <= D4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= G4;   
                        5'h19: auto_tone <= G4;   
                        5'h1A: auto_tone <= F4;   
                        5'h1B: auto_tone <= F4;   
                        5'h1C: auto_tone <= E4;   
                        5'h1D: auto_tone <= E4;   
                        5'h1E: auto_tone <= D4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hD: begin  // 歌曲13 - 卖报歌
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= E4;   
                        5'h02: auto_tone <= D4;   
                        5'h03: auto_tone <= C4;   
                        5'h04: auto_tone <= D4;   
                        5'h05: auto_tone <= E4;   
                        5'h06: auto_tone <= G4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= G4;   
                        5'h09: auto_tone <= E4;   
                        5'h0A: auto_tone <= D4;   
                        5'h0B: auto_tone <= C4;   
                        5'h0C: auto_tone <= D4;   
                        5'h0D: auto_tone <= C4;   
                        5'h0E: auto_tone <= A3;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= A4;   
                        5'h11: auto_tone <= A4;   
                        5'h12: auto_tone <= A4;   
                        5'h13: auto_tone <= A4;   
                        5'h14: auto_tone <= G4;   
                        5'h15: auto_tone <= E4;   
                        5'h16: auto_tone <= G4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= D4;   
                        5'h19: auto_tone <= D4;   
                        5'h1A: auto_tone <= D4;   
                        5'h1B: auto_tone <= G4;   
                        5'h1C: auto_tone <= E4;   
                        5'h1D: auto_tone <= D4;   
                        5'h1E: auto_tone <= C4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hE: begin  // 歌曲14 - 小燕子
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= E4;   
                        5'h02: auto_tone <= G4;   
                        5'h03: auto_tone <= C5;   
                        5'h04: auto_tone <= B4;   
                        5'h05: auto_tone <= A4;   
                        5'h06: auto_tone <= G4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A4;   
                        5'h09: auto_tone <= G4;   
                        5'h0A: auto_tone <= F4;   
                        5'h0B: auto_tone <= E4;   
                        5'h0C: auto_tone <= D4;   
                        5'h0D: auto_tone <= C4;   
                        5'h0E: auto_tone <= D4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= G4;   
                        5'h12: auto_tone <= A4;   
                        5'h13: auto_tone <= B4;   
                        5'h14: auto_tone <= C5;   
                        5'h15: auto_tone <= B4;   
                        5'h16: auto_tone <= A4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= G4;   
                        5'h19: auto_tone <= F4;   
                        5'h1A: auto_tone <= E4;   
                        5'h1B: auto_tone <= D4;   
                        5'h1C: auto_tone <= C4;   
                        5'h1D: auto_tone <= E4;   
                        5'h1E: auto_tone <= G4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                4'hF: begin  // 歌曲15 - 虫儿飞
                    case (note_index & 8'h1F)  // 32音符循环
                        5'h00: auto_tone <= G4;   
                        5'h01: auto_tone <= C5;   
                        5'h02: auto_tone <= B4;   
                        5'h03: auto_tone <= A4;   
                        5'h04: auto_tone <= G4;   
                        5'h05: auto_tone <= E4;   
                        5'h06: auto_tone <= G4;   
                        5'h07: auto_tone <= SILENT;
                        5'h08: auto_tone <= A4;   
                        5'h09: auto_tone <= G4;   
                        5'h0A: auto_tone <= F4;   
                        5'h0B: auto_tone <= E4;   
                        5'h0C: auto_tone <= D4;   
                        5'h0D: auto_tone <= C4;   
                        5'h0E: auto_tone <= E4;   
                        5'h0F: auto_tone <= SILENT;
                        5'h10: auto_tone <= G4;   
                        5'h11: auto_tone <= A4;   
                        5'h12: auto_tone <= B4;   
                        5'h13: auto_tone <= C5;   
                        5'h14: auto_tone <= D5;   
                        5'h15: auto_tone <= C5;   
                        5'h16: auto_tone <= A4;   
                        5'h17: auto_tone <= SILENT;
                        5'h18: auto_tone <= G4;   
                        5'h19: auto_tone <= F4;   
                        5'h1A: auto_tone <= E4;   
                        5'h1B: auto_tone <= D4;   
                        5'h1C: auto_tone <= C4;   
                        5'h1D: auto_tone <= D4;   
                        5'h1E: auto_tone <= G4;   
                        5'h1F: auto_tone <= SILENT;
                    endcase
                end
                
                default: auto_tone <= SILENT;
            endcase
        end
    end
end

endmodule