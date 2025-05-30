// ============================================================================
// Module: control
// Description: LCD控制协调模块 - 移植自原始ballplayer项目
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module control (
    input   wire             sys_clk_50MHz,
    input   wire             sys_rst_n,
    input   wire     [8:0]   init_data,
    input   wire             en_write_init,
    input   wire             init_done,
    input   wire     [8:0]   show_pic_data,
    input   wire             en_write_show_pic,
    input   wire             show_pic_done,
    input   wire     [8:0]   draw_line_data,
    input   wire             en_write_draw_line,
    input   wire             draw_line_done,
    
    output  reg              show_pic_flag,
    output  reg              draw_line_flag,
    output  reg      [8:0]   data,
    output  reg              en_write,
    output  reg              led
);

// 状态定义
parameter   IDLE        = 3'b000,
            INIT        = 3'b001,
            SHOW_PIC    = 3'b010,
            DRAW_LINE   = 3'b100;

reg [2:0]   state;
reg [3:0]   draw_line_counter;
reg [3:0]   show_pic_counter;

// 状态转换逻辑
always@(posedge sys_clk_50MHz or negedge sys_rst_n) begin
    if(!sys_rst_n)
        state <= INIT; // 复位后直接进入 INIT
    else
        case(state)            IDLE : 
                // 如果初始化未完成，进入初始化状态
                // 如果初始化完成，则开始显示循环
                if (!init_done)
                    state <= INIT;
                else 
                    state <= SHOW_PIC; // 持续循环显示

            INIT :
                // 初始化完成后转到 SHOW_PIC
                if (init_done)
                    state <= SHOW_PIC;
                else
                    state <= INIT;

            SHOW_PIC : 
                // 图片显示完成后转到 DRAW_LINE
                if (show_pic_done)
                    state <= DRAW_LINE;
                else
                    state <= SHOW_PIC;            DRAW_LINE : 
                // 画线完成后返回 SHOW_PIC，形成持续刷新循环
                if (draw_line_done)
                    state <= SHOW_PIC; // 循环刷新，而不是回到IDLE
                else
                    state <= DRAW_LINE;

            default : 
                state <= IDLE;
        endcase
end

// 计数器逻辑
always@(posedge sys_clk_50MHz or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        draw_line_counter <= 0;
        show_pic_counter <= 0;
    end
    else
        case(state)
            SHOW_PIC: begin
                draw_line_counter <= 0;
                if (show_pic_counter < 4'b1111)
                    show_pic_counter <= show_pic_counter + 1;
                else
                    show_pic_counter <= show_pic_counter;
            end
            DRAW_LINE: begin
                show_pic_counter <= 0;
                if (draw_line_counter < 4'b1111)
                    draw_line_counter <= draw_line_counter + 1;
                else
                    draw_line_counter <= draw_line_counter;
            end
            default: begin
                draw_line_counter <= 0;
                show_pic_counter <= 0;
            end
        endcase
end

// 输出逻辑
always@(*) begin
    case(state)
        INIT : begin
            led = 1;
            data = init_data;
            en_write = en_write_init;
            show_pic_flag = 1'b0;
            draw_line_flag = 1'b0;
        end

        SHOW_PIC : begin
            led = 1;
            data = show_pic_data;
            en_write = en_write_show_pic;
            show_pic_flag = (show_pic_counter < 4'b0111) ? 1'b1 : 1'b0;
            draw_line_flag = 1'b0;
        end

        DRAW_LINE : begin
            led = 0;
            data = draw_line_data;
            en_write = en_write_draw_line;
            show_pic_flag = 1'b0;
            draw_line_flag = (draw_line_counter < 4'b0111) ? 1'b1 : 1'b0;
        end

        default : begin
            led = 1;
            data = 9'd0;
            en_write = 1'b0;
            show_pic_flag = 1'b0;
            draw_line_flag = 1'b0;
        end
    endcase
end

endmodule
