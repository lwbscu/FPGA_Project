module audio_level_detector(
    input           clk,
    input           rst_n,
    input [7:0]     audio_data,   // ADC数据输入
    input           data_valid,   // 数据有效信号
    output reg [7:0] level_led    // LED电平指示 - 低电平有效
);

// 简单的电平检测 - 低电平点亮LED
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        level_led <= 8'b11111111;  // 全灭（高电平）
    end else if (data_valid) begin
        // 注意：现在是低电平点亮，所以要取反
        if (audio_data < 8'd32)
            level_led <= 8'b11111110;  // 点亮1个LED
        else if (audio_data < 8'd64)
            level_led <= 8'b11111100;  // 点亮2个LED
        else if (audio_data < 8'd96)
            level_led <= 8'b11111000;  // 点亮3个LED
        else if (audio_data < 8'd128)
            level_led <= 8'b11110000;  // 点亮4个LED
        else if (audio_data < 8'd160)
            level_led <= 8'b11100000;  // 点亮5个LED
        else if (audio_data < 8'd192)
            level_led <= 8'b11000000;  // 点亮6个LED
        else if (audio_data < 8'd224)
            level_led <= 8'b10000000;  // 点亮7个LED
        else
            level_led <= 8'b00000000;  // 点亮8个LED
    end
end

endmodule