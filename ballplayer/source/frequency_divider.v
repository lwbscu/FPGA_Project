// ============================================================================
// Module: frequency_divider
// Description: 频率分频器模块 - 可配置分频比
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module frequency_divider #(
    parameter WIDTH = 24,       // 计数器位宽
    parameter N = 219089        // 分频系数
)(
    input wire  clk,            // 输入时钟
    input wire  rst_n,          // 复位信号
    output reg  clk_out         // 输出分频时钟
);

reg [WIDTH-1:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= {WIDTH{1'b0}};
        clk_out <= 1'b0;
    end else begin
        if (counter >= (N - 24'd1)) begin
            counter <= {WIDTH{1'b0}};
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + {{(WIDTH-1){1'b0}}, 1'b1};
        end
    end
end

endmodule
