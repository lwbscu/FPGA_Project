module mode_controller(
    input           clk,
    input           rst_n,
    input   [15:0]  key_pulse,
    output reg [2:0] current_mode,
    output reg      mode_change
);

// 模式定义
parameter MODE_SPECTRUM   = 3'd0;
parameter MODE_DB_METER   = 3'd1;
parameter MODE_MUSIC      = 3'd2;
parameter MODE_ADAPTIVE   = 3'd3;
parameter MODE_VISUAL     = 3'd4;
parameter MODE_SETTING    = 3'd5;

// 按键定义 - 使用矩阵键盘的前6个键
parameter KEY_MODE_1 = 16'h0001;  // 按键1
parameter KEY_MODE_2 = 16'h0002;  // 按键2
parameter KEY_MODE_3 = 16'h0004;  // 按键3
parameter KEY_MODE_4 = 16'h0008;  // 按键4
parameter KEY_MODE_5 = 16'h0010;  // 按键5
parameter KEY_MODE_6 = 16'h0020;  // 按键6

// 模式切换逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_mode <= MODE_SPECTRUM;
        mode_change <= 1'b0;
    end else begin
        mode_change <= 1'b0;  // 默认清除模式切换标志
        
        case (key_pulse)
            KEY_MODE_1: begin
                current_mode <= MODE_SPECTRUM;
                mode_change <= 1'b1;
            end
            KEY_MODE_2: begin
                current_mode <= MODE_DB_METER;
                mode_change <= 1'b1;
            end
            KEY_MODE_3: begin
                current_mode <= MODE_MUSIC;
                mode_change <= 1'b1;
            end
            KEY_MODE_4: begin
                current_mode <= MODE_ADAPTIVE;
                mode_change <= 1'b1;
            end
            KEY_MODE_5: begin
                current_mode <= MODE_VISUAL;
                mode_change <= 1'b1;
            end
            KEY_MODE_6: begin
                current_mode <= MODE_SETTING;
                mode_change <= 1'b1;
            end
            default: begin
                // 保持当前模式
            end
        endcase
    end
end

endmodule