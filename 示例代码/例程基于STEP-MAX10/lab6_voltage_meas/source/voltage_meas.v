// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: voltage_meas
// 
// Author: Step
// 
// Description: Voltage Measure system
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2016/10/30   |Initial ver
// --------------------------------------------------------------------
module voltage_meas(
		input				clk,			//系统时钟12MHz
		input				rst_n,		//系统复位
		input				adc_dat,		//SPI ADC数据
		output			adc_cs,		//SPI ADC片选
		output			adc_clk,		//SPI	ADC时钟
		output	[8:0]	seg_1,  		//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
		output	[8:0]	seg_2   		//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
	);
	


wire clk_24mhz,locked;
pll u1(
		.areset				(!rst_n		), 
		.inclk0				(clk			), 
		.c0					(clk_24mhz	), 
		.locked				(locked		)  
	);

wire adc_done;
wire [7:0] adc_data;

adc081s101_driver u2(
		.clk(clk_24mhz),	
		.rst_n(rst_n),	
		.adc_cs(adc_cs),	
		.adc_clk(adc_clk),	
		.adc_dat(adc_dat),	
		.adc_done(adc_done),	
		.adc_data(adc_data)	
	);

//
wire [15:0]	bin_code = adc_data * 16'd129;
wire [19:0]	bcd_code;

//bcd码转换
bin_to_bcd u3(
		.rst_n(rst_n),	
		.bin_code(bin_code),	
		.bcd_code(bcd_code)	
	);


segment_led u4(
		.seg_dot(1'b1),				//seg_dot input
		.seg_data(bcd_code[19:16]),//seg_data input
		.segment_led(seg_1)			//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
	);


segment_led u5(
		.seg_dot(1'b0),				//seg_dot input
		.seg_data(bcd_code[15:12]),//seg_data input
		.segment_led(seg_2)			//MSB~LSB = SEG,DP,G,F,E,D,C,B,A
	);	
	
endmodule
