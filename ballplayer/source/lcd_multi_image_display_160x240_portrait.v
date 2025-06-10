// ============================================================================
// Module: lcd_multi_image_display_160x240_portrait
// Description: LCD多图片显示模块 - 竖屏模式 160x240
// Author: GitHub Copilot  
// Date: 2025-06-10
// ============================================================================

module lcd_multi_image_display_160x240_portrait (
    input wire          clk_25MHz,      // 25MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [2:0]   current_image_id,  // 当前图片ID
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
reg [2:0] current_image; // 3位支持8张图片，使用5张

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// ROM地址和数据信号（240*160图片在竖屏显示：160*240像素，黑白格式）
wire [12:0] rom_addr;
wire [7:0] rom_data;

// 实例化多图片ROM（使用现有的240x160 ROM，但重新映射坐标）
multi_image_rom_240x160 multi_rom_inst (
    .clk(clk_25MHz),
    .image_id(current_image),
    .addr({2'b00, rom_addr}),   // 扩展到15位
    .data(rom_data)
);

// 输出状态信号
assign current_image_id = current_image;
assign display_active = (state == DISPLAY);

// 主状态机
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
        current_image <= 3'b000;
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
                // 图片切换计时
                if (image_timer >= IMAGE_SWITCH_TIME) begin
                    image_timer <= 26'h0;
                    // 循环切换到下一张图片
                    if (current_image >= 3'd4) begin
                        current_image <= 3'd0;
                    end else begin
                        current_image <= current_image + 1'b1;
                    end
                end else begin
                    image_timer <= image_timer + 1'b1;
                end
                
                // 像素计数器逻辑 - 竖屏模式：160x240 = 38400像素
                if (wr_done) begin
                    if (pixel_counter < 18'd38399) begin // 160*240-1
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

// 竖屏坐标映射：将240x160图片旋转90度显示为160x240
reg [8:0] screen_x, screen_y;  // 屏幕坐标
reg [8:0] image_x, image_y;    // 图片坐标
reg [16:0] image_addr;         // 图片地址
wire in_image_area;
wire pixel_bit;

always @(*) begin
    // 从pixel_counter计算屏幕坐标（竖屏：160x240）
    screen_x = pixel_counter % 9'd160;  // 0-159
    screen_y = pixel_counter / 9'd160;  // 0-239
    
    // 坐标旋转：将屏幕坐标映射到图片坐标
    // 原图片：240x160，现在旋转90度顺时针显示
    // 图片坐标计算：image_x = screen_y, image_y = (160-1) - screen_x
    if (screen_y < 9'd240 && screen_x < 9'd160) begin
        image_x = screen_y;                    // 0-239 映射到图片的x坐标
        image_y = 9'd159 - screen_x;          // 159-0 映射到图片的y坐标
        
        // 确保坐标在图片范围内
        if (image_x < 9'd240 && image_y < 9'd160) begin
            image_addr = image_y * 17'd240 + image_x;  // 计算图片地址
        end else begin
            image_addr = 17'h0;
        end
    end else begin
        image_addr = 17'h0;
    end
end

// 判断是否在图片显示区域
assign in_image_area = (screen_y < 9'd240 && screen_x < 9'd160 && 
                        image_x < 9'd240 && image_y < 9'd160);

// 计算ROM地址（黑白格式：8个像素打包成1字节）
assign rom_addr = in_image_area ? (image_addr >> 3) : 13'h0;

// 从ROM数据中提取单个像素位（黑白格式）
assign pixel_bit = rom_data[7 - (image_addr[2:0])];

// 输出像素数据处理 - 将黑白位转换为RGB332格式
always @(*) begin
    if (in_image_area) begin
        // 在图片区域内，将黑白位转换为RGB332格式
        if (pixel_bit) begin
            // 白色像素 -> 白色RGB332 (11111111)
            display_data = 9'h1FF;
        end else begin
            // 黑色像素 -> 黑色RGB332 (00000000)
            display_data = 9'h100;
        end
    end else begin
        // 在图片区域外，显示黑色背景
        display_data = 9'h100; // 黑色，数据模式 (dc=1)
    end
end

// 输出控制逻辑
assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

// LCD初始化模块实例化（竖屏模式）
lcd_init_portrait lcd_init_inst(
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
