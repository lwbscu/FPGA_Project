// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: altitude
// 
// Author: Step
// 
// Description: 气压计控制
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module altitude(
		input			clk,
		input			rst_n,
		
		output		i2c_scl,	//I2C时钟总线
		inout			i2c_sda,	//I2C数据总线
		
		output		seg_rck,	//74HC595的RCK管脚
		output		seg_sck,	//74HC595的SCK管脚
		output		seg_din		//74HC595的SER管脚
	);


wire	[15:0]	dig_t1;	
wire	[15:0]	dig_t2;	
wire	[15:0]	dig_t3; 	
wire	[15:0]	dig_p1;	
wire	[15:0]	dig_p2;	
wire	[15:0]	dig_p3; 	
wire	[15:0]	dig_p4;	
wire	[15:0]	dig_p5;	
wire	[15:0]	dig_p6; 	
wire	[15:0]	dig_p7;	
wire	[15:0]	dig_p8;	
wire	[15:0]	dig_p9; 	
wire	[19:0]	adc_p;	
wire	[19:0]	adc_t;	

wire				dat_valid;
bmp280_driver u1(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n		),	//系统复位，低有效
		
		.i2c_scl		(i2c_scl		),	//I2C总线SCL
		.i2c_sda		(i2c_sda		),	//I2C总线SDA
		.dat_valid	(dat_valid	),
		
		.dig_t1		(dig_t1		), //
		.dig_t2		(dig_t2		), //
		.dig_t3		(dig_t3		), //
		.dig_p1		(dig_p1		), //
		.dig_p2		(dig_p2		), //
		.dig_p3		(dig_p3		), //
		.dig_p4		(dig_p4		), //
		.dig_p5		(dig_p5		), //
		.dig_p6		(dig_p6		), //
		.dig_p7		(dig_p7		), //
		.dig_p8		(dig_p8		), //
		.dig_p9		(dig_p9		), //
		.adc_p		(adc_p		), //
		.adc_t		(adc_t		)	//
	);

wire [ 7: 0] dat_en, dot_en;
wire [31: 0] T_data;
//wire [31: 0] P_data;
calculate u2(
		.rst_n		(rst_n		),	//系统复位，低有效
		.dat_valid	(dat_valid	),
		
		.dig_t1		(dig_t1		), //
		.dig_t2		(dig_t2		), //
		.dig_t3		(dig_t3		), //
		.dig_p1		(dig_p1		), //
		.dig_p2		(dig_p2		), // 
		.dig_p3		(dig_p3		), //
		.dig_p4		(dig_p4		), //
		.dig_p5		(dig_p5		), //
		.dig_p6		(dig_p6		), //
		.dig_p7		(dig_p7		), //
		.dig_p8		(dig_p8		), //
		.dig_p9		(dig_p9		), //
		.adc_p		(adc_p		), //
		.adc_t		(adc_t		),	//
		
		.T_data		(T_data		),	//温度BCD码
		
		.dat_en		(dat_en		),	//数码显示使能
		.dot_en		(dot_en		)	//小数点显示使能
);


segment_scan u3(
		.clk			(clk			),	//系统时钟
		.rst_n		(rst_n			),	//系统复位，低有效
		.dat_1		(T_data[31:28]	),	//SEG1 显示温度百位
		.dat_2		(T_data[27:24]	),	//SEG2 显示温度十位
		.dat_3		(T_data[23:20]	),	//SEG3 显示温度个位
		.dat_4		(T_data[19:16]	),	//SEG4 显示温度小数位
		.dat_5		(T_data[15:12]	),	//SEG5 显示湿度百位
		.dat_6		(T_data[11: 8]	),	//SEG6 显示湿度十位
		.dat_7		(T_data[ 7: 4]	),	//SEG7 显示湿度个位
		.dat_8		(T_data[ 3: 0]	),	//SEG8 显示湿度小数位
		.dat_en		(dat_en			),	//各位数码管数据显示使能，[MSB~LSB]=[SEG1~SEG8]
		.dot_en		(dot_en			),	//各位数码管小数点显示使能，[MSB~LSB]=[SEG1~SEG8]
		.seg_rck		(seg_rck		),	//74HC595的RCK管脚
		.seg_sck		(seg_sck		),	//74HC595的SCK管脚
		.seg_din		(seg_din		)	//74HC595的SER管脚
	);

endmodule
