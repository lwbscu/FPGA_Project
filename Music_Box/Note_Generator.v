// Note_Generator.v - 音符发生器模块
// 根据音符编号生成相应频率的PWM信号

module Note_Generator(
    input           clk,            // 系统时钟
    input           rst_n,          // 复位信号
    input   [7:0]   note,           // 音符编号
    input   [23:0]  duration,       // 持续时间
    input           play_enable,    // 播放使能
    output          beeper          // 蜂鸣器输出
);

// 内部信号
wire [15:0] pwm_cycle;              // PWM周期值
wire [15:0] pwm_duty;               // PWM占空比值

// 音符转PWM周期
Note_to_PWM u_note_to_pwm(
    .note       (note),
    .pwm_cycle  (pwm_cycle)
);

// 占空比设为周期的一半（50%占空比）
assign pwm_duty = pwm_cycle >> 1;

// 实例化PWM发生器
PWM_Gen #(
    .WIDTH(16)
) u_pwm_gen (
    .clk        (clk),
    .rst_n      (rst_n),
    .cycle      (pwm_cycle),
    .duty       (pwm_duty),
    .enable     (play_enable),
    .pwm_out    (beeper)
);

endmodule

// 音符到PWM周期转换模块
module Note_to_PWM(
    input   [7:0]   note,
    output reg [15:0] pwm_cycle
);

// 根据音符编号返回对应的PWM周期值
// 周期值 = 12MHz / 音符频率
always @(note) begin
    case(note)
        8'd0:  pwm_cycle = 16'd0;      // REST - 休止符
        8'd1:  pwm_cycle = 16'd45872;  // L1 - 低音1 (261.6Hz)
        8'd2:  pwm_cycle = 16'd40858;  // L2 - 低音2 (293.7Hz)
        8'd3:  pwm_cycle = 16'd36408;  // L3 - 低音3 (329.6Hz)
        8'd4:  pwm_cycle = 16'd34364;  // L4 - 低音4 (349.2Hz)
        8'd5:  pwm_cycle = 16'd30612;  // L5 - 低音5 (392Hz)
        8'd6:  pwm_cycle = 16'd27273;  // L6 - 低音6 (440Hz)
        8'd7:  pwm_cycle = 16'd24296;  // L7 - 低音7 (493.9Hz)
        8'd8:  pwm_cycle = 16'd22931;  // M1 - 中音1 (523.3Hz)
        8'd9:  pwm_cycle = 16'd20432;  // M2 - 中音2 (587.3Hz)
        8'd10: pwm_cycle = 16'd18201;  // M3 - 中音3 (659.3Hz)
        8'd11: pwm_cycle = 16'd17180;  // M4 - 中音4 (698.5Hz)
        8'd12: pwm_cycle = 16'd15306;  // M5 - 中音5 (784Hz)
        8'd13: pwm_cycle = 16'd13636;  // M6 - 中音6 (880Hz)
        8'd14: pwm_cycle = 16'd12148;  // M7 - 中音7 (987.8Hz)
        8'd15: pwm_cycle = 16'd11478;  // H1 - 高音1 (1045.5Hz)
        8'd16: pwm_cycle = 16'd10215;  // H2 - 高音2 (1174.7Hz)
        8'd17: pwm_cycle = 16'd9108;   // H3 - 高音3 (1318.5Hz)
        8'd18: pwm_cycle = 16'd8593;   // H4 - 高音4 (1396.9Hz)
        8'd19: pwm_cycle = 16'd7653;   // H5 - 高音5 (1568Hz)
        default: pwm_cycle = 16'd0;     // 默认休止
    endcase
end

endmodule

// PWM信号发生器模块
module PWM_Gen #(
    parameter WIDTH = 16
)(
    input                   clk,
    input                   rst_n,
    input   [WIDTH-1:0]     cycle,
    input   [WIDTH-1:0]     duty,
    input                   enable,
    output reg              pwm_out
);

// 内部计数器
reg [WIDTH-1:0] cnt;

// PWM生成逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= {WIDTH{1'b0}};
        pwm_out <= 1'b0;
    end
    else if (!enable || cycle == {WIDTH{1'b0}}) begin
        // 禁用或休止符时，输出低电平
        cnt <= {WIDTH{1'b0}};
        pwm_out <= 1'b0;
    end
    else if (cnt >= cycle - 1) begin
        // 计数器达到周期值，重新开始计数
        cnt <= {WIDTH{1'b0}};
        pwm_out <= 1'b1;
    end
    else begin
        cnt <= cnt + 1'b1;
        // 根据占空比控制输出电平
        if (cnt < duty)
            pwm_out <= 1'b1;
        else
            pwm_out <= 1'b0;
    end
end

endmodule