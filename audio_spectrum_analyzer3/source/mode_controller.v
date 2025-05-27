// --------------------------------------------------------------------
// Module: mode_controller
// Description: 系统模式控制，支持多种工作模式
// --------------------------------------------------------------------
module mode_controller(
    input           clk,
    input           rst_n,
    input   [15:0]  key_pulse,      // 矩阵键盘输入
    input           encoder_a,       // 旋转编码器A
    input           encoder_b,       // 旋转编码器B
    input           encoder_o,       // 旋转编码器按键
    output  [3:0]   current_mode,   // 当前模式
    output          mode_change     // 模式改变脉冲
);

// 模式定义
parameter MODE_SPECTRUM    = 4'd0;  // 频谱显示模式
parameter MODE_DB_METER    = 4'd1;  // 分贝计模式
parameter MODE_RECORD      = 4'd2;  // 记录模式
parameter MODE_LIGHT_AUTO  = 4'd3;  // 自动灯光模式
parameter MODE_LIGHT_MAN   = 4'd4;  // 手动灯光模式
parameter MODE_MUSIC_PLAY  = 4'd5;  // 音乐播放模式
parameter MODE_MUSIC_REACT = 4'd6;  // 音乐反应模式
parameter MODE_FFT_DETAIL  = 4'd7;  // FFT详细显示
parameter MODE_NOISE_MON   = 4'd8;  // 噪声监测模式
parameter MODE_CONFIG      = 4'd9;  // 配置模式

reg [3:0] mode_reg;
reg       mode_change_reg;
reg [15:0] key_pulse_r;

// 旋转编码器处理
wire encoder_left, encoder_right, encoder_press;
amp_encoder encoder_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_a(encoder_a),
    .key_b(encoder_b),
    .L_pulse(encoder_left),
    .R_pulse(encoder_right)
);

wire encoder_o_pulse;
debounce #(.KEY_WIDTH(1)) debounce_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_n(encoder_o),
    .key_pulse(encoder_o_pulse)
);

// 模式切换逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        mode_reg <= MODE_SPECTRUM;
        mode_change_reg <= 1'b0;
        key_pulse_r <= 16'hFFFF;
    end else begin
        key_pulse_r <= key_pulse;
        mode_change_reg <= 1'b0;
        
        // 矩阵键盘直接选择模式（按键1-10对应模式0-9）
        if (key_pulse != key_pulse_r) begin
            case (key_pulse)
                16'h0001: begin mode_reg <= MODE_SPECTRUM;    mode_change_reg <= 1'b1; end
                16'h0002: begin mode_reg <= MODE_DB_METER;    mode_change_reg <= 1'b1; end
                16'h0004: begin mode_reg <= MODE_RECORD;      mode_change_reg <= 1'b1; end
                16'h0008: begin mode_reg <= MODE_LIGHT_AUTO;  mode_change_reg <= 1'b1; end
                16'h0010: begin mode_reg <= MODE_LIGHT_MAN;   mode_change_reg <= 1'b1; end
                16'h0020: begin mode_reg <= MODE_MUSIC_PLAY;  mode_change_reg <= 1'b1; end
                16'h0040: begin mode_reg <= MODE_MUSIC_REACT; mode_change_reg <= 1'b1; end
                16'h0080: begin mode_reg <= MODE_FFT_DETAIL;  mode_change_reg <= 1'b1; end
                16'h0100: begin mode_reg <= MODE_NOISE_MON;   mode_change_reg <= 1'b1; end
                16'h0200: begin mode_reg <= MODE_CONFIG;      mode_change_reg <= 1'b1; end
            endcase
        end
        
        // 旋转编码器切换模式
        else if (encoder_left) begin
            if (mode_reg == MODE_SPECTRUM)
                mode_reg <= MODE_CONFIG;
            else
                mode_reg <= mode_reg - 1'b1;
            mode_change_reg <= 1'b1;
        end
        else if (encoder_right) begin
            if (mode_reg == MODE_CONFIG)
                mode_reg <= MODE_SPECTRUM;
            else
                mode_reg <= mode_reg + 1'b1;
            mode_change_reg <= 1'b1;
        end
    end
end

assign current_mode = mode_reg;
assign mode_change = mode_change_reg;

endmodule