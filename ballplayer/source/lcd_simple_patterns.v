// ============================================================================
// Module: lcd_simple_patterns
// Description: 超简化的LCD图案显示 - 专为调试设计
// Author: GitHub Copilot
// Date: 2025-05-29
// ============================================================================

module lcd_simple_patterns (
    input wire          clk_50MHz,      // 50MHz时钟
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [2:0]   pattern_id      // 当前图案ID
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

// 图案切换定时器 (每3秒切换一次 @ 50MHz)
reg [26:0] pattern_timer;  // 27位寄存器
parameter PATTERN_SWITCH_TIME = 27'd150000000; // 3秒 (150M < 2^27)

// 图案选择 (4种简单图案)
reg [1:0] current_pattern;
assign pattern_id = {1'b0, current_pattern};

// 显示坐标和计数器
reg [17:0] pixel_counter;  // 18位计数器，足够240*320*2
reg [8:0] display_data;
reg display_en;

// 简化的坐标计算 - 移除复杂运算
// wire in_center_area = (pixel_counter >= 18'd38400 && pixel_counter <= 18'd115200); // 中心区域
// wire in_left_half = (pixel_counter[0] == 1'b0) ? (pixel_counter[17:1] % 240 < 120) : 
//                     ((pixel_counter[17:1] + 1) % 240 < 120);

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

// 主状态机
always @(posedge clk_50MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= INIT;
        pixel_counter <= 18'd0;
        pattern_timer <= 28'd0;
        current_pattern <= 2'd0;
    end
    else begin
        case (state)
            INIT: begin
                if (init_done) begin
                    state <= DISPLAY;
                    pixel_counter <= 18'd0;
                end
            end
            
            DISPLAY: begin
                if (wr_done && display_en) begin
                    pixel_counter <= pixel_counter + 18'd1;
                    if (pixel_counter >= 18'd153599) begin // 240*320*2 - 1
                        pixel_counter <= 18'd0;
                        
                        // 图案切换定时器
                        pattern_timer <= pattern_timer + 28'd1;
                        if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                            pattern_timer <= 28'd0;
                            current_pattern <= current_pattern + 2'd1;
                        end
                    end
                end
            end
            
            default: state <= INIT;
        endcase
    end
end

// 数据输出控制
always @(*) begin
    if (state == INIT) begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
    else if (state == DISPLAY) begin
        display_en = 1'b1;
        
        // 超简化的图案生成
        case (current_pattern)
            2'd0: begin // 全红色
                if (pixel_counter[0] == 1'b0) begin
                    display_data = 9'h1F8; // 红色高8位
                end else begin
                    display_data = 9'h100; // 红色低8位
                end
            end
            
            2'd1: begin // 全绿色
                if (pixel_counter[0] == 1'b0) begin
                    display_data = 9'h107; // 绿色高8位
                end else begin
                    display_data = 9'h1E0; // 绿色低8位
                end
            end
            
            2'd2: begin // 全蓝色
                if (pixel_counter[0] == 1'b0) begin
                    display_data = 9'h100; // 蓝色高8位
                end else begin
                    display_data = 9'h11F; // 蓝色低8位
                end
            end
            
            2'd3: begin // 全白色
                if (pixel_counter[0] == 1'b0) begin
                    display_data = 9'h1FF; // 白色高8位
                end else begin
                    display_data = 9'h1FF; // 白色低8位
                end
            end
            
            default: begin
                display_data = 9'h100; // 默认黑色
            end
        endcase
    end
    else begin
        display_en = 1'b0;
        display_data = 9'h000;
    end
end

assign data = (state == INIT) ? init_data : display_data;
assign en_write = (state == INIT) ? en_write_init : display_en;

endmodule
