// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: type_system
// 
// Author: Step
// 
// Description: 矩阵键盘输入控制，按压按键在小脚丫数码管显示编号
// 
// Web: www.stepfapga.com
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2016/04/20   |Initial ver
// --------------------------------------------------------------------
module type_system(
		input				clk,
		input				rst_n,
		input		[3:0]	col,
		output	[3:0]	row,
		output	[8:0]	seg_1,	//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
		output	[8:0]	seg_2		//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
	);

wire			[15:0]	key_out;
wire			[15:0]	key_pulse;
wire			[7:0]		seg_data;
//Array_KeyBoard 
array_keyboard u1(
			.clk(clk),
			.rst_n(rst_n),
			.col(col),
			.row(row),
			.key_out(key_out),
			.key_pulse(key_pulse)
	);


//key_decode
key_decode u2(
			.clk					(clk			),
			.rst_n					(rst_n			),
			.key_pulse				(key_pulse		),
			.seg_data				(seg_data		)	//高4位代表十位，低4位代表个位
	);

//Segment led display module
segment_led u3
(
.seg_data				(seg_data[7:4]	),  //seg_data input
.segment_led			(seg_1			)   //MSB~LSB = SEG,DP,G,F,E,D,C,B,A
);

//Segment led display module
segment_led u4
(
.seg_data				(seg_data[3:0]	),  //seg_data input
.segment_led			(seg_2			)   //MSB~LSB = SEG,DP,G,F,E,D,C,B,A
);

endmodule
