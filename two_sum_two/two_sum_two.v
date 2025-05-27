// 修正后的4.6.10题代码

// 1位全加器模块
module _1bitAdder(A, B, Ci, Sum, Co);
    input A, B, Ci;
    output Sum, Co;
    
    // 使用assign语句代替always块，更适合组合逻辑
    assign Sum = A ^ B ^ Ci;
    assign Co = (A & B) | (A & Ci) | (B & Ci);
endmodule


// 2位二进制加法器模块（分层结构）
module _2bitAdder(A, B, Cin, Sum, Cout);
    input [1:0] A, B;
    input Cin;
    output [1:0] Sum;
    output Cout;
    
    // 内部连线，连接两个1位加法器的进位
    wire c0;
    
    // 实例化两个1位全加器
    _1bitAdder add0(A[0], B[0], Cin, Sum[0], c0);
    _1bitAdder add1(A[1], B[1], c0, Sum[1], Cout);
endmodule

// 小脚丫实验板顶层模块
module two_sum_two(
    input A1,          // 高位输入A
    input A0,          // 低位输入A
    input B1,          // 高位输入B
    input B0,          // 低位输入B
    output led_C1,     // 高位输出（LED低电平有效）
    output led_C0,     // 低位输出（LED低电平有效）
    output led_Cout,   // 进位输出（LED低电平有效）
    output [8:0] seg   // 七段数码管输出信号
);
    // 内部信号声明
    wire [1:0] A, B;
    wire [1:0] Sum;
    wire Cout;
    
    // 组织输入信号
    assign A = {A1, A0};
    assign B = {B1, B0};
    
    // 实例化2位加法器，无初始进位
    _2bitAdder adder_inst(A, B, 1'b0, Sum, Cout);
    
 
    // 二进制到十进制转换（用于数码管显示）
    wire [3:0] sum_value;
    assign sum_value = {1'b0, Cout, Sum}; // 组合为一个最大值为7的数字
    
    // 七段数码管显示逻辑
    reg [8:0] seg_patterns [9:0]; // 0-9的显示模式
    
    initial begin
        // 初始化数码管显示模式（根据实际硬件可能需要调整）
        seg_patterns[0] = 9'h3f; // 显示数字0
        seg_patterns[1] = 9'h06; // 显示数字1
        seg_patterns[2] = 9'h5b; // 显示数字2
        seg_patterns[3] = 9'h4f; // 显示数字3
        seg_patterns[4] = 9'h66; // 显示数字4
        seg_patterns[5] = 9'h6d; // 显示数字5
        seg_patterns[6] = 9'h7d; // 显示数字6
        seg_patterns[7] = 9'h07; // 显示数字7
        seg_patterns[8] = 9'h7f; // 显示数字8
        seg_patterns[9] = 9'h6f; // 显示数字9
    end
    
    // 根据计算结果选择对应的数码管显示模式
    assign seg = seg_patterns[sum_value];
endmodule