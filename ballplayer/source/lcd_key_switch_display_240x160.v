// ============================================================================
// Module: lcd_key_switch_display_240x160
// Description: LCD按键切换图片显示模块 - 支持5张240x160图片按键手动切换显示
// Author: GitHub Copilot
// Date: 2025-06-07
// ============================================================================

module lcd_key_switch_display_240x160 (
    input wire          clk_25MHz,      // 25MHz时钟
    input wire          rst_n,          // 复位信号
    input wire          key_switch,     // 按键切换信号（任意键按下）
    
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

// 图片切换控制 - 按键触发切换
reg [2:0] current_image; // 3位支持8张图片，使用5张 (0-4)
reg key_switch_r;        // 按键信号寄存
wire key_switch_pulse;   // 按键脉冲信号

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
    .image_id(current_image),
    .addr({2'b00, rom_addr}),   // 扩展到15位
    .data(rom_data)
);

// 计算ROM地址 - 黑白格式：8个像素打包成1字节
assign rom_addr = in_image_area ? (image_addr >> 3) : 13'h0;

// 输出状态信号
assign current_image_id = current_image;
assign display_active = (state == DISPLAY);

// 按键信号边沿检测
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        key_switch_r <= 1'b0;
    end else begin
        key_switch_r <= key_switch;
    end
end

// 产生按键脉冲信号（上升沿检测）
assign key_switch_pulse = key_switch & (~key_switch_r);

// 图片切换逻辑
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        current_image <= 3'b000;
    end else begin
        // 只在按键按下时切换图片
        if (key_switch_pulse) begin
            if (current_image >= 3'd4) begin  // 5张图片：0,1,2,3,4
                current_image <= 3'd0;        // 循环回到第0张
            end else begin
                current_image <= current_image + 1'b1;
            end
        end
    end
end

// 主状态机
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
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
                // 像素计数器逻辑
                if (wr_done) begin
                    if (pixel_counter < 18'd38399) begin // 240*160-1
                        pixel_counter <= pixel_counter + 1'b1;
                    end else begin
                        pixel_counter <= 18'h0;  // 重新开始显示（持续刷新）
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
    // 从pixel_counter计算屏幕坐标 (修复：直接按240×160计算)
    x_pos = pixel_counter % 9'd240;  // 正确的240像素宽
    y_pos = pixel_counter / 9'd240;  // 正确的240像素宽
    
    // 直接映射到240×160图片（全屏显示）
    if (x_pos < 9'd240 && y_pos < 9'd160) begin
        image_addr = y_pos * 17'd240 + x_pos;
    end else begin
        image_addr = 17'h0;
    end
end

// 判断是否在图片显示区域
assign in_image_area = (x_pos < 9'd240 && y_pos < 9'd160);

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
