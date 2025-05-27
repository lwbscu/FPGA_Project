module dac_test_gen(
    input           clk,        // 12MHz时钟
    input           rst_n,      // 复位信号
    
    // DAC SPI接口
    output reg      dac_sync,   // DAC同步信号
    output reg      dac_sclk,   // DAC时钟
    output reg      dac_sdi     // DAC数据
);

// 产生简单的锯齿波测试信号
reg [7:0] wave_data;
reg [15:0] wave_cnt;

// 波形数据生成 - 锯齿波
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        wave_data <= 8'd0;
        wave_cnt <= 16'd0;
    end else begin
        if (wave_cnt >= 16'd1000) begin  // 控制波形频率
            wave_cnt <= 16'd0;
            wave_data <= wave_data + 1'b1;  // 锯齿波递增
        end else begin
            wave_cnt <= wave_cnt + 1'b1;
        end
    end
end

// DAC SPI通信状态机
reg [4:0] spi_cnt;
reg [15:0] spi_data;
reg spi_busy;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        dac_sync <= 1'b1;
        dac_sclk <= 1'b0;
        dac_sdi <= 1'b0;
        spi_cnt <= 5'd0;
        spi_busy <= 1'b0;
    end else begin
        if (!spi_busy) begin
            // 准备发送数据
            spi_data <= {4'b0000, wave_data, 4'b0000};  // DAC格式
            dac_sync <= 1'b0;  // 开始传输
            spi_busy <= 1'b1;
            spi_cnt <= 5'd0;
        end else begin
            // SPI传输过程
            if (spi_cnt < 5'd32) begin
                if (spi_cnt[0] == 1'b0) begin
                    // 偶数计数：设置数据和时钟低
                    dac_sclk <= 1'b0;
                    dac_sdi <= spi_data[15];
                end else begin
                    // 奇数计数：时钟高，移位数据
                    dac_sclk <= 1'b1;
                    spi_data <= {spi_data[14:0], 1'b0};
                end
                spi_cnt <= spi_cnt + 1'b1;
            end else begin
                // 传输完成
                dac_sync <= 1'b1;
                dac_sclk <= 1'b0;
                spi_busy <= 1'b0;
            end
        end
    end
end

endmodule