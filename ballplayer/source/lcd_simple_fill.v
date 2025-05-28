// ============================================================================
// Module: lcd_simple_fill
// Description: 简化的LCD填充显示模块 - 直接填充白色背景
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_simple_fill (
    input           clk_50mhz,
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

// 简化的状态机
reg [2:0] state;
reg [23:0] counter;
reg [15:0] pixel_counter;

parameter INIT_WAIT = 3'b000;
parameter FILL_WHITE = 3'b001;
parameter FILL_RED = 3'b010;
parameter DONE = 3'b011;

// 颜色定义
parameter WHITE = 16'hFFFF;
parameter RED   = 16'hF800;

// 内部信号
wire [8:0] data_to_send;
wire en_write_signal;
wire wr_done;

// 背光常开
assign lcd_blk = 1'b1;

// 简单的填充状态机
always @(posedge clk_50mhz or negedge rst_n) begin
    if (!rst_n) begin
        state <= INIT_WAIT;
        counter <= 0;
        pixel_counter <= 0;
    end
    else begin
        case (state)
            INIT_WAIT: begin
                counter <= counter + 1;
                if (counter == 24'h500000) begin // 等待初始化
                    state <= FILL_WHITE;
                    counter <= 0;
                end
            end
            
            FILL_WHITE: begin
                if (wr_done) begin
                    pixel_counter <= pixel_counter + 1;
                    if (pixel_counter == 16'h9600) begin // 240*320/2
                        state <= FILL_RED;
                        pixel_counter <= 0;
                        counter <= 0;
                    end
                end
            end
            
            FILL_RED: begin
                counter <= counter + 1;
                if (counter == 24'h500000) begin
                    state <= FILL_WHITE;
                    counter <= 0;
                end
            end
            
            default: state <= INIT_WAIT;
        endcase
    end
end

// 数据生成
assign data_to_send = (state == FILL_WHITE) ? 
                     (pixel_counter[0] ? {1'b1, WHITE[7:0]} : {1'b1, WHITE[15:8]}) :
                     (state == FILL_RED) ? 
                     (pixel_counter[0] ? {1'b1, RED[7:0]} : {1'b1, RED[15:8]}) :
                     9'h000;

assign en_write_signal = (state == FILL_WHITE || state == FILL_RED);

// LED指示
assign led1 = (state != INIT_WAIT);  // 工作指示
assign led2 = 1'b1;                  // 常亮表示模块运行

// LCD写入模块实例化
lcd_write lcd_write_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .data(data_to_send),
    .en_write(en_write_signal),
    .wr_done(wr_done),
    .cs(lcd_cs),
    .sclk(lcd_sclk),
    .dc(lcd_dc),
    .mosi(lcd_mosi)
);

// LCD初始化模块实例化
lcd_init lcd_init_inst(
    .sys_clk_50MHz(clk_50mhz),
    .sys_rst_n(rst_n),
    .wr_done(1'b1),  // 简化
    .lcd_rst(lcd_rst),
    .init_data(),    // 不使用
    .en_write(),     // 不使用
    .init_done()     // 不使用
);

endmodule
