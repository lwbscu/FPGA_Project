module db_calculator(
    input           clk,
    input           rst_n,
    input   [15:0]  audio_data,
    input           data_valid,
    output reg [15:0] db_value
);

// 简化的分贝计算
// dB = 20 * log10(amplitude / reference)
// 这里使用查找表简化计算

reg [31:0] amplitude_acc;
reg [15:0] sample_cnt;
reg [15:0] amplitude_avg;

// 每1000个样本计算一次平均值
parameter AVG_SAMPLES = 16'd1000;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        amplitude_acc <= 32'd0;
        sample_cnt <= 16'd0;
        amplitude_avg <= 16'd0;
        db_value <= 16'd0;
    end else if (data_valid) begin
        // 累加绝对值
        amplitude_acc <= amplitude_acc + (audio_data[15] ? ~audio_data + 1'b1 : audio_data);
        sample_cnt <= sample_cnt + 1'b1;
        
        if (sample_cnt >= AVG_SAMPLES) begin
            // 计算平均值
            amplitude_avg <= amplitude_acc[31:16];
            amplitude_acc <= 32'd0;
            sample_cnt <= 16'd0;
            
            // 简化的dB映射（使用线性近似）
            // 实际应用中应使用更精确的对数计算
            if (amplitude_avg < 16'd100)
                db_value <= 16'd30;  // 30dB
            else if (amplitude_avg < 16'd500)
                db_value <= 16'd40;  // 40dB
            else if (amplitude_avg < 16'd2000)
                db_value <= 16'd50;  // 50dB
            else if (amplitude_avg < 16'd8000)
                db_value <= 16'd60;  // 60dB
            else if (amplitude_avg < 16'd20000)
                db_value <= 16'd70;  // 70dB
            else
                db_value <= 16'd80;  // 80dB
        end
    end
end

endmodule