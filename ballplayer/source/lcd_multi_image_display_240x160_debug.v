// ============================================================================
// Module: lcd_multi_image_display_240x160_debug
// Description: 调试版本 - 显示固定的白色像素来测试LCD基本功能
// Author: GitHub Copilot
// Date: 2025-05-31
// ============================================================================

module lcd_multi_image_display_240x160_debug (
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
    output wire [1:0]   current_image_id,  // 当前图片ID
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

// 简单的测试模式计时器
reg [26:0] test_timer;
parameter TEST_SWITCH_TIME = 27'd25000000; // 1秒切换 (25MHz * 1s = 25M)
reg [1:0] test_mode; // 测试模式：0=全黑, 1=全白, 2=条纹, 3=棋盘

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// 输出状态信号
assign current_image_id = test_mode[1:0];
assign display_active = (state == DISPLAY);

// 主状态机
always @(posedge clk_25MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
        test_mode <= 2'b00;
        test_timer <= 27'h0;
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
                // 测试模式切换计时
                if (test_timer >= TEST_SWITCH_TIME) begin
                    test_timer <= 27'h0;
                    if (test_mode >= 2'd3) begin
                        test_mode <= 2'd0;
                    end else begin
                        test_mode <= test_mode + 1'b1;
                    end
                end else begin
                    test_timer <= test_timer + 1'b1;
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

// 像素坐标计算
reg [8:0] x_pos, y_pos;

always @(*) begin
    // 从pixel_counter计算屏幕坐标 (240x160分辨率)
    x_pos = pixel_counter % 240;
    y_pos = pixel_counter / 240;
end

// 测试图案生成
always @(*) begin
    case (test_mode)
        2'd0: begin
            // 模式0：全黑色
            display_data = 9'b1_000_000_00;  // DC=1, 黑色RGB332
        end
        2'd1: begin
            // 模式1：全白色
            display_data = 9'b1_111_111_11;  // DC=1, 白色RGB332
        end
        2'd2: begin
            // 模式2：垂直条纹 (每16像素切换)
            if (x_pos[4]) begin
                display_data = 9'b1_111_111_11;  // 白色
            end else begin
                display_data = 9'b1_000_000_00;  // 黑色
            end
        end
        2'd3: begin
            // 模式3：水平条纹 (每16像素切换)
            if (y_pos[4]) begin
                display_data = 9'b1_111_111_11;  // 白色
            end else begin
                display_data = 9'b1_000_000_00;  // 黑色
            end
        end
    endcase
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
