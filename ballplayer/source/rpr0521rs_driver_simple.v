// =============================================================================
// File: rpr0521rs_driver.v
// Description: 简化的RPR0521RS传感器驱动 - 用于ballplayer项目稳定运行
// Author: GitHub Copilot (Simplified Version)
// Date: 2025-05-28
// =============================================================================

module rpr0521rs_driver(
    input wire clk,
    input wire rst_n,
    input wire enable,
    inout wire sda,
    output wire scl,
    output reg [15:0] proximity_data,
    output reg [15:0] ambient_light_data,
    output reg data_ready,
    output reg error_flag
);

    // 简化的传感器驱动 - 为了系统稳定性
    // 使用模拟数据来验证其他功能，避免复杂的I2C通信问题
    
    reg [23:0] counter;
    reg [7:0] sim_prox_data;
    reg data_toggle;
    
    // 时钟分频 - 生成约1Hz的数据更新频率
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 24'd0;
            sim_prox_data <= 8'd50;
            data_toggle <= 1'b0;
            proximity_data <= 16'h0000;
            ambient_light_data <= 16'h0100;
            data_ready <= 1'b0;
            error_flag <= 1'b0;
        end else if (enable) begin
            counter <= counter + 1'b1;
            
            // 每约0.8秒更新一次数据 (12MHz / 10000000 ≈ 0.83s)
            if (counter >= 24'd10000000) begin
                counter <= 24'd0;
                data_toggle <= ~data_toggle;
                
                // 模拟传感器数据变化 - 模拟手的接近和远离
                if (data_toggle) begin
                    sim_prox_data <= 8'd100;  // 模拟手靠近 - 较高的proximity值
                end else begin
                    sim_prox_data <= 8'd30;   // 模拟手远离 - 较低的proximity值
                end
                
                proximity_data <= {8'h00, sim_prox_data};
                ambient_light_data <= 16'h0200;  // 固定的环境光数据
                data_ready <= 1'b1;
            end else begin
                data_ready <= 1'b0;
            end
        end else begin
            counter <= 24'd0;
            data_ready <= 1'b0;
            error_flag <= 1'b0;
        end
    end
    
    // I2C信号 - 暂时保持高阻态（未连接传感器时的安全状态）
    assign scl = 1'bz;
    assign sda = 1'bz;

endmodule
