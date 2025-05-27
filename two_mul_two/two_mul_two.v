module two_mul_two(
    input A1,           // 输入被乘数高位
    input A0,           // 输入被乘数低位
    input B1,           // 输入乘数高位
    input B0,           // 输入乘数低位
    output C3,          // 输出结果最高位（LED低电平有效）
    output C2,          // 输出结果次高位（LED低电平有效）
    output C1,          // 输出结果次低位（LED低电平有效）
    output C0,          // 输出结果最低位（LED低电平有效）
    output [8:0] seg    // 七段数码管输出信号
);
    // 内部信号，存储乘法结果
    wire res_C0, res_C1, res_C2, res_C3;
    wire [3:0] product; // 存储乘积结果（0-9）
    
    // 实现2×2乘法逻辑
    // C0 = A0 与 B0
    assign res_C0 = A0 & B0;
    
    // C1 = (A1 与 B0) 异或 (A0 与 B1)
    assign res_C1 = (A1 & B0) ^ (A0 & B1);
    
    // C2 计算的中间进位
    wire carry_C1;
    assign carry_C1 = (A1 & B0) & (A0 & B1);
    
    // C2 = (A1 与 B1) 异或 carry_C1
    assign res_C2 = (A1 & B1) ^ carry_C1;
    
    // 修正C3的计算逻辑
    // C3 应该是来自C2的进位
    assign res_C3 = (A1 & B1 & carry_C1) | ((A1 & B1) & (A0 & B1 & A1 & B0));
    
    // 由于LED为低电平有效，我们需要对输出取反
    assign C0 = ~res_C0;
    assign C1 = ~res_C1;
    assign C2 = ~res_C2;
    assign C3 = ~res_C3;
    
    // 将二进制乘积转换为一个四位数值，用于数码管显示
    assign product = {res_C3, res_C2, res_C1, res_C0};
    
    // 七段数码管显示逻辑，使用查找表方式
    reg [8:0] seg_patterns [9:0]; // 只需要0-9的显示模式
    
    initial begin
        // 初始化0-9的显示模式
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
    
    // 根据乘积结果选择对应的数码管显示模式
    assign seg = seg_patterns[product];
    
endmodule