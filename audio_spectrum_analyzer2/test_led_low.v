module test_led_low(
    input           clk,        // E1引脚
    output reg      led1,       // N15
    output reg      led2,       // N14
    output reg      led3,       // M14
    output reg      led4        // M12
);

// 计数器
reg [27:0] counter = 28'd0;

always @(posedge clk) begin
    counter <= counter + 1'b1;
end

// 低电平点亮LED，所以要取反
always @(*) begin
    led1 = ~counter[24];  // 闪烁（低电平亮）
    led2 = ~counter[25];  // 慢一倍
    led3 = ~counter[26];  // 更慢
    led4 = 1'b0;          // 常亮（输出低电平）
end

endmodule