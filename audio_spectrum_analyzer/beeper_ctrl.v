module beeper_ctrl(
    input           clk,
    input           rst_n,
    input [15:0]    key_pulse,
    output reg      beep
);

reg [15:0] beep_cnt;
reg beep_en;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        beep <= 1'b0;
        beep_cnt <= 16'd0;
        beep_en <= 1'b0;
    end else begin
        // 检测按键脉冲
        if (|key_pulse) begin
            beep_en <= 1'b1;
            beep_cnt <= 16'd0;
        end
        
        // 产生蜂鸣声
        if (beep_en) begin
            beep_cnt <= beep_cnt + 1'b1;
            // 产生1kHz方波
            beep <= (beep_cnt[11:0] < 12'd3000) ? 1'b1 : 1'b0;
            
            // 持续100ms
            if (beep_cnt >= 16'd12000) begin
                beep_en <= 1'b0;
                beep <= 1'b0;
            end
        end
    end
end

endmodule