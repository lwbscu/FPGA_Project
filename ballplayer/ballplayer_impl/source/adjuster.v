module adjuster
(
	input wire clk,//12MHz时钟信号
	input	wire rst,//复位信号
	input	wire key_up,
	input	wire key_down,
	output reg [1:0] k,
	output wire [8:0] seg_led_1,
	output wire [8:0] seg_led_2
);
wire key_up_pulse,key_down_pulse;//按键消抖
debounce #(.N(2)) deb(clk,rst,{key_up,key_down},{key_up_pulse,key_down_pulse});
always@(posedge clk or negedge rst)//输出
	begin
		if(!rst)
			begin
				k <= 2'b00;
			end
		else
			begin
				if(key_up_pulse&&(k<3))
					k <= k + 1;
				else if(key_down_pulse&&(k>0))
					k <= k - 1;
				else k <= k;
			end
	end
segment seg(0,k+5,seg_led_1,seg_led_2);
endmodule