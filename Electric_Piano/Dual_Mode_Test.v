// Dual_Mode_Test.v - 双模式电子琴系统功能测试
// 验证key1切换模式和16首音乐播放功能

`timescale 1ns / 1ps

module Dual_Mode_Test();

// 测试信号
reg clk;
reg rst_n;
reg [15:0] key_pulse;
wire current_mode;
wire [7:0] led_display;
wire [3:0] mode_indicator;

// 音乐播放相关信号
wire [7:0] music_tone;
wire music_enable;
wire beeper_out;

// 实例化模式控制器
Mode_Controller u_mode_ctrl(
    .clk(clk),
    .rst_n(rst_n),
    .key_pulse(key_pulse),
    .current_mode(current_mode),
    .mode_switch(),  // 未使用的输出
    .led_display(led_display),
    .mode_indicator(mode_indicator)
);

// 实例化音乐播放器
Music_Player u_music_player(
    .clk(clk),
    .rst_n(rst_n),
    .mode(current_mode),
    .key_pulse(key_pulse),
    .music_tone(music_tone),
    .music_enable(music_enable)
);

// 实例化蜂鸣器
Advanced_Beeper u_beeper(
    .clk(clk),
    .rst_n(rst_n),
    .tone_in(music_tone),
    .enable(music_enable),
    .mode(current_mode),
    .beeper(beeper_out)
);

// 时钟生成 (12MHz)
initial clk = 0;
always #41.67 clk = ~clk;  // 12MHz时钟

// 测试过程
initial begin
    $display("===== 双模式电子琴系统测试开始 =====");
    
    // 初始化
    rst_n = 0;
    key_pulse = 16'h0000;
    #200;
    rst_n = 1;
    #100;
    
    $display("时间: %0t - 系统复位完成", $time);
    $display("当前模式: %b (0=手动, 1=自动)", current_mode);
    $display("LED显示: %b", led_display);
    
    // 测试1: 验证初始模式 (应该是手动模式)
    #1000;
    $display("\n===== 测试1: 初始模式验证 =====");
    $display("当前模式: %b", current_mode);
    $display("LED1状态: %b (应该为0表示点亮)", led_display[0]);
    $display("LED2状态: %b (应该为1表示熄灭)", led_display[1]);
    
    // 测试2: 模式切换 (按下key1)
    #1000;
    $display("\n===== 测试2: 模式切换测试 =====");
    key_pulse[1] = 1'b1;  // 模拟按下key1 (J9引脚)
    #100;
    key_pulse[1] = 1'b0;
    #1000;
    $display("按下key1后:");
    $display("当前模式: %b", current_mode);
    $display("LED1状态: %b", led_display[0]);
    $display("LED2状态: %b", led_display[1]);
    
    // 测试3: 自动模式下播放音乐 (测试几个不同的按键)
    if (current_mode == 1'b1) begin
        $display("\n===== 测试3: 自动模式音乐播放 =====");
        
        // 播放歌曲0 (key0)
        $display("播放歌曲0...");
        key_pulse[0] = 1'b1;
        #100;
        key_pulse[0] = 1'b0;
        #10000;  // 等待一段时间观察音乐播放
        
        // 播放歌曲5 (key5)
        $display("播放歌曲5...");
        key_pulse[5] = 1'b1;
        #100;
        key_pulse[5] = 1'b0;
        #10000;
        
        // 播放歌曲15 (key15)
        $display("播放歌曲15...");
        key_pulse[15] = 1'b1;
        #100;
        key_pulse[15] = 1'b0;
        #10000;
    end
    
    // 测试4: 再次切换回手动模式
    #1000;
    $display("\n===== 测试4: 切换回手动模式 =====");
    key_pulse[1] = 1'b1;  // 再次按下key1
    #100;
    key_pulse[1] = 1'b0;
    #1000;
    $display("再次按下key1后:");
    $display("当前模式: %b", current_mode);
    $display("LED1状态: %b", led_display[0]);
    $display("LED2状态: %b", led_display[1]);
    
    // 测试5: 手动模式下的按键响应
    if (current_mode == 1'b0) begin
        $display("\n===== 测试5: 手动模式按键测试 =====");
        
        // 测试几个按键的手动播放
        key_pulse[0] = 1'b1;
        #100;
        key_pulse[0] = 1'b0;
        #2000;
        
        key_pulse[7] = 1'b1;
        #100;
        key_pulse[7] = 1'b0;
        #2000;
        
        key_pulse[15] = 1'b1;
        #100;
        key_pulse[15] = 1'b0;
        #2000;
    end
    
    $display("\n===== 测试完成 =====");
    $display("总测试时间: %0t ns", $time);
    $finish;
end

// 监控关键信号变化
always @(posedge clk) begin
    // 监控模式切换
    if ($past(current_mode) !== current_mode) begin
        $display("时间: %0t - 模式切换: %b -> %b", $time, $past(current_mode), current_mode);
    end
    
    // 监控音乐播放开始
    if (!$past(music_enable) && music_enable) begin
        $display("时间: %0t - 音乐播放开始, 音调: %h", $time, music_tone);
    end
    
    // 监控按键按下
    if (|key_pulse && !|$past(key_pulse)) begin
        $display("时间: %0t - 按键按下: %b", $time, key_pulse);
    end
end

// 生成VCD波形文件用于调试
initial begin
    $dumpfile("dual_mode_test.vcd");
    $dumpvars(0, Dual_Mode_Test);
end

endmodule
