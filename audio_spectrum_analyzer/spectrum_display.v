module spectrum_display(
    input           clk,
    input           rst_n,
    input [95:0]    spectrum_data_packed,  // 使用打包数据而不是数组
    input           spectrum_valid,
    output reg [7:0] led_out
);

// 解包频谱数据
wire [11:0] spectrum_0 = spectrum_data_packed[11:0];
wire [11:0] spectrum_1 = spectrum_data_packed[23:12];
wire [11:0] spectrum_2 = spectrum_data_packed[35:24];
wire [11:0] spectrum_3 = spectrum_data_packed[47:36];
wire [11:0] spectrum_4 = spectrum_data_packed[59:48];
wire [11:0] spectrum_5 = spectrum_data_packed[71:60];
wire [11:0] spectrum_6 = spectrum_data_packed[83:72];
wire [11:0] spectrum_7 = spectrum_data_packed[95:84];

// 频谱LED显示
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led_out <= 8'h00;
    end else if (spectrum_valid) begin
        // 将12位频谱数据映射到LED亮度
        led_out[0] <= |spectrum_0[11:4];
        led_out[1] <= |spectrum_1[11:4];
        led_out[2] <= |spectrum_2[11:4];
        led_out[3] <= |spectrum_3[11:4];
        led_out[4] <= |spectrum_4[11:4];
        led_out[5] <= |spectrum_5[11:4];
        led_out[6] <= |spectrum_6[11:4];
        led_out[7] <= |spectrum_7[11:4];
    end
end

endmodule