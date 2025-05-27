// --------------------------------------------------------------------
// Module: spectrum_display
// Description: 将FFT结果转换为8段LED频谱显示
// --------------------------------------------------------------------
module spectrum_display(
    input           clk,
    input           rst_n,
    input   [511:0] fft_real,
    input   [511:0] fft_imag,
    input           fft_done,
    output  [63:0]  spectrum_data_flat,  // 8*8=64位平坦化数组
    output  [7:0]   led_out
);

// 内部使用二维数组
reg [7:0] spectrum_data [0:7];
reg [15:0] band_energy [0:7];
reg [7:0]  band_level [0:7];
reg [7:0]  led_reg;
reg        update_flag;

// 计算每个频段的能量
integer i, j;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 8; i = i + 1) begin
            band_energy[i] <= 16'd0;
            band_level[i] <= 8'd0;
            spectrum_data[i] <= 8'd0;
        end
        update_flag <= 1'b0;
    end else if (fft_done) begin
        update_flag <= 1'b1;
        for (i = 0; i < 8; i = i + 1) begin
            band_energy[i] <= 16'd0;
            band_energy[i] <= fft_real[i*64] + fft_imag[i*64];
        end
    end else if (update_flag) begin
        update_flag <= 1'b0;
        for (i = 0; i < 8; i = i + 1) begin
            if (band_energy[i] > 16'd32768) 
                band_level[i] <= 8'd255;
            else 
                band_level[i] <= band_energy[i][15:8];
            
            spectrum_data[i] <= band_level[i];
            led_reg[i] <= (band_level[i] > 8'd128) ? 1'b0 : 1'b1;
        end
    end
end

// 将二维数组转换为一维输出
assign spectrum_data_flat = {spectrum_data[7], spectrum_data[6], spectrum_data[5], spectrum_data[4],
                            spectrum_data[3], spectrum_data[2], spectrum_data[1], spectrum_data[0]};

assign led_out = led_reg;

endmodule