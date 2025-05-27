// Music_Box_V2.v - 音乐盒顶层模块（修正版）
// 添加调试信号和修正逻辑

module Music_Box(
    input           clk,        // 系统时钟 12MHz
    input           rst_n,      // 复位信号，低电平有效
    input   [3:0]   col,        // 矩阵键盘列输入
    output  [3:0]   row,        // 矩阵键盘行输出
    output          beeper,     // 蜂鸣器输出
    output  [7:0]   led         // LED显示当前播放歌曲编号
);

// 内部信号定义
wire [15:0] key_out;           // 键盘输出状态
wire [15:0] key_pulse;         // 键盘脉冲输出
wire [7:0]  note;              // 当前音符
wire [23:0] duration;          // 音符持续时间
wire        play_enable;       // 播放使能信号
reg  [3:0]  song_select;       // 选中的歌曲编号
reg         song_valid;        // 歌曲有效标志

// LED显示：低4位显示歌曲编号，高4位显示调试信息
assign led[3:0] = song_select;
assign led[4] = play_enable;        // 播放使能指示
assign led[5] = (note != 8'd0);     // 音符有效指示
assign led[6] = |key_pulse;         // 按键检测指示
assign led[7] = song_valid;         // 歌曲有效指示

// 实例化矩阵键盘驱动模块
Array_KeyBoard u_keyboard(
    .clk        (clk),
    .rst_n      (rst_n),
    .col        (col),
    .row        (row),
    .key_out    (key_out),
    .key_pulse  (key_pulse)
);

// 按键解码：将按键脉冲转换为歌曲选择
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        song_select <= 4'd0;
        song_valid <= 1'b1;  // 默认播放第一首歌
    end
    else begin
        if (|key_pulse) begin  // 检测到任意按键
            song_valid <= 1'b1;
            case(key_pulse)
                16'h0001: song_select <= 4'd0;  // K1 - 稻香
                16'h0002: song_select <= 4'd1;  // K2 - 小星星
                16'h0004: song_select <= 4'd2;  // K3 - 生日快乐
                16'h0008: song_select <= 4'd3;  // K4 - 两只老虎
                16'h0010: song_select <= 4'd4;  // K5 - 新年好
                16'h0020: song_select <= 4'd5;  // K6 - 童话
                16'h0040: song_select <= 4'd6;  // K7 - 菊花台
                16'h0080: song_select <= 4'd7;  // K8 - 东风破
                16'h0100: song_select <= 4'd8;  // K9 - 简单爱
                16'h0200: song_select <= 4'd9;  // K10 - 晴天
                16'h0400: song_select <= 4'd10; // K11 - 七里香
                16'h0800: song_select <= 4'd11; // K12 - 青花瓷
                16'h1000: song_select <= 4'd12; // K13 - 听妈妈的话
                16'h2000: song_select <= 4'd13; // K14 - 彩虹
                16'h4000: song_select <= 4'd14; // K15 - 夜曲
                16'h8000: song_select <= 4'd15; // K16 - 安静
                default: ; // 保持当前选择
            endcase
        end
    end
end

// 实例化歌曲播放器模块
Song_Player_V2 u_player(
    .clk            (clk),
    .rst_n          (rst_n),
    .song_select    (song_select),
    .song_valid     (song_valid),
    .note           (note),
    .duration       (duration),
    .play_enable    (play_enable)
);

// 实例化音符发生器模块
Note_Generator u_generator(
    .clk            (clk),
    .rst_n          (rst_n),
    .note           (note),
    .duration       (duration),
    .play_enable    (play_enable),
    .beeper         (beeper)
);

endmodule