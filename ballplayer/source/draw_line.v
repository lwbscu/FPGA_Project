// ============================================================================
// Module: draw_line
// Description: LCD画线模块 - 用于绘制球和手的位置
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module draw_line (
    input       wire            sys_clk,
    input       wire            sys_rst_n,
    input       wire            wr_done,
    input       wire            draw_line_flag,
    input       wire    [8:0]   y_coord,        // Y坐标

    output      wire    [8:0]   draw_line_data,
    output      wire            draw_line_done,
    output      wire            en_write_draw_line 
);

// 颜色定义
parameter   WHITE   = 16'hFFFF,
            BLACK   = 16'h0000,
            BLUE    = 16'h001F,
            RED     = 16'hF800,
            GREEN   = 16'h07E0,
            CYAN    = 16'h7FFF,
            YELLOW  = 16'hFFE0;

// 状态定义
parameter   CLEAR = 3'b001;     
parameter   DRAW  = 3'b010;
parameter   IDLE  = 3'b100;

reg [8:0]   past_y;
reg [8:0]   delta;
reg [2:0]   state;
reg [8:0]   data;
reg         en;
reg [15:0]  counter;

// 状态转换
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        state <= IDLE;
        past_y <= 9'd0;
        delta <= 9'd0;
    end
    else if(draw_line_flag) begin
        case(state)
            IDLE: begin
                delta <= (y_coord > past_y) ? (y_coord - past_y) : (past_y - y_coord);
                state <= CLEAR;
            end
            CLEAR: begin
                if(counter >= 16'd100)  // 清除完成
                    state <= DRAW;
            end
            DRAW: begin
                if(counter >= 16'd200)  // 绘制完成
                    state <= IDLE;
            end
            default: state <= IDLE;
        endcase
    end
    else begin
        state <= IDLE;
    end
end

// 计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        counter <= 16'd0;
    else if(state == IDLE)
        counter <= 16'd0;
    else if((state == CLEAR || state == DRAW) && wr_done)
        counter <= counter + 1'b1;
end

// 更新过去的Y坐标
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        past_y <= 9'd0;
    else if(state == IDLE && draw_line_flag)
        past_y <= y_coord;
end

// 数据输出
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        data <= 9'h000;
        en <= 1'b0;
    end
    else begin
        case(state)
            CLEAR: begin
                en <= 1'b1;
                if(counter[0] == 1'b0)
                    data <= {1'b1, WHITE[15:8]};  // 白色背景高8位
                else
                    data <= {1'b1, WHITE[7:0]};   // 白色背景低8位
            end
            DRAW: begin
                en <= 1'b1;
                if(counter[0] == 1'b0)
                    data <= {1'b1, RED[15:8]};    // 红色球高8位
                else
                    data <= {1'b1, RED[7:0]};     // 红色球低8位
            end
            default: begin
                data <= 9'h000;
                en <= 1'b0;
            end
        endcase
    end
end

// 输出信号
assign draw_line_data = data;
assign en_write_draw_line = en;
assign draw_line_done = (state == IDLE && !draw_line_flag) ? 1'b1 : 1'b0;

endmodule
