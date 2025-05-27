// --------------------------------------------------------------------
// Module: audio_spectrum_analyzer
// Author: Step
// Description: 智能音频频谱分析仪顶层模块
// --------------------------------------------------------------------
module audio_spectrum_analyzer(
    input           clk,            // 系统时钟 12MHz
    input           rst_n,          // 系统复位
    
    // 矩阵键盘接口
    input   [3:0]   col,
    output  [3:0]   row,
    
    // 旋转编码器接口
    input           key_a,
    input           key_b,
    
    // 数码管显示接口
    output          seg_rck,
    output          seg_sck,
    output          seg_din,
    
    // 蜂鸣器接口
    output          beeper,
    
    // LCD接口
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs,
    
    // HDMI接口（预留）
    output  [2:0]   TMDSp,
    output  [2:0]   TMDSn,
    output          TMDSp_clock,
    output          TMDSn_clock
);

// 参数定义
parameter MODE_SPECTRUM   = 3'd0;  // 频谱分析模式
parameter MODE_DB_METER   = 3'd1;  // 声压级测量模式
parameter MODE_MUSIC      = 3'd2;  // 音乐播放模式
parameter MODE_ADAPTIVE   = 3'd3;  // 自适应音乐模式
parameter MODE_VISUAL     = 3'd4;  // 可视化效果模式
parameter MODE_SETTING    = 3'd5;  // 设置模式

// 内部信号定义
wire    [15:0]  key_pulse;          // 按键脉冲
wire    [2:0]   current_mode;       // 当前模式
wire    [7:0]   sensitivity;        // 灵敏度
wire            mode_change;        // 模式切换信号
wire    [15:0]  audio_data;         // 模拟音频数据
wire    [15:0]  db_value;           // 分贝值
wire    [511:0] fft_data;          // FFT数据
wire            data_valid;         // 数据有效标志

// LCD背光常开
assign lcd_blk = 1'b1;

// 模式控制模块
mode_controller u_mode_ctrl(
    .clk            (clk),
    .rst_n          (rst_n),
    .key_pulse      (key_pulse),
    .current_mode   (current_mode),
    .mode_change    (mode_change)
);

// 矩阵键盘模块
array_keyboard u_keyboard(
    .clk            (clk),
    .rst_n          (rst_n),
    .col            (col),
    .row            (row),
    .key_out        (),
    .key_pulse      (key_pulse)
);

// 旋转编码器模块
wire L_pulse, R_pulse;
amp_encoder u_encoder(
    .clk            (clk),
    .rst_n          (rst_n),
    .key_a          (key_a),
    .key_b          (key_b),
    .L_pulse        (L_pulse),
    .R_pulse        (R_pulse)
);

// 参数调节模块
param_adjuster u_param_adj(
    .clk            (clk),
    .rst_n          (rst_n),
    .L_pulse        (L_pulse),
    .R_pulse        (R_pulse),
    .current_mode   (current_mode),
    .sensitivity    (sensitivity)
);

// 音频数据仿真模块
audio_simulator u_audio_sim(
    .clk            (clk),
    .rst_n          (rst_n),
    .audio_data     (audio_data),
    .data_valid     (data_valid)
);

// 分贝计算模块
db_calculator u_db_calc(
    .clk            (clk),
    .rst_n          (rst_n),
    .audio_data     (audio_data),
    .data_valid     (data_valid),
    .db_value       (db_value)
);

// 显示控制模块
display_controller u_display(
    .clk            (clk),
    .rst_n          (rst_n),
    .current_mode   (current_mode),
    .db_value       (db_value),
    .sensitivity    (sensitivity),
    .seg_rck        (seg_rck),
    .seg_sck        (seg_sck),
    .seg_din        (seg_din)
);

endmodule