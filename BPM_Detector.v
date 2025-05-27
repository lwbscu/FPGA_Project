// BPM_Detector.v - 节奏检测模块
module BPM_Detector(
    input           clk,
    input           rst_n,
    input           enable,
    input  [15:0]   audio_sample,
    input           audio_valid,
    output reg [7:0] bpm_value,
    output reg       beat_pulse
);

// 能量检测
reg [31:0] energy_buffer[0:63];  // 64个能量窗口
reg [5:0] energy_index;
reg [31:0] current_energy;
reg [31:0] average_energy;

// 节拍检测
reg [15:0] beat_interval_counter;
reg [15:0] last_beat_interval;
reg beat_detected;

// 自相关缓冲区
reg [15:0] autocorr_buffer[0:511];
reg [8:0] autocorr_index;

// 能量计算
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        current_energy <= 0;
        energy_index <= 0;
    end else if(enable && audio_valid) begin
        // 计算瞬时能量
        current_energy <= audio_sample * audio_sample;
        
        // 更新能量缓冲区
        energy_buffer[energy_index] <= current_energy;
        energy_index <= energy_index + 1;
    end
end

// 平均能量计算
always @(posedge clk) begin
    if(enable) begin
        integer i;
        reg [31:0] sum;
        sum = 0;
        for(i = 0; i < 64; i = i + 1) begin
            sum = sum + energy_buffer[i];
        end
        average_energy <= sum >> 6; // 除以64
    end
end

// 节拍检测
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        beat_detected <= 0;
        beat_pulse <= 0;
        beat_interval_counter <= 0;
    end else if(enable) begin
        beat_interval_counter <= beat_interval_counter + 1;
        beat_pulse <= 0;
        
        // 检测能量峰值
        if(current_energy > (average_energy + (average_energy >> 2))) begin
            if(!beat_detected) begin
                beat_detected <= 1;
                beat_pulse <= 1;
                last_beat_interval <= beat_interval_counter;
                beat_interval_counter <= 0;
            end
        end else begin
            beat_detected <= 0;
        end
    end
end

// BPM计算
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        bpm_value <= 120; // 默认120 BPM
    end else if(enable && last_beat_interval > 0) begin
        // 根据采样率和间隔计算BPM
        // BPM = 60 * 采样率 / 间隔
        // 简化计算：假设48kHz采样率
        bpm_value <= 2880000 / last_beat_interval; // 60 * 48000 / interval
    end
end

endmodule