// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: decoder 
// 
// Author: Step
// 
// Description: decoder
// 
// Web: www.stepfpga.com
// 
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2015/11/11   |Initial ver
// --------------------------------------------------------------------
module decoder(
		input				rst_n,
		input				dat_valid,
		input	[15:0]	prox_dat,
		input [15:0]   ch0_dat,
		input [15:0]   ch1_dat,
		output [31:0]	lux_data,
		output reg	[7:0]	Y_out
	);

reg	[15:0] prox_dat0,prox_dat1,prox_dat2;
always @(posedge dat_valid) begin
	prox_dat0 <= prox_dat;
	prox_dat1 <= prox_dat0;
	if(((prox_dat1-prox_dat0) >= 16'h800)||((prox_dat1-prox_dat0) >= 16'h800)) 
		prox_dat2 <= prox_dat2;
	else 
		prox_dat2 <= prox_dat0;
end

always@(prox_dat2[11:9]) begin
	case (prox_dat2[11:9])
		3'b000: Y_out = 8'b11111110;
		3'b001: Y_out = 8'b11111100;
		3'b010: Y_out = 8'b11111000;
		3'b011: Y_out = 8'b11110000;
		3'b100: Y_out = 8'b11100000;
		3'b101: Y_out = 8'b11000000;
		3'b110: Y_out = 8'b10000000;
		3'b111: Y_out = 8'b00000000;
		default:Y_out = 8'b11111111;
	endcase
end

wire	[31:0] data0,data1;
reg	[31:0] lux;

assign data0 = ch0_dat ;
assign data1 = ch1_dat ;

always@(data0 or data1)
	if(data1 < data0*595)
		lux = data0*1682 - data1*1877;
	else if(data1 < data0*1015)
		lux = data0*644 - data1* 132;
	else if(data1 < data0*1352) 
		lux = data0*756 - data1*243;
	else if((data1 < data0*3053))
		lux = data0*766 - data1*25;
	else
		lux = 0;

//进行BCD转码处理

wire [31:0] T_data_bcd;
bin_to_bcd u1
(
.rst_n				(rst_n		),	//系统复位，低有效
.bin_code			(lux			),	//需要进行BCD转码的二进制数据
.bcd_code			(T_data_bcd	)	//转码后的BCD码型数据输出
);
assign lux_data = T_data_bcd;
endmodule
