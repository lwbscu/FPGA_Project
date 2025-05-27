// --------------------------------------------------------------------
// Module: lcd_spectrum_display
// Description: LCD显示频谱图和系统信息
// --------------------------------------------------------------------
module lcd_spectrum_display(
    input           clk,
    input           rst_n,
    input   [63:0]  spectrum_data_flat,  // 平坦化的频谱数据
    input   [15:0]  db_value,
    input   [3:0]   current_mode,
    
    output          lcd_rst,
    output          lcd_blk,
    output          lcd_dc,
    output          lcd_sclk,
    output          lcd_mosi,
    output          lcd_cs
);

// 从平坦化数组恢复
wire [7:0] spectrum_data [0:7];
genvar k;
generate
    for (k = 0; k < 8; k = k + 1) begin : unflatten
        assign spectrum_data[k] = spectrum_data_flat[k*8 +: 8];
    end
endgenerate

// LCD参数
parameter LCD_WIDTH = 240;
parameter LCD_HEIGHT = 320;

// 内部信号
wire        clk_50mhz;
wire [8:0]  lcd_data;
wire        lcd_en_write;
wire        lcd_wr_done;
wire        lcd_init_done;
reg  [8:0]  display_data;
reg         display_en;
reg  [16:0] pixel_counter;
reg  [8:0]  x_pos;
reg  [8:0]  y_pos;

// PLL生成50MHz时钟
pll pll_lcd(
    .inclk0(clk),
    .c0(clk_50mhz)
);

// LCD写入控制
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .data(display_data),
    .en_write(display_en),
    .wr_done(lcd_wr_done),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi)
);

// 显示状态机
localparam DISP_IDLE = 3'd0;
localparam DISP_CLEAR = 3'd1;
localparam DISP_SPECTRUM = 3'd2;
localparam DISP_INFO = 3'd3;
localparam DISP_UPDATE = 3'd4;

reg [2:0]  disp_state;
reg [23:0] update_counter;

always @(posedge clk_50mhz or negedge rst_n) begin
    if (!rst_n) begin
        disp_state <= DISP_IDLE;
        pixel_counter <= 17'd0;
        x_pos <= 9'd0;
        y_pos <= 9'd0;
        display_data <= 9'd0;
        display_en <= 1'b0;
        update_counter <= 24'd0;
    end else begin
        case (disp_state)
            DISP_IDLE: begin
                if (lcd_init_done) begin
                    disp_state <= DISP_CLEAR;
                end
            end
            
            DISP_CLEAR: begin
                // 清屏
                if (pixel_counter < LCD_WIDTH * LCD_HEIGHT) begin
                    display_data <= 9'h1FF;  // 白色背景
                    display_en <= 1'b1;
                    if (lcd_wr_done) begin
                        pixel_counter <= pixel_counter + 1'b1;
                        display_en <= 1'b0;
                    end
                end else begin
                    pixel_counter <= 17'd0;
                    disp_state <= DISP_SPECTRUM;
                end
            end
            
            DISP_SPECTRUM: begin
                // 绘制频谱柱状图
                // 每个频段宽度30像素，高度根据spectrum_data
                if (x_pos < 8) begin
                    // 计算当前柱的高度
                    reg [8:0] bar_height;
                    bar_height = spectrum_data[x_pos[2:0]];
                    
                    // 绘制柱状图
                    if (y_pos < bar_height) begin
                        // 彩色频谱
                        case (x_pos[2:0])
                            3'd0: display_data <= 9'h1F0;  // 红色
                            3'd1: display_data <= 9'h1E3;  // 橙色
                            3'd2: display_data <= 9'h1E0;  // 黄色
                            3'd3: display_data <= 9'h0F0;  // 绿色
                            3'd4: display_data <= 9'h0F8;  // 青色
                            3'd5: display_data <= 9'h01F;  // 蓝色
                            3'd6: display_data <= 9'h11F;  // 紫色
                            3'd7: display_data <= 9'h10F;  // 品红
                        endcase
                    end else begin
                        display_data <= 9'h1FF;  // 背景色
                    end
                    
                    display_en <= 1'b1;
                    if (lcd_wr_done) begin
                        display_en <= 1'b0;
                        if (y_pos >= LCD_HEIGHT - 1) begin
                            y_pos <= 9'd0;
                            x_pos <= x_pos + 1'b1;
                        end else begin
                            y_pos <= y_pos + 1'b1;
                        end
                    end
                end else begin
                    x_pos <= 9'd0;
                    y_pos <= 9'd0;
                    disp_state <= DISP_INFO;
                end
            end
            
            DISP_INFO: begin
                // 显示系统信息（简化处理）
                disp_state <= DISP_UPDATE;
            end
            
            DISP_UPDATE: begin
                // 等待下次更新
                if (update_counter >= 24'd600000) begin  // 50ms更新一次
                    update_counter <= 24'd0;
                    disp_state <= DISP_SPECTRUM;
                end else begin
                    update_counter <= update_counter + 1'b1;
                end
            end
        endcase
    end
end

assign lcd_blk = 1'b1;
assign lcd_rst = rst_n;

endmodule