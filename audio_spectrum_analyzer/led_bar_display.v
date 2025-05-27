module led_bar_display(
    input           clk,
    input           rst_n,
    input [95:0]    spectrum_data_packed,
    input [2:0]     mode,
    output reg [7:0] led
);

// 解包数据
wire [11:0] spectrum_0 = spectrum_data_packed[11:0];
wire [11:0] spectrum_1 = spectrum_data_packed[23:12];
wire [11:0] spectrum_2 = spectrum_data_packed[35:24];
wire [11:0] spectrum_3 = spectrum_data_packed[47:36];
wire [11:0] spectrum_4 = spectrum_data_packed[59:48];
wire [11:0] spectrum_5 = spectrum_data_packed[71:60];
wire [11:0] spectrum_6 = spectrum_data_packed[83:72];
wire [11:0] spectrum_7 = spectrum_data_packed[95:84];

// 峰值保持
reg [11:0] peak_hold_0, peak_hold_1, peak_hold_2, peak_hold_3;
reg [11:0] peak_hold_4, peak_hold_5, peak_hold_6, peak_hold_7;
reg [15:0] peak_timer_0, peak_timer_1, peak_timer_2, peak_timer_3;
reg [15:0] peak_timer_4, peak_timer_5, peak_timer_6, peak_timer_7;

// 平均值计算
reg [14:0] avg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led <= 8'h00;
        peak_hold_0 <= 12'd0; peak_hold_1 <= 12'd0;
        peak_hold_2 <= 12'd0; peak_hold_3 <= 12'd0;
        peak_hold_4 <= 12'd0; peak_hold_5 <= 12'd0;
        peak_hold_6 <= 12'd0; peak_hold_7 <= 12'd0;
        peak_timer_0 <= 16'd0; peak_timer_1 <= 16'd0;
        peak_timer_2 <= 16'd0; peak_timer_3 <= 16'd0;
        peak_timer_4 <= 16'd0; peak_timer_5 <= 16'd0;
        peak_timer_6 <= 16'd0; peak_timer_7 <= 16'd0;
        avg <= 15'd0;
    end else begin
        case (mode)
            3'd0: begin  // 实时频谱
                led[0] <= |spectrum_0[11:4];
                led[1] <= |spectrum_1[11:4];
                led[2] <= |spectrum_2[11:4];
                led[3] <= |spectrum_3[11:4];
                led[4] <= |spectrum_4[11:4];
                led[5] <= |spectrum_5[11:4];
                led[6] <= |spectrum_6[11:4];
                led[7] <= |spectrum_7[11:4];
            end
            
            3'd1: begin  // VU表模式
                // 计算平均值
                avg = (spectrum_0 + spectrum_1 + spectrum_2 + spectrum_3 +
                       spectrum_4 + spectrum_5 + spectrum_6 + spectrum_7) >> 3;
                
                // 条形图显示
                if (avg > 12'd3584) led <= 8'b11111111;
                else if (avg > 12'd3072) led <= 8'b01111111;
                else if (avg > 12'd2560) led <= 8'b00111111;
                else if (avg > 12'd2048) led <= 8'b00011111;
                else if (avg > 12'd1536) led <= 8'b00001111;
                else if (avg > 12'd1024) led <= 8'b00000111;
                else if (avg > 12'd512) led <= 8'b00000011;
                else if (avg > 12'd256) led <= 8'b00000001;
                else led <= 8'b00000000;
            end
            
            3'd2: begin  // 峰值保持
                // 峰值检测和保持 - 频段0
                if (spectrum_0 > peak_hold_0) begin
                    peak_hold_0 <= spectrum_0;
                    peak_timer_0 <= 16'd50000;
                end else if (peak_timer_0 > 0) begin
                    peak_timer_0 <= peak_timer_0 - 1'b1;
                end else begin
                    if (peak_hold_0 > 12'd10)
                        peak_hold_0 <= peak_hold_0 - 12'd10;
                    else
                        peak_hold_0 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段1
                if (spectrum_1 > peak_hold_1) begin
                    peak_hold_1 <= spectrum_1;
                    peak_timer_1 <= 16'd50000;
                end else if (peak_timer_1 > 0) begin
                    peak_timer_1 <= peak_timer_1 - 1'b1;
                end else begin
                    if (peak_hold_1 > 12'd10)
                        peak_hold_1 <= peak_hold_1 - 12'd10;
                    else
                        peak_hold_1 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段2
                if (spectrum_2 > peak_hold_2) begin
                    peak_hold_2 <= spectrum_2;
                    peak_timer_2 <= 16'd50000;
                end else if (peak_timer_2 > 0) begin
                    peak_timer_2 <= peak_timer_2 - 1'b1;
                end else begin
                    if (peak_hold_2 > 12'd10)
                        peak_hold_2 <= peak_hold_2 - 12'd10;
                    else
                        peak_hold_2 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段3
                if (spectrum_3 > peak_hold_3) begin
                    peak_hold_3 <= spectrum_3;
                    peak_timer_3 <= 16'd50000;
                end else if (peak_timer_3 > 0) begin
                    peak_timer_3 <= peak_timer_3 - 1'b1;
                end else begin
                    if (peak_hold_3 > 12'd10)
                        peak_hold_3 <= peak_hold_3 - 12'd10;
                    else
                        peak_hold_3 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段4
                if (spectrum_4 > peak_hold_4) begin
                    peak_hold_4 <= spectrum_4;
                    peak_timer_4 <= 16'd50000;
                end else if (peak_timer_4 > 0) begin
                    peak_timer_4 <= peak_timer_4 - 1'b1;
                end else begin
                    if (peak_hold_4 > 12'd10)
                        peak_hold_4 <= peak_hold_4 - 12'd10;
                    else
                        peak_hold_4 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段5
                if (spectrum_5 > peak_hold_5) begin
                    peak_hold_5 <= spectrum_5;
                    peak_timer_5 <= 16'd50000;
                end else if (peak_timer_5 > 0) begin
                    peak_timer_5 <= peak_timer_5 - 1'b1;
                end else begin
                    if (peak_hold_5 > 12'd10)
                        peak_hold_5 <= peak_hold_5 - 12'd10;
                    else
                        peak_hold_5 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段6
                if (spectrum_6 > peak_hold_6) begin
                    peak_hold_6 <= spectrum_6;
                    peak_timer_6 <= 16'd50000;
                end else if (peak_timer_6 > 0) begin
                    peak_timer_6 <= peak_timer_6 - 1'b1;
                end else begin
                    if (peak_hold_6 > 12'd10)
                        peak_hold_6 <= peak_hold_6 - 12'd10;
                    else
                        peak_hold_6 <= 12'd0;
                end
                
                // 峰值检测和保持 - 频段7
                if (spectrum_7 > peak_hold_7) begin
                    peak_hold_7 <= spectrum_7;
                    peak_timer_7 <= 16'd50000;
                end else if (peak_timer_7 > 0) begin
                    peak_timer_7 <= peak_timer_7 - 1'b1;
                end else begin
                    if (peak_hold_7 > 12'd10)
                        peak_hold_7 <= peak_hold_7 - 12'd10;
                    else
                        peak_hold_7 <= 12'd0;
                end
                
                // LED显示峰值
                led[0] <= |peak_hold_0[11:4];
                led[1] <= |peak_hold_1[11:4];
                led[2] <= |peak_hold_2[11:4];
                led[3] <= |peak_hold_3[11:4];
                led[4] <= |peak_hold_4[11:4];
                led[5] <= |peak_hold_5[11:4];
                led[6] <= |peak_hold_6[11:4];
                led[7] <= |peak_hold_7[11:4];
            end
            
            default: led <= 8'h00;
        endcase
    end
end

endmodule