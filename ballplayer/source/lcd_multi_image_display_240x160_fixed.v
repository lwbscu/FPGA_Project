// ============================================================================
// Module: lcd_multi_image_display_240x160_fixed
// Description: LCD多图片显示模块 - 支持2张240x160图片每2秒循环显示
// Author: GitHub Copilot
// Date: 2025-05-31
// ============================================================================

module lcd_multi_image_display_240x160_fixed (
    input wire          clk_25MHz,      // 25MHz时钟（降低频率以改善时序）
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [1:0]   current_image_id,  // 当前图片ID (2位支持4张图片)
    output wire         display_active      // 显示活动指示
);

// 内部信号
wire    [8:0]   data;   
wire            en_write;
wire            wr_done;

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

// 状态定义
parameter IDLE = 2'b00, INIT = 2'b01, DISPLAY = 2'b10;
reg [1:0] state;

// 图片切换定时器 (每2秒切换一次 @ 25MHz)
reg [25:0] image_timer;
parameter IMAGE_SWITCH_TIME = 26'd50000000; // 2秒切换间隔 (25MHz * 2s = 50M)
reg [1:0] current_image; // 2位支持4张图片，使用2张

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// ROM地址和数据信号（黑白格式：240*160/8 = 4800字节，13位地址）
wire [12:0] rom_addr;
wire [7:0] rom_data;

// 实例化多图片ROM
multi_image_rom_240x160 multi_rom_inst (
    .clk(clk_25MHz),
    .image_id(current_image),           // 直接使用2位current_image
    .addr({2'b00, rom_addr}),           // 扩展到15位
    .data(rom_data)
);

// 计算ROM地址 - 黑白格式：8个像素打包成1字节
// 确保地址计算正确，避免截断
wire [16:0] byte_addr;
assign byte_addr = image_addr >> 3;  // 除以8得到字节地址
assign rom_addr = byte_addr[12:0];   // 取低13位作为ROM地址

// 输出状态信号
assign current_image_id = current_image;
assign display_active = (state == DISPLAY);

// 主状态机
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
        current_image <= 2'b00;
        image_timer <= 26'h0;
    end else begin
        case (state)
            IDLE: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'h0;
                    display_en <= 1'b1;
                end else begin
                    state <= INIT;
                end
            end
            
            INIT: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'h0;
                    display_en <= 1'b1;
                end
            end
            
            DISPLAY: begin
                // 图片切换计时 - 每个时钟周期都计时
                if (image_timer >= IMAGE_SWITCH_TIME) begin
                    image_timer <= 26'h0;
                    // 在2张图片之间循环切换
                    if (current_image >= 2'd1) begin
                        current_image <= 2'd0;
                    end else begin
                        current_image <= current_image + 1'b1;
                    end
                end else begin
                    image_timer <= image_timer + 1'b1;
                end
                
                // 像素计数器逻辑
                if (wr_done) begin
                    if (pixel_counter < 18'd38399) begin // 240*160-1 = 38399
                        pixel_counter <= pixel_counter + 1'b1;
                    end else begin
                        pixel_counter <= 18'h0;
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

// 像素数据处理和坐标映射
reg [8:0] x_pos, y_pos;
reg [16:0] image_addr; // 17位地址，支持240×160=38400像素
wire in_image_area;
wire pixel_bit; // 单个像素位

always @(*) begin
    // 从pixel_counter计算屏幕坐标 (240x160分辨率)
    x_pos = pixel_counter % 240;  // 使用常数240避免位宽问题
    y_pos = pixel_counter / 240;  // 使用常数240避免位宽问题
    
    // 直接使用240×160分辨率
    if (x_pos < 240 && y_pos < 160) begin
        // 在图片显示区域内 (240×160像素区域)
        image_addr = y_pos * 240 + x_pos;  // 使用常数避免位宽问题
    end else begin
        image_addr = 17'h0;
    end
end

// 判断是否在图片显示区域
assign in_image_area = (x_pos < 240 && y_pos < 160);

// 从ROM数据中提取单个像素位（黑白格式）
// 注意：修正位顺序，通常MSB在左
assign pixel_bit = rom_data[image_addr[2:0]];

// 输出像素数据处理 - 将黑白位转换为RGB332格式
always @(*) begin
    if (in_image_area) begin
        // 在图片区域内，将黑白位转换为RGB332格式
        if (pixel_bit) begin
            // 白色像素 -> 白色RGB332: DC=1, R=111, G=111, B=11
            display_data = 9'b1_111_111_11;  // 0x1FF
        end else begin
            // 黑色像素 -> 黑色RGB332: DC=1, R=000, G=000, B=00  
            display_data = 9'b1_000_000_00;  // 0x100
        end
    end else begin
        // 在图片区域外，显示黑色背景
        display_data = 9'b1_000_000_00; // 黑色，数据模式 (dc=1)
    end
end

// 输出控制逻辑
assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// LCD初始化模块实例化
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_25MHz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_25MHz),
    .sys_rst_n(rst_n),
    .data(data),
    .en_write(en_write),
    .wr_done(wr_done),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi)
);

endmodule
