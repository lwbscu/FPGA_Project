// Test_Bench.v - 电子琴系统测试台
// 用于验证双模式切换和16首音乐播放功能

`timescale 1ns / 1ps

module Test_Bench();

// 测试信号
reg clk;
reg rst_n;
reg key1;                   // 添加key1信号
reg [3:0] col;
wire [3:0] row;
wire [15:0] key_out;
wire [15:0] key_pulse;
wire current_mode;          // 修改为1位信号
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
    .key1(key1),                // 添加key1信号
    .key_pulse(key_pulse),
    .current_mode(current_mode),
    .mode_switch(),
    .led_display(led_display),
    .mode_indicator(mode_indicator)
);

Advanced_Electric_Piano u_piano(
    .clk(clk),
    .rst_n(rst_n),
    .key1(key1),                // 添加key1信号
    .col(col),
    .row(row),
    .beeper(beeper_out),
    .led_display(led_display),
    .mode_indicator(mode_indicator)
);

// 时钟生成 (12MHz)
initial clk = 0;
always #41.67 clk = ~clk; // 12MHz = 1/(83.33ns)

// 测试序列
initial begin
    $display("=== 电子琴双模式测试开始 ===");
    
    // 初始化
    rst_n = 0;
    key1 = 1;                   // key1初始为高电平（未按下）
    col = 4'b1111;
    #1000;
    rst_n = 1;
    #1000;
    
    $display("时间: %0t - 系统复位完成", $time);
    $display("当前模式: %b (0=手动, 1=自动)", current_mode);
    $display("LED显示: %b (LED1=%b, LED2=%b)", led_display, ~led_display[0], ~led_display[1]);
    
    // 测试1: 验证初始状态（应该是手动模式）
    #5000;
    if (current_mode == 1'b0 && led_display[0] == 1'b0) begin
        $display("✓ 测试1通过: 初始状态为手动模式，LED1亮");
    end else begin
        $display("✗ 测试1失败: 初始状态错误");
    end
      // 测试2: 模式切换 - 按key1切换到自动模式
    $display("\n=== 测试模式切换 ===");
    simulate_key1_press(); // 按key1
    #10000;
    
    if (current_mode == 1'b1 && led_display[1] == 1'b0) begin
        $display("✓ 测试2通过: 切换到自动模式，LED2亮");
    end else begin
        $display("✗ 测试2失败: 模式切换错误");
        $display("  current_mode=%b, led_display=%b", current_mode, led_display);
    end
    
    // 测试3: 再次按key1切换回手动模式
    simulate_key1_press(); // 再次按key1
    #10000;
    
    if (current_mode == 1'b0 && led_display[0] == 1'b0) begin
        $display("✓ 测试3通过: 切换回手动模式，LED1亮");
    end else begin
        $display("✗ 测试3失败: 模式切换回手动失败");
    end
    
    // 测试4: 自动模式下测试音乐播放
    $display("\n=== 测试自动模式音乐播放 ===");
    // 先切换到自动模式
    simulate_key1_press();
    #5000;
    
    // 测试不同按键触发不同音乐
    $display("触发歌曲0 (按键1)");
    simulate_key_press(16'h0001);
    #10000;
    
    $display("触发歌曲1 (按键2)");
    simulate_key_press(16'h0002);
    #10000;
    
    $display("触发歌曲3 (按键A)");
    simulate_key_press(16'h0008);
    #10000;
    
    $display("触发歌曲15 (按键D)");
    simulate_key_press(16'h8000);
    #10000;
    
    $display("\n=== 测试完成 ===");
    $finish;
end

// 模拟key1按键按下的任务
task simulate_key1_press;
    begin
        key1 = 0;    // 按下key1（低电平）
        #50000;      // 保持50us
        key1 = 1;    // 释放key1（高电平）
        #100000;     // 等待消抖和处理
    end
endtask

// 模拟按键按下的任务
task simulate_key_press;
    input [15:0] key_pattern;
    begin
        // 模拟矩阵键盘扫描
        case (key_pattern)
            16'h0001: begin // 按键1 (第1行第1列)
                col = 4'b1110; #100; col = 4'b1111; #100;
            end
            16'h0002: begin // 按键2 (第1行第2列)
                col = 4'b1101; #100; col = 4'b1111; #100;
            end
            16'h0008: begin // 按键A (第1行第4列)
                col = 4'b0111; #100; col = 4'b1111; #100;
            end
            16'h8000: begin // 按键D (第4行第4列)
                col = 4'b0111; #100; col = 4'b1111; #100;
            end
            default: begin
                col = 4'b1111; #100;
            end
        endcase
        #1000; // 等待按键处理
    end
endtask

// 监控重要信号变化
always @(posedge clk) begin
    if (current_mode !== current_mode) begin
        $display("时间: %0t - 模式变化: %b", $time, current_mode);
    end
end

endmodule

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
