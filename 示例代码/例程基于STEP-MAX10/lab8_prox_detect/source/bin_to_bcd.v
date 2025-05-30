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
module bin_to_bcd
(
input						rst_n,	//系统复位，低有效
input		[31:0]			bin_code,	//需要进行BCD转码的二进制数据
output	reg	[31:0]			bcd_code	//转码后的BCD码型数据输出
);

/*
此模块为了将ADC采样的数据转换为我们常用的十进制显示而存在，
主要知识涉及数学中不同制式数据的转换，详细原理这里不做介绍，去百度搜索<FPGA 二进制转BCD码>可得
*/

reg		[67:0]		shift_reg; 
always@(bin_code or rst_n)begin
	shift_reg = {36'h0,bin_code};
	if(!rst_n) 
		bcd_code = 0; 
	else begin 
		repeat(32) begin //循环32次  
			//BCD码各位数据作满5加3操作，
				
			if (shift_reg[35:32] >= 5) 
				shift_reg[35:32] = shift_reg[35:32] + 2'b11;
			if (shift_reg[39:36] >= 5) 
				shift_reg[39:36] = shift_reg[39:36] + 2'b11;
			if (shift_reg[43:40] >= 5) 
				shift_reg[43:40] = shift_reg[43:40] + 2'b11;
			if (shift_reg[47:44] >= 5) 
				shift_reg[47:44] = shift_reg[47:44] + 2'b11;
			if (shift_reg[51:48] >= 5) 
				shift_reg[51:48] = shift_reg[51:48] + 2'b11;
			if (shift_reg[55:52] >= 5) 
				shift_reg[55:52] = shift_reg[55:52] + 2'b11;
			if (shift_reg[59:56] >= 5) 
				shift_reg[59:56] = shift_reg[59:56] + 2'b11;
			if (shift_reg[63:60] >= 5) 
				shift_reg[63:60] = shift_reg[63:60] + 2'b11;
			if (shift_reg[67:64] >= 5) 
				shift_reg[67:64] = shift_reg[67:64] + 2'b11;	
			shift_reg = shift_reg << 1;	
		
		end
		bcd_code = shift_reg[67:36];   
	end  
end

endmodule
