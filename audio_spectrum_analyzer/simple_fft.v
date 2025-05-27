module simple_fft(
    input           clk,
    input           rst_n,
    input  [7:0]    adc_data,
    input           trigger,
    input  [2:0]    mode,
    input  [7:0]    gain,
    output reg [95:0] spectrum_data_packed,  // 8个频段 x 12位
    output reg      spectrum_valid
);

// 采样缓冲
reg [7:0] samples [0:63];
reg [5:0] sample_cnt;
reg sampling;

// 频谱计算寄存器
reg [11:0] spectrum [0:7];
reg [3:0] calc_cnt;
reg [11:0] temp_sum;
reg calc_busy;

// 整数变量声明（用于循环）
integer i;

// 主状态机 - 合并采样和计算逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sample_cnt <= 6'd0;
        sampling <= 1'b0;
        spectrum_valid <= 1'b0;
        calc_cnt <= 4'd0;
        calc_busy <= 1'b0;
        spectrum_data_packed <= 96'd0;
        temp_sum <= 12'd0;
        
        // 初始化数组
        for (i = 0; i < 64; i = i + 1) begin
            samples[i] <= 8'd0;
        end
        
        for (i = 0; i < 8; i = i + 1) begin
            spectrum[i] <= 12'd0;
        end
    end else begin
        // 采样逻辑
        if (trigger && !sampling && !calc_busy) begin
            sampling <= 1'b1;
            sample_cnt <= 6'd0;
            spectrum_valid <= 1'b0;
        end else if (sampling) begin
            samples[sample_cnt] <= adc_data;
            
            if (sample_cnt == 6'd63) begin
                sampling <= 1'b0;
                sample_cnt <= 6'd0;
                calc_busy <= 1'b1;  // 开始计算
                calc_cnt <= 4'd0;
            end else begin
                sample_cnt <= sample_cnt + 1'b1;
            end
        end
        
        // 频谱计算逻辑
        else if (calc_busy) begin
            case(calc_cnt)
                4'd0: begin
                    // 频段0：0-7号样本
                    temp_sum = 12'd0;
                    for (i = 0; i < 8; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[0] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd1: begin
                    // 频段1：8-15号样本
                    temp_sum = 12'd0;
                    for (i = 8; i < 16; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[1] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd2: begin
                    // 频段2：16-23号样本
                    temp_sum = 12'd0;
                    for (i = 16; i < 24; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[2] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd3: begin
                    // 频段3：24-31号样本
                    temp_sum = 12'd0;
                    for (i = 24; i < 32; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[3] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd4: begin
                    // 频段4：32-39号样本
                    temp_sum = 12'd0;
                    for (i = 32; i < 40; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[4] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd5: begin
                    // 频段5：40-47号样本
                    temp_sum = 12'd0;
                    for (i = 40; i < 48; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[5] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd6: begin
                    // 频段6：48-55号样本
                    temp_sum = 12'd0;
                    for (i = 48; i < 56; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[6] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd7: begin
                    // 频段7：56-63号样本
                    temp_sum = 12'd0;
                    for (i = 56; i < 64; i = i + 1) begin
                        if (samples[i] > 8'd128)
                            temp_sum = temp_sum + (samples[i] - 8'd128);
                        else
                            temp_sum = temp_sum + (8'd128 - samples[i]);
                    end
                    spectrum[7] <= temp_sum;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd8: begin
                    // 应用增益并打包输出
                    spectrum_data_packed <= {
                        (spectrum[7] * gain) >> 7,
                        (spectrum[6] * gain) >> 7,
                        (spectrum[5] * gain) >> 7,
                        (spectrum[4] * gain) >> 7,
                        (spectrum[3] * gain) >> 7,
                        (spectrum[2] * gain) >> 7,
                        (spectrum[1] * gain) >> 7,
                        (spectrum[0] * gain) >> 7
                    };
                    spectrum_valid <= 1'b1;
                    calc_cnt <= calc_cnt + 1'b1;
                end
                
                4'd9: begin
                    spectrum_valid <= 1'b0;
                    calc_busy <= 1'b0;
                    calc_cnt <= 4'd0;
                end
                
                default: begin
                    calc_cnt <= 4'd0;
                    calc_busy <= 1'b0;
                end
            endcase
        end
    end
end

endmodule