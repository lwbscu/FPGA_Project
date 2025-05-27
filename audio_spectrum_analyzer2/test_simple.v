module test_simple(
    input           clk,        // 12MHz时钟
    input           rst_n,      // 复位按键
    
    // 数码管
    output reg      seg_rck,
    output reg      seg_sck,
    output reg      seg_din,
    
    // LED测试 - 使用多个LED
    output reg      led1,       // LED1
    output reg      led2,       // LED2
    output reg      led3,       // LED3
    output reg      led4        // LED4
);

// 简单计数器产生慢时钟
reg [23:0] cnt;
reg slow_clk;

always @(posedge clk) begin
    cnt <= cnt + 1'b1;
    if(cnt == 24'd6000000) begin  // 0.5秒
        cnt <= 24'd0;
        slow_clk <= ~slow_clk;
    end
end

// LED闪烁测试
always @(posedge clk) begin
    led1 <= cnt[22];  // 快闪
    led2 <= cnt[23];  // 慢闪
    led3 <= slow_clk; // 更慢
    led4 <= 1'b1;     // 常亮
end

// 简单的数码管测试 - 直接显示8
reg [5:0] state;
reg [15:0] seg_data;

always @(posedge cnt[15]) begin  // 使用较慢的时钟
    if(state < 6'd32) 
        state <= state + 1'b1;
    else 
        state <= 6'd0;
end

// 数码管数据：最后一位显示8，其他位灭
// 段码 = 0x7F (显示8), 位选 = 0x7F (只亮最后一位)
always @(posedge cnt[15]) begin
    seg_data <= 16'hFF7F;  // 高8位是段码，低8位是位选
    
    case(state[4:0])
        // 发送16位数据到74HC595
        5'd0:  begin seg_sck <= 1'b0; seg_din <= seg_data[15]; end
        5'd1:  begin seg_sck <= 1'b1; end
        5'd2:  begin seg_sck <= 1'b0; seg_din <= seg_data[14]; end
        5'd3:  begin seg_sck <= 1'b1; end
        5'd4:  begin seg_sck <= 1'b0; seg_din <= seg_data[13]; end
        5'd5:  begin seg_sck <= 1'b1; end
        5'd6:  begin seg_sck <= 1'b0; seg_din <= seg_data[12]; end
        5'd7:  begin seg_sck <= 1'b1; end
        5'd8:  begin seg_sck <= 1'b0; seg_din <= seg_data[11]; end
        5'd9:  begin seg_sck <= 1'b1; end
        5'd10: begin seg_sck <= 1'b0; seg_din <= seg_data[10]; end
        5'd11: begin seg_sck <= 1'b1; end
        5'd12: begin seg_sck <= 1'b0; seg_din <= seg_data[9]; end
        5'd13: begin seg_sck <= 1'b1; end
        5'd14: begin seg_sck <= 1'b0; seg_din <= seg_data[8]; end
        5'd15: begin seg_sck <= 1'b1; end
        5'd16: begin seg_sck <= 1'b0; seg_din <= seg_data[7]; end
        5'd17: begin seg_sck <= 1'b1; end
        5'd18: begin seg_sck <= 1'b0; seg_din <= seg_data[6]; end
        5'd19: begin seg_sck <= 1'b1; end
        5'd20: begin seg_sck <= 1'b0; seg_din <= seg_data[5]; end
        5'd21: begin seg_sck <= 1'b1; end
        5'd22: begin seg_sck <= 1'b0; seg_din <= seg_data[4]; end
        5'd23: begin seg_sck <= 1'b1; end
        5'd24: begin seg_sck <= 1'b0; seg_din <= seg_data[3]; end
        5'd25: begin seg_sck <= 1'b1; end
        5'd26: begin seg_sck <= 1'b0; seg_din <= seg_data[2]; end
        5'd27: begin seg_sck <= 1'b1; end
        5'd28: begin seg_sck <= 1'b0; seg_din <= seg_data[1]; end
        5'd29: begin seg_sck <= 1'b1; end
        5'd30: begin seg_sck <= 1'b0; seg_din <= seg_data[0]; end
        5'd31: begin seg_sck <= 1'b1; seg_rck <= 1'b1; end
        default: begin seg_rck <= 1'b0; end
    endcase
end

endmodule