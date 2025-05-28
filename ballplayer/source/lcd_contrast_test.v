// ============================================================================
// Module: lcd_contrast_test
// Description: LCD对比度测试模块 - 确保能看到不同颜色
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_contrast_test (
    input           clk_50MHz,
    input           rst_n,
    
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs,
    output          led1,      
    output          led2
);

// 内部信号
wire    [8:0]   data;   
wire            en_write;
wire            wr_done;

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

// 状态定义
parameter IDLE = 2'b00, INIT = 2'b01, FILL = 2'b10;
reg [1:0] state;
reg [16:0] pixel_counter;
reg [8:0] test_data;
reg test_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// LCD SPI写入模块
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50MHz),
    .sys_rst_n(rst_n),
    .data(data),
    .en_write(en_write),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .wr_done(wr_done)
);

// LCD初始化模块
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_50MHz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// 状态机
always @(posedge clk_50MHz or negedge rst_n) begin    if (!rst_n) begin
        state <= INIT;
        pixel_counter <= 17'd0;
    end
    else begin
        case (state)
            INIT: begin
                if (init_done)
                    state <= FILL;
            end            FILL: begin
                if (wr_done && test_en) begin
                    pixel_counter <= pixel_counter + 17'd1;
                    if (pixel_counter >= 17'd76800) // 240*320 = 76800
                        pixel_counter <= 17'd0;
                end
            end
            default: state <= INIT;
        endcase
    end
end

// 测试图案生成
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        test_data <= 9'd0;
        test_en <= 1'b0;
    end    else if (state == FILL) begin
        test_en <= 1'b1;
        
        // 生成条纹图案
        if (pixel_counter < 17'd19200) begin // 前1/4屏幕 - 红色
            if (pixel_counter[0] == 1'b0)
                test_data <= {1'b1, 8'hF8}; // 红色高8位
            else
                test_data <= {1'b1, 8'h00}; // 红色低8位
        end
        else if (pixel_counter < 17'd38400) begin // 第2个1/4屏幕 - 绿色
            if (pixel_counter[0] == 1'b0)
                test_data <= {1'b1, 8'h07}; // 绿色高8位
            else
                test_data <= {1'b1, 8'hE0}; // 绿色低8位
        end
        else if (pixel_counter < 17'd57600) begin // 第3个1/4屏幕 - 蓝色
            if (pixel_counter[0] == 1'b0)
                test_data <= {1'b1, 8'h00}; // 蓝色高8位
            else
                test_data <= {1'b1, 8'h1F}; // 蓝色低8位
        end
        else begin // 最后1/4屏幕 - 白色
            if (pixel_counter[0] == 1'b0)
                test_data <= {1'b1, 8'hFF}; // 白色高8位
            else
                test_data <= {1'b1, 8'hFF}; // 白色低8位
        end
    end
    else begin
        test_data <= 9'd0;
        test_en <= 1'b0;
    end
end

// 数据选择
assign data = (state == INIT) ? init_data : test_data;
assign en_write = (state == INIT) ? en_write_init : test_en;

// LED状态指示
assign led1 = (state == FILL);  // 填充状态指示
assign led2 = init_done;        // 初始化完成指示

endmodule
