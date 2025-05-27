// --------------------------------------------------------------------
// Module: light_effects
// Description: 音乐同步灯光效果控制
// --------------------------------------------------------------------
module light_effects(
    input           clk,
    input           rst_n,
    input   [63:0]  spectrum_data_flat,   // 平坦化的频谱数据
    input   [3:0]   current_mode,
    output  [7:0]   light_pattern
);

// 参数定义（保持不变）
parameter EFFECT_SPECTRUM   = 3'd0;
parameter EFFECT_PULSE      = 3'd1;
parameter EFFECT_WAVE       = 3'd2;
parameter EFFECT_STAR       = 3'd3;
parameter EFFECT_CHASE      = 3'd4;
parameter EFFECT_FADE       = 3'd5;
parameter EFFECT_RANDOM     = 3'd6;
parameter EFFECT_VU_METER   = 3'd7;

// 内部信号
reg [7:0]  led_reg;
reg [23:0] effect_counter;
reg [7:0]  brightness [0:7];
reg [2:0]  auto_effect;
reg [7:0]  chase_position;
reg [7:0]  fade_level;
reg [15:0] random_seed;

// 从平坦化数组提取各段数据
wire [7:0] spectrum_data [0:7];
genvar g;
generate
    for (g = 0; g < 8; g = g + 1) begin : unflatten
        assign spectrum_data[g] = spectrum_data_flat[g*8 +: 8];
    end
endgenerate

// 自动效果选择
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        auto_effect <= EFFECT_SPECTRUM;
    end else begin
        if (spectrum_data[0] > 200 && spectrum_data[1] > 200) begin
            auto_effect <= EFFECT_PULSE;
        end else if (spectrum_data[6] > 180 && spectrum_data[7] > 180) begin
            auto_effect <= EFFECT_STAR;
        end else if (spectrum_data[3] > 150 && spectrum_data[4] > 150) begin
            auto_effect <= EFFECT_WAVE;
        end else begin
            auto_effect <= EFFECT_SPECTRUM;
        end
    end
end

// 效果计数器
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        effect_counter <= 24'd0;
    end else begin
        effect_counter <= effect_counter + 1'b1;
    end
end

// 主效果生成器
integer i;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led_reg <= 8'hFF;
        chase_position <= 8'b00000001;
        fade_level <= 8'd0;
        random_seed <= 16'hA5A5;
        for (i = 0; i < 8; i = i + 1) begin
            brightness[i] <= 8'd0;
        end
    end else begin
        case (current_mode[3] ? auto_effect : current_mode[2:0])
            EFFECT_SPECTRUM: begin
                for (i = 0; i < 8; i = i + 1) begin
                    led_reg[i] <= (spectrum_data[i] > 128) ? 1'b0 : 1'b1;
                end
            end
            
            EFFECT_PULSE: begin
                if (effect_counter[19:12] < 128) begin
                    fade_level <= effect_counter[19:12];
                end else begin
                    fade_level <= 255 - effect_counter[19:12];
                end
                for (i = 0; i < 8; i = i + 1) begin
                    led_reg[i] <= (fade_level > (spectrum_data[0] >> 1)) ? 1'b1 : 1'b0;
                end
            end
            
            EFFECT_WAVE: begin
                for (i = 0; i < 8; i = i + 1) begin
                    brightness[i] <= (effect_counter[18:11] + i * 32) & 8'hFF;
                    led_reg[i] <= (brightness[i] > 128) ? 1'b0 : 1'b1;
                end
            end
            
            EFFECT_STAR: begin
                random_seed <= {random_seed[14:0], random_seed[15] ^ random_seed[13]};
                for (i = 0; i < 8; i = i + 1) begin
                    led_reg[i] <= random_seed[i] & (spectrum_data[i] > 100);
                end
            end
            
            EFFECT_CHASE: begin
                if (effect_counter[17:0] == 18'd0) begin
                    chase_position <= {chase_position[6:0], chase_position[7]};
                end
                led_reg <= ~chase_position;
            end
            
            EFFECT_FADE: begin
                fade_level <= effect_counter[19:12];
                for (i = 0; i < 8; i = i + 1) begin
                    led_reg[i] <= (fade_level > (i * 32)) ? 1'b0 : 1'b1;
                end
            end
            
            EFFECT_RANDOM: begin
                if (effect_counter[15:0] == 16'd0) begin
                    random_seed <= {random_seed[14:0], random_seed[15] ^ random_seed[13]};
                    led_reg <= random_seed[7:0];
                end
            end
            
            EFFECT_VU_METER: begin
                reg [10:0] avg_energy;
                avg_energy = spectrum_data[0] + spectrum_data[1] + 
                            spectrum_data[2] + spectrum_data[3];
                case (avg_energy[10:7])
                    4'd0: led_reg <= 8'b11111111;
                    4'd1: led_reg <= 8'b11111110;
                    4'd2: led_reg <= 8'b11111100;
                    4'd3: led_reg <= 8'b11111000;
                    4'd4: led_reg <= 8'b11110000;
                    4'd5: led_reg <= 8'b11100000;
                    4'd6: led_reg <= 8'b11000000;
                    4'd7: led_reg <= 8'b10000000;
                    default: led_reg <= 8'b00000000;
                endcase
            end
        endcase
    end
end

assign light_pattern = led_reg;

endmodule