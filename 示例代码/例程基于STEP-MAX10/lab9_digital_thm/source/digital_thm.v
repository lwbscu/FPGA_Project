// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: digital_thm
// 
// Author: Step
// 
// Description: 温湿度传感器控制
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module digital_thm(
		input			clk,
		input			rst_n,
		
		output		i2c_scl,	//I2C时钟总线
		inout			i2c_sda,	//I2C数据总线
		
		output		seg_rck,	//74HC595的RCK管脚
		output		seg_sck,	//74HC595的SCK管脚
		output		seg_din		//74HC595的SER管脚
	);

wire [15:0] T_code,H_code;
sht30_driver u1(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n		),	//系统复位，低有效
		
		.i2c_scl		(i2c_scl		),	//I2C总线SCL
		.i2c_sda		(i2c_sda		),	//I2C总线SDA
		
		.T_code		(T_code		),	//温度码值
		.H_code		(H_code		)	//湿度码值
	);

wire [ 7: 0] dat_en, dot_en;
wire [15: 0] T_data, H_data;
calculate u2(
		.rst_n			(rst_n			),	//系统复位，低有效
		
		.T_code			(T_code			),	//温度码值
		.H_code			(H_code			),	//湿度码值
		
		.T_data			(T_data			),	//温度BCD码
		.H_data			(H_data			),	//湿度BCD码
		
		.dat_en			(dat_en			),	//数码显示使能
		.dot_en			(dot_en			)	//小数点显示使能
);


segment_scan u3(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n			),	//系统复位，低有效
		.dat_1		(T_data[15:12]	),	//SEG1 显示温度百位
		.dat_2		(T_data[11: 8]	),	//SEG2 显示温度十位
		.dat_3		(T_data[ 7: 4]	),	//SEG3 显示温度个位
		.dat_4		(T_data[ 3: 0]	),	//SEG4 显示温度小数位
		.dat_5		(H_data[15:12]	),	//SEG5 显示湿度百位
		.dat_6		(H_data[11: 8]	),	//SEG6 显示湿度十位
		.dat_7		(H_data[ 7: 4]	),	//SEG7 显示湿度个位
		.dat_8		(H_data[ 3: 0]	),	//SEG8 显示湿度小数位
		.dat_en		(dat_en			),	//各位数码管数据显示使能，[MSB~LSB]=[SEG1~SEG8]
		.dot_en		(dot_en			),	//各位数码管小数点显示使能，[MSB~LSB]=[SEG1~SEG8]
		.seg_rck		(seg_rck		),	//74HC595的RCK管脚
		.seg_sck		(seg_sck		),	//74HC595的SCK管脚
		.seg_din		(seg_din		)	//74HC595的SER管脚
	);

endmodule
