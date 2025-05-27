// Advanced_Electric_Piano.v - 高级电子琴顶层模块
// 功能：支持矩阵键盘演奏和自动播放多首歌曲
// 歌曲列表：《稻香》、《青花瓷》、《告白气球》等

module Advanced_Electric_Piano(
    input           clk,        // 系统时钟 12MHz
    input           rst_n,      // 复位信号，低电平有效
    input           key1,       // 模式切换按键（PIN_J9）
    input   [3:0]   col,        // 矩阵键盘列输入
    output  [3:0]   row,        // 矩阵键盘行输出
    output          beeper,     // 蜂鸣器输出
    output  [7:0]   led_display,// LED显示当前模式
    output  [3:0]   mode_indicator // 模式指示灯
);

// 内部信号定义
wire [15:0] key_out;           // 键盘输出状态
wire [15:0] key_pulse;         // 键盘脉冲输出
wire        current_mode;      // 当前模式（0=手动，1=自动）
wire [15:0] auto_tone;         // 自动播放音调
wire        mode_switch;       // 模式切换信号
wire        song_finished;     // 歌曲播放完成信号

// 实例化矩阵键盘驱动模块
Array_KeyBoard u_keyboard(
    .clk        (clk),
    .rst_n      (rst_n),
    .col        (col),
    .row        (row),
    .key_out    (key_out),
    .key_pulse  (key_pulse)
);

// 实例化模式控制器
Mode_Controller u_mode_ctrl(
    .clk            (clk),
    .rst_n          (rst_n),
    .key1           (key1),         // 独立的模式切换按键
    .key_pulse      (key_pulse),
    .current_mode   (current_mode),
    .mode_switch    (mode_switch),
    .led_display    (led_display),
    .mode_indicator (mode_indicator)
);

// 实例化音乐播放器（自动播放歌曲）
Music_Player u_music_player(
    .clk            (clk),
    .rst_n          (rst_n),
    .mode           (current_mode),     // 0=手动，1=自动
    .key_pulse      (key_pulse),        // 按键脉冲信号
    .auto_tone      (auto_tone),
    .song_finished  (song_finished)
);

// 实例化蜂鸣器驱动模块
Advanced_Beeper u_beeper(
    .clk_in         (clk),
    .rst_n_in       (rst_n),
    .manual_key     (~key_out),     // 手动按键（取反）
    .auto_tone      (auto_tone),    // 自动播放音调
    .mode           (current_mode),
    .beeper         (beeper)
);

endmodule