module adc_driver(
    input           clk,        // 24MHz时钟
    input           rst_n,      // 复位信号
    output reg      adc_cs,     // ADC片选
    output reg      adc_clk,    // ADC时钟
    input           adc_dat,    // ADC数据
    output reg      adc_done,   // 采样完成
    output reg [7:0] adc_data   // 采样数据
);

// 参数定义
localparam IDLE = 2'd0;
localparam CONVERT = 2'd1;
localparam DONE = 2'd2;

// 状态机
reg [1:0] state;
reg [4:0] bit_cnt;
reg [7:0] data_temp;

// ADC时序控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        adc_cs <= 1'b1;
        adc_clk <= 1'b1;
        adc_done <= 1'b0;
        adc_data <= 8'd0;
        bit_cnt <= 5'd0;
        data_temp <= 8'd0;
    end else begin
        case (state)
            IDLE: begin
                adc_cs <= 1'b0;  // 片选有效
                adc_clk <= 1'b1;
                adc_done <= 1'b0;
                bit_cnt <= 5'd0;
                state <= CONVERT;
            end
            
            CONVERT: begin
                if (bit_cnt < 5'd16) begin
                    adc_clk <= ~adc_clk;
                    
                    // 在时钟上升沿采样数据
                    if (adc_clk == 1'b0 && bit_cnt >= 5'd3 && bit_cnt < 5'd11) begin
                        data_temp[10-bit_cnt] <= adc_dat;
                    end
                    
                    if (adc_clk == 1'b1) begin
                        bit_cnt <= bit_cnt + 1'b1;
                    end
                end else begin
                    adc_cs <= 1'b1;
                    adc_data <= data_temp;
                    adc_done <= 1'b1;
                    state <= DONE;
                end
            end
            
            DONE: begin
                adc_done <= 1'b0;
                state <= IDLE;
            end
            
            default: state <= IDLE;
        endcase
    end
end

endmodule