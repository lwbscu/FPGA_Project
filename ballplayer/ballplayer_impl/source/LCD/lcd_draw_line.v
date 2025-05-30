module lcd_draw_line
(
    input       wire            sys_clk             ,
    input       wire            sys_rst_n           ,
    input       wire            wr_done             ,
    input       wire            draw_line_flag       ,   //显示字符标志信号

	input		wire    [8:0]   y_coord,                // 输入Y坐标

    output      wire    [8:0]   draw_line_data       ,   //传输的命令或者数据
	 output		wire			draw_line_done,
    output      wire            en_write_draw_line   
);

parameter COLOR = 16'h001F;
//****************** Parameter and Internal Signal *******************//

//画笔颜色
parameter   WHITE   = 16'hFFFF,
            BLACK   = 16'h0000,	  
            BLUE    = 16'h001F,  
            BRED    = 16'hF81F,
            GRED 	  = 16'hFFE0,
            GBLUE	  = 16'h07FF,
            RED     = 16'hF800,
            MAGENTA = 16'hF81F,
            GREEN   = 16'h07E0,
            CYAN    = 16'h7FFF,
            YELLOW  = 16'hFFE0,
            BROWN   = 16'hBC40, //棕色
            BRRED   = 16'hFC07, //棕红色
            GRAY    = 16'h8430; //灰色
			
parameter   SIZE_WIDTH_MAX = 8'd239;
parameter   SIZE_LENGTH_MAX = 1'd1;

parameter   STATE0 = 4'b0_001;     
parameter   STATE1 = 4'b0_010;
parameter   STATE2 = 4'b0_100;
parameter   DONE   = 4'b1_000;

//状态转移
reg     [3:0]   state;

//设置显示窗口
reg             the1_wr_done;
reg     [3:0]   cnt_set_windows;

//状态STATE1跳转到STATE2的标志信号
reg            state1_finish_flag;

//长度加1标志信号
reg             length_num_flag;

//点的颜色计数器
reg     [9:0]   cnt_wr_color_data;

//长度计数器
reg     [8:0]   cnt_length_num;

//要传输的命令或者数据
reg     [8:0]   data;

//状态STATE2跳转到DONE的标志信号        
wire    state2_finish_flag;

//检测 draw_line_flag 上升沿
reg             draw_line_flag_prev;  // 保存上一个时钟周期的 draw_line_flag 值
wire            draw_line_flag_rise;  // 上升沿标志信号
//******************************* Main Code **************************//

 //检测 draw_line_flag 的上升沿
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        draw_line_flag_prev <= 1'b0;
    else
        draw_line_flag_prev <= draw_line_flag;

assign draw_line_flag_rise = (~draw_line_flag_prev) & draw_line_flag;  // 上升沿检测

//状态转移
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state <= STATE0;
    else
        case(state)
            STATE0 : state <= (draw_line_flag) ? STATE1 : STATE0;
            STATE1 : state <= (state1_finish_flag) ? STATE2 : STATE1;
            STATE2 : state <= (state2_finish_flag) ? DONE : STATE2;
            DONE   : state <= (draw_line_flag_rise)?STATE0:DONE;
        endcase
		
//重要//
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n) 
        the1_wr_done <= 1'b0;
    else if(wr_done)
        the1_wr_done <= 1'b1;
    else
        the1_wr_done <= 1'b0;
        
//设置显示窗口计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)  
        cnt_set_windows <= 'd0;
    else if(state == STATE1 && the1_wr_done)
        cnt_set_windows <= cnt_set_windows + 1'b1;
    //////////////////////////////////////////////
    else if(state == DONE)
        cnt_set_windows <= 4'b0;
    //////////////////////////////////////////////

//状态STATE1跳转到STATE2的标志信号
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state1_finish_flag <= 1'b0;
    else if(cnt_set_windows == 'd10 && the1_wr_done)
        state1_finish_flag <= 1'b1;
    else
        state1_finish_flag <= 1'b0;
        
//长度加1标志信号
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        length_num_flag <= 1'b0;
   else if(
            state == STATE2 && 
            cnt_wr_color_data == 10'd479 &&
            the1_wr_done
           )
       length_num_flag <= 1'b1;
    else
       length_num_flag <= 1'b0;

//长度计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_length_num <= 'd0;
    else if(cnt_length_num < (SIZE_LENGTH_MAX<<1+1) && length_num_flag)
        cnt_length_num <= cnt_length_num + 1'b1;
    //////////////////////////////////////////////
    else if(state == DONE)
        cnt_length_num <= 8'b0;
    //////////////////////////////////////////////
//点的颜色计数器
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_wr_color_data <= 'd0;
    else if(state == DONE)
        cnt_wr_color_data <= 'd0;
    else if(state == STATE2 && the1_wr_done)
        cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
        
//要传输的命令或者数据
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        data <= 9'h000;
    else if(state == STATE1)
        case(cnt_set_windows)
            0 : data <= 9'h02A;
            1 : data <= {1'b1,8'h00};
            2 : data <= {1'b1,8'h00};
            3 : data <= {1'b1,8'h00};
            4 : data <= {1'b1,8'hEF};
            5 : data <= 9'h02B;
            6 : data <= {8'b1000_0000,y_coord[8]};
            7 : data <= {1'b1,(y_coord[7:0]-SIZE_LENGTH_MAX)};
            8 : data <= {8'b1000_0000,y_coord[8]};
            9 : data <= {1'b1,(y_coord[7:0]+SIZE_LENGTH_MAX)};
            10: data <= 9'h02C;
            default: data <= 9'h000;
        endcase
    else if(state == STATE2)
        if(cnt_wr_color_data[0] == 1'b0 )
            data <= {1'b1,COLOR[15:8]};
        else
            data <= {1'b1,COLOR[7:0]};
    else
        data <= data;   

//状态STATE2跳转到DONE的标志信号        
assign state2_finish_flag = (
                             (
                                (cnt_length_num == (SIZE_LENGTH_MAX<<1+1))         
                             ) &&
                             length_num_flag
                            ) ? 1'b1 : 1'b0;
        
//输出端口
assign draw_line_data = data;
assign en_write_draw_line = (state == STATE1 || state == STATE2)? 1'b1 : 1'b0;

reg draw_line_done_reg;
always @(posedge sys_clk or negedge sys_rst_n)
    if (!sys_rst_n)
        draw_line_done_reg <= 1'b0;
    else if (state == DONE)
        draw_line_done_reg <= 1'b1;  // 进入 DONE 时拉高
    else
        draw_line_done_reg <= 1'b0;  // 其他状态拉低

assign draw_line_done = draw_line_done_reg;
endmodule