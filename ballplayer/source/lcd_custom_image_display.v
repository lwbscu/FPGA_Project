// ============================================================================
// Module: lcd_custom_image_display
// Description: 自定义图片显示模块 - 240×180图片居中显示，支持黑白(1位)格式
// Author: GitHub Copilot
// Date: 2025-05-30
// ============================================================================

module lcd_custom_image_display (
    input wire          clk_50MHz,      // 50MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示（反向逻辑，适配低电平点亮LED）
    output wire [2:0]   image_id_inv    // 当前图片ID（反向，3位显示）
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

// 图片切换定时器 (每2.5秒切换一次 @ 50MHz)
reg [29:0] image_timer;
parameter IMAGE_SWITCH_TIME = 30'd125000000; // 2.5秒切换间隔
reg [2:0] current_image; // 3位支持8张图片，目前只有1张

// LED输出反向逻辑（低电平点亮）
assign image_id_inv = ~current_image;

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// ROM地址信号（黑白格式：5400字节，13位地址）
wire [12:0] rom_addr;
wire [7:0] rom_data;

// 实例化图片ROM
Clever_rom clever_rom_inst (
    .clk(clk_50MHz),
    .addr(rom_addr),
    .data(rom_data)
);

// 计算ROM地址 - 黑白格式：8个像素打包成1字节
assign rom_addr = in_image_area ? (image_addr >> 3) : 13'h0;

// 主状态机
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
        current_image <= 3'b000;
        image_timer <= 30'h0;
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
                if (wr_done) begin
                    if (pixel_counter < 18'd76799) begin // 320*240-1
                        pixel_counter <= pixel_counter + 1'b1;
                    end else begin
                        pixel_counter <= 18'h0;
                        // 图片切换计时
                        if (image_timer >= IMAGE_SWITCH_TIME) begin
                            image_timer <= 30'h0;
                            current_image <= current_image; // 目前只有一张图片
                        end else begin
                            image_timer <= image_timer + 1'b1;
                        end
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

// 像素数据处理和坐标映射
reg [8:0] x_pos, y_pos;
reg [17:0] image_addr; // 18位地址，支持240×180=43200像素
wire in_image_area;
wire pixel_bit; // 单个像素位

always @(*) begin
    // 从pixel_counter计算屏幕坐标
    x_pos = pixel_counter % 9'd320;
    y_pos = pixel_counter / 9'd320;
    
    // 将屏幕坐标映射到240×180图片 - 居中显示
    // 计算居中偏移：(320-240)/2 = 40, (240-180)/2 = 30
    image_addr = 18'h0;
    
    if (x_pos >= 9'd40 && x_pos < 9'd280 && y_pos >= 8'd30 && y_pos < 8'd210) begin
        // 在图片显示区域内 (240×180像素区域)
        image_addr = (y_pos - 8'd30) * 18'd240 + (x_pos - 9'd40);
    end else begin
        image_addr = 18'h0;
    end
end

// 判断是否在图片显示区域
assign in_image_area = (x_pos >= 9'd40 && x_pos < 9'd280 && y_pos >= 8'd30 && y_pos < 8'd210);

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

// LCD初始化模块实例化
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_50MHz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50MHz),
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
