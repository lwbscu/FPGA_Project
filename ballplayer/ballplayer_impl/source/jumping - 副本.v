module jumping
(
	input wire clk,//12MHzʱ���ź�
	input	wire rst,//��λ�ź�
	output reg [8:0] pic_y,//С��������
	
	input wire [8:0] handline,//������ֶ�Ӧλ��
	input wire [7:0] hand_velocity,//�ֵ��ٶ�
	
	input wire [1:0] k, // ����ϵ��
	input wire ball_release_button,//�����
	input wire [8:0] home, //����λ��
	
	output reg [1:0] beep_flag,//�̴����к���Ϸ����
	output reg stop_flag=0,//ֹͣ��־λ
	input wire over_flag//����ʱֹͣ��־λ
	//,output reg led
);

wire reset = ball_release_button && rst;//�����־λ

wire clk_out;//��Ƶ���ʱ�ӣ�18.2ms
parameter N=219089;//��Ƶϵ��
parameter WIDTH=24;//��������λ��
fre_div #(.WIDTH(WIDTH),.N(N)) fre_500us
(
	clk,//����12Mʱ���ź�
	rst,//��λ
	clk_out//�����Ƶ���ʱ��
);

//״̬��������λ�����䣬����
parameter DOWN=2'b00,UP=2'b01;
//��ǰ״̬����һ״̬
reg [1:0] current_state=DOWN;

parameter MAX_Y = 9'd309;//Һ�������ظ߶�
reg [14:0] time_count_down=0,time_count_up=0,time_count_r=0;//ʱ�������,��һʱ��Ĵ���
reg [8:0] init_position=0,position=0;//��ʼλ�üĴ�����λ�üĴ���
reg [10:0] init_velocity = 0;
reg [5:0] beep_count;//���������ͼ�ʱ

reg [8:0] handline_sync1, handline_sync2;
always @(posedge clk_out) begin
    handline_sync1 <= handline;    // ��һ��ͬ��
    handline_sync2 <= handline_sync1; // �ڶ���ͬ��
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
								
								time_count_down <= time_count_down + 1'b1;//�½�ʱ�����
								beep_flag[1] <= 0;
							end
						else
							begin
								
								pic_y <= MAX_Y;//���
								position <= 0;//λ�üĴ�������

								time_count_r <= (( (time_count_down-1 ) * (k + 4) ) >> 3 )+ init_velocity; // �������ٶȱ�Ϊԭ����0.7��

								current_state <= UP;//״̬ת��
								
								time_count_down <= 0;
								//led <= 1;
								beep_flag[1] <= ~stop_flag;
							end
					end
				UP:
					begin
						if(time_count_up>=time_count_r)//�ٶȼ�Ϊ��
							begin
								if(pic_y>=MAX_Y-7)//����΢С����
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
									init_position <= pic_y;//���浱ǰλ��
								
								init_velocity <= 0;
								current_state <= DOWN;//״̬ת��

								time_count_up <= 0;
								//led <= 0;
								beep_flag[1] <= 0;
							end
						else if((pic_y<5)||(pic_y>MAX_Y))
							begin
								pic_y <= 0;
								init_velocity <= ((time_count_r - time_count_up)* (k + 4) ) >> 3;
								init_position <= 0;
								current_state <= DOWN;//״̬ת��

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
									current_state <= DOWN;//״̬ת��

									time_count_up <= 0;
									//led <= 0;
								end
							else
								begin
									pic_y <= MAX_Y + ((time_count_up * time_count_up)>>3) - ((time_count_r*time_count_up)>>2);
									time_count_up <= time_count_up + 1;	//����ʱ�����
								end
							end
						
					end
				default://������󣬸�λ
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
