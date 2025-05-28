// ============================================================================
// Module: lcd
// Description: LCD显示控制模块 - 移植自原始ballplayer项目
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd (
    input           clk_50mhz,     // 直接接收50MHz时钟
    input           rst_n,
    input wire [8:0] y,        // 球的Y坐标
    input wire [8:0] x,        // 手的X坐标
    
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

wire            show_pic_flag;
wire    [8:0]   show_pic_data;
wire            en_write_show_pic;
wire            show_pic_done;

wire    [8:0]   draw_line_data;
wire            en_write_draw_line;
wire            draw_line_done;
wire            draw_line_flag;

wire     [8:0]  rom_addr;
wire    [239:0] rom_q;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// LCD SPI写入模块
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50mhz),  // 直接使用输入时钟
    .sys_rst_n(rst_n),
    .data(data),
    .en_write(en_write),
    .wr_done(wr_done),
    .cs(lcd_cs),
    .dc(lcd_dc),
    .sclk(lcd_sclk),
    .mosi(lcd_mosi)
);

// LCD控制协调模块
control control_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .init_data(init_data),
    .en_write_init(en_write_init),
    .init_done(init_done),
    .show_pic_data(show_pic_data),
    .en_write_show_pic(en_write_show_pic),
    .show_pic_done(show_pic_done),
    .draw_line_data(draw_line_data),
    .en_write_draw_line(en_write_draw_line),
    .draw_line_done(draw_line_done),
    .show_pic_flag(show_pic_flag),
    .draw_line_flag(draw_line_flag),
    .data(data),
    .en_write(en_write),
    .led(led1)
);

// LCD初始化模块
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// LCD背景图片显示模块
lcd_show_pic lcd_show_pic_inst(
    .sys_clk(clk_50mhz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .show_pic_flag(show_pic_flag),
    .rom_addr(rom_addr),
    .rom_q(rom_q),
    .show_pic_data(show_pic_data),
    .show_pic_done(show_pic_done),
    .en_write_show_pic(en_write_show_pic)
);

// 画线模块 - 用于绘制球和手的位置
draw_line lcd_draw_line_inst(
    .sys_clk(clk_50mhz),
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .draw_line_flag(draw_line_flag),
    .y_coord(x),                    // 使用手的X坐标
    .draw_line_data(draw_line_data),
    .draw_line_done(draw_line_done),
    .en_write_draw_line(en_write_draw_line)
);

// 图片RAM - 存储背景图像数据
pic_ram pic_ram_inst(
    .address(rom_addr),
    .q(rom_q),
    .offset(y)                      // 使用球的Y坐标作为偏移
);

// 状态指示
assign led2 = init_done;

endmodule
