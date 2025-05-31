// ============================================================================
// Module: lcd_simple_black_white_test
// Description: 简单的LCD黑白测试模块 - 验证基本功能
// Author: GitHub Copilot
// Date: 2025-05-31
// ============================================================================

module lcd_simple_black_white_test (
    input wire          clk_12MHz,      // 12MHz时钟输入
    input wire          rst_n,          // 复位信号
    
    // LCD控制接口
    output wire         lcd_rst,        // LCD复位
    output wire         lcd_blk,        // LCD背光
    output wire         lcd_dc,         // LCD数据/命令选择
    output wire         lcd_sclk,       // LCD SPI时钟
    output wire         lcd_mosi,       // LCD SPI数据
    output wire         lcd_cs,         // LCD片选
    
    // 状态指示
    output wire [7:0]   led             // LED指示状态
);

// PLL生成10MHz时钟（降低频率改善时序）
wire clk_10MHz;
wire pll_locked;

ballplayer_pll pll_inst(
    .inclk0(clk_12MHz),
    .c0(),                  // 24MHz输出（不使用）
    .c1(clk_10MHz),         // 修改为10MHz输出
    .locked(pll_locked)
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

// 显示坐标和计数器
reg [17:0] pixel_counter;
reg [8:0] display_data;
reg display_en;

// 背光控制 - 始终打开
assign lcd_blk = 1'b1;

// 简单的测试图案计数器
reg [25:0] pattern_timer;
reg [1:0] current_pattern;
parameter PATTERN_SWITCH_TIME = 26'd10000000; // 1秒切换 (10MHz * 1s = 10M)

// LED状态指示
assign led = {
    pll_locked,             // LED[7] - PLL锁定状态
    init_done,              // LED[6] - 初始化完成
    (state == DISPLAY),     // LED[5] - 显示状态
    1'b0,                   // LED[4] - 保留
    1'b0,                   // LED[3] - 保留  
    1'b0,                   // LED[2] - 保留
    current_pattern         // LED[1:0] - 当前图案
};

// 主状态机
always @(posedge clk_10MHz or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        pixel_counter <= 18'h0;
        display_en <= 1'b0;
        current_pattern <= 2'b00;
        pattern_timer <= 26'h0;
    end else if (pll_locked) begin  // 只有PLL锁定后才工作
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
                // 图案切换计时
                if (pattern_timer >= PATTERN_SWITCH_TIME) begin
                    pattern_timer <= 26'h0;
                    if (current_pattern >= 2'd3) begin
                        current_pattern <= 2'd0;
                    end else begin
                        current_pattern <= current_pattern + 1'b1;
                    end
                end else begin
                    pattern_timer <= pattern_timer + 1'b1;
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

// 简单的测试图案生成
reg [8:0] x_pos, y_pos;

always @(*) begin
    // 计算当前像素坐标
    x_pos = pixel_counter % 240;
    y_pos = pixel_counter / 240;
    
    // 根据当前图案生成显示数据
    case (current_pattern)
        2'd0: begin
            // 图案0：纯白色
            display_data = 9'b1_111_111_11;  // DC=1, 白色RGB332
        end
        2'd1: begin
            // 图案1：纯黑色
            display_data = 9'b1_000_000_00;  // DC=1, 黑色RGB332
        end
        2'd2: begin
            // 图案2：垂直条纹
            if (x_pos[4]) begin  // 每16像素切换
                display_data = 9'b1_111_111_11;  // 白色
            end else begin
                display_data = 9'b1_000_000_00;  // 黑色
            end
        end
        2'd3: begin
            // 图案3：水平条纹
            if (y_pos[4]) begin  // 每16像素切换
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
    .sys_clk_50MHz(clk_10MHz),   // 使用10MHz时钟
    .sys_rst_n(rst_n),
    .wr_done(wr_done),
    .lcd_rst(lcd_rst),
    .init_data(init_data),
    .en_write(en_write_init),
    .init_done(init_done)
);

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_10MHz),   // 使用10MHz时钟
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
