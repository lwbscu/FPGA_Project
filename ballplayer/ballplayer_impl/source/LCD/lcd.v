module  lcd
(
    input           	clk			,
    input           	rst_n		   ,
	input wire [8:0] y,
	input wire [8:0] x,
    
    output          	lcd_rst     ,
	 output				lcd_blk		,
    output          	lcd_dc      ,
    output          	lcd_sclk    ,
    output          	lcd_mosi    ,
    output          	lcd_cs      
	,output led1      
	,output led2
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
wire			show_pic_done;

wire            show_char_done     ;  
wire     [8:0]  rom_addr;
wire    [239:0]   rom_q;
wire				 clk_50MHz;

wire    [8:0]   draw_line_data     ;
wire            en_write_draw_line  ;
wire			draw_line_done;


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
    .show_pic_done         (show_pic_done           ),
    .draw_line_data         (draw_line_data      ),
    .en_write_draw_line     (en_write_draw_line  ),
    .draw_line_done              (draw_line_done           ),

	 .show_pic_flag	      (show_pic_flag     ),
    .draw_line_flag    	(draw_line_flag), 
    .data                   (data                ),
    .en_write               (en_write            )
	//,.led(led)
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
//draw_line  lcd_draw_line_inst
//(
    //.sys_clk			(clk_50MHz    ),
    //.sys_rst_n        	(rst_n        ),
    //.wr_done          	(wr_done      ),
    //.draw_line_flag    	(show_pic_flag), 
	//.y_coord			(x),
	//.draw_line_data    	(show_pic_data     ),   
	//.draw_line_done    	(show_pic_done     ),   
    //.en_write_draw_line  (en_write_show_pic )
//);
lcd_show_pic  lcd_show_pic_inst
(
    .sys_clk			(clk_50MHz    ),
    .sys_rst_n        	(rst_n        ),
    .wr_done          	(wr_done      ),
    .show_pic_flag    	(show_pic_flag), 
	.rom_addr	 		(rom_addr), 
	.rom_q				(rom_q),
	.show_pic_data    	(show_pic_data     ),   
	.show_pic_done    	(show_pic_done     ),   
    .en_write_show_pic  (en_write_show_pic )  
);

draw_line  lcd_draw_line_inst
(
    .sys_clk			(clk_50MHz    ),
    .sys_rst_n        	(rst_n        ),
    .wr_done          	(wr_done      ),
    .draw_line_flag    	(draw_line_flag), 
	.y_coord			(x),
	.draw_line_data    	(draw_line_data     ),   
	.draw_line_done    	(draw_line_done     ),   
    .en_write_draw_line  (en_write_draw_line )  
);
pic_ram pic_ram_u0
(
	.address(rom_addr), 
	.q(rom_q),
	.offset(y)
);

//line_ram line_ram_u0
//(
	//.address(rom_addr), 
	//.q(rom_q)
//);
endmodule