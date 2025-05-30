// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: prox_detect
// 
// Author: Step
// 
// Description: 接近和环境光传感器控制
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module prox_detect(
		input				clk,
		input				rst_n,
		
		output			i2c_scl,	//I2C时钟总线
		inout				i2c_sda,	//I2C数据总线
		output			seg_rck,			// 74HC595的RCK管脚
		output			seg_sck,			// 74HC595的SCK管脚
		output			seg_din,			// 74HC595的SER管脚
		
		output	[7:0]	led		//led灯
	);

wire dat_valid;
wire [15:0] ch0_dat, ch1_dat, prox_dat;
wire [31:0] lux_data;
rpr0521rs_driver u1(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n		),	//系统复位，低有效
		.i2c_scl		(i2c_scl		),	//I2C总线SCL
		.i2c_sda		(i2c_sda		),	//I2C总线SDA
		
		.dat_valid	(dat_valid	),	//数据有效脉冲
		.ch0_dat		(ch0_dat		),	//ALS数据
		.ch1_dat		(ch1_dat		),	//IR数据
		.prox_dat	(prox_dat	)	//Prox数据
	);

decoder u2(
		.rst_n		(rst_n),
		.dat_valid	(dat_valid	),
		.ch0_dat		(ch0_dat		),
		.ch1_dat		(ch1_dat		),
		.prox_dat	(prox_dat	),
		.lux_data	(lux_data	),
		.Y_out		(led			)
	);

segment_scan u4(
		.clk(clk),					//系统时钟 12MHz
		.rst_n(rst_n),				//系统复位 低有效
		.dat_1(lux_data[31:28]	),	//SEG1 显示的数据输入
		.dat_2(lux_data[27:24]	),	//SEG2 显示的数据输入
		.dat_3(lux_data[23:20]	),	//SEG3 显示的数据输入
		.dat_4(lux_data[19:16]	),	//SEG4 显示的数据输入
		.dat_5(lux_data[15:12]	),	//SEG5 显示的数据输入
		.dat_6(lux_data[11:08]	),	//SEG6 显示的数据输入
		.dat_7(lux_data[07:04]	),	//SEG7 显示的数据输入
		.dat_8(lux_data[03:00]	),	//SEG8 显示的数据输入
		.dat_en(8'b1111_1111	),	//数码管数据位显示使能，[MSB~LSB]=[SEG1~SEG8]
		.dot_en(8'b0000_0100	),	//数码管小数点位显示使能，[MSB~LSB]=[SEG1~SEG8]
		.seg_rck(seg_rck		),	//74HC595的RCK管脚
		.seg_sck(seg_sck		),	//74HC595的SCK管脚
		.seg_din(seg_din		)	//74HC595的SER管脚
	);

endmodule
