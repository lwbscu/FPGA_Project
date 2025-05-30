module draw_line
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
			
parameter   CLEAR = 3'b001;     
parameter   DRAW = 3'b010;
parameter   IDLE   = 3'b100;
reg [8:0]   past_y = 9'd0;
reg [8:0]   delta;
reg [2:0]	state=IDLE;
wire [8:0] clear_data;
wire clear_finish_flag;
wire draw_finish_flag;
wire en_clear;
wire [8:0] draw_data;
wire en_draw;
reg [8:0] data;
reg en;

// 检测上升沿
wire clear_finish_pos;
wire draw_finish_pos;
edge_detect clear_edge
(
	.clk(sys_clk),
	.signal(clear_finish_flag),
	.rst_n(sys_rst_n),
	.up_edge(clear_finish_pos)
);
edge_detect draw_edge
(
	.clk(sys_clk),
	.signal(draw_finish_flag),
	.rst_n(sys_rst_n),
	.up_edge(draw_finish_pos)
);

//状态转移
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)
        state <= IDLE;
    else
        case(state)
            CLEAR : begin
				state <= (clear_finish_pos) ? DRAW : CLEAR;
			end

            DRAW : begin
                if (draw_finish_pos) begin
					past_y <= y_coord;
                    state <= IDLE;
                end
            end

            IDLE : begin
                if (draw_line_flag && (y_coord != past_y)) begin
                    state <= CLEAR;  // 仅在 draw_line_flag 有效时检测变化
				end
            end
        endcase


lcd_draw_line #(.COLOR(WHITE),.SIZE_LENGTH_MAX(3'd7)) lcd_draw_white_line_inst
(
    .sys_clk			(sys_clk    ),
    .sys_rst_n        	(sys_rst_n        ),
    .wr_done          	(wr_done      ),
    .draw_line_flag    	((state==CLEAR)), 
	.y_coord			(past_y),
	.draw_line_data    	(clear_data     ),   
	.draw_line_done    	(clear_finish_flag     ),   
    .en_write_draw_line  (en_clear )  
);	
lcd_draw_line #(.COLOR(BROWN),.SIZE_LENGTH_MAX(1'd0)) lcd_draw_brown_line_inst
(
    .sys_clk			(sys_clk    ),
    .sys_rst_n        	(sys_rst_n        ),
    .wr_done          	(wr_done      ),
    .draw_line_flag    	((state==DRAW)), 
	.y_coord			(y_coord),
	.draw_line_data    	(draw_data     ),   
	.draw_line_done    	(draw_finish_flag     ),   
    .en_write_draw_line  (en_draw )  
);
//要传输的命令或者数据
always@(posedge sys_clk or negedge sys_rst_n)
    if(!sys_rst_n)begin
			data <= 9'h000;
			en <= 1'b0;
		end
    else if(state == CLEAR) begin
			data <=  clear_data;
			en <= en_clear;
		end
    else if(state == DRAW)begin
			data <=  draw_data;
			en <= en_draw;
		end
    else begin
        data <= data;  
		en <= 1'b0;
	end

assign draw_line_data = data;
assign draw_line_done = (state == IDLE);
assign en_write_draw_line = en;
endmodule