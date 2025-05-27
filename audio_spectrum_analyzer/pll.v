module pll(
    input  areset,
    input  inclk0,
    output c0,
    output c1,
    output locked
);

// 简单的PLL模拟 - 实际项目中应使用Quartus的PLL IP核
// 这里只是为了编译通过的占位符

assign c0 = inclk0;  // 24MHz (实际应该是倍频)
assign c1 = inclk0;  // 50MHz (实际应该是倍频)
assign locked = ~areset;

endmodule