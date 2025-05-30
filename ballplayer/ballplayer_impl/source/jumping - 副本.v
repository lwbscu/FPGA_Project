module jumping
(
	input wire clk,//12MHz时钟信号
	input	wire rst,//复位信号
	output reg [8:0] pic_y,//小球纵坐标
	
	input wire [8:0] handline,//拍球的手对应位置
	input wire [7:0] hand_velocity,//手的速度
	
	input wire [1:0] k, // 反弹系数
	input wire ball_release_button,//放球键
	input wire [8:0] home, //放球位置
	
	output reg [1:0] beep_flag,//短促鸣叫和游戏结束
	output reg stop_flag=0,//停止标志位
	input wire over_flag//倒计时停止标志位
	//,output reg led
);

wire reset = ball_release_button && rst;//放球标志位

wire clk_out;//分频后的时钟，18.2ms
parameter N=219089;//分频系数
parameter WIDTH=24;//计数器的位数
fre_div #(.WIDTH(WIDTH),.N(N)) fre_500us
(
	clk,//输入12M时钟信号
	rst,//复位
	clk_out//输出分频后的时钟
);

//状态常量，复位，下落，弹起
parameter DOWN=2'b00,UP=2'b01;
//当前状态和下一状态
reg [1:0] current_state=DOWN;

parameter MAX_Y = 9'd309;//液晶屏像素高度
reg [14:0] time_count_down=0,time_count_up=0,time_count_r=0;//时间计数器,上一时间寄存器
reg [8:0] init_position=0,position=0;//初始位置寄存器和位置寄存器
reg [10:0] init_velocity = 0;
reg [5:0] beep_count;//蜂鸣器拉低计时

reg [8:0] handline_sync1, handline_sync2;
always @(posedge clk_out) begin
    handline_sync1 <= handline;    // 第一级同步
    handline_sync2 <= handline_sync1; // 第二级同步
end
always@(posedge clk_out or negedge reset)
begin
	if(!reset)
		begin
			time_count_down <= 0;
			time_count_up <= 0;
			time_count_r <= 0;
			position <= 0;
			init_position <= home;
			pic_y <= home;
			current_state <= DOWN; 
			
			init_velocity <= 0;
			beep_count <= 0;
			stop_flag <= 0;
		end
	else
		begin
			case(current_state)
				DOWN:
					begin
						if(position + init_position <= MAX_Y)
							begin
								pic_y <= position + init_position;
								position <= ((time_count_down * time_count_down)>>3) + (init_velocity*time_count_down);// s=g*t*t/2
								
								if(pic_y < handline_sync2)
									init_velocity <= hand_velocity>>1;
								
								time_count_down <= time_count_down + 1'b1;//下降时间计数
								beep_flag[1] <= 0;
							end
						else
							begin
								
								pic_y <= MAX_Y;//落地
								position <= 0;//位置寄存器清零

								time_count_r <= (( (time_count_down-1 ) * (k + 4) ) >> 3 )+ init_velocity; // 反弹，速度变为原来的0.7倍

								current_state <= UP;//状态转换
								
								time_count_down <= 0;
								//led <= 1;
								beep_flag[1] <= ~stop_flag;
							end
					end
				UP:
					begin
						if(time_count_up>=time_count_r)//速度减为零
							begin
								if(pic_y>=MAX_Y-7)//忽略微小弹起
									begin
										init_position	<= MAX_Y;
										stop_flag <= 1;
										if(beep_count<=1)
											begin
												beep_flag[0]<= 1;
												beep_count <= beep_count + 1;
											end
										else
											begin
												beep_flag[0]<= 0;
												beep_count <= beep_count;
											end
									end
								else
									init_position <= pic_y;//保存当前位置
								
								init_velocity <= 0;
								current_state <= DOWN;//状态转换

								time_count_up <= 0;
								//led <= 0;
								beep_flag[1] <= 0;
							end
						else if((pic_y<5)||(pic_y>MAX_Y))
							begin
								pic_y <= 0;
								init_velocity <= ((time_count_r - time_count_up)* (k + 4) ) >> 3;
								init_position <= 0;
								current_state <= DOWN;//状态转换

								time_count_up <= 0;
								//led <= 0;
								beep_flag[1] <= ~stop_flag;
							end
						else
							begin
							beep_flag[1] <= 0;
							if(pic_y < handline_sync2)
								begin
									init_position <= handline_sync2;
									init_velocity <= hand_velocity>>1;
									current_state <= DOWN;//状态转换

									time_count_up <= 0;
									//led <= 0;
								end
							else
								begin
									pic_y <= MAX_Y + ((time_count_up * time_count_up)>>3) - ((time_count_r*time_count_up)>>2);
									time_count_up <= time_count_up + 1;	//上升时间计数
								end
							end
						
					end
				default://程序错误，复位
					begin
						pic_y <= 0;
						time_count_down <= 0;
						time_count_up <= 0;
						time_count_r <= 0;
						position <= 0;
						init_position <= home;
						current_state <= DOWN; 
						
						init_velocity <= 0;
						beep_count <= 0;
						stop_flag <= 0;
					end
			endcase	
		end
end

endmodule
