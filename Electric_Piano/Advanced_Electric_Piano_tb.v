// Advanced_Electric_Piano_tb.v - 高级电子琴测试平台
// 用于仿真验证各个模块的功能

`timescale 1ns / 1ps

module Advanced_Electric_Piano_tb;

// 测试信号
reg clk;
reg rst_n;
reg [3:0] col;
wire [3:0] row;
wire beeper;
wire [7:0] led_display;
wire [3:0] mode_indicator;

// 实例化被测试模块
Advanced_Electric_Piano uut (
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .beeper(beeper),
    .led_display(led_display),
    .mode_indicator(mode_indicator)
);

// 时钟生成 (12MHz)
initial begin
    clk = 0;
    forever #41.67 clk = ~clk;  // 12MHz时钟周期约83.33ns
end

// 测试序列
initial begin
    // 初始化
    $dumpfile("advanced_piano_tb.vcd");
    $dumpvars(0, Advanced_Electric_Piano_tb);
    
    rst_n = 0;
    col = 4'b1111;
    
    // 复位
    #1000;
    rst_n = 1;
    #1000;
    
    $display("=== 高级电子琴测试开始 ===");
    $display("时间: %t ns", $time);
    
    // 测试1: 验证初始状态
    #10000;
    $display("测试1: 初始状态");
    $display("LED显示: %h, 模式指示: %h", led_display, mode_indicator);
    
    // 测试2: 模拟按键切换到稻香模式
    $display("测试2: 切换到稻香模式");
    wait(row == 4'b0111);  // 等待扫描到第4行
    #1000;
    col = 4'b1101;  // 模拟按下第15个按键
    #5000;
    col = 4'b1111;  // 释放按键
    #50000;
    $display("LED显示: %h, 模式指示: %h", led_display, mode_indicator);
    
    // 测试3: 观察自动播放
    $display("测试3: 观察稻香自动播放");
    #200000;  // 观察几个节拍
    
    // 测试4: 切换到青花瓷模式
    $display("测试4: 切换到青花瓷模式");
    wait(row == 4'b0111);
    #1000;
    col = 4'b1011;  // 模拟按下第14个按键
    #5000;
    col = 4'b1111;
    #50000;
    $display("LED显示: %h, 模式指示: %h", led_display, mode_indicator);
    
    // 测试5: 切换到手动模式
    $display("测试5: 切换到手动模式");
    wait(row == 4'b0111);
    #1000;
    col = 4'b0111;  // 模拟按下第16个按键
    #5000;
    col = 4'b1111;
    #50000;
    $display("LED显示: %h, 模式指示: %h", led_display, mode_indicator);
    
    // 测试6: 手动演奏测试
    $display("测试6: 手动演奏Do-Re-Mi");
    
    // 演奏Do (第1个按键)
    wait(row == 4'b1110);
    #1000;
    col = 4'b1110;
    #20000;
    col = 4'b1111;
    #10000;
    
    // 演奏Re (第2个按键)
    wait(row == 4'b1110);
    #1000;
    col = 4'b1101;
    #20000;
    col = 4'b1111;
    #10000;
    
    // 演奏Mi (第3个按键)
    wait(row == 4'b1110);
    #1000;
    col = 4'b1011;
    #20000;
    col = 4'b1111;
    #10000;
    
    $display("=== 测试完成 ===");
    $finish;
end

// 监控蜂鸣器输出
always @(posedge beeper) begin
    $display("时间 %t: 蜂鸣器信号上升沿", $time);
end

// 监控模式变化
always @(led_display or mode_indicator) begin
    $display("时间 %t: 模式改变 - LED: %h, 指示: %h", $time, led_display, mode_indicator);
end

endmodule
