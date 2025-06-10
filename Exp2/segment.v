module segment
 (
input wire [3:0] bcd_tens_in, //四位输入数据信号
input wire [3:0] bcd_ones_in, //四位输入数据信号
output wire [8:0] segment_led_tens, //数码管 1，MSB~LSB = SEG,DP,G,F,E,D,C,B,A
output wire [8:0] segment_led_ones	//数码管2，MSB~LSB=SEG,DP,G,F,E,D,C,B,A
 );
 
// 定义数码管类型：1=共阳极，0=共阴极
// 如果数码管不显示，请尝试修改这个参数
parameter COMMON_ANODE = 1'b0; // 默认假设共阴极数码管

reg[7:0]seg_pattern[15:0]; //存储7段数码管段码(不含公共端)

initial
	begin
		// 7段数码管段码 (GFEDCBA格式，DP在单独处理)
		seg_pattern[0] = 8'h3f; // 0: abcdef--
		seg_pattern[1] = 8'h06; // 1: -bc-----
		seg_pattern[2] = 8'h5b; // 2: ab-de-g-
		seg_pattern[3] = 8'h4f; // 3: abcd--g-
		seg_pattern[4] = 8'h66; // 4: -bc--fg-
		seg_pattern[5] = 8'h6d; // 5: a-cd-fg-
		seg_pattern[6] = 8'h7d; // 6: a-cdefg-
		seg_pattern[7] = 8'h07; // 7: abc-----
		seg_pattern[8] = 8'h7f; // 8: abcdefg-
		seg_pattern[9] = 8'h6f; // 9: abcd-fg-
		seg_pattern[10] = 8'h77; // A: abc-efg-
		seg_pattern[11] = 8'h7c; // b: --cdefg-
		seg_pattern[12] = 8'h39; // C: a--def--
		seg_pattern[13] = 8'h5e; // d: -bcde-g-
		seg_pattern[14] = 8'h79; // E: a--defg-
		seg_pattern[15] = 8'h71; // F: a---efg-
 end

// 根据数码管类型生成最终输出
wire [7:0] segments_tens, segments_ones;
wire common_tens, common_ones;

assign segments_tens = COMMON_ANODE ? ~seg_pattern[bcd_tens_in] : seg_pattern[bcd_tens_in];
assign segments_ones = COMMON_ANODE ? ~seg_pattern[bcd_ones_in] : seg_pattern[bcd_ones_in];

// 公共端控制：共阳极时为高电平，共阴极时为低电平
assign common_tens = COMMON_ANODE ? 1'b1 : 1'b0;
assign common_ones = COMMON_ANODE ? 1'b1 : 1'b0;

// 输出组合：[公共端，小数点，G，F，E，D，C，B，A]
assign segment_led_tens = {common_tens, 1'b0, segments_tens[6:0]}; // DP关闭
assign segment_led_ones = {common_ones, 1'b0, segments_ones[6:0]}; // DP关闭
 
 endmodule