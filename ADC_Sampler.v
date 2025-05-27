module ADC_Sampler(
    input           clk,
    input           rst_n,
    input           enable,
    output reg      adc_cs,
    output reg      adc_clk,
    input           adc_dat,
    output reg      sample_done,
    output reg [7:0] sample_data
);

// ADC采样状态机
localparam IDLE = 0, START = 1, SAMPLE = 2, DONE = 3;
reg [1:0] state;
reg [4:0] bit_cnt;
reg [7:0] shift_reg;

// 分频产生ADC时钟
reg [3:0] clk_div;
wire adc_clk_en = (clk_div == 4'd0);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        clk_div <= 0;
    end else begin
        clk_div <= (clk_div >= 4'd11) ? 0 : clk_div + 1;
    end
end

// ADC采样控制
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        state <= IDLE;
        adc_cs <= 1;
        adc_clk <= 1;
        sample_done <= 0;
        sample_data <= 0;
        bit_cnt <= 0;
        shift_reg <= 0;
    end else if(enable && adc_clk_en) begin
        case(state)
            IDLE: begin
                adc_cs <= 1;
                adc_clk <= 1;
                sample_done <= 0;
                state <= START;
            end
            
            START: begin
                adc_cs <= 0;
                bit_cnt <= 0;
                state <= SAMPLE;
            end
            
            SAMPLE: begin
                if(bit_cnt < 16) begin
                    adc_clk <= ~adc_clk;
                    if(adc_clk) begin
                        if(bit_cnt >= 3 && bit_cnt < 11) begin
                            shift_reg <= {shift_reg[6:0], adc_dat};
                        end
                        bit_cnt <= bit_cnt + 1;
                    end
                end else begin
                    state <= DONE;
                end
            end
            
            DONE: begin
                adc_cs <= 1;
                sample_data <= shift_reg;
                sample_done <= 1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule