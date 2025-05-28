module fre_div
(
	input wire clk,//输入12M时钟信号
	input wire rst,//复位信号
	output reg clk_out//输出分频后的时钟
);

parameter WIDTH = 24; //计数器的位数，计数的最大值为2**WIDTH-1
parameter N = 240_000; //分频系数，请确保 N < 2**WIDTH-1，否则计数会溢出

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
