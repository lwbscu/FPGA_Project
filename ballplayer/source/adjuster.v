// ============================================================================
// Module: adjuster
// Description: 参数调节模块 - 通过按键调节弹性系数并显示在数码管上
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module adjuster(
    input wire          clk,            // 12MHz时钟信号
    input wire          rst_n,          // 复位信号
    input wire          key_up,         // 向上调节按键
    input wire          key_down,       // 向下调节按键
    output reg [1:0]    k,              // 弹性系数输出
    output wire [8:0]   seg_led_1,      // 第一个数码管
    output wire [8:0]   seg_led_2       // 第二个数码管
);

// 按键消抖信号
wire key_up_pulse, key_down_pulse;

// 按键消抖模块 - 上调按键
debounce deb_up_inst(
    .clk(clk),
    .rst_n(rst_n),
    .button_in(key_up),
    .button_out(key_up_pulse)
);

// 按键消抖模块 - 下调按键
debounce deb_down_inst(
    .clk(clk),
    .rst_n(rst_n),
    .button_in(key_down),
    .button_out(key_down_pulse)
);

// 弹性系数调节逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        k <= 2'b00;
    end
    else begin        if (key_up_pulse && (k < 2'd3))
            k <= k + 2'd1;
        else if (key_down_pulse && (k > 2'd0))
            k <= k - 2'd1;
        else 
            k <= k;
    end
end

// 数码管显示模块 - 显示弹性系数值
segment_display seg_inst(
    .clk(clk),
    .rst_n(rst_n),
    .display_value({4'd0, k + 3'd5}),  // 显示k+5值 (5,6,7,8)
    .seg(seg_led_1),                   // 7段显示输出
    .dig(seg_led_2)                    // 位选择输出
);

endmodule
