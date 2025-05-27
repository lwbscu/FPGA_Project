// PWM.v - PWM信号发生器模块
// 根据输入的周期和占空比产生PWM信号

module PWM #(
    parameter WIDTH = 32        // 计数器位宽，确保 2^WIDTH > cycle
)(
    input                   clk,        // 系统时钟
    input                   rst_n,      // 复位信号
    input   [WIDTH-1:0]     cycle,      // PWM周期（cycle > duty）
    input   [WIDTH-1:0]     duty,       // PWM占空比（duty < cycle）
    output reg              pwm_out     // PWM输出信号
);

// 内部计数器
reg [WIDTH-1:0] cnt;

// PWM生成逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= {WIDTH{1'b0}};
        pwm_out <= 1'b0;
    end
    else if (cycle == {WIDTH{1'b0}}) begin
        // 当周期为0时，输出低电平（静音）
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