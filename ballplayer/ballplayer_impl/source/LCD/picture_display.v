// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Module: picture_display
// 
// Author: Step
// 
// Description: LCD鍥剧墖鏄剧ず
// 
// Web: www.stepfpga.com
//
// --------------------------------------------------------------------
// Code Revision History :
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.1     |2023/10/30   |Initial ver
// --------------------------------------------------------------------

module  picture_display
(
    input           	clk			,
    input           	rst_n		   ,
    
    output          	lcd_rst     ,
	 output				lcd_blk		,
    output          	lcd_dc      ,
    output          	lcd_sclk    ,
    output          	lcd_mosi    ,
    output          	lcd_cs      

);
wire    [8:0]   data;   
wire            en_write;
wire            wr_done; 

wire    [8:0]   init_data;
wire            en_write_init;
wire            init_done;

wire            en_size            ;
wire            show_pic_flag     ;
wire    [6:0]   ascii_num          ;
wire    [8:0]   start_x            ;
wire    [8:0]   start_y            ;

wire    [8:0]   show_pic_data     ;
wire            en_write_show_pic  ;
wire            show_char_done     ;  
wire     [8:0]  rom_addr;
wire    [239:0]   rom_q;
wire				 clk_50MHz;


assign			lcd_blk = 1'b1;

pll pll_u1(
 
		.CLKI(clk ), 
		.CLKOP(clk_50MHz )
	);

lcd_write  lcd_write_inst
(
    .sys_clk_50MHz(clk_50MHz	  ),
    .sys_rst_n    (rst_n  		  ),
    .data         (data         ),
    .en_write     (en_write     ),
                                
    .wr_done      (wr_done      ),
    .cs           (lcd_cs       ),
    .dc           (lcd_dc       ),
    .sclk         (lcd_sclk     ),
    .mosi         (lcd_mosi     )
);

control  control_inst
(
    .sys_clk_50MHz          (clk_50MHz 	       ), 
    .sys_rst_n              (rst_n		          ),
    .init_data              (init_data           ),
    .en_write_init          (en_write_init       ),
    .init_done              (init_done           ),
    .show_pic_data         (show_pic_data      ),
    .en_write_show_pic     (en_write_show_pic  ),

	 .show_pic_flag	      (show_pic_flag     ),
    .data                   (data                ),
    .en_write               (en_write            )
);

lcd_init  lcd_init_inst
(
    .sys_clk_50MHz(clk_50MHz		),
    .sys_rst_n    (rst_n	     ),
    .wr_done      (wr_done      ),

    .lcd_rst      (lcd_rst      ),
    .init_data    (init_data    ),
    .en_write     (en_write_init),
    .init_done    (init_done    )
);

lcd_show_pic  lcd_show_pic_inst
(
    .sys_clk			(clk_50MHz    ),
    .sys_rst_n        	(rst_n        ),
    .wr_done          	(wr_done      ),
    .show_pic_flag    	(show_pic_flag), 
	.rom_addr	 		(rom_addr), 
	.rom_q				(rom_q),
	.show_pic_data    	(show_pic_data     ),   
    .en_write_show_pic  (en_write_show_pic )  
);

pic_ram pic_ram_u0
(
	.address(rom_addr), 
	.q(rom_q)
);


/////////////////////////////////////////////////////////////////////////////////
assign led = sw;
wire clk_24mhz,locked;
pll pll_u2(
 
		.CLKI(clk ), 
		.CLKOP(clk_24mhz )
	);

wire adc_done;
wire [7:0] adc_data;

ADC081S101_driver u2
(
	.clk				(clk_24mhz	),	
	.rst_n			(rst			),	
	.adc_cs			(adc_cs		),	
	.adc_clk			(adc_clk		),	
	.adc_dat			(adc_dat		),	
	.adc_done		(adc_done	),	
	.adc_data		(adc_data	)	
);
wire [1:0] k;//反弹系数
wire [7:0] pic_y;
wire [7:0] home;
wire [7:0] position;
adjuster(
	.clk(clk),//12MHz时钟信号
	.rst(rst),//复位信号
	.key_up(key_up),
	.key_down(key_down),
	.k(k),
	.seg_led_1(seg_led_1),
	.seg_led_2(seg_led_2)
);
timer
(
	.clk(clk),//12MHz时钟信号
	.rst(rst),//复位信号
	.button(ball_release_button),
	.k(k),
	.home(home),
	.position(position)//计时信号
);
assign home = (adc_data * 142)>>8;
assign pic_y = ball_release_button ? position : home;


endmodule