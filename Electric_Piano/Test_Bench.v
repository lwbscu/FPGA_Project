// Test_Bench.v - 电子琴系统测试台
// 用于验证按键响应和模式切换功能

`timescale 1ns / 1ps

module Test_Bench();

// 测试信号
reg clk;
reg rst_n;
reg [3:0] col;
wire [3:0] row;
wire [15:0] key_out;
wire [15:0] key_pulse;
wire [2:0] current_mode;
wire [7:0] led_display;
wire [3:0] mode_indicator;
wire beeper_out;

// 实例化待测模块
Array_KeyBoard u_keyboard(
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .key_out(key_out),
    .key_pulse(key_pulse)
);

Mode_Controller u_mode_ctrl(
    .clk(clk),
    .rst_n(rst_n),
    .key_pulse(key_pulse),
    .current_mode(current_mode),
    .mode_switch(),
    .led_display(led_display),
    .mode_indicator(mode_indicator)
);

// 时钟生成
initial begin
    clk = 0;
    forever #41.67 clk = ~clk;  // 12MHz时钟
end

// 复位信号
initial begin
    rst_n = 0;
    #1000;
    rst_n = 1;
end

// 列信号初始化
initial begin
    col = 4'b1111;  // 默认无按键按下
end

// 按键仿真任务
task press_key(input [1:0] row_idx, input [1:0] col_idx);
    begin
        wait(row == (4'b1110 >> row_idx));  // 等待对应行被扫描
        #1000;
        col[col_idx] = 0;  // 按下按键
        #50000;            // 保持按下50us
        col[col_idx] = 1;  // 释放按键
        #100000;           // 等待消抖
    end
endtask

// 测试序列
initial begin
    #2000;  // 等待复位完成
    
    $display("=== 电子琴按键测试开始 ===");
    $display("初始状态 - 模式: %d, LED: %b", current_mode, led_display);
    
    // 测试1：按A键切换到稻香模式
    $display("\n--- 测试1：按A键（第1行第4列）---");
    press_key(0, 3);  // A键在第1行第4列
    #10000;
    $display("按A键后 - 模式: %d, LED: %b", current_mode, led_display);
    
    // 测试2：按B键切换到青花瓷模式
    $display("\n--- 测试2：按B键（第2行第4列）---");
    press_key(1, 3);  // B键在第2行第4列
    #10000;
    $display("按B键后 - 模式: %d, LED: %b", current_mode, led_display);
    
    // 测试3：按C键切换到告白气球模式
    $display("\n--- 测试3：按C键（第3行第4列）---");
    press_key(2, 3);  // C键在第3行第4列
    #10000;
    $display("按C键后 - 模式: %d, LED: %b", current_mode, led_display);
    
    // 测试4：按D键切换到简单爱模式
    $display("\n--- 测试4：按D键（第4行第4列）---");
    press_key(3, 3);  // D键在第4行第4列
    #10000;
    $display("按D键后 - 模式: %d, LED: %b", current_mode, led_display);
    
    // 测试5：按1键切换回手动模式
    $display("\n--- 测试5：按1键（第1行第1列）---");
    press_key(0, 0);  // 1键在第1行第1列
    #10000;
    $display("按1键后 - 模式: %d, LED: %b", current_mode, led_display);
    
    $display("\n=== 测试完成 ===");
    #50000;
    $finish;
end

// 监控关键信号
always @(posedge clk) begin
    if (|key_pulse) begin
        $display("时间:%t, 按键脉冲: %h, 当前模式: %d", $time, key_pulse, current_mode);
    end
end

endmodule
