module param_adjuster(
    input           clk,
    input           rst_n,
    input           L_pulse,
    input           R_pulse,
    input   [2:0]   current_mode,
    output reg [7:0] sensitivity
);

// 根据模式调节不同参数
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sensitivity <= 8'd50;  // 默认灵敏度50%
    end else begin
        if (L_pulse && sensitivity > 8'd0) begin
            sensitivity <= sensitivity - 8'd1;
        end else if (R_pulse && sensitivity < 8'd99) begin
            sensitivity <= sensitivity + 8'd1;
        end
    end
end

endmodule