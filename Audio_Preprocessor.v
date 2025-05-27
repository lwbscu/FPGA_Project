module Audio_Preprocessor(
    input           clk,
    input           rst_n,
    input  [7:0]    adc_data,
    input           adc_valid,
    output reg [15:0] audio_sample
);

// DC偏移去除
reg [15:0] dc_offset;
reg [19:0] dc_accumulator;
reg [7:0] sample_count;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        dc_accumulator <= 0;
        sample_count <= 0;
        dc_offset <= 16'd128;
    end else if(adc_valid) begin
        dc_accumulator <= dc_accumulator + adc_data;
        sample_count <= sample_count + 1;
        
        if(sample_count == 255) begin
            dc_offset <= dc_accumulator[15:0] >> 8;
            dc_accumulator <= 0;
            sample_count <= 0;
        end
    end
end

// 8位转16位，去除DC偏移
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        audio_sample <= 0;
    end else if(adc_valid) begin
        // 扩展到16位并去除DC偏移
        audio_sample <= {adc_data, 8'h00} - {dc_offset, 8'h00};
    end
end

endmodule