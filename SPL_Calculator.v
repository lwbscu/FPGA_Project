// SPL_Calculator.v - 声压级计算模块
module SPL_Calculator(
    input           clk,
    input           rst_n,
    input           enable,
    input  [15:0]   audio_sample,
    input           audio_valid,
    output reg [15:0] spl_db,      // 当前dB值
    output reg [15:0] spl_peak     // 峰值dB
);

// A加权滤波器系数（简化实现）
reg [31:0] rms_accumulator;
reg [15:0] sample_count;
reg [15:0] rms_value;

// dB查找表（简化实现）
reg [7:0] db_table[0:255];

initial begin
    integer i;
    for(i = 0; i < 256; i = i + 1) begin
        if(i == 0) db_table[i] = 0;
        else db_table[i] = $rtoi(20 * $log10(i/255.0) + 94); // 参考94dB SPL
    end
end

// RMS计算
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rms_accumulator <= 0;
        sample_count <= 0;
        rms_value <= 0;
    end else if(enable && audio_valid) begin
        // 累加平方值
        rms_accumulator <= rms_accumulator + (audio_sample * audio_sample);
        sample_count <= sample_count + 1;
        
        // 每1024个采样计算一次RMS
        if(sample_count == 1023) begin
            rms_value <= rms_accumulator[31:16]; // 简化的平方根
            rms_accumulator <= 0;
            sample_count <= 0;
        end
    end
end

// dB值计算
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        spl_db <= 0;
        spl_peak <= 0;
    end else if(enable) begin
        // 查表获取dB值
        spl_db <= {8'h00, db_table[rms_value[15:8]]};
        
        // 更新峰值
        if(spl_db > spl_peak) begin
            spl_peak <= spl_db;
        end
    end
end

endmodule