// Advanced_Beeper.v - 高级蜂鸣器模块
// 功能：支持手动演奏和自动播放的音频输出

module Advanced_Beeper(
    input           clk_in,
    input           rst_n_in,
    input   [15:0]  manual_key,     // 手动按键输入
    input   [15:0]  auto_tone,      // 自动播放音调（直接为PWM周期值）
    input           mode,           // 当前模式（0=手动，1=自动）
    output          beeper
);

wire [15:0] manual_tone_cycle;  // 手动模式音调周期
wire [15:0] final_tone_cycle;   // 最终音调周期

// 手动模式：通过tone模块转换按键为音调
tone u_tone(
    .key_in(manual_key),
    .cycle(manual_tone_cycle)
);

// 根据模式选择音调源
// 手动模式(0): 使用转换后的按键音调
// 自动模式(1): 直接使用Music_Player输出的PWM周期值
assign final_tone_cycle = (mode == 1'b0) ? manual_tone_cycle : auto_tone;

// 实例化PWM模块
PWM #(
    .WIDTH(16)
) u_pwm(
    .clk(clk_in),
    .rst_n(rst_n_in),
    .cycle(final_tone_cycle),
    .duty(final_tone_cycle >> 1),  // 50%占空比
    .pwm_out(beeper)
);

endmodule
