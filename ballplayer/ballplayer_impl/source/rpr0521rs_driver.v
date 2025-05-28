// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: rpr0521rs_driver
// 
// Author: Step
// 
// Description: rpr0521rs_driver
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module rpr0521rs_driver(
		input				clk,		//ϵͳʱ��
		input				rst_n,	//ϵͳ��λ������Ч
		
		output			i2c_scl,	//I2C����SCL
		inout				i2c_sda,	//I2C����SDA
		
		output	reg				dat_valid,	//������Ч����
		output	reg	[15:0]	ch0_dat,		//ALS����
		output	reg	[15:0]	ch1_dat,		//IR����
		output	reg	[15:0]	prox_dat 	//Prox����
	);
	
	parameter	CNT_NUM	=	15;
	
	localparam	IDLE	=	4'd0;
	localparam	MAIN	=	4'd1;
	localparam	MODE1	=	4'd2;
	localparam	MODE2	=	4'd3;
	localparam	START	=	4'd4;
	localparam	WRITE	=	4'd5;
	localparam	READ	=	4'd6;
	localparam	STOP	=	4'd7;
	localparam	DELAY	=	4'd8;
	
	localparam	ACK	=	1'b0;
	localparam	NACK	=	1'b1;
	
	//ʹ�ü�������Ƶ����400KHzʱ���ź�clk_400khz
	reg					clk_400khz;
	reg		[9:0]		cnt_400khz;
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			cnt_400khz <= 10'd0;
		else if(cnt_400khz == CNT_NUM-1) 
			cnt_400khz <= 10'd0;
		else 
			cnt_400khz <= cnt_400khz + 1'b1;
	end
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			clk_400khz <= 1'b0;
		else if(cnt_400khz == CNT_NUM-1) 
			clk_400khz <= ~clk_400khz;
	end
	
	reg scl,sda,ack,ack_flag;
	reg [3:0] cnt, cnt_main, cnt_mode1, cnt_mode2, cnt_start, cnt_write, cnt_read, cnt_stop;
	reg [7:0] data_wr, dev_addr, reg_addr, reg_data, data_r, dat_l, dat_h;
	reg [23:0] cnt_delay, num_delay;
	reg [3:0]  state, state_back;

	always@(posedge clk_400khz or negedge rst_n) begin
		if(!rst_n) begin	//���������λ����������ݳ�ʼ��
			scl <= 1'd1; sda <= 1'd1; ack <= ACK; ack_flag <= 1'b0; cnt <= 1'b0;
			cnt_main <= 1'b0; cnt_mode1 <= 1'b0; cnt_mode2 <= 1'b0;
			cnt_start <= 1'b0; cnt_write <= 1'b0; cnt_read <= 1'b0; cnt_stop <= 1'b0;
			cnt_delay <= 1'b0; num_delay <= 24'd4800;
			state <= IDLE; state_back <= IDLE;
		end else begin
			case(state)
				IDLE:begin	//����Ը�λ����Ҫ���ڳ����ܷɺ�Ĵ���
						scl <= 1'd1; sda <= 1'd1; ack <= ACK; ack_flag <= 1'b0; cnt <= 1'b0;
						cnt_main <= 1'b0; cnt_mode1 <= 1'b0; cnt_mode2 <= 1'b0;
						cnt_start <= 1'b0; cnt_write <= 1'b0; cnt_read <= 1'b0; cnt_stop <= 1'b0;
						cnt_delay <= 1'b0; num_delay <= 24'd4800;
						state <= MAIN; state_back <= IDLE;
					end
				MAIN:begin
						if(cnt_main >= 4'd11) cnt_main <= 4'd4;  	//д�����ָ���ѭ��������
						else cnt_main <= cnt_main + 1'b1;	
						case(cnt_main)
							4'd0:	begin dev_addr <= 7'h38; reg_addr <= 8'h40; reg_data <= 8'h0a; state <= MODE1; end	//д������
							4'd1:	begin dev_addr <= 7'h38; reg_addr <= 8'h41; reg_data <= 8'hc6; state <= MODE1; end	//д������
							4'd2:	begin dev_addr <= 7'h38; reg_addr <= 8'h42; reg_data <= 8'h02; state <= MODE1; end	//д������
							4'd3:	begin dev_addr <= 7'h38; reg_addr <= 8'h43; reg_data <= 8'h01; state <= MODE1; end	//д������
							4'd4:	begin state <= DELAY; dat_valid <= 1'b0; end	//12ms��ʱ
							4'd5:	begin dev_addr <= 7'h38; reg_addr <= 8'h44;  state <= MODE2; end	//��ȡ����
							4'd6:	begin  prox_dat<= {dat_h,dat_l}; end	//��ȡ����
							4'd7:	begin dev_addr <= 7'h38; reg_addr <= 8'h46;  state <= MODE2; end	//��ȡ����
							4'd8:	begin ch0_dat <= {dat_h,dat_l}; end	//��ȡ����
							4'd9:	begin dev_addr <= 7'h38; reg_addr <= 8'h48;  state <= MODE2; end	//��ȡ����
							4'd10:	begin ch1_dat <= {dat_h,dat_l}; end	//��ȡ����
							4'd11:	begin dat_valid <= 1'b1; end	//��ȡ����
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				MODE1:begin	//����д����
						if(cnt_mode1 >= 4'd5) cnt_mode1 <= 1'b0;	//��START�е���״ִ̬�п���cnt_start
						else cnt_mode1 <= cnt_mode1 + 1'b1;
						state_back <= MODE1;
						case(cnt_mode1)
							4'd0:	begin state <= START; end	//I2Cͨ��ʱ���е�START
							4'd1:	begin data_wr <= dev_addr<<1; state <= WRITE; end	//�豸��ַ
							4'd2:	begin data_wr <= reg_addr; state <= WRITE; end	//�Ĵ�����ַ
							4'd3:	begin data_wr <= reg_data; state <= WRITE; end	//д������
							4'd4:	begin state <= STOP; end	//I2Cͨ��ʱ���е�STOP
							4'd5:	begin state <= MAIN; end	//����MAIN
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				MODE2:begin	//���ζ�����
						if(cnt_mode2 >= 4'd10) cnt_mode2 <= 1'b0;	//��START�е���״ִ̬�п���cnt_start
						else cnt_mode2 <= cnt_mode2 + 1'b1;
						state_back <= MODE2;
						case(cnt_mode2)
							4'd0:	begin state <= START; end	//I2Cͨ��ʱ���е�START
							4'd1:	begin data_wr <= dev_addr<<1; state <= WRITE; end	//�豸��ַ
							4'd2:	begin data_wr <= reg_addr; state <= WRITE; end	//�Ĵ�����ַ
							4'd3:	begin state <= START; end	//I2Cͨ��ʱ���е�START
							4'd4:	begin data_wr <= (dev_addr<<1)|8'h01; state <= WRITE; end	//�豸��ַ
							4'd5:	begin ack <= ACK; state <= READ; end	//���Ĵ�������
							4'd6:	begin dat_l <= data_r; end
							4'd7:	begin ack <= NACK; state <= READ; end	//���Ĵ�������
							4'd8:	begin dat_h <= data_r; end
							4'd9:	begin state <= STOP; end	//I2Cͨ��ʱ���е�STOP
							4'd10:	begin state <= MAIN; end	//����MAIN
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				START:begin	//I2Cͨ��ʱ���е���ʼSTART
						if(cnt_start >= 3'd5) cnt_start <= 1'b0;	//��START�е���״ִ̬�п���cnt_start
						else cnt_start <= cnt_start + 1'b1;
						case(cnt_start)
							3'd0:	begin sda <= 1'b1; scl <= 1'b1; end	//��SCL��SDA���ߣ�����4.7us����
							3'd1:	begin sda <= 1'b1; scl <= 1'b1; end	//clk_400khzÿ������2.5us����Ҫ��������
							3'd2:	begin sda <= 1'b0; end	//SDA���͵�SCL���ͣ�����4.0us����
							3'd3:	begin sda <= 1'b0; end	//clk_400khzÿ������2.5us����Ҫ��������
							3'd4:	begin scl <= 1'b0; end	//SCL���ͣ�����4.7us����
							3'd5:	begin scl <= 1'b0; state <= state_back; end	//clk_400khzÿ������2.5us����Ҫ�������ڣ�����MAIN
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				WRITE:begin	//I2Cͨ��ʱ���е�д����WRITE����Ӧ�жϲ���ACK
						if(cnt <= 3'd6) begin	//����Ҫ����8bit�����ݣ��������ѭ���Ĵ���
							if(cnt_write >= 3'd3) begin cnt_write <= 1'b0; cnt <= cnt + 1'b1; end
							else begin cnt_write <= cnt_write + 1'b1; cnt <= cnt; end
						end else begin
							if(cnt_write >= 3'd7) begin cnt_write <= 1'b0; cnt <= 1'b0; end	//�����������ָ���ֵ
							else begin cnt_write <= cnt_write + 1'b1; cnt <= cnt; end
						end
						case(cnt_write)
							//����I2C��ʱ��������
							3'd0:	begin scl <= 1'b0; sda <= data_wr[7-cnt]; end	//SCL���ͣ�������SDA�����Ӧ��λ
							3'd1:	begin scl <= 1'b1; end	//SCL���ߣ�����4.0us����
							3'd2:	begin scl <= 1'b1; end	//clk_400khzÿ������2.5us����Ҫ��������
							3'd3:	begin scl <= 1'b0; end	//SCL���ͣ�׼��������1bit������
							//��ȡ���豸����Ӧ�źŲ��ж�
							3'd4:	begin sda <= 1'bz; end	//�ͷ�SDA�ߣ�׼�����մ��豸����Ӧ�ź�
							3'd5:	begin scl <= 1'b1; end	//SCL���ߣ�����4.0us����
							3'd6:	begin ack_flag <= i2c_sda; end	//��ȡ���豸����Ӧ�źŲ��ж�
							3'd7:	begin scl <= 1'b0; if(ack_flag)state <= state; else state <= state_back; end //SCL���ͣ������Ӧ��ѭ��д
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				READ:begin	//I2Cͨ��ʱ���еĶ�����READ�ͷ���ACK�Ĳ���
						if(cnt <= 3'd6) begin	//����Ҫ����8bit�����ݣ��������ѭ���Ĵ���
							if(cnt_read >= 3'd3) begin cnt_read <= 1'b0; cnt <= cnt + 1'b1; end
							else begin cnt_read <= cnt_read + 1'b1; cnt <= cnt; end
						end else begin
							if(cnt_read >= 3'd7) begin cnt_read <= 1'b0; cnt <= 1'b0; end	//�����������ָ���ֵ
							else begin cnt_read <= cnt_read + 1'b1; cnt <= cnt; end
						end
						case(cnt_read)
							//����I2C��ʱ���������
							3'd0:	begin scl <= 1'b0; sda <= 1'bz; end	//SCL���ͣ��ͷ�SDA�ߣ�׼�����մ��豸����
							3'd1:	begin scl <= 1'b1; end	//SCL���ߣ�����4.0us����
							3'd2:	begin data_r[7-cnt] <= i2c_sda; end	//��ȡ���豸���ص�����
							3'd3:	begin scl <= 1'b0; end	//SCL���ͣ�׼��������1bit������
							//����豸������Ӧ�ź�
							3'd4:	begin sda <= ack; end	//������Ӧ�źţ���ǰ����յ���������
							3'd5:	begin scl <= 1'b1; end	//SCL���ߣ�����4.0us����
							3'd6:	begin scl <= 1'b1; end	//SCL���ߣ�����4.0us����
							3'd7:	begin scl <= 1'b0; state <= state_back; end	//SCL���ͣ�����MAIN״̬
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				STOP:begin	//I2Cͨ��ʱ���еĽ���STOP
						if(cnt_stop >= 3'd5) cnt_stop <= 1'b0;	//��STOP�е���״ִ̬�п���cnt_stop
						else cnt_stop <= cnt_stop + 1'b1;
						case(cnt_stop)
							3'd0:	begin sda <= 1'b0; end	//SDA���ͣ�׼��STOP
							3'd1:	begin sda <= 1'b0; end	//SDA���ͣ�׼��STOP
							3'd2:	begin scl <= 1'b1; end	//SCL��ǰSDA����4.0us
							3'd3:	begin scl <= 1'b1; end	//SCL��ǰSDA����4.0us
							3'd4:	begin sda <= 1'b1; end	//SDA����
							3'd5:	begin sda <= 1'b1; state <= state_back; end	//���STOP����������MAIN״̬
							default: state <= IDLE;	//�������ʧ�أ�����IDLE�Ը�λ״̬
						endcase
					end
				DELAY:begin	//12ms��ʱ
						if(cnt_delay >= num_delay) begin
							cnt_delay <= 1'b0;
							state <= MAIN; 
						end else cnt_delay <= cnt_delay + 1'b1;
					end
				default:;
			endcase
		end
	end
	
	assign	i2c_scl = scl;	//��SCL�˿ڸ�ֵ
	assign	i2c_sda = sda;	//��SDA�˿ڸ�ֵ

endmodule
