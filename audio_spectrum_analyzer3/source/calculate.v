 // --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: calculate
// 
// Author: Step
// 
// Description: calculate
// 
// Web: www.stepfpga.com
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2016/04/20   |Initial ver
// --------------------------------------------------------------------
module calculate(
		input				rst_n,		//复位信号
		input	[15:0]	data_in,		//

		
		output	[19:0]	data_out,		//
		output	[7:0]		dat_en,		//数字显示使能
		output	[7:0]		dot_en		//小数点显示使能
	);

///////////////////////////////////// /////////////////////////////////////////


wire [31:0] data_bin = data_in[12]?{4'b0000,(~data_in[11:0]+1'b1)}:data_in;


//进行BCD转码处理
//小数点在BCD码基础上左移2位，完成除以100的操作
//T_data_bcd[19:16]百位,[15:12]十位,[11:8]个位,[7:0]两个小数位
wire [19:0] data_bcd;
bin_to_bcd u1
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(data_bin	),	//需要进行BCD转码的二进制数据
.bcd_code			(data_bcd	)	//转码后的BCD码型数据输出
);

//要显示的数据,保留1位小数
//若温度为负，将T_data_bcd[19:16]百位数据用数字A替换，同时把数码管A的字库显示负号
assign data_out = (data_in[12])? {4'ha,data_bcd[15:0]}:data_bcd[19:0];

//数据显示使能，高位消零
assign dat_en[4] = |data_out[19:16]; //自或
//assign dat_en[2] = (data_in[12])?(|data_out[11:8]):(|data_out[15:8]);
assign dat_en[7:5] = 3'b000;
assign dat_en[3:0] = 4'b1111;
//小数点显示使能
assign dot_en[7:0] = 8'b0000_0000;



endmodule
