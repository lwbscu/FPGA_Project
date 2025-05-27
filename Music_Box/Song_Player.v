// Song_Player_V2.v - 歌曲播放器模块（修正版）
// 简化逻辑，确保正确播放

module Song_Player_V2(
    input           clk,            // 系统时钟
    input           rst_n,          // 复位信号
    input   [3:0]   song_select,    // 歌曲选择
    input           song_valid,     // 歌曲有效标志
    output reg [7:0] note,          // 当前音符
    output reg [23:0] duration,     // 音符持续时间
    output reg      play_enable     // 播放使能
);

// 音符定义
localparam REST = 8'd0;    // 休止符
localparam L1 = 8'd1;      // 低音1
localparam L2 = 8'd2;      // 低音2
localparam L3 = 8'd3;      // 低音3
localparam L4 = 8'd4;      // 低音4
localparam L5 = 8'd5;      // 低音5
localparam L6 = 8'd6;      // 低音6
localparam L7 = 8'd7;      // 低音7
localparam M1 = 8'd8;      // 中音1
localparam M2 = 8'd9;      // 中音2
localparam M3 = 8'd10;     // 中音3
localparam M4 = 8'd11;     // 中音4
localparam M5 = 8'd12;     // 中音5
localparam M6 = 8'd13;     // 中音6
localparam M7 = 8'd14;     // 中音7
localparam H1 = 8'd15;     // 高音1
localparam H2 = 8'd16;     // 高音2

// 节拍定义（基于12MHz时钟）
localparam BEAT_1   = 24'd6000000;   // 全音符 (500ms)
localparam BEAT_1_2 = 24'd3000000;   // 二分音符 (250ms)
localparam BEAT_1_4 = 24'd1500000;   // 四分音符 (125ms)
localparam BEAT_1_8 = 24'd750000;    // 八分音符 (62.5ms)

// 状态机定义
reg [1:0] state;
localparam IDLE = 2'b00;
localparam LOAD = 2'b01;
localparam PLAY = 2'b10;
localparam WAIT = 2'b11;

// 内部寄存器
reg [7:0] note_index;          // 当前音符索引
reg [23:0] duration_counter;   // 持续时间计数器
reg [3:0] current_song;        // 当前播放的歌曲
reg [7:0] next_note;           // 下一个音符
reg [23:0] next_duration;      // 下一个音符持续时间

// 播放控制状态机
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        note_index <= 8'd0;
        duration_counter <= 24'd0;
        play_enable <= 1'b0;
        current_song <= 4'd0;
        note <= REST;
        duration <= 24'd0;
    end
    else begin
        case(state)
            IDLE: begin
                play_enable <= 1'b0;
                if (song_valid) begin
                    if (song_select != current_song) begin
                        current_song <= song_select;
                        note_index <= 8'd0;
                    end
                    state <= LOAD;
                end
            end
            
            LOAD: begin
                // 加载下一个音符
                get_note_data(current_song, note_index, next_note, next_duration);
                
                // 检查是否到达歌曲结尾
                if (next_duration == 24'd0) begin
                    note_index <= 8'd0;  // 循环到开头
                    state <= IDLE;
                end
                else begin
                    note <= next_note;
                    duration <= next_duration;
                    duration_counter <= next_duration;
                    state <= PLAY;
                end
            end
            
            PLAY: begin
                play_enable <= 1'b1;
                state <= WAIT;
            end
            
            WAIT: begin
                if (duration_counter > 0) begin
                    duration_counter <= duration_counter - 1'b1;
                end
                else begin
                    play_enable <= 1'b0;
                    note_index <= note_index + 1'b1;
                    state <= LOAD;
                end
                
                // 检查是否切换歌曲
                if (song_select != current_song) begin
                    state <= IDLE;
                    play_enable <= 1'b0;
                end
            end
        endcase
    end
end

// 获取音符数据的任务（改为always块实现）
reg [7:0] temp_note;
reg [23:0] temp_duration;

always @(*) begin
    temp_note = REST;
    temp_duration = 24'd0;
    
    case(current_song)
        4'd1: begin // 小星星（简化版，用于测试）
            case(note_index)
                8'd0:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd1:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd2:  begin temp_note = M5; temp_duration = BEAT_1_4; end
                8'd3:  begin temp_note = M5; temp_duration = BEAT_1_4; end
                8'd4:  begin temp_note = M6; temp_duration = BEAT_1_4; end
                8'd5:  begin temp_note = M6; temp_duration = BEAT_1_4; end
                8'd6:  begin temp_note = M5; temp_duration = BEAT_1_2; end
                8'd7:  begin temp_note = REST; temp_duration = BEAT_1_4; end // 休止
                8'd8:  begin temp_note = M4; temp_duration = BEAT_1_4; end
                8'd9:  begin temp_note = M4; temp_duration = BEAT_1_4; end
                8'd10: begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd11: begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd12: begin temp_note = M2; temp_duration = BEAT_1_4; end
                8'd13: begin temp_note = M2; temp_duration = BEAT_1_4; end
                8'd14: begin temp_note = M1; temp_duration = BEAT_1_2; end
                default: begin temp_note = REST; temp_duration = 24'd0; end // 结束标记
            endcase
        end
        
        4'd3: begin // 两只老虎（简化版）
            case(note_index)
                8'd0:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd1:  begin temp_note = M2; temp_duration = BEAT_1_4; end
                8'd2:  begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd3:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd4:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd5:  begin temp_note = M2; temp_duration = BEAT_1_4; end
                8'd6:  begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd7:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd8:  begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd9:  begin temp_note = M4; temp_duration = BEAT_1_4; end
                8'd10: begin temp_note = M5; temp_duration = BEAT_1_2; end
                8'd11: begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd12: begin temp_note = M4; temp_duration = BEAT_1_4; end
                8'd13: begin temp_note = M5; temp_duration = BEAT_1_2; end
                default: begin temp_note = REST; temp_duration = 24'd0; end
            endcase
        end
        
        default: begin // 默认播放简单音阶（用于测试）
            case(note_index)
                8'd0:  begin temp_note = M1; temp_duration = BEAT_1_4; end
                8'd1:  begin temp_note = M2; temp_duration = BEAT_1_4; end
                8'd2:  begin temp_note = M3; temp_duration = BEAT_1_4; end
                8'd3:  begin temp_note = M4; temp_duration = BEAT_1_4; end
                8'd4:  begin temp_note = M5; temp_duration = BEAT_1_4; end
                8'd5:  begin temp_note = M6; temp_duration = BEAT_1_4; end
                8'd6:  begin temp_note = M7; temp_duration = BEAT_1_4; end
                8'd7:  begin temp_note = H1; temp_duration = BEAT_1_2; end
                default: begin temp_note = REST; temp_duration = 24'd0; end
            endcase
        end
    endcase
end

// 任务：获取音符数据
task get_note_data;
    input [3:0] song;
    input [7:0] index;
    output [7:0] note_out;
    output [23:0] duration_out;
    begin
        note_out = temp_note;
        duration_out = temp_duration;
    end
endtask

endmodule