// Music_Player.v - 音乐播放器模块
// 功能：自动播放预设的歌曲序列
// 支持的歌曲：稻香、青花瓷、告白气球、简单爱

module Music_Player(
    input           clk,
    input           rst_n,
    input   [2:0]   mode,           // 播放模式
    input           enable,         // 播放使能
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

// 节拍计数器 - 控制播放速度
reg [25:0] beat_counter;
parameter BEAT_PERIOD = 26'd6000000;  // 12MHz / 6M = 2Hz，每0.5秒一拍
reg        beat_pulse;

// 歌曲序列计数器
reg [7:0] note_index;
wire [7:0] song_length;

// 模式变化检测
reg [2:0] mode_prev;
wire mode_changed;
assign mode_changed = (mode != mode_prev);

// 节拍生成器（约每秒2拍，可调节速度）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        beat_counter <= 26'h0;
        beat_pulse <= 1'b0;
    end else begin
        if (enable) begin
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

// 歌曲长度设置（组合逻辑）
assign song_length = (mode == 3'b001) ? 8'd32 :  // 稻香 - 32个音符
                     (mode == 3'b010) ? 8'd28 :  // 青花瓷 - 28个音符
                     (mode == 3'b011) ? 8'd24 :  // 告白气球 - 24个音符
                     (mode == 3'b100) ? 8'd20 :  // 简单爱 - 20个音符
                     8'd16;                       // 默认长度

// 音符序列播放控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        note_index <= 8'h0;
        song_finished <= 1'b0;
        mode_prev <= 3'b000;
    end else begin
        mode_prev <= mode;  // 更新模式历史
        
        if (!enable || mode_changed) begin
            // 禁用播放或模式改变时重置
            note_index <= 8'h0;
            song_finished <= 1'b0;
        end else if (beat_pulse) begin
            if (note_index >= song_length - 1) begin
                note_index <= 8'h0;      // 循环播放
                song_finished <= 1'b1;
            end else begin
                note_index <= note_index + 1'b1;
                song_finished <= 1'b0;
            end
        end
    end
end

// 根据模式和音符索引输出对应音调
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        auto_tone <= SILENT;
    end else begin
        if (!enable) begin
            auto_tone <= SILENT;
        end else begin
            case (mode)
                3'b001: begin  // 稻香 - 简化版主旋律
                    case (note_index)
                        8'd0:  auto_tone <= G4;    // So
                        8'd1:  auto_tone <= A4;    // La
                        8'd2:  auto_tone <= C5;    // Do(高)
                        8'd3:  auto_tone <= A4;    // La
                        8'd4:  auto_tone <= G4;    // So
                        8'd5:  auto_tone <= F4;    // Fa
                        8'd6:  auto_tone <= E4;    // Mi
                        8'd7:  auto_tone <= D4;    // Re
                        8'd8:  auto_tone <= C4;    // Do
                        8'd9:  auto_tone <= SILENT;
                        8'd10: auto_tone <= E4;    // Mi
                        8'd11: auto_tone <= F4;    // Fa
                        8'd12: auto_tone <= G4;    // So
                        8'd13: auto_tone <= A4;    // La
                        8'd14: auto_tone <= G4;    // So
                        8'd15: auto_tone <= F4;    // Fa
                        8'd16: auto_tone <= E4;    // Mi
                        8'd17: auto_tone <= D4;    // Re
                        8'd18: auto_tone <= C4;    // Do
                        8'd19: auto_tone <= SILENT;
                        8'd20: auto_tone <= C5;    // Do(高)
                        8'd21: auto_tone <= B4;    // Si
                        8'd22: auto_tone <= A4;    // La
                        8'd23: auto_tone <= G4;    // So
                        8'd24: auto_tone <= F4;    // Fa
                        8'd25: auto_tone <= E4;    // Mi
                        8'd26: auto_tone <= D4;    // Re
                        8'd27: auto_tone <= E4;    // Mi
                        8'd28: auto_tone <= C4;    // Do
                        8'd29: auto_tone <= SILENT;
                        8'd30: auto_tone <= G4;    // So
                        8'd31: auto_tone <= C4;    // Do
                        default: auto_tone <= SILENT;
                    endcase
                end
                
                3'b010: begin  // 青花瓷 - 简化版主旋律
                    case (note_index)
                        8'd0:  auto_tone <= C4;    // 素胚勾勒出
                        8'd1:  auto_tone <= D4;
                        8'd2:  auto_tone <= E4;
                        8'd3:  auto_tone <= G4;
                        8'd4:  auto_tone <= A4;    // 青花的笔锋
                        8'd5:  auto_tone <= G4;
                        8'd6:  auto_tone <= E4;
                        8'd7:  auto_tone <= D4;
                        8'd8:  auto_tone <= C4;    // 浓转淡
                        8'd9:  auto_tone <= SILENT;
                        8'd10: auto_tone <= E4;    // 瓶身描绘的
                        8'd11: auto_tone <= F4;
                        8'd12: auto_tone <= G4;
                        8'd13: auto_tone <= A4;
                        8'd14: auto_tone <= C5;    // 牡丹一如
                        8'd15: auto_tone <= B4;
                        8'd16: auto_tone <= A4;
                        8'd17: auto_tone <= G4;
                        8'd18: auto_tone <= F4;    // 你初妆
                        8'd19: auto_tone <= E4;
                        8'd20: auto_tone <= D4;
                        8'd21: auto_tone <= C4;
                        8'd22: auto_tone <= SILENT;
                        8'd23: auto_tone <= G4;
                        8'd24: auto_tone <= A4;
                        8'd25: auto_tone <= C5;
                        8'd26: auto_tone <= D5;
                        8'd27: auto_tone <= C5;
                        default: auto_tone <= SILENT;
                    endcase
                end
                
                3'b011: begin  // 告白气球 - 简化版主旋律
                    case (note_index)
                        8'd0:  auto_tone <= C4;    // 塞纳河畔
                        8'd1:  auto_tone <= D4;
                        8'd2:  auto_tone <= E4;
                        8'd3:  auto_tone <= F4;
                        8'd4:  auto_tone <= G4;    // 左岸的咖啡
                        8'd5:  auto_tone <= A4;
                        8'd6:  auto_tone <= G4;
                        8'd7:  auto_tone <= F4;
                        8'd8:  auto_tone <= E4;    // 我手一杯
                        8'd9:  auto_tone <= D4;
                        8'd10: auto_tone <= C4;
                        8'd11: auto_tone <= SILENT;
                        8'd12: auto_tone <= E4;    // 品尝你的美
                        8'd13: auto_tone <= F4;
                        8'd14: auto_tone <= G4;
                        8'd15: auto_tone <= A4;
                        8'd16: auto_tone <= C5;    // 留下唇印的
                        8'd17: auto_tone <= B4;
                        8'd18: auto_tone <= A4;
                        8'd19: auto_tone <= G4;
                        8'd20: auto_tone <= F4;    // 嘴
                        8'd21: auto_tone <= E4;
                        8'd22: auto_tone <= D4;
                        8'd23: auto_tone <= C4;
                        default: auto_tone <= SILENT;
                    endcase
                end
                
                3'b100: begin  // 简单爱 - 简化版主旋律
                    case (note_index)
                        8'd0:  auto_tone <= G4;    // 说不上为什么
                        8'd1:  auto_tone <= A4;
                        8'd2:  auto_tone <= C5;
                        8'd3:  auto_tone <= D5;
                        8'd4:  auto_tone <= C5;    // 我变得很主动
                        8'd5:  auto_tone <= A4;
                        8'd6:  auto_tone <= G4;
                        8'd7:  auto_tone <= F4;
                        8'd8:  auto_tone <= E4;    // 若爱上一个人
                        8'd9:  auto_tone <= D4;
                        8'd10: auto_tone <= C4;
                        8'd11: auto_tone <= SILENT;
                        8'd12: auto_tone <= C5;    // 什么都会值得去做
                        8'd13: auto_tone <= B4;
                        8'd14: auto_tone <= A4;
                        8'd15: auto_tone <= G4;
                        8'd16: auto_tone <= F4;
                        8'd17: auto_tone <= E4;
                        8'd18: auto_tone <= D4;
                        8'd19: auto_tone <= C4;
                        default: auto_tone <= SILENT;
                    endcase
                end
                
                default: auto_tone <= SILENT;
            endcase
        end
    end
end

endmodule
