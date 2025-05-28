// ============================================================================
// Module: lcd_show_pic
// Description: LCD背景图片显示模块 - 简化版本适配ballplayer项目
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module lcd_show_pic (
    input       wire            sys_clk,
    input       wire            sys_rst_n,
    input       wire            wr_done,
    input       wire            show_pic_flag,

    output      reg     [8:0]   rom_addr,
    input       wire    [239:0] rom_q,

    output      wire    [8:0]   show_pic_data,
    output      wire            show_pic_done,
    output      wire            en_write_show_pic   
);

// 颜色定义
parameter   WHITE   = 16'hFFFF,
            BLACK   = 16'h0000,
            BLUE    = 16'h001F,
            RED     = 16'hF800,
            GREEN   = 16'h07E0,
            CYAN    = 16'h7FFF,
            YELLOW  = 16'hFFE0;

// LCD尺寸参数
parameter   SIZE_WIDTH_MAX = 8'd239;
parameter   SIZE_LENGTH_MAX = 9'd319;

// 状态定义
parameter   STATE0 = 4'b0001;     // 初始状态
parameter   STATE1 = 4'b0010;     // 设置窗口
parameter   STATE2 = 4'b0100;     // 写入图片数据
parameter   DONE   = 4'b1000;     // 完成

reg     [3:0]   state;
reg     [3:0]   cnt_set_windows;
reg             state1_finish_flag;
wire            state2_finish_flag;     // 声明state2_finish_flag信号
reg     [2:0]   cnt_rom_prepare;
reg     [239:0] temp;
reg             length_num_flag;
reg     [8:0]   cnt_length_num;
reg     [9:0]   cnt_wr_color_data;
reg     [8:0]   data;

// 状态转换
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        state <= STATE0;
    else if(show_pic_flag)
        case(state)
            STATE0: state <= STATE1;
            STATE1: state <= (state1_finish_flag) ? STATE2 : STATE1;
            STATE2: state <= (state2_finish_flag) ? DONE : STATE2;
            DONE: state <= STATE0;
            default: state <= STATE0;
        endcase
    else
        state <= STATE0;
end

// 设置窗口计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_set_windows <= 4'd0;
    else if(state == STATE1 && wr_done)
        cnt_set_windows <= cnt_set_windows + 1'b1;
    else if(state != STATE1)
        cnt_set_windows <= 4'd0;
end

// STATE1完成标志
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        state1_finish_flag <= 1'b0;
    else if(cnt_set_windows == 4'd10 && wr_done)
        state1_finish_flag <= 1'b1;
    else
        state1_finish_flag <= 1'b0;
end

// ROM准备计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)  
        cnt_rom_prepare <= 3'd0;
    else if(length_num_flag)
        cnt_rom_prepare <= 3'd0;
    else if(state == STATE2 && cnt_rom_prepare < 3'd5)
        cnt_rom_prepare <= cnt_rom_prepare + 1'b1;
end

// ROM地址
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        rom_addr <= 9'd0;
    else if(cnt_rom_prepare == 3'd1)      
        rom_addr <= cnt_length_num;
end

// ROM数据移位处理
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        temp <= 240'd0;
    else if(cnt_rom_prepare == 3'd3)
        temp <= rom_q;
    else if(state == STATE2 && wr_done) begin
        if(cnt_wr_color_data[0] == 1'b1)
            temp <= temp >> 1;
    end
end

// 长度增加标志
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        length_num_flag <= 1'b0;
   else if(state == STATE2 && 
            cnt_wr_color_data == 10'd479 &&
            wr_done)
       length_num_flag <= 1'b1;
    else
       length_num_flag <= 1'b0;
end
        
// 长度计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_length_num <= 9'd0;
    else if(cnt_length_num < SIZE_LENGTH_MAX && length_num_flag)
        cnt_length_num <= cnt_length_num + 1'b1;
end

// 颜色数据计数器
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_wr_color_data <= 10'd0;
    else if(cnt_rom_prepare == 3'd3 || state == DONE)
        cnt_wr_color_data <= 10'd0;
    else if(state == STATE2 && wr_done)
        cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
end
        
// 要传输的命令或者数据
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        data <= 9'h000;
    else if(state == STATE1)
        case(cnt_set_windows)
            0 : data <= 9'h02A;
            1 : data <= {1'b1,8'h00};
            2 : data <= {1'b1,8'h00};
            3 : data <= {1'b1,8'h00};
            4 : data <= {1'b1,8'hef};
            5 : data <= 9'h02B;
            6 : data <= {1'b1,8'h00};
            7 : data <= {1'b1,8'h00};
            8 : data <= {1'b1,8'h01};
            9 : data <= {1'b1,8'h3f};
            10: data <= 9'h02C;
            default: data <= 9'h000;
        endcase
    else if(state == STATE2 && ((temp & 1'b1) == 1'b0)) begin
        if(cnt_wr_color_data[0] == 1'b0)
            data <= {1'b1,WHITE[15:8]};
        else
            data <= {1'b1,WHITE[7:0]};
    end
    else if(state == STATE2 && ((temp & 1'b1) == 1'b1)) begin
        if(cnt_wr_color_data[0] == 1'b0)
            data <= {1'b1,BLACK[15:8]};
        else
            data <= {1'b1,BLACK[7:0]};
    end
    else
        data <= 9'h000;
end

// STATE2完成标志
assign state2_finish_flag = (cnt_length_num == SIZE_LENGTH_MAX) ? 1'b1 : 1'b0;

// 输出信号
assign show_pic_data = data;
assign en_write_show_pic = (state == STATE1 || state == STATE2) ? 1'b1 : 1'b0;
assign show_pic_done = (state == DONE) ? 1'b1 : 1'b0;

endmodule
