module  template
(
    input           	clk			,
    input           	rst		   ,
	
    input wire ball_release_button,
    
		
	input wire adc_dat,
	input	wire key_up,
	input	wire key_down,
	output wire	adc_cs,
	output wire adc_clk,
	
	output wire i2c_scl, //I2C时钟总线
	inout wire i2c_sda,	//I2C数据总线
	
	output          	lcd_rst     ,
	output				lcd_blk		,
    output          	lcd_dc      ,
    output          	lcd_sclk    ,
    output          	lcd_mosi    ,
    output          	lcd_cs    	,  
	
	output reg led,
	output wire [8:0] seg_led_1,
	output wire [8:0] seg_led_2
);
//////////////////////////////////////////////////////
wire clk_24MHz;
PLL24M pll_u2(
 
		.CLKI(clk ), 
		.CLKOP(clk_24MHz )
);


wire adc_done;
wire [7:0] adc_data;

adc081s101_driver adc_driver
(
	.clk			(clk_24MHz	),	
	.rst_n			(rst),	
	.adc_cs			(adc_cs		),	
	.adc_clk		(adc_clk		),	
	.adc_dat		(adc_dat		),	
	.adc_done		(adc_done	),	
	.adc_data		(adc_data	)	
);
wire [1:0] k;//反弹系数
wire [8:0] pic_y;
wire [8:0] home;
wire [8:0] position;
wire stop_flag;
wire over_flag;
wire [1:0] BEEP_flag;
wire [8:0] handline;
wire [7:0]hand_velocity;
adjuster adj(
	.clk(clk),//12MHz时钟信号
	.rst(rst),//复位信号
	.key_up(key_up),
	.key_down(key_down),
	.k(k),
	.seg_led_1(seg_led_1),
	.seg_led_2(seg_led_2)
);

wire dat_valid;//数据有效脉冲
wire [15:0] ch0_dat, ch1_dat, prox_dat;
rpr0521rs_driver u7
(
	.clk			(clk			),	//12M时钟信号
	.rst_n			(rst			),	//系统复位，低有效
	.i2c_scl		(i2c_scl		),	//I2C总线SCL
	.i2c_sda		(i2c_sda		),	//I2C总线SDA

	.dat_valid	(dat_valid	),	//数据有效脉冲
	.ch0_dat		(ch0_dat		),	//ALS数据
	.ch1_dat		(ch1_dat		),	//IR数据
	.prox_dat	(prox_dat	)	//Prox数据
);


hand_control u8
(
	.dat_valid(dat_valid),//数据有效脉冲
	.prox_dat(prox_dat),//位置传感器数据
	.handline(handline)//拍球的手对应位置
	,.hand_velocity(hand_velocity)//手的速度
);
reg led; // 定义 LED5

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        led <= 1'b0;
    end else if (dat_valid) begin
        if (handline > 16'd10) begin
            led <= 1'b1; 
        end else begin
            led <= 1'b0;
        end
    end
end
jumping jump
(
    .clk(clk),
    .rst(rst),
	.pic_y(position),
	
	.handline(handline),
	.hand_velocity(hand_velocity),//鎵嬬殑閫熷害
	
    .k(k),
    .ball_release_button(ball_release_button),
    .home(home),
	
    .beep_flag(BEEP_flag),
    .stop_flag(stop_flag),
	.over_flag(over_flag)
	//.led(led)
);
assign home = ((310*adc_data)>>8)+3'd7  ;
assign pic_y = ball_release_button?position:home;

lcd lcd1
(
	.clk(clk),
    .rst_n(rst),
	.y(pic_y),
	.x(handline),
    
    .lcd_rst(lcd_rst),
	.lcd_blk(lcd_blk),
    .lcd_dc(lcd_dc) ,
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs)  
);

endmodule