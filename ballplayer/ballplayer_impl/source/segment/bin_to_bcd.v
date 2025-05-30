// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: bin_to_bcd
// 
// Author: Step
// 
// Description: bin_to_bcd
// 
// Web: www.stepfpga.com
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2016/04/20   |Initial ver
// --------------------------------------------------------------------
module bin_to_bcd(
		input					rst_n,	//ϵͳ��λ������Ч
		input		[15:0]	bin_code,//��Ҫ����BCDת��Ķ���������
		output reg	[19:0]bcd_code	//ת����BCD�����������
	);

/*
��ģ��Ϊ�˽�ADC����������ת��Ϊ���ǳ��õ�ʮ������ʾ�����ڣ�
��Ҫ֪ʶ�漰��ѧ�в�ͬ��ʽ���ݵ�ת������ϸԭ�����ﲻ�����ܣ�ȥ�ٶ�����<FPGA ������תBCD��>�ɵ�
*/

reg		[35:0]		shift_reg; 
always@(bin_code or rst_n)begin
	shift_reg = {20'h0,bin_code};
	if(!rst_n) 
		bcd_code = 0; 
	else begin 
		repeat(16) begin //ѭ��16��  
			//BCD���λ��������5��3������
			if (shift_reg[19:16] >= 5) shift_reg[19:16] = shift_reg[19:16] + 2'b11;
			if (shift_reg[23:20] >= 5) shift_reg[23:20] = shift_reg[23:20] + 2'b11;
			if (shift_reg[27:24] >= 5) shift_reg[27:24] = shift_reg[27:24] + 2'b11;
			if (shift_reg[31:28] >= 5) shift_reg[31:28] = shift_reg[31:28] + 2'b11;
			if (shift_reg[35:32] >= 5) shift_reg[35:32] = shift_reg[35:32] + 2'b11;
			shift_reg = shift_reg << 1; 
		end
		bcd_code = shift_reg[35:16];   
	end  
end

endmodule
