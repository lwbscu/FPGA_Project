// Light_Controller.v - 智能灯光控制
module Light_Controller(
    input           clk,
    input           rst_n,
    input           enable,
    input  [15:0]   fft_mag[0:7],
    input           beat_pulse,
    input  [7:0]    bpm_value,
    output reg [7:0] led_out
);

// 灯光模式定义
localparam MODE_SPECTRUM  = 0;  // 频谱显示
localparam MODE_PULSE     = 1;  // 脉冲呼吸
localparam MODE_STROBE    = 2;  // 频闪同步
localparam MODE_STAR      = 3;  // 星空闪烁
localparam MODE_WAVE      = 4;  // 波浪效果
localparam MODE_RAINBOW   = 5;  // 彩虹渐变
localparam MODE_FIRE      = 6;  // 火焰效果
localparam MODE_RAINDROP  = 7;  // 雨滴效果

reg [2:0] light_mode;
reg [7:0] effect_counter;
reg [7:0] brightness[0:7];

// 频谱特征分析
wire low_freq_dominant = (fft_mag[0] + fft_mag[1]) > (fft_mag[6] + fft_mag[7]);
wire high_freq_rich = (fft_mag[5] + fft_mag[6] + fft_mag[7]) > (fft_mag[0] + fft_mag[1]);
wire strong_beat = beat_pulse && (bpm_value > 100);

// 自动模式选择
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        light_mode <= MODE_SPECTRUM;
    end else if(enable) begin
        if(strong_beat) begin
            light_mode <= MODE_STROBE;
        end else if(low_freq_dominant) begin
            light_mode <= MODE_PULSE;
        end else if(high_freq_rich) begin
            light_mode <= MODE_STAR;
        end else begin
            light_mode <= MODE_SPECTRUM;
        end
    end
end

// 效果生成
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        led_out <= 8'h00;
        effect_counter <= 0;
    end else if(enable) begin
        effect_counter <= effect_counter + 1;
        
        case(light_mode)
            MODE_SPECTRUM: begin
                // 频谱显示模式
                integer i;
                for(i = 0; i < 8; i = i + 1) begin
                    led_out[i] <= fft_mag[i] > 16'h4000;
                end
            end
            
            MODE_PULSE: begin
                // 脉冲呼吸效果
                reg [7:0] pulse_brightness;
                pulse_brightness = effect_counter < 128 ? effect_counter : 255 - effect_counter;
                led_out <= {8{pulse_brightness > 64}};
            end
            
            MODE_STROBE: begin
                // 节奏同步频闪
                led_out <= beat_pulse ? 8'hFF : 8'h00;
            end
            
            MODE_STAR: begin
                // 星空闪烁效果
                led_out[0] <= (effect_counter[7:5] == 3'b000);
                led_out[1] <= (effect_counter[7:5] == 3'b001);
                led_out[2] <= (effect_counter[7:5] == 3'b010);
                led_out[3] <= (effect_counter[7:5] == 3'b011);
                led_out[4] <= (effect_counter[7:5] == 3'b100);
                led_out[5] <= (effect_counter[7:5] == 3'b101);
                led_out[6] <= (effect_counter[7:5] == 3'b110);
                led_out[7] <= (effect_counter[7:5] == 3'b111);
            end
            
            default: begin
                led_out <= 8'h00;
            end
        endcase
    end else begin
        led_out <= 8'h00;
    end
end

endmodule