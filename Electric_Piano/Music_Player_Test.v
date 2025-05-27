// Music_Player_Test.v - 音乐播放器测试台
// 用于验证自动播放功能

`timescale 1ns / 1ps

module Music_Player_Test();

// 测试信号
reg clk;
reg rst_n;
reg [2:0] mode;
reg enable;
wire [15:0] auto_tone;
wire song_finished;

// 实例化被测模块
Music_Player u_music_player(
    .clk(clk),
    .rst_n(rst_n),
    .mode(mode),
    .enable(enable),
    .auto_tone(auto_tone),
    .song_finished(song_finished)
);

// 时钟生成（12MHz模拟）
initial begin
    clk = 0;
    forever #41.67 clk = ~clk;  // 12MHz周期约83.33ns
end

// 测试序列
initial begin
    // 初始化
    rst_n = 0;
    mode = 3'b000;
    enable = 0;
    
    // 复位
    #200;
    rst_n = 1;
    #100;
    
    // 测试稻香模式 (模式001)
    $display("开始测试稻香模式...");
    mode = 3'b001;
    enable = 1;
    
    // 观察几个节拍的音调输出
    #12000000;  // 等待1个节拍周期
    $display("第1拍: auto_tone = %d", auto_tone);
    #12000000;  // 等待第2个节拍
    $display("第2拍: auto_tone = %d", auto_tone);
    #12000000;  // 等待第3个节拍
    $display("第3拍: auto_tone = %d", auto_tone);
    
    // 测试青花瓷模式 (模式010)
    $display("开始测试青花瓷模式...");
    mode = 3'b010;
    #12000000;  // 等待1个节拍
    $display("青花瓷第1拍: auto_tone = %d", auto_tone);
    
    // 测试禁用播放
    $display("禁用播放测试...");
    enable = 0;
    #1000;
    $display("禁用后: auto_tone = %d", auto_tone);
    
    // 测试手动模式
    $display("切换到手动模式...");
    mode = 3'b000;
    enable = 1;  // 手动模式下enable应该被忽略
    #1000;
    $display("手动模式: auto_tone = %d", auto_tone);
    
    $display("测试完成");
    $finish;
end

// 监控模式变化
always @(mode) begin
    $display("时间 %t: 模式切换到 %b", $time, mode);
end

// 监控音调变化
always @(auto_tone) begin
    if (auto_tone != 0)
        $display("时间 %t: 音调输出 = %d", $time, auto_tone);
end

endmodule
