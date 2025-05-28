module beep
(
	input wire clk,//输入12M时钟信号
	input wire rst,//复位信号
	input [4:0] fre_num,//输入不同的数字，发出不同的音节
	output reg clk_out//输出分频后的时钟
);

parameter WIDTH = 16; //计数器的位数，计数的最大值为2**WIDTH-1
reg [15:0]  N = 1; //分频系数，请确保 N < 2**WIDTH-1，否则计数会溢出

always@(fre_num)
begin
	case(fre_num)
		5'd1: N = 16'd45872; //L1, 
		5'd2: N = 16'd40858; //L2, 
		5'd3: N = 16'd36408; //L3, 
		5'd4: N = 16'd34364; //L4, 
		5'd5: N = 16'd30612; //L5, 
		5'd6: N = 16'd27273; //L6, 
		5'd7: N = 16'd24296; //L7, 
		5'd8: N = 16'd22931; //M1, 
		5'd9: N = 16'd20432; //M2, 
		5'd10: N = 16'd18201; //M3, 
		5'd11: N = 16'd17180; //M4, 
		5'd12: N = 16'd15306; //M5, 
		5'd13: N = 16'd13636; //M6, 
		5'd14: N = 16'd12148; //M7, 
		5'd15: N = 16'd11478; //H1, 
		5'd16: N = 16'd10215; //H2, 
		default: N = 16'd1; //分频错误，输出低电平
	endcase
end

reg [WIDTH-1:0] count_up;//计数器，将会在时钟上升沿加一或清零
always@(posedge clk or negedge rst)//时钟上升沿触发
begin
	if(!rst)
	begin
		count_up <= 0;
		clk_out <= 0;
	end
	else
	begin
		if(count_up==(N-1))//时钟周期计数，共采集N个时钟周期
			count_up <= 0;
		else
			count_up <= count_up + 1;
		

		if(count_up<(N>>1))//占空比为50%
			clk_out <= 1;//分频时钟高电平
		else
			clk_out <= 0;//分频时钟低电平
	end
end

endmodule
