module mode_control(
    input           clk,
    input           rst_n,
    input [3:0]     key_value,  // 按键值
    input           key_valid,  // 按键有效
    
    output reg [2:0] mode,      // 当前模式
    output reg [7:0] gain,      // 增益控制
    output reg       mode_changed // 模式改变标志
);

// 模式定义
localparam MODE_SPECTRUM = 3'd0;   // 频谱显示
localparam MODE_VU_METER = 3'd1;   // VU表
localparam MODE_PEAK_HOLD = 3'd2;  // 峰值保持
localparam MODE_WATERFALL = 3'd3;  // 瀑布图
localparam MODE_TEST = 3'd4;       // 测试模式

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        mode <= MODE_SPECTRUM;
        gain <= 8'd128;  // 默认增益
        mode_changed <= 1'b0;
    end else begin
        mode_changed <= 1'b0;
        
        if (key_valid) begin
            case (key_value)
                4'd1: begin  // 按键1 - 频谱模式
                    mode <= MODE_SPECTRUM;
                    mode_changed <= 1'b1;
                end
                4'd2: begin  // 按键2 - VU表模式
                    mode <= MODE_VU_METER;
                    mode_changed <= 1'b1;
                end
                4'd3: begin  // 按键3 - 峰值保持
                    mode <= MODE_PEAK_HOLD;
                    mode_changed <= 1'b1;
                end
                4'd4: begin  // 按键4 - 瀑布图
                    mode <= MODE_WATERFALL;
                    mode_changed <= 1'b1;
                end
                4'd5: begin  // 按键5 - 测试模式
                    mode <= MODE_TEST;
                    mode_changed <= 1'b1;
                end
                
                // 增益控制
                4'd7: begin  // 按键7 - 增益+
                    if (gain < 8'd240)
                        gain <= gain + 8'd16;
                end
                4'd8: begin  // 按键8 - 增益-
                    if (gain > 8'd16)
                        gain <= gain - 8'd16;
                end
                
                4'd0: begin  // 按键0 - 复位
                    mode <= MODE_SPECTRUM;
                    gain <= 8'd128;
                    mode_changed <= 1'b1;
                end
            endcase
        end
    end
end

endmodule