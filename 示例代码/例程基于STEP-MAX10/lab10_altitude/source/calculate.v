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
		input	 	[15:0]	dig_t1,		//
		input	 	[15:0]	dig_t2,		//
		input	 	[15:0]	dig_t3, 		//
		input	 	[15:0]	dig_p1,		//
		input	 	[15:0]	dig_p2,		//
		input	 	[15:0]	dig_p3, 		//
		input	 	[15:0]	dig_p4,		//
		input	 	[15:0]	dig_p5,		//
		input	 	[15:0]	dig_p6, 		//
		input	 	[15:0]	dig_p7,		//
		input	 	[15:0]	dig_p8,		//
		input	 	[15:0]	dig_p9, 		//
		input	 	[19:0]	adc_p,		//
		input	 	[19:0]	adc_t,		//
		input					dat_valid,
		
		output	[31:0]	T_data,		//
		output	[31:0]	P_data,		//
		output	[7:0]		dat_en,		//数字显示使能
		output	[7:0]		dot_en		//小数点显示使能
	);

/////////////////////////////////////温度运算/////////////////////////////////////////

reg	[19:0] adct;
wire [31:0] var1,var2;
reg [15:0] digt2,digt3;
wire [31:0] T_data_bin ;

always@(posedge dat_valid)begin
			digt2 <=dig_t2[15]?(~dig_t2+1'b1):dig_t2;
			digt3 = dig_t3[15]?(~dig_t3+1'b1):dig_t3;
			adct <= adc_t;
			end

//assign digt2 = dig_t2[15]?(~dig_t2+1'b1):dig_t2;
//assign digt3 = dig_t3[15]?(~dig_t3+1'b1):dig_t3;

assign var1 = (((adct >> 3) - (dig_t1 << 1)) * (digt2)) >>11;
assign var2 = (((((adct >> 4) - (dig_t1)) * (( adct >> 4) - (dig_t1))) >> 12) * ( digt3)) >> 14;

assign T_data_bin =(dig_t3[15])?(((var1 - var2)*5+128)>>8):(((var1 + var2)*5+128)>>8);



//进行BCD转码处理

wire [31:0] T_data_bcd;
bin_to_bcd u1
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(T_data_bin	),	//需要进行BCD转码的二进制数据
.bcd_code			(T_data_bcd	)	//转码后的BCD码型数据输出
);

assign T_data = T_data_bcd;

//数据显示使能，高位消零
assign dat_en[7:0] = 8'b1111_1111;

//小数点显示使能
assign dot_en[7:0] = 8'b0000_0100;

//////////////////////////////////////////////////////////////////////////////






endmodule
