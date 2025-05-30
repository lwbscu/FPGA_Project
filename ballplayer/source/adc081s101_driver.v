// ============================================================================
// Module: adc081s101_driver
// Description: ADC081S101 ADC驱动模块 - 用于读取模拟信号
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module adc081s101_driver(
    input wire          clk,            // 24MHz时钟
    input wire          rst_n,          // 复位信号
    output reg          adc_cs,         // ADC片选信号
    output reg          adc_clk,        // ADC时钟信号
    input wire          adc_dat,        // ADC数据输入
    output reg          adc_done,       // ADC转换完成信号
    output reg [7:0]    adc_data        // ADC转换结果
);

// 状态机定义
parameter IDLE = 3'd0;
parameter START = 3'd1;
parameter SAMPLE = 3'd2;
parameter CONVERT = 3'd3;
parameter READ = 3'd4;
parameter DONE = 3'd5;

reg [2:0] state;
reg [7:0] bit_count;
reg [7:0] data_temp;
reg [15:0] clk_count;

// ADC时钟分频 - 从24MHz产生ADC时钟（约1MHz）
parameter CLK_DIV = 24;
reg [4:0] clk_div_count;
reg adc_clk_int;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        clk_div_count <= 5'd0;
        adc_clk_int <= 1'b0;
    end else begin
        if (clk_div_count >= 5'd11) begin  // CLK_DIV/2 - 1 = 11
            clk_div_count <= 5'd0;
            adc_clk_int <= ~adc_clk_int;
        end else begin
            clk_div_count <= clk_div_count + 1'b1;
        end
    end
end

// ADC控制状态机
always @(posedge clk or negedge rst_n) begin    if (!rst_n) begin
        state <= IDLE;
        adc_cs <= 1'b1;
        adc_clk <= 1'b0;
        adc_done <= 1'b0;
        adc_data <= 8'h00;
        bit_count <= 8'd0;
        data_temp <= 8'd0;
        clk_count <= 16'd0;
    end else begin
        case (state)            IDLE: begin
                adc_cs <= 1'b1;
                adc_clk <= 1'b0;
                adc_done <= 1'b0;
                clk_count <= clk_count + 1'b1;
                if (clk_count >= 16'd48000) begin  // 约2ms间隔采样
                    clk_count <= 16'd0;
                    state <= START;
                end
            end
              START: begin
                adc_cs <= 1'b0;    // 启动转换
                adc_clk <= 1'b0;
                bit_count <= 8'd0;
                data_temp <= 8'd0;
                state <= SAMPLE;
            end
              SAMPLE: begin
                adc_clk <= adc_clk_int;
                if (adc_clk_int && (bit_count < 8'd8)) begin
                    data_temp <= {data_temp[6:0], adc_dat};
                    bit_count <= bit_count + 1'b1;
                end else if (bit_count >= 8'd8) begin
                    state <= DONE;
                end
            end
            
            DONE: begin
                adc_cs <= 1'b1;
                adc_clk <= 1'b0;
                adc_data <= data_temp;
                adc_done <= 1'b1;
                state <= IDLE;
            end
            
            default: begin
                state <= IDLE;
            end
        endcase
    end
end

endmodule
