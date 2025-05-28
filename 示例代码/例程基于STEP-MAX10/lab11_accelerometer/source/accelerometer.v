// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: accelerometer
// 
// Author: Step
// 
// Description: 加速度计控制
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module accelerometer(
		input			clk,
		input			rst_n,
		
		output		i2c_scl,	//I2C时钟总线
		inout			i2c_sda,	//I2C数据总线
		
		output		seg_rck,	//74HC595的RCK管脚
		output		seg_sck,	//74HC595的SCK管脚
		output		seg_din		//74HC595的SER管脚
	);

wire [15:0] data_in;
wire [19:0] data_out;
adxl345_driver u1(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n		),	//系统复位，低有效
		
		.i2c_scl		(i2c_scl		),	//I2C总线SCL
		.i2c_sda		(i2c_sda		),	//I2C总线SDA
		
		.data_valid	(),
		.x_dat		(),
		.y_dat		(),
		.z_dat		(data_in)
	);

wire [ 7: 0] dat_en, dot_en;
wire [15: 0] T_data, H_data;
calculate u2(
		.rst_n			(rst_n			),	//系统复位，低有效
		
		.data_in			(data_in			),	
		.data_out		(data_out		),	
		
		
		.dat_en			(dat_en			),	//数码显示使能
		.dot_en			(dot_en			)	//小数点显示使能
);


segment_scan u3(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n			),	//系统复位，低有效
		.dat_1		(	),	//SEG1 
		.dat_2		(	),	//SEG2 
		.dat_3		(	),	//SEG3 
		.dat_4		(data_out[19:16]	),	//SEG4 
		.dat_5		(data_out[15:12]),	//SEG5 
		.dat_6		(data_out[11: 8]),	//SEG6 
		.dat_7		(data_out[ 7: 4]),	//SEG7 
		.dat_8		(data_out[ 3: 0]),	//SEG8
		.dat_en		(dat_en			),	//各位数码管数据显示使能，[MSB~LSB]=[SEG1~SEG8]
		.dot_en		(dot_en			),	//各位数码管小数点显示使能，[MSB~LSB]=[SEG1~SEG8]
		.seg_rck		(seg_rck		),	//74HC595的RCK管脚
		.seg_sck		(seg_sck		),	//74HC595的SCK管脚
		.seg_din		(seg_din		)	//74HC595的SER管脚
	);

endmodule
