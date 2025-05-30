module lcd_draw_line
(
    input       wire            sys_clk             ,
    input       wire            sys_rst_n           ,
    input       wire            wr_done             ,
    input       wire            draw_line_flag       ,   //��ʾ�ַ���־�ź�

	input		wire    [8:0]   y_coord,                // ����Y����

    output      wire    [8:0]   draw_line_data       ,   //����������������
	 output		wire			draw_line_done,
    output      wire            en_write_draw_line   
);

parameter COLOR = 16'h001F;
//****************** Parameter and Internal Signal *******************//

//������ɫ
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
            BROWN   = 16'hBC40, //��ɫ
            BRRED   = 16'hFC07, //�غ�ɫ
            GRAY    = 16'h8430; //��ɫ
			
parameter   SIZE_WIDTH_MAX = 8'd239;
parameter   SIZE_LENGTH_MAX = 1'd1;

parameter   STATE0 = 4'b0_001;     
parameter   STATE1 = 4'b0_010;
parameter   STATE2 = 4'b0_100;
parameter   DONE   = 4'b1_000;

//״̬ת��
reg     [3:0]   state;

//������ʾ����
reg             the1_wr_done;
reg     [3:0]   cnt_set_windows;

//״̬STATE1��ת��STATE2�ı�־�ź�
reg            state1_finish_flag;

//���ȼ�1��־�ź�
reg             length_num_flag;

//�����ɫ������
reg     [9:0]   cnt_wr_color_data;

//���ȼ�����
reg     [8:0]   cnt_length_num;

//Ҫ����������������
reg     [8:0]   data;

//״̬STATE2��ת��DONE�ı�־�ź�        
wire    state2_finish_flag;

//��� draw_line_flag ������
reg             draw_line_flag_prev;  // ������һ��ʱ�����ڵ� draw_line_flag ֵ
wire            draw_line_flag_rise;  // �����ر�־�ź�
//******************************* Main Code **************************//

 //��� draw_line_flag ��������
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        draw_line_flag_prev <= 1'b0;
    else
        draw_line_flag_prev <= draw_line_flag;

assign draw_line_flag_rise = (~draw_line_flag_prev) & draw_line_flag;  // �����ؼ��

//״̬ת��
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
		
//��Ҫ//
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n) 
        the1_wr_done <= 1'b0;
    else if(wr_done)
        the1_wr_done <= 1'b1;
    else
        the1_wr_done <= 1'b0;
        
//������ʾ���ڼ�����
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)  
        cnt_set_windows <= 'd0;
    else if(state == STATE1 && the1_wr_done)
        cnt_set_windows <= cnt_set_windows + 1'b1;
    //////////////////////////////////////////////
    else if(state == DONE)
        cnt_set_windows <= 4'b0;
    //////////////////////////////////////////////

//״̬STATE1��ת��STATE2�ı�־�ź�
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state1_finish_flag <= 1'b0;
    else if(cnt_set_windows == 'd10 && the1_wr_done)
        state1_finish_flag <= 1'b1;
    else
        state1_finish_flag <= 1'b0;
        
//���ȼ�1��־�ź�
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

//���ȼ�����
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_length_num <= 'd0;
    else if(cnt_length_num < (SIZE_LENGTH_MAX<<1+1) && length_num_flag)
        cnt_length_num <= cnt_length_num + 1'b1;
    //////////////////////////////////////////////
    else if(state == DONE)
        cnt_length_num <= 8'b0;
    //////////////////////////////////////////////
//�����ɫ������
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        cnt_wr_color_data <= 'd0;
    else if(state == DONE)
        cnt_wr_color_data <= 'd0;
    else if(state == STATE2 && the1_wr_done)
        cnt_wr_color_data <= cnt_wr_color_data + 1'b1;
        
//Ҫ����������������
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

//״̬STATE2��ת��DONE�ı�־�ź�        
assign state2_finish_flag = (
                             (
                                (cnt_length_num == (SIZE_LENGTH_MAX<<1+1))         
                             ) &&
                             length_num_flag
                            ) ? 1'b1 : 1'b0;
        
//����˿�
assign draw_line_data = data;
assign en_write_draw_line = (state == STATE1 || state == STATE2)? 1'b1 : 1'b0;

reg draw_line_done_reg;
always @(posedge sys_clk or negedge sys_rst_n)
    if (!sys_rst_n)
        draw_line_done_reg <= 1'b0;
    else if (state == DONE)
        draw_line_done_reg <= 1'b1;  // ���� DONE ʱ����
    else
        draw_line_done_reg <= 1'b0;  // ����״̬����

assign draw_line_done = draw_line_done_reg;
endmodule