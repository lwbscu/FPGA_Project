module test_led_only(
    input           clk,        // E1引脚
    output reg      led1,       // N15
    output reg      led2,       // N14
    output reg      led3,       // M14
    output reg      led4        // M12
);

// 直接使用计数器，不依赖时钟
reg [27:0] counter = 28'd0;

always @(posedge clk) begin
    counter <= counter + 1'b1;
end

// 直接连接到LED
always @(*) begin
    led1 = counter[24];  // 应该闪烁
    led2 = counter[25];  // 慢一倍
    led3 = counter[26];  // 更慢
    led4 = counter[27];  // 最慢
end

endmodule