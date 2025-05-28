// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Sun Feb 16 17:39:42 2025
//
// Verilog Description of module picture_display
//

module picture_display (clk, rst_n, lcd_rst, lcd_blk, lcd_dc, lcd_sclk, 
            lcd_mosi, lcd_cs) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(19[9:24])
    input clk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(21[22:25])
    input rst_n;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(22[22:27])
    output lcd_rst;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(24[22:29])
    output lcd_blk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(25[13:20])
    output lcd_dc;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(26[22:28])
    output lcd_sclk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(27[22:30])
    output lcd_mosi;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(28[22:30])
    output lcd_cs;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(29[22:28])
    
    wire clk_c /* synthesis is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(21[22:25])
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    
    wire rst_n_c, lcd_rst_c, lcd_dc_c_8, lcd_sclk_c, lcd_mosi_c, lcd_cs_c, 
        GND_net;
    wire [8:0]data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(32[17:21])
    
    wire wr_done;
    wire [8:0]init_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(36[17:26])
    
    wire en_write_init;
    wire [8:0]show_pic_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(46[17:30])
    
    wire en_write_show_pic;
    wire [8:0]rom_addr;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(49[17:25])
    
    wire n5568;
    wire [3:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(36[17:22])
    wire [3:0]cnt_sclk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(42[17:25])
    
    wire clk_50MHz_enable_94;
    wire [3:0]state_3__N_25;
    
    wire clk_50MHz_enable_50;
    wire [1:0]cnt1_adj_929;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(19[17:21])
    wire [5:0]state_adj_931;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(47[13:18])
    wire [6:0]cnt_s2_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(57[13:23])
    wire [3:0]state_adj_936;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(45[17:22])
    wire [2:0]cnt_rom_prepare;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(55[17:32])
    wire [239:0]temp;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(62[19:23])
    
    wire length_num_flag;
    wire [3:0]state_3__N_574;
    
    wire clk_50MHz_enable_97, n6589, n4469, n6548, n5592, n6902, 
        n12;
    wire [239:0]temp_239__N_311;
    
    wire n20, n6577, n5, n1530, n6, n6403, clk_50MHz_enable_59, 
        VCC_net, n4411, clk_50MHz_enable_61, n6608, n6606;
    
    VLO i1 (.Z(GND_net));
    pic_ram pic_ram_u0 (.rom_addr({rom_addr}), .n12(n12), .n6(n6), .n5592(n5592), 
            .n5568(n5568), .n4469(n4469), .n6548(n6548), .n6403(n6403), 
            .n6577(n6577), .n6606(n6606), .\temp[14] (temp[14]), .\temp_239__N_311[13] (temp_239__N_311[13])) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(115[9] 119[2])
    OB lcd_dc_pad (.I(lcd_dc_c_8), .O(lcd_dc));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(26[22:28])
    OB lcd_blk_pad (.I(VCC_net), .O(lcd_blk));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(25[13:20])
    OB lcd_sclk_pad (.I(lcd_sclk_c), .O(lcd_sclk));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(27[22:30])
    OB lcd_rst_pad (.I(lcd_rst_c), .O(lcd_rst));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(24[22:29])
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 i503_2_lut (.A(wr_done), .B(state_adj_931[4]), .Z(clk_50MHz_enable_50)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam i503_2_lut.init = 16'hbbbb;
    LUT4 i1_4_lut (.A(cnt_sclk[3]), .B(n6608), .C(state[2]), .D(cnt_sclk[2]), 
         .Z(clk_50MHz_enable_97)) /* synthesis lut_function=(!(A+(B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i1_4_lut.init = 16'h1150;
    IB rst_n_pad (.I(rst_n), .O(rst_n_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(22[22:27])
    IB clk_pad (.I(clk), .O(clk_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(21[22:25])
    OB lcd_cs_pad (.I(lcd_cs_c), .O(lcd_cs));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(29[22:28])
    OB lcd_mosi_pad (.I(lcd_mosi_c), .O(lcd_mosi));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(28[22:30])
    LUT4 i5032_2_lut_rep_99 (.A(cnt_sclk[0]), .B(cnt_sclk[1]), .Z(n6608)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i5032_2_lut_rep_99.init = 16'heeee;
    LUT4 i5178_3_lut_rep_80_4_lut (.A(cnt_sclk[0]), .B(cnt_sclk[1]), .C(cnt_sclk[3]), 
         .D(cnt_sclk[2]), .Z(n6589)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i5178_3_lut_rep_80_4_lut.init = 16'h0100;
    LUT4 i500_2_lut_rep_101 (.A(wr_done), .B(state_adj_931[2]), .Z(clk_50MHz_enable_61)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam i500_2_lut_rep_101.init = 16'hbbbb;
    LUT4 i1011_2_lut_3_lut (.A(wr_done), .B(state_adj_931[2]), .C(cnt_s2_num[0]), 
         .Z(n20)) /* synthesis lut_function=(!(A (C)+!A !(B (C)+!B !(C)))) */ ;
    defparam i1011_2_lut_3_lut.init = 16'h4b4b;
    GSR GSR_INST (.GSR(rst_n_c));
    LUT4 i497_4_lut_rep_105 (.A(state_adj_931[5]), .B(state_3__N_574[1]), 
         .C(cnt1_adj_929[0]), .D(cnt1_adj_929[1]), .Z(clk_50MHz_enable_59)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;
    defparam i497_4_lut_rep_105.init = 16'hceee;
    LUT4 i1013_2_lut_4_lut (.A(state_adj_931[5]), .B(state_3__N_574[1]), 
         .C(cnt1_adj_929[0]), .D(cnt1_adj_929[1]), .Z(n5)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B (C)+!B !(C)))) */ ;
    defparam i1013_2_lut_4_lut.init = 16'h3e1e;
    LUT4 i504_4_lut (.A(state_adj_936[2]), .B(length_num_flag), .C(n4411), 
         .D(cnt_rom_prepare[2]), .Z(clk_50MHz_enable_94)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;
    defparam i504_4_lut.init = 16'hceee;
    lcd_show_pic lcd_show_pic_inst (.rom_addr({rom_addr}), .clk_50MHz(clk_50MHz), 
            .wr_done(wr_done), .n6606(n6606), .length_num_flag(length_num_flag), 
            .\show_pic_data[0] (show_pic_data[0]), .GND_net(GND_net), .\cnt_rom_prepare[2] (cnt_rom_prepare[2]), 
            .n6(n6), .n6548(n6548), .\state[2] (state_adj_936[2]), .n6577(n6577), 
            .n12(n12), .\show_pic_data[8] (show_pic_data[8]), .\temp[14] (temp[14]), 
            .\temp_239__N_311[13] (temp_239__N_311[13]), .n6403(n6403), 
            .n5592(n5592), .n5568(n5568), .\show_pic_data[1] (show_pic_data[1]), 
            .\show_pic_data[2] (show_pic_data[2]), .\show_pic_data[3] (show_pic_data[3]), 
            .\show_pic_data[4] (show_pic_data[4]), .\show_pic_data[6] (show_pic_data[6]), 
            .\show_pic_data[7] (show_pic_data[7]), .n4469(n4469), .en_write_show_pic(en_write_show_pic), 
            .clk_50MHz_enable_94(clk_50MHz_enable_94), .\state_3__N_574[1] (state_3__N_574[1]), 
            .n4411(n4411)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(103[15] 113[2])
    lcd_init lcd_init_inst (.GND_net(GND_net), .clk_50MHz(clk_50MHz), .clk_50MHz_enable_50(clk_50MHz_enable_50), 
            .init_data({init_data}), .clk_50MHz_enable_61(clk_50MHz_enable_61), 
            .state({state_adj_931[5:4], Open_0, Open_1, Open_2, Open_3}), 
            .n6902(n6902), .\cnt_s2_num[0] (cnt_s2_num[0]), .n1530(n1530), 
            .\state[2] (state_adj_931[2]), .en_write_init(en_write_init), 
            .lcd_rst_c(lcd_rst_c), .n20(n20)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(91[11] 101[2])
    lcd_write lcd_write_inst (.clk_50MHz(clk_50MHz), .lcd_cs_c(lcd_cs_c), 
            .wr_done(wr_done), .lcd_sclk_c(lcd_sclk_c), .cnt_sclk({cnt_sclk}), 
            .n6589(n6589), .\data[5] (data[5]), .\data[6] (data[6]), .n6608(n6608), 
            .\state[2] (state[2]), .\data[4] (data[4]), .lcd_mosi_c(lcd_mosi_c), 
            .clk_50MHz_enable_97(clk_50MHz_enable_97), .\data[0] (data[0]), 
            .\data[1] (data[1]), .n1530(n1530), .\state_3__N_25[1] (state_3__N_25[1]), 
            .\data[7] (data[7]), .\data[2] (data[2]), .\data[3] (data[3])) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(62[12] 74[2])
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    LUT4 m1_lut (.Z(n6902)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    control control_inst (.cnt1({cnt1_adj_929}), .clk_50MHz(clk_50MHz), 
            .\state_3__N_574[1] (state_3__N_574[1]), .n5(n5), .\state_3__N_25[1] (state_3__N_25[1]), 
            .\data[0] (data[0]), .init_data({init_data}), .\show_pic_data[0] (show_pic_data[0]), 
            .\state[5] (state_adj_931[5]), .lcd_dc_c_8(lcd_dc_c_8), .\data[7] (data[7]), 
            .\data[6] (data[6]), .\data[5] (data[5]), .\data[4] (data[4]), 
            .\data[3] (data[3]), .\data[2] (data[2]), .\data[1] (data[1]), 
            .clk_50MHz_enable_59(clk_50MHz_enable_59), .\show_pic_data[8] (show_pic_data[8]), 
            .\show_pic_data[7] (show_pic_data[7]), .\show_pic_data[6] (show_pic_data[6]), 
            .\show_pic_data[3] (show_pic_data[3]), .\show_pic_data[4] (show_pic_data[4]), 
            .\show_pic_data[2] (show_pic_data[2]), .\show_pic_data[1] (show_pic_data[1]), 
            .en_write_init(en_write_init), .en_write_show_pic(en_write_show_pic)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(76[10] 89[2])
    pll pll_u1 (.clk_c(clk_c), .clk_50MHz(clk_50MHz), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(56[5] 60[3])
    VHI i5436 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module pic_ram
//

module pic_ram (rom_addr, n12, n6, n5592, n5568, n4469, n6548, 
            n6403, n6577, n6606, \temp[14] , \temp_239__N_311[13] ) /* synthesis syn_module_defined=1 */ ;
    input [8:0]rom_addr;
    output n12;
    output n6;
    output n5592;
    output n5568;
    output n4469;
    input n6548;
    output n6403;
    output n6577;
    input n6606;
    input \temp[14] ;
    output \temp_239__N_311[13] ;
    
    
    wire n6565, n6609;
    
    LUT4 i23_3_lut (.A(rom_addr[2]), .B(rom_addr[0]), .C(rom_addr[1]), 
         .Z(n12)) /* synthesis lut_function=(!(A (B+(C))+!A !(B (C)))) */ ;
    defparam i23_3_lut.init = 16'h4242;
    LUT4 i2_2_lut (.A(rom_addr[7]), .B(rom_addr[8]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[13:19])
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i2_3_lut_4_lut (.A(n12), .B(n6565), .C(n5592), .D(n5568), .Z(n4469)) /* synthesis lut_function=(A (B (C (D)))+!A (C (D))) */ ;
    defparam i2_3_lut_4_lut.init = 16'hd000;
    LUT4 i3298_2_lut_rep_100 (.A(rom_addr[6]), .B(rom_addr[5]), .Z(n6609)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3298_2_lut_rep_100.init = 16'h8888;
    LUT4 n165_bdd_2_lut_5244_3_lut (.A(rom_addr[6]), .B(rom_addr[5]), .C(n6548), 
         .Z(n6403)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam n165_bdd_2_lut_5244_3_lut.init = 16'h8080;
    LUT4 i3_3_lut_rep_68_4_lut (.A(rom_addr[6]), .B(rom_addr[5]), .C(n6), 
         .D(rom_addr[4]), .Z(n6577)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i3_3_lut_rep_68_4_lut.init = 16'hf7ff;
    LUT4 i5020_2_lut_rep_56_4_lut (.A(rom_addr[4]), .B(n6), .C(n6609), 
         .D(rom_addr[3]), .Z(n6565)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[13:19])
    defparam i5020_2_lut_rep_56_4_lut.init = 16'hffdf;
    LUT4 temp_239__I_0_i14_3_lut_4_lut (.A(n12), .B(n6565), .C(n6606), 
         .D(\temp[14] ), .Z(\temp_239__N_311[13] )) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C+(D)))+!A (C+!(D)))) */ ;
    defparam temp_239__I_0_i14_3_lut_4_lut.init = 16'h2f20;
    LUT4 i2_3_lut_4_lut_adj_73 (.A(rom_addr[0]), .B(n6577), .C(rom_addr[3]), 
         .D(rom_addr[1]), .Z(n5568)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i2_3_lut_4_lut_adj_73.init = 16'hfeff;
    LUT4 i3_4_lut (.A(rom_addr[1]), .B(rom_addr[0]), .C(n6577), .D(rom_addr[3]), 
         .Z(n5592)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;
    defparam i3_4_lut.init = 16'hfffb;
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module lcd_show_pic
//

module lcd_show_pic (rom_addr, clk_50MHz, wr_done, n6606, length_num_flag, 
            \show_pic_data[0] , GND_net, \cnt_rom_prepare[2] , n6, n6548, 
            \state[2] , n6577, n12, \show_pic_data[8] , \temp[14] , 
            \temp_239__N_311[13] , n6403, n5592, n5568, \show_pic_data[1] , 
            \show_pic_data[2] , \show_pic_data[3] , \show_pic_data[4] , 
            \show_pic_data[6] , \show_pic_data[7] , n4469, en_write_show_pic, 
            clk_50MHz_enable_94, \state_3__N_574[1] , n4411) /* synthesis syn_module_defined=1 */ ;
    output [8:0]rom_addr;
    input clk_50MHz;
    input wr_done;
    output n6606;
    output length_num_flag;
    output \show_pic_data[0] ;
    input GND_net;
    output \cnt_rom_prepare[2] ;
    input n6;
    output n6548;
    output \state[2] ;
    input n6577;
    input n12;
    output \show_pic_data[8] ;
    output \temp[14] ;
    input \temp_239__N_311[13] ;
    input n6403;
    input n5592;
    input n5568;
    output \show_pic_data[1] ;
    output \show_pic_data[2] ;
    output \show_pic_data[3] ;
    output \show_pic_data[4] ;
    output \show_pic_data[6] ;
    output \show_pic_data[7] ;
    input n4469;
    output en_write_show_pic;
    input clk_50MHz_enable_94;
    input \state_3__N_574[1] ;
    output n4411;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    
    wire clk_50MHz_enable_58;
    wire [8:0]cnt_length_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    wire [15:0]n334;
    
    wire cnt_set_windows_3__N_590, the1_wr_done;
    wire [3:0]state_3__N_578;
    
    wire state1_finish_flag_N_877;
    wire [239:0]temp;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(62[19:23])
    
    wire clk_50MHz_enable_32;
    wire [9:0]cnt_wr_color_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(71[17:34])
    
    wire clk_50MHz_enable_70, cnt_wr_color_data_9__N_857;
    wire [9:0]n1127;
    
    wire length_num_flag_N_879, clk_50MHz_enable_76;
    wire [8:0]show_pic_data_8__N_291;
    wire [3:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(45[17:22])
    
    wire n3072;
    wire [3:0]state_3__N_582;
    
    wire cnt_length_num_8__N_845;
    wire [8:0]n41;
    
    wire n6_c, n957;
    wire [2:0]cnt_rom_prepare;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(55[17:32])
    wire [2:0]n1;
    
    wire n5493, n6_adj_918, n956, n6575, n6625, n2123;
    wire [8:0]show_pic_data_8__N_867;
    
    wire n5509, n6624;
    wire [2:0]n68;
    
    wire n5508, n5492, n5491, n6400, n6399, n5507, n6594, n4, 
        n5490, n5506, n5489, n10, n6554, n6560, n6584, n6553;
    wire [8:0]show_pic_data_8__N_858;
    
    wire n4_adj_920;
    wire [239:0]temp_239__N_311;
    
    wire clk_50MHz_enable_77, n5992;
    wire [15:0]n33;
    
    wire n3077, n6549, n2137, n6377, n24, n2070, n2072, n2073, 
        n11, n12_adj_921, n13, n10_adj_922;
    
    FD1P3AX rom_addr_i0_i0 (.D(cnt_length_num[0]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i0.GSR = "ENABLED";
    FD1P3AY cnt_set_windows_FSM_i0_i0 (.D(n334[15]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i0.GSR = "ENABLED";
    FD1S3AX the1_wr_done_107 (.D(wr_done), .CK(clk_50MHz), .Q(the1_wr_done)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(97[10] 100[30])
    defparam the1_wr_done_107.GSR = "ENABLED";
    FD1S3AX state1_finish_flag_109 (.D(state1_finish_flag_N_877), .CK(clk_50MHz), 
            .Q(state_3__N_578[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(113[10] 116[36])
    defparam state1_finish_flag_109.GSR = "ENABLED";
    FD1P3IX temp_i0 (.D(temp[1]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i0.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i0 (.D(n1127[0]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i0.GSR = "ENABLED";
    FD1S3AX length_num_flag_113 (.D(length_num_flag_N_879), .CK(clk_50MHz), 
            .Q(length_num_flag)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(153[9] 160[32])
    defparam length_num_flag_113.GSR = "ENABLED";
    FD1P3AX data_i0 (.D(show_pic_data_8__N_291[0]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[0] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i0.GSR = "ENABLED";
    FD1S3IX state_FSM_i0 (.D(state_3__N_582[3]), .CK(clk_50MHz), .CD(n3072), 
            .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i0 (.D(n41[0]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i0.GSR = "ENABLED";
    LUT4 i4_4_lut (.A(n334[7]), .B(n334[1]), .C(n334[3]), .D(n6_c), 
         .Z(n957)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut (.A(n334[2]), .B(n334[6]), .Z(n6_c)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_2_lut.init = 16'heeee;
    FD1S3IX cnt_rom_prepare__i0 (.D(n1[0]), .CK(clk_50MHz), .CD(length_num_flag), 
            .Q(cnt_rom_prepare[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(122[10] 125[51])
    defparam cnt_rom_prepare__i0.GSR = "ENABLED";
    CCU2D add_75_11 (.A0(cnt_wr_color_data[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5493), .S0(n1127[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_11.INIT0 = 16'h5aaa;
    defparam add_75_11.INIT1 = 16'h0000;
    defparam add_75_11.INJECT1_0 = "NO";
    defparam add_75_11.INJECT1_1 = "NO";
    LUT4 i4_4_lut_adj_61 (.A(n334[15]), .B(n334[11]), .C(n334[13]), .D(n6_adj_918), 
         .Z(n956)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i4_4_lut_adj_61.init = 16'hfffe;
    LUT4 mux_376_i9_4_lut_4_lut (.A(n6575), .B(n6625), .C(n957), .D(n2123), 
         .Z(show_pic_data_8__N_867[8])) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam mux_376_i9_4_lut_4_lut.init = 16'haaa8;
    CCU2D cnt_length_num_474_add_4_9 (.A0(cnt_length_num[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[8]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5509), .S0(n41[7]), .S1(n41[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_9.INJECT1_0 = "NO";
    defparam cnt_length_num_474_add_4_9.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_62 (.A(n334[12]), .B(n334[14]), .Z(n6_adj_918)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_2_lut_adj_62.init = 16'heeee;
    LUT4 show_pic_data_8__I_0_i3_3_lut_4_lut (.A(cnt_wr_color_data[0]), .B(n6624), 
         .C(state[1]), .D(show_pic_data_8__N_867[2]), .Z(show_pic_data_8__N_291[2])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A ((D)+!C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(202[10] 208[22])
    defparam show_pic_data_8__I_0_i3_3_lut_4_lut.init = 16'hfd0d;
    LUT4 i686_2_lut (.A(cnt_rom_prepare[1]), .B(cnt_rom_prepare[0]), .Z(n68[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(125[28:50])
    defparam i686_2_lut.init = 16'h6666;
    LUT4 i693_3_lut (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[1]), .C(cnt_rom_prepare[0]), 
         .Z(n68[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(125[28:50])
    defparam i693_3_lut.init = 16'h6a6a;
    CCU2D cnt_length_num_474_add_4_7 (.A0(cnt_length_num[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5508), .COUT(n5509), .S0(n41[5]), 
          .S1(n41[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_7.INJECT1_0 = "NO";
    defparam cnt_length_num_474_add_4_7.INJECT1_1 = "NO";
    CCU2D add_75_9 (.A0(cnt_wr_color_data[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5492), .COUT(n5493), .S0(n1127[7]), .S1(n1127[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_9.INIT0 = 16'h5aaa;
    defparam add_75_9.INIT1 = 16'h5aaa;
    defparam add_75_9.INJECT1_0 = "NO";
    defparam add_75_9.INJECT1_1 = "NO";
    CCU2D add_75_7 (.A0(cnt_wr_color_data[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5491), .COUT(n5492), .S0(n1127[5]), .S1(n1127[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_7.INIT0 = 16'h5aaa;
    defparam add_75_7.INIT1 = 16'h5aaa;
    defparam add_75_7.INJECT1_0 = "NO";
    defparam add_75_7.INJECT1_1 = "NO";
    LUT4 n6400_bdd_4_lut (.A(n6400), .B(n6399), .C(rom_addr[1]), .D(n6), 
         .Z(n6548)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;
    defparam n6400_bdd_4_lut.init = 16'h00ca;
    CCU2D cnt_length_num_474_add_4_5 (.A0(cnt_length_num[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5507), .COUT(n5508), .S0(n41[3]), 
          .S1(n41[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_5.INJECT1_0 = "NO";
    defparam cnt_length_num_474_add_4_5.INJECT1_1 = "NO";
    LUT4 i2019_1_lut (.A(\state[2] ), .Z(n3072)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i2019_1_lut.init = 16'h5555;
    LUT4 i2_4_lut (.A(cnt_length_num[7]), .B(n6594), .C(cnt_length_num[6]), 
         .D(n4), .Z(state_3__N_582[3])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;
    defparam i2_4_lut.init = 16'h0400;
    CCU2D add_75_5 (.A0(cnt_wr_color_data[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5490), .COUT(n5491), .S0(n1127[3]), .S1(n1127[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_5.INIT0 = 16'h5aaa;
    defparam add_75_5.INIT1 = 16'h5aaa;
    defparam add_75_5.INJECT1_0 = "NO";
    defparam add_75_5.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_63 (.A(cnt_length_num[8]), .B(length_num_flag), .Z(n4)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(166[13:45])
    defparam i1_2_lut_adj_63.init = 16'h8888;
    CCU2D cnt_length_num_474_add_4_3 (.A0(cnt_length_num[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n5506), .COUT(n5507), .S0(n41[1]), 
          .S1(n41[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_length_num_474_add_4_3.INJECT1_0 = "NO";
    defparam cnt_length_num_474_add_4_3.INJECT1_1 = "NO";
    CCU2D add_75_3 (.A0(cnt_wr_color_data[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5489), .COUT(n5490), .S0(n1127[1]), .S1(n1127[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_3.INIT0 = 16'h5aaa;
    defparam add_75_3.INIT1 = 16'h5aaa;
    defparam add_75_3.INJECT1_0 = "NO";
    defparam add_75_3.INJECT1_1 = "NO";
    LUT4 i4_4_lut_adj_64 (.A(cnt_length_num[1]), .B(cnt_length_num[3]), 
         .C(cnt_length_num[0]), .D(cnt_length_num[5]), .Z(n10)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(166[13:45])
    defparam i4_4_lut_adj_64.init = 16'h8000;
    CCU2D cnt_length_num_474_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_length_num[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n5506), .S1(n41[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474_add_4_1.INIT0 = 16'hF000;
    defparam cnt_length_num_474_add_4_1.INIT1 = 16'h0555;
    defparam cnt_length_num_474_add_4_1.INJECT1_0 = "NO";
    defparam cnt_length_num_474_add_4_1.INJECT1_1 = "NO";
    LUT4 show_pic_data_8__I_0_i8_3_lut_4_lut (.A(n6554), .B(n6560), .C(state[1]), 
         .D(n6584), .Z(show_pic_data_8__N_291[7])) /* synthesis lut_function=(!(A (C+!(D))+!A !(B (C+(D))+!B !(C+!(D))))) */ ;
    defparam show_pic_data_8__I_0_i8_3_lut_4_lut.init = 16'h4f40;
    LUT4 i1_2_lut_rep_44_3_lut (.A(n6577), .B(rom_addr[3]), .C(n12), .Z(n6553)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_rep_44_3_lut.init = 16'h1010;
    LUT4 i1099_2_lut (.A(\state[2] ), .B(\show_pic_data[8] ), .Z(show_pic_data_8__N_858[8])) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(202[10] 208[22])
    defparam i1099_2_lut.init = 16'heeee;
    LUT4 i5_3_lut_rep_85 (.A(cnt_length_num[4]), .B(n10), .C(cnt_length_num[2]), 
         .Z(n6594)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(166[13:45])
    defparam i5_3_lut_rep_85.init = 16'h8080;
    LUT4 i1_2_lut_4_lut (.A(cnt_length_num[4]), .B(n10), .C(cnt_length_num[2]), 
         .D(cnt_length_num[6]), .Z(n4_adj_920)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(166[13:45])
    defparam i1_2_lut_4_lut.init = 16'hff80;
    LUT4 i50_3_lut_3_lut_4_lut (.A(n6577), .B(rom_addr[3]), .C(temp[21]), 
         .D(n6606), .Z(temp_239__N_311[20])) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i50_3_lut_3_lut_4_lut.init = 16'h11f0;
    LUT4 i50_3_lut_3_lut_4_lut_adj_65 (.A(n6577), .B(rom_addr[3]), .C(temp[20]), 
         .D(n6606), .Z(temp_239__N_311[19])) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i50_3_lut_3_lut_4_lut_adj_65.init = 16'h11f0;
    FD1P3AX temp_i21 (.D(temp_239__N_311[21]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[21])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i21.GSR = "ENABLED";
    FD1P3AX temp_i20 (.D(temp_239__N_311[20]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[20])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i20.GSR = "ENABLED";
    FD1P3AX temp_i19 (.D(temp_239__N_311[19]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[19])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i19.GSR = "ENABLED";
    FD1P3AX temp_i18 (.D(temp_239__N_311[18]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[18])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i18.GSR = "ENABLED";
    FD1P3AX temp_i17 (.D(temp_239__N_311[17]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[17])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i17.GSR = "ENABLED";
    CCU2D add_75_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_wr_color_data[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n5489), .S1(n1127[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(176[30:54])
    defparam add_75_1.INIT0 = 16'hF000;
    defparam add_75_1.INIT1 = 16'h5555;
    defparam add_75_1.INJECT1_0 = "NO";
    defparam add_75_1.INJECT1_1 = "NO";
    FD1P3AX temp_i16 (.D(temp_239__N_311[16]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[16])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i16.GSR = "ENABLED";
    FD1P3AX temp_i15 (.D(temp_239__N_311[15]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[15])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i15.GSR = "ENABLED";
    FD1P3AX temp_i14 (.D(temp_239__N_311[14]), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(\temp[14] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i14.GSR = "ENABLED";
    FD1P3AX temp_i13 (.D(\temp_239__N_311[13] ), .SP(clk_50MHz_enable_77), 
            .CK(clk_50MHz), .Q(temp[13])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i13.GSR = "ENABLED";
    FD1P3IX temp_i12 (.D(temp[13]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[12])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i12.GSR = "ENABLED";
    FD1P3IX temp_i11 (.D(temp[12]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[11])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i11.GSR = "ENABLED";
    FD1P3IX temp_i10 (.D(temp[11]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[10])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i10.GSR = "ENABLED";
    FD1P3IX temp_i9 (.D(temp[10]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[9])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i9.GSR = "ENABLED";
    FD1P3IX temp_i8 (.D(temp[9]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i8.GSR = "ENABLED";
    FD1P3IX temp_i7 (.D(temp[8]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[7])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i7.GSR = "ENABLED";
    LUT4 i1_3_lut_rep_51 (.A(n334[4]), .B(n334[5]), .C(n957), .Z(n6560)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_3_lut_rep_51.init = 16'h0202;
    LUT4 i1_2_lut_4_lut_adj_66 (.A(n334[4]), .B(n334[5]), .C(n957), .D(n334[8]), 
         .Z(n5992)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_2_lut_4_lut_adj_66.init = 16'h0002;
    LUT4 i50_3_lut_3_lut_4_lut_adj_67 (.A(n6577), .B(rom_addr[3]), .C(temp[17]), 
         .D(n6606), .Z(temp_239__N_311[16])) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i50_3_lut_3_lut_4_lut_adj_67.init = 16'h11f0;
    FD1P3IX temp_i6 (.D(temp[7]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i6.GSR = "ENABLED";
    FD1P3IX temp_i5 (.D(temp[6]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i5.GSR = "ENABLED";
    FD1P3IX temp_i4 (.D(temp[5]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i4.GSR = "ENABLED";
    FD1P3IX temp_i3 (.D(temp[4]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i3.GSR = "ENABLED";
    FD1P3IX temp_i2 (.D(temp[3]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i2.GSR = "ENABLED";
    FD1P3IX temp_i1 (.D(temp[2]), .SP(clk_50MHz_enable_32), .CD(n6606), 
            .CK(clk_50MHz), .Q(temp[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i1.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i15 (.D(n334[14]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[15]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i15.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i14 (.D(n334[13]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i14.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i13 (.D(n334[12]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[13]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i13.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i12 (.D(n334[11]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i12.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i11 (.D(n33[10]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[11]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i11.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i10 (.D(n334[9]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n33[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i10.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i9 (.D(n334[8]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i9.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i8 (.D(n334[7]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i8.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i7 (.D(n334[6]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i7.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i6 (.D(n334[5]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i6.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i5 (.D(n334[4]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i5.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i4 (.D(n334[3]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i4.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i3 (.D(n334[2]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i3.GSR = "ENABLED";
    FD1P3AX cnt_set_windows_FSM_i0_i2 (.D(n334[1]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i2.GSR = "ENABLED";
    LUT4 i51_3_lut_3_lut_4_lut (.A(n6577), .B(rom_addr[3]), .C(temp[16]), 
         .D(n6606), .Z(temp_239__N_311[15])) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i51_3_lut_3_lut_4_lut.init = 16'h11f0;
    FD1P3AX cnt_set_windows_FSM_i0_i1 (.D(n334[0]), .SP(cnt_set_windows_3__N_590), 
            .CK(clk_50MHz), .Q(n334[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_FSM_i0_i1.GSR = "ENABLED";
    LUT4 cnt_length_num_8__I_4_4_lut (.A(cnt_length_num[7]), .B(length_num_flag), 
         .C(cnt_length_num[8]), .D(n4_adj_920), .Z(cnt_length_num_8__N_845)) /* synthesis lut_function=(!(A ((C)+!B)+!A ((C (D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(166[13:64])
    defparam cnt_length_num_8__I_4_4_lut.init = 16'h0c4c;
    LUT4 rom_addr_1__bdd_3_lut (.A(rom_addr[2]), .B(rom_addr[4]), .C(rom_addr[0]), 
         .Z(n6400)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;
    defparam rom_addr_1__bdd_3_lut.init = 16'h0404;
    LUT4 rom_addr_1__bdd_4_lut_5329 (.A(rom_addr[2]), .B(rom_addr[4]), .C(rom_addr[0]), 
         .D(rom_addr[3]), .Z(n6399)) /* synthesis lut_function=(!((B ((D)+!C)+!B !(C (D)))+!A)) */ ;
    defparam rom_addr_1__bdd_4_lut_5329.init = 16'h2080;
    FD1P3AX rom_addr_i0_i8 (.D(cnt_length_num[8]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i8.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i7 (.D(cnt_length_num[7]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[7])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i7.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i6 (.D(cnt_length_num[6]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i6.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i5 (.D(cnt_length_num[5]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i5.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i4 (.D(cnt_length_num[4]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i4.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i3 (.D(cnt_length_num[3]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i3.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i2 (.D(cnt_length_num[2]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i2.GSR = "ENABLED";
    FD1P3AX rom_addr_i0_i1 (.D(cnt_length_num[1]), .SP(clk_50MHz_enable_58), 
            .CK(clk_50MHz), .Q(rom_addr[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[10] 132[37])
    defparam rom_addr_i0_i1.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i1 (.D(n1127[1]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i1.GSR = "ENABLED";
    LUT4 i5184_2_lut_rep_66 (.A(n33[10]), .B(n956), .Z(n6575)) /* synthesis lut_function=(!(A+(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i5184_2_lut_rep_66.init = 16'h1111;
    LUT4 i2_3_lut_4_lut (.A(the1_wr_done), .B(\state[2] ), .C(n6606), 
         .D(state[3]), .Z(clk_50MHz_enable_70)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i2_3_lut_4_lut.init = 16'hfff8;
    PFUMX show_pic_data_8__I_0_i9 (.BLUT(show_pic_data_8__N_858[8]), .ALUT(show_pic_data_8__N_867[8]), 
          .C0(state[1]), .Z(show_pic_data_8__N_291[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;
    LUT4 i1_2_lut_rep_78_3_lut (.A(the1_wr_done), .B(\state[2] ), .C(cnt_wr_color_data[0]), 
         .Z(clk_50MHz_enable_32)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1_2_lut_rep_78_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_3_lut_4_lut (.A(the1_wr_done), .B(\state[2] ), .C(n6606), 
         .D(cnt_wr_color_data[0]), .Z(clk_50MHz_enable_77)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i2024_2_lut_2_lut_3_lut_4_lut (.A(the1_wr_done), .B(\state[2] ), 
         .C(n6606), .D(cnt_wr_color_data[0]), .Z(n3077)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i2024_2_lut_2_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i5210_3_lut_rep_97 (.A(cnt_rom_prepare[1]), .B(\cnt_rom_prepare[2] ), 
         .C(cnt_rom_prepare[0]), .Z(n6606)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[13:35])
    defparam i5210_3_lut_rep_97.init = 16'h2020;
    LUT4 temp_239__N_835_I_0_2_lut_4_lut (.A(cnt_rom_prepare[1]), .B(\cnt_rom_prepare[2] ), 
         .C(cnt_rom_prepare[0]), .D(state[3]), .Z(cnt_wr_color_data_9__N_857)) /* synthesis lut_function=(A (B (D)+!B (C+(D)))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[13:35])
    defparam temp_239__N_835_I_0_2_lut_4_lut.init = 16'hff20;
    LUT4 i1_2_lut_rep_40_3_lut_3_lut_4_lut (.A(n33[10]), .B(n956), .C(n6625), 
         .D(n6560), .Z(n6549)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_2_lut_rep_40_3_lut_3_lut_4_lut.init = 16'h0100;
    LUT4 i1066_4_lut_4_lut (.A(n33[10]), .B(n956), .C(n334[9]), .D(n5992), 
         .Z(show_pic_data_8__N_867[2])) /* synthesis lut_function=(!(A (B)+!A (B+!(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1066_4_lut_4_lut.init = 16'h3332;
    LUT4 show_pic_data_8__N_858_2__bdd_3_lut_3_lut (.A(n33[10]), .B(n956), 
         .C(n2137), .Z(n6377)) /* synthesis lut_function=(!(A (B)+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam show_pic_data_8__N_858_2__bdd_3_lut_3_lut.init = 16'h3232;
    PFUMX i5224 (.BLUT(n6584), .ALUT(n6377), .C0(state[1]), .Z(show_pic_data_8__N_291[3]));
    LUT4 i1079_2_lut (.A(n334[5]), .B(n334[4]), .Z(n2123)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1079_2_lut.init = 16'h4444;
    LUT4 i41_3_lut (.A(n24), .B(temp[19]), .C(n6606), .Z(temp_239__N_311[18])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(140[10] 146[7])
    defparam i41_3_lut.init = 16'hacac;
    LUT4 i1_2_lut_adj_68 (.A(state[1]), .B(the1_wr_done), .Z(cnt_set_windows_3__N_590)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1_2_lut_adj_68.init = 16'h8888;
    LUT4 i1_2_lut_adj_69 (.A(the1_wr_done), .B(n33[10]), .Z(state1_finish_flag_N_877)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(97[10] 100[30])
    defparam i1_2_lut_adj_69.init = 16'h8888;
    LUT4 i1_4_lut (.A(n6553), .B(n6403), .C(n5592), .D(n5568), .Z(n24)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(140[10] 146[7])
    defparam i1_4_lut.init = 16'hefff;
    LUT4 i41_3_lut_adj_70 (.A(n24), .B(temp[18]), .C(n6606), .Z(temp_239__N_311[17])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(140[10] 146[7])
    defparam i41_3_lut_adj_70.init = 16'hacac;
    FD1P3IX cnt_wr_color_data__i2 (.D(n1127[2]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i2.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i3 (.D(n1127[3]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i3.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i4 (.D(n1127[4]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i4.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i5 (.D(n1127[5]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i5.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i6 (.D(n1127[6]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i6.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i7 (.D(n1127[7]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[7])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i7.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i8 (.D(n1127[8]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i8.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i9 (.D(n1127[9]), .SP(clk_50MHz_enable_70), 
            .CD(cnt_wr_color_data_9__N_857), .CK(clk_50MHz), .Q(cnt_wr_color_data[9])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(173[10] 176[55])
    defparam cnt_wr_color_data__i9.GSR = "ENABLED";
    FD1P3AX data_i1 (.D(show_pic_data_8__N_291[1]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[1] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i1.GSR = "ENABLED";
    FD1P3AX data_i2 (.D(show_pic_data_8__N_291[2]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[2] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i2.GSR = "ENABLED";
    FD1P3AX data_i3 (.D(show_pic_data_8__N_291[3]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[3] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i3.GSR = "ENABLED";
    FD1P3AX data_i4 (.D(show_pic_data_8__N_291[4]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[4] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i4.GSR = "ENABLED";
    FD1P3AX data_i6 (.D(show_pic_data_8__N_291[6]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[6] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i6.GSR = "ENABLED";
    FD1P3AX data_i7 (.D(show_pic_data_8__N_291[7]), .SP(clk_50MHz_enable_76), 
            .CK(clk_50MHz), .Q(\show_pic_data[7] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i7.GSR = "ENABLED";
    FD1S3AX data_i8 (.D(show_pic_data_8__N_291[8]), .CK(clk_50MHz), .Q(\show_pic_data[8] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(182[10] 208[22])
    defparam data_i8.GSR = "ENABLED";
    LUT4 temp_239__I_0_i15_3_lut (.A(n4469), .B(temp[15]), .C(n6606), 
         .Z(temp_239__N_311[14])) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(140[10] 146[7])
    defparam temp_239__I_0_i15_3_lut.init = 16'h5c5c;
    FD1P3IX temp_i22 (.D(n6553), .SP(clk_50MHz_enable_77), .CD(n3077), 
            .CK(clk_50MHz), .Q(temp[22])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(138[10] 146[7])
    defparam temp_i22.GSR = "ENABLED";
    LUT4 show_pic_data_8__I_0_i2_4_lut (.A(n6624), .B(n2137), .C(state[1]), 
         .D(n6575), .Z(show_pic_data_8__N_291[1])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[10] 208[22])
    defparam show_pic_data_8__I_0_i2_4_lut.init = 16'hca0a;
    FD1P3AX cnt_length_num_474__i1 (.D(n41[1]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i1.GSR = "ENABLED";
    LUT4 i5213_2_lut_3_lut (.A(cnt_rom_prepare[1]), .B(cnt_rom_prepare[0]), 
         .C(\cnt_rom_prepare[2] ), .Z(clk_50MHz_enable_58)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[13:35])
    defparam i5213_2_lut_3_lut.init = 16'h0404;
    LUT4 state_3__N_571_I_0_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(cnt_rom_prepare[0]), 
         .C(\cnt_rom_prepare[2] ), .D(state[1]), .Z(en_write_show_pic)) /* synthesis lut_function=(A (D)+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(131[13:35])
    defparam state_3__N_571_I_0_3_lut_4_lut.init = 16'hff40;
    FD1P3AX cnt_length_num_474__i2 (.D(n41[2]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i2.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i3 (.D(n41[3]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i3.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i4 (.D(n41[4]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i4.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i5 (.D(n41[5]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i5.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i6 (.D(n41[6]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i6.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i7 (.D(n41[7]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i7.GSR = "ENABLED";
    FD1P3AX cnt_length_num_474__i8 (.D(n41[8]), .SP(cnt_length_num_8__N_845), 
            .CK(clk_50MHz), .Q(cnt_length_num[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(167[27:48])
    defparam cnt_length_num_474__i8.GSR = "ENABLED";
    FD1S3AX state_FSM_i1 (.D(n2070), .CK(clk_50MHz), .Q(\state[2] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    LUT4 i1092_3_lut (.A(n334[8]), .B(n334[9]), .C(n957), .Z(n2137)) /* synthesis lut_function=(A (B)+!A (B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1092_3_lut.init = 16'hcdcd;
    FD1S3AX state_FSM_i2 (.D(n2072), .CK(clk_50MHz), .Q(state[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3JX state_FSM_i3 (.D(n2073), .CK(clk_50MHz), .PD(state[3]), .Q(state[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i3_2_lut (.A(cnt_wr_color_data[8]), .B(cnt_wr_color_data[3]), .Z(n11)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut.init = 16'h8888;
    LUT4 temp_239__I_0_i22_3_lut (.A(n4469), .B(temp[22]), .C(n6606), 
         .Z(temp_239__N_311[21])) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(140[10] 146[7])
    defparam temp_239__I_0_i22_3_lut.init = 16'h5c5c;
    FD1P3IX cnt_rom_prepare__i1 (.D(n68[1]), .SP(clk_50MHz_enable_94), .CD(length_num_flag), 
            .CK(clk_50MHz), .Q(cnt_rom_prepare[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(122[10] 125[51])
    defparam cnt_rom_prepare__i1.GSR = "ENABLED";
    FD1P3IX cnt_rom_prepare__i2 (.D(n68[2]), .SP(clk_50MHz_enable_94), .CD(length_num_flag), 
            .CK(clk_50MHz), .Q(\cnt_rom_prepare[2] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=103, LSE_RLINE=113 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(122[10] 125[51])
    defparam cnt_rom_prepare__i2.GSR = "ENABLED";
    LUT4 i4_3_lut (.A(cnt_wr_color_data[7]), .B(cnt_wr_color_data[5]), .C(cnt_wr_color_data[9]), 
         .Z(n12_adj_921)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;
    defparam i4_3_lut.init = 16'h0202;
    LUT4 show_pic_data_8__I_0_i5_4_lut (.A(n6584), .B(n334[9]), .C(state[1]), 
         .D(n6575), .Z(show_pic_data_8__N_291[4])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[10] 208[22])
    defparam show_pic_data_8__I_0_i5_4_lut.init = 16'hca0a;
    LUT4 show_pic_data_8__I_0_i7_4_lut (.A(cnt_wr_color_data[0]), .B(n6549), 
         .C(state[1]), .D(n6624), .Z(show_pic_data_8__N_291[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[10] 208[22])
    defparam show_pic_data_8__I_0_i7_4_lut.init = 16'hcfca;
    LUT4 i2_2_lut (.A(state[1]), .B(\state[2] ), .Z(clk_50MHz_enable_76)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i1009_2_lut (.A(cnt_rom_prepare[0]), .B(clk_50MHz_enable_94), .Z(n1[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(122[10] 125[51])
    defparam i1009_2_lut.init = 16'h6666;
    LUT4 i87_2_lut_rep_115 (.A(\state[2] ), .B(temp[0]), .Z(n6624)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[13:55])
    defparam i87_2_lut_rep_115.init = 16'h2222;
    LUT4 i3356_2_lut_rep_75_3_lut (.A(\state[2] ), .B(temp[0]), .C(cnt_wr_color_data[0]), 
         .Z(n6584)) /* synthesis lut_function=(!(A (B (C))+!A (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[13:55])
    defparam i3356_2_lut_rep_75_3_lut.init = 16'h2f2f;
    LUT4 i1026_4_lut (.A(\state[2] ), .B(state_3__N_578[2]), .C(state_3__N_582[3]), 
         .D(state[1]), .Z(n2070)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1026_4_lut.init = 16'hce0a;
    LUT4 i370_2_lut_rep_116 (.A(n334[8]), .B(n334[9]), .Z(n6625)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i370_2_lut_rep_116.init = 16'heeee;
    LUT4 i1_4_lut_adj_71 (.A(clk_50MHz_enable_32), .B(n13), .C(n11), .D(n12_adj_921), 
         .Z(length_num_flag_N_879)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_4_lut_adj_71.init = 16'h8000;
    LUT4 i1028_4_lut (.A(state[1]), .B(\state_3__N_574[1] ), .C(state_3__N_578[2]), 
         .D(state[0]), .Z(n2072)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1028_4_lut.init = 16'hce0a;
    LUT4 i1029_2_lut (.A(state[0]), .B(\state_3__N_574[1] ), .Z(n2073)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1029_2_lut.init = 16'h2222;
    LUT4 show_pic_data_8__I_0_i1_4_lut (.A(n6624), .B(n6575), .C(state[1]), 
         .D(n10_adj_922), .Z(show_pic_data_8__N_291[0])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(197[10] 208[22])
    defparam show_pic_data_8__I_0_i1_4_lut.init = 16'hca0a;
    LUT4 i1_4_lut_adj_72 (.A(n6625), .B(n957), .C(n334[4]), .D(n334[5]), 
         .Z(n10_adj_922)) /* synthesis lut_function=(A+!(B+!(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(183[9] 196[16])
    defparam i1_4_lut_adj_72.init = 16'hbbba;
    LUT4 i3361_2_lut (.A(cnt_rom_prepare[0]), .B(cnt_rom_prepare[1]), .Z(n4411)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i3361_2_lut.init = 16'heeee;
    LUT4 i376_2_lut_rep_45_3_lut_4_lut (.A(n334[8]), .B(n334[9]), .C(n956), 
         .D(n33[10]), .Z(n6554)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i376_2_lut_rep_45_3_lut_4_lut.init = 16'hfffe;
    LUT4 i5_4_lut (.A(cnt_wr_color_data[6]), .B(cnt_wr_color_data[4]), .C(cnt_wr_color_data[2]), 
         .D(cnt_wr_color_data[1]), .Z(n13)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i5_4_lut.init = 16'h8000;
    
endmodule
//
// Verilog Description of module lcd_init
//

module lcd_init (GND_net, clk_50MHz, clk_50MHz_enable_50, init_data, 
            clk_50MHz_enable_61, state, n6902, \cnt_s2_num[0] , n1530, 
            \state[2] , en_write_init, lcd_rst_c, n20) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input clk_50MHz;
    input clk_50MHz_enable_50;
    output [8:0]init_data;
    input clk_50MHz_enable_61;
    output [5:0]state;
    input n6902;
    output \cnt_s2_num[0] ;
    input n1530;
    output \state[2] ;
    output en_write_init;
    output lcd_rst_c;
    input n20;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    
    wire n5496;
    wire [22:0]cnt_150ms;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(55[13:22])
    wire [22:0]n97;
    
    wire n5497, n5495;
    wire [17:0]cnt_s4_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(59[13:23])
    
    wire n1544;
    wire [17:0]n357;
    wire [8:0]init_data_8__N_102;
    wire [6:0]cnt_s2_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(57[13:23])
    
    wire n1542;
    wire [6:0]n159;
    
    wire lcd_rst_high_flag, n3075, lcd_rst_high_flag_N_275, clk_50MHz_enable_8, 
        n6616, n4451, n5494, n6578, n6627, n8;
    wire [5:0]state_5__N_185;
    
    wire n6555, n6604, n6900, n6582, n6220, n6626, n6585, n6630, 
        n6580, n6629, n5923, n5925, n6632, n6633, n6603, n6600, 
        n4235, n8_adj_894, n5481, n5482, n6568, n2924, n2878, 
        n4, n6579, n6636, n6174, n6, n5939, n7, n6188, n33, 
        n6558, n6618;
    wire [8:0]init_data_8__N_236;
    
    wire n6563;
    wire [5:0]state_5__N_197;
    
    wire cnt_s4_num_done_N_279, n6569;
    wire [5:0]state_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(47[13:18])
    wire [5:0]state_5__N_191;
    
    wire n2082;
    wire [5:0]state_5__N_179;
    
    wire n2084, n5961, n6066, n6133, n12, n2890;
    wire [5:0]state_5__N_173;
    
    wire n2086, n6035, n6077, n2087, n6617, n5926, n6033, n9, 
        n7_adj_895, n6572, n6571, n5480, n6599, n6596, n6595, 
        n6623, n6602, n6601, n4240, cnt_150ms_22__N_226, n6619, 
        n6406, n6607, n6583, n6557, n6573, n6598, n6002, n8_adj_896, 
        n6574, n6552, n6551, n6592, n6029, n6593, n6005, n5945, 
        n10, n8_adj_897, n4370, n6024, n6605, n6622, n6566, n6076, 
        n6621, n6567, n6145, n6212, n6525, n10_adj_898, n5988;
    wire [8:0]init_data_8__N_245;
    
    wire n4_adj_899, n6591, n4553, n5504, n5503, n4_adj_900, n6612, 
        n13, n6155, n6613, n5971, n6556, n6011, n6_adj_901, n13_adj_902, 
        n32, n6027, n6016, n7_adj_903, n8_adj_904, n4603, n7_adj_905, 
        n8_adj_906, n84, n4523, n6570, n5986, n6635, n5928, n48, 
        n4_adj_907, n6121, n6178, n4233, n9_adj_908, n8_adj_909, 
        n7_adj_910, n85, n88, n6590, n23, n5982, n5675, n17, 
        n13_adj_911, n12_adj_912, n51, n6611, n6186, n6_adj_913, 
        n5985, n5930, n36, n6559, n7_adj_914, n6172, n4448, n5485, 
        n5486, n6_adj_915, n4348, n6_adj_916, n5483, n5484, n6170, 
        n4429, n4246, n28, n5, n7_adj_917, n73, n5502, n5488, 
        n5487, n5501, n5500, n5499, n6089, n6588, n52, n5498, 
        n2080, n6628, n6236;
    
    CCU2D cnt_150ms_473_add_4_7 (.A0(cnt_150ms[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5496), .COUT(n5497), .S0(n97[5]), .S1(n97[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_7.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_7.INJECT1_1 = "NO";
    CCU2D cnt_150ms_473_add_4_5 (.A0(cnt_150ms[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5495), .COUT(n5496), .S0(n97[3]), .S1(n97[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_5.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_5.INJECT1_1 = "NO";
    FD1P3IX cnt_s4_num__i0 (.D(n357[0]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i0.GSR = "ENABLED";
    FD1S3AX init_data_i0 (.D(init_data_8__N_102[0]), .CK(clk_50MHz), .Q(init_data[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i0.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i4 (.D(n159[4]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i4.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i3 (.D(n159[3]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i3.GSR = "ENABLED";
    FD1S3IX lcd_rst_high_flag_171 (.D(lcd_rst_high_flag_N_275), .CK(clk_50MHz), 
            .CD(n3075), .Q(lcd_rst_high_flag)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[10] 101[35])
    defparam lcd_rst_high_flag_171.GSR = "ENABLED";
    FD1P3AX state_FSM_i0 (.D(n6902), .SP(clk_50MHz_enable_8), .CK(clk_50MHz), 
            .Q(state[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    LUT4 i2_3_lut_rep_107 (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), .C(cnt_s2_num[2]), 
         .Z(n6616)) /* synthesis lut_function=(((C)+!B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(238[13:18])
    defparam i2_3_lut_rep_107.init = 16'hf7f7;
    LUT4 i1_2_lut_3_lut_4_lut (.A(cnt_s4_num[12]), .B(cnt_s4_num[14]), .C(cnt_s4_num[15]), 
         .D(cnt_s4_num[13]), .Z(n4451)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_3_lut_4_lut.init = 16'hfffe;
    CCU2D cnt_150ms_473_add_4_3 (.A0(cnt_150ms[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5494), .COUT(n5495), .S0(n97[1]), .S1(n97[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_3.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_3.INJECT1_1 = "NO";
    LUT4 i5112_4_lut_then_4_lut (.A(n6578), .B(cnt_s2_num[1]), .C(cnt_s2_num[2]), 
         .D(\cnt_s2_num[0] ), .Z(n6627)) /* synthesis lut_function=(A+(B (C+(D))+!B (C+!(D)))) */ ;
    defparam i5112_4_lut_then_4_lut.init = 16'hfefb;
    LUT4 i3_3_lut_4_lut (.A(cnt_s4_num[12]), .B(cnt_s4_num[14]), .C(cnt_s4_num[0]), 
         .D(cnt_s4_num[1]), .Z(n8)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i3_3_lut_4_lut.init = 16'hffef;
    FD1S3IX cnt_s2_num_done_174 (.D(n6555), .CK(clk_50MHz), .CD(n1530), 
            .Q(state_5__N_185[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(127[10] 130[33])
    defparam cnt_s2_num_done_174.GSR = "ENABLED";
    LUT4 i5106_4_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), .C(n6900), .D(n6582), 
         .Z(n6220)) /* synthesis lut_function=(A (B+(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i5106_4_lut_4_lut.init = 16'hfad8;
    LUT4 i5112_4_lut_else_4_lut (.A(n6578), .B(cnt_s2_num[1]), .C(cnt_s2_num[2]), 
         .D(\cnt_s2_num[0] ), .Z(n6626)) /* synthesis lut_function=(!(A (D)+!A (B ((D)+!C)+!B (D)))) */ ;
    defparam i5112_4_lut_else_4_lut.init = 16'h00fb;
    LUT4 i3300_3_lut_3_lut_4_lut_4_lut_then_4_lut (.A(n6585), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n6630)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(268[13:18])
    defparam i3300_3_lut_3_lut_4_lut_4_lut_then_4_lut.init = 16'hefff;
    CCU2D cnt_150ms_473_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n5494), .S1(n97[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_1.INIT0 = 16'hF000;
    defparam cnt_150ms_473_add_4_1.INIT1 = 16'h0555;
    defparam cnt_150ms_473_add_4_1.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_1.INJECT1_1 = "NO";
    LUT4 i3300_3_lut_3_lut_4_lut_4_lut_else_4_lut (.A(n6580), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n6629)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(268[13:18])
    defparam i3300_3_lut_3_lut_4_lut_4_lut_else_4_lut.init = 16'hfeff;
    LUT4 i3_4_lut (.A(cnt_150ms[14]), .B(cnt_150ms[5]), .C(cnt_150ms[6]), 
         .D(n5923), .Z(n5925)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i3_4_lut.init = 16'hfffe;
    FD1P3IX cnt_s2_num__i2 (.D(n159[2]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i2.GSR = "ENABLED";
    LUT4 cnt_s4_num_0__bdd_4_lut (.A(cnt_s4_num[0]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[2]), .D(cnt_s4_num[3]), .Z(n6632)) /* synthesis lut_function=(A (B (C)+!B (C (D)+!C !(D)))+!A (C (D))) */ ;
    defparam cnt_s4_num_0__bdd_4_lut.init = 16'hf082;
    FD1P3IX cnt_s2_num__i1 (.D(n159[1]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i1.GSR = "ENABLED";
    LUT4 i2_4_lut_else_1_lut (.A(n6900), .B(cnt_s2_num[1]), .C(cnt_s2_num[2]), 
         .D(\cnt_s2_num[0] ), .Z(n6633)) /* synthesis lut_function=(!((B (C+!(D))+!B !((D)+!C))+!A)) */ ;
    defparam i2_4_lut_else_1_lut.init = 16'h2a02;
    LUT4 i2_2_lut_3_lut_4_lut (.A(n6603), .B(n6600), .C(n4235), .D(n6616), 
         .Z(n8_adj_894)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i2_2_lut_3_lut_4_lut.init = 16'hf0e0;
    CCU2D add_153_5 (.A0(cnt_s4_num[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5481), .COUT(n5482), .S0(n357[3]), .S1(n357[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_5.INIT0 = 16'h5aaa;
    defparam add_153_5.INIT1 = 16'h5aaa;
    defparam add_153_5.INJECT1_0 = "NO";
    defparam add_153_5.INJECT1_1 = "NO";
    LUT4 equal_65_i13_2_lut_rep_59_3_lut_4_lut (.A(n6603), .B(n6600), .C(n6604), 
         .D(cnt_s2_num[2]), .Z(n6568)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam equal_65_i13_2_lut_rep_59_3_lut_4_lut.init = 16'hfeff;
    LUT4 i1_2_lut (.A(n2924), .B(n2878), .Z(n4)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 cnt_s2_num_0__bdd_2_lut (.A(\cnt_s2_num[0] ), .B(n6579), .Z(n6636)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam cnt_s2_num_0__bdd_2_lut.init = 16'h4444;
    LUT4 i5065_2_lut (.A(cnt_150ms[10]), .B(cnt_150ms[15]), .Z(n6174)) /* synthesis lut_function=(A (B)) */ ;
    defparam i5065_2_lut.init = 16'h8888;
    LUT4 i4_4_lut (.A(cnt_150ms[3]), .B(cnt_150ms[0]), .C(cnt_150ms[1]), 
         .D(n6), .Z(n2924)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_3_lut_4_lut_adj_5 (.A(n6603), .B(n6600), .C(n5939), 
         .D(n6616), .Z(n7)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_5.init = 16'hf0e0;
    LUT4 i1_2_lut_adj_6 (.A(cnt_150ms[2]), .B(cnt_150ms[4]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i1_2_lut_adj_6.init = 16'heeee;
    LUT4 i4_4_lut_adj_7 (.A(cnt_150ms[9]), .B(cnt_150ms[17]), .C(cnt_150ms[18]), 
         .D(n6188), .Z(n5923)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i4_4_lut_adj_7.init = 16'hfbff;
    LUT4 i1_4_lut (.A(state[4]), .B(n33), .C(n6558), .D(n6618), .Z(init_data_8__N_236[7])) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(275[10] 311[32])
    defparam i1_4_lut.init = 16'ha8a0;
    LUT4 i671_3_lut_4_lut (.A(cnt_s2_num[4]), .B(n6563), .C(cnt_s2_num[5]), 
         .D(cnt_s2_num[6]), .Z(n159[6])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i671_3_lut_4_lut.init = 16'h7f80;
    FD1S3IX cnt_s4_num_done_177 (.D(cnt_s4_num_done_N_279), .CK(clk_50MHz), 
            .CD(n1530), .Q(state_5__N_197[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(328[10] 331[33])
    defparam cnt_s4_num_done_177.GSR = "ENABLED";
    LUT4 i5079_2_lut (.A(cnt_150ms[20]), .B(cnt_150ms[7]), .Z(n6188)) /* synthesis lut_function=(A (B)) */ ;
    defparam i5079_2_lut.init = 16'h8888;
    LUT4 equal_61_i13_2_lut_rep_60_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), 
         .C(n6600), .D(n6603), .Z(n6569)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam equal_61_i13_2_lut_rep_60_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1038_4_lut (.A(state_c[3]), .B(state_5__N_185[3]), .C(state_5__N_191[3]), 
         .D(\state[2] ), .Z(n2082)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1038_4_lut.init = 16'heca0;
    LUT4 i1040_4_lut (.A(\state[2] ), .B(state_5__N_179[1]), .C(state_5__N_185[3]), 
         .D(state_c[1]), .Z(n2084)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1040_4_lut.init = 16'h3b0a;
    LUT4 i1_4_lut_adj_8 (.A(n5961), .B(n6066), .C(cnt_150ms[6]), .D(cnt_150ms[13]), 
         .Z(state_5__N_179[1])) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i1_4_lut_adj_8.init = 16'hefff;
    LUT4 i6_4_lut (.A(n6133), .B(n12), .C(cnt_150ms[22]), .D(cnt_150ms[11]), 
         .Z(n5961)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i6_4_lut.init = 16'hffdf;
    LUT4 i5026_2_lut (.A(cnt_150ms[12]), .B(cnt_150ms[21]), .Z(n6133)) /* synthesis lut_function=(A (B)) */ ;
    defparam i5026_2_lut.init = 16'h8888;
    LUT4 i5_4_lut (.A(cnt_150ms[5]), .B(cnt_150ms[19]), .C(cnt_150ms[8]), 
         .D(n5923), .Z(n12)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i5_4_lut.init = 16'hfffd;
    LUT4 i1_2_lut_adj_9 (.A(n2924), .B(n2890), .Z(n6066)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_9.init = 16'heeee;
    LUT4 i1042_4_lut (.A(state_c[1]), .B(state_5__N_173[0]), .C(state_5__N_179[1]), 
         .D(state_c[0]), .Z(n2086)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A !(B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1042_4_lut.init = 16'hb3a0;
    LUT4 i1_4_lut_adj_10 (.A(n6035), .B(n6077), .C(cnt_150ms[6]), .D(cnt_150ms[5]), 
         .Z(state_5__N_173[0])) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i1_4_lut_adj_10.init = 16'hffef;
    LUT4 i1043_2_lut (.A(state_c[0]), .B(state_5__N_173[0]), .Z(n2087)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1043_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_rep_108 (.A(cnt_s4_num[11]), .B(cnt_s4_num[5]), .Z(n6617)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_108.init = 16'heeee;
    LUT4 i2_3_lut (.A(cnt_s4_num[4]), .B(cnt_s4_num[17]), .C(cnt_s4_num[16]), 
         .Z(n5926)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i2_3_lut.init = 16'hfefe;
    LUT4 init_data_8__I_0_i7_3_lut (.A(init_data_8__N_236[7]), .B(n6033), 
         .C(\state[2] ), .Z(init_data_8__N_102[6])) /* synthesis lut_function=(!(A (B (C))+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(275[10] 311[32])
    defparam init_data_8__I_0_i7_3_lut.init = 16'h3a3a;
    LUT4 i5_4_lut_adj_11 (.A(n9), .B(n7_adj_895), .C(n6572), .D(n6571), 
         .Z(n6033)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i5_4_lut_adj_11.init = 16'h8000;
    CCU2D add_153_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n5480), .S1(n357[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_1.INIT0 = 16'hF000;
    defparam add_153_1.INIT1 = 16'h5555;
    defparam add_153_1.INJECT1_0 = "NO";
    defparam add_153_1.INJECT1_1 = "NO";
    LUT4 state_5__N_169_I_0_2_lut (.A(\state[2] ), .B(state[4]), .Z(en_write_init)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(333[19:72])
    defparam state_5__N_169_I_0_2_lut.init = 16'heeee;
    LUT4 i1_4_lut_adj_12 (.A(n4235), .B(n6579), .C(n6616), .D(n6585), 
         .Z(n7_adj_895)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut_adj_12.init = 16'ha888;
    LUT4 i3189_4_lut (.A(n6616), .B(n6599), .C(n6596), .D(n6595), .Z(n4235)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i3189_4_lut.init = 16'hfac8;
    LUT4 equal_101_i13_2_lut_rep_63_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), 
         .C(n6623), .D(n6602), .Z(n6572)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam equal_101_i13_2_lut_rep_63_3_lut_4_lut.init = 16'hfffe;
    LUT4 i5198_2_lut_rep_46_2_lut_3_lut_4_lut (.A(n6602), .B(n6601), .C(n6604), 
         .D(cnt_s2_num[2]), .Z(n6555)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(267[13:18])
    defparam i5198_2_lut_rep_46_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i3194_4_lut (.A(n6616), .B(n6599), .C(n6900), .D(n6578), .Z(n4240)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i3194_4_lut.init = 16'hfac8;
    FD1S3IX cnt_150ms_473__i0 (.D(n97[0]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i0.GSR = "ENABLED";
    LUT4 i3291_3_lut_4_lut (.A(n6619), .B(n6558), .C(state[4]), .D(n6406), 
         .Z(init_data_8__N_236[3])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i3291_3_lut_4_lut.init = 16'hf0e0;
    LUT4 i657_2_lut_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6607), .C(cnt_s2_num[4]), 
         .D(cnt_s2_num[3]), .Z(n159[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i657_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i3_2_lut_4_lut (.A(n6583), .B(n4240), .C(n6579), .D(n6557), 
         .Z(n9)) /* synthesis lut_function=(A (B (C (D)))+!A (B (D))) */ ;
    defparam i3_2_lut_4_lut.init = 16'hc400;
    LUT4 i2_2_lut_4_lut (.A(n6573), .B(n6583), .C(n6598), .D(n6002), 
         .Z(n8_adj_896)) /* synthesis lut_function=(A (B (C (D))+!B (D))) */ ;
    defparam i2_2_lut_4_lut.init = 16'ha200;
    LUT4 i1_2_lut_rep_43_4_lut (.A(n5926), .B(n4451), .C(n6574), .D(n6619), 
         .Z(n6552)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_2_lut_rep_43_4_lut.init = 16'hfffe;
    LUT4 i2022_1_lut (.A(state_c[0]), .Z(n3075)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i2022_1_lut.init = 16'h5555;
    LUT4 i5191_2_lut_rep_42_4_lut (.A(n5926), .B(n4451), .C(n6574), .D(cnt_s4_num[1]), 
         .Z(n6551)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam i5191_2_lut_rep_42_4_lut.init = 16'h0001;
    LUT4 i1_4_lut_adj_13 (.A(n6583), .B(n6592), .C(n6595), .D(n6578), 
         .Z(n6029)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B+(D))) */ ;
    defparam i1_4_lut_adj_13.init = 16'hf5c4;
    LUT4 i3_4_lut_adj_14 (.A(n6593), .B(n6005), .C(n5945), .D(n6579), 
         .Z(n10)) /* synthesis lut_function=(A (B (C))+!A (B (C (D)))) */ ;
    defparam i3_4_lut_adj_14.init = 16'hc080;
    LUT4 i4_4_lut_adj_15 (.A(n6616), .B(n8_adj_897), .C(n4370), .D(n6598), 
         .Z(n6024)) /* synthesis lut_function=(A (B (C))+!A (B (C (D)))) */ ;
    defparam i4_4_lut_adj_15.init = 16'hc080;
    LUT4 equal_82_i13_2_lut_rep_57_3_lut_4_lut (.A(\cnt_s2_num[0] ), .B(n6605), 
         .C(n6622), .D(n6603), .Z(n6566)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(233[13:18])
    defparam equal_82_i13_2_lut_rep_57_3_lut_4_lut.init = 16'hfffb;
    LUT4 i5194_4_lut (.A(n6076), .B(n6035), .C(cnt_150ms[5]), .D(cnt_150ms[6]), 
         .Z(lcd_rst_high_flag_N_275)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i5194_4_lut.init = 16'h0010;
    LUT4 i1_2_lut_3_lut_4_lut_adj_16 (.A(cnt_s2_num[1]), .B(n6621), .C(n6601), 
         .D(n6602), .Z(n4370)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_16.init = 16'hffef;
    LUT4 i2_4_lut (.A(n6567), .B(n2890), .C(n6145), .D(n6212), .Z(n6076)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i2_4_lut.init = 16'hefff;
    LUT4 cnt_s4_num_0__bdd_4_lut_5305 (.A(cnt_s4_num[0]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[2]), .D(cnt_s4_num[3]), .Z(n6525)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C (D))+!B ((D)+!C))) */ ;
    defparam cnt_s4_num_0__bdd_4_lut_5305.init = 16'hd981;
    LUT4 i5038_2_lut (.A(cnt_150ms[3]), .B(cnt_150ms[0]), .Z(n6145)) /* synthesis lut_function=(A (B)) */ ;
    defparam i5038_2_lut.init = 16'h8888;
    LUT4 i3567_4_lut (.A(n6593), .B(n10_adj_898), .C(n5988), .D(n6900), 
         .Z(init_data_8__N_245[3])) /* synthesis lut_function=(!(A (B (C))+!A (B (C (D))))) */ ;
    defparam i3567_4_lut.init = 16'h3f7f;
    LUT4 i2_4_lut_adj_17 (.A(n6595), .B(n4_adj_899), .C(n6592), .D(n6591), 
         .Z(n4553)) /* synthesis lut_function=(A (B)+!A (B (C (D)))) */ ;
    defparam i2_4_lut_adj_17.init = 16'hc888;
    CCU2D cnt_150ms_473_add_4_23 (.A0(cnt_150ms[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5504), .S0(n97[21]), .S1(n97[22]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_23.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_23.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_23.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_23.INJECT1_1 = "NO";
    CCU2D cnt_150ms_473_add_4_21 (.A0(cnt_150ms[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5503), .COUT(n5504), .S0(n97[19]), .S1(n97[20]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_21.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_21.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_21.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_21.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_18 (.A(n6599), .B(n6585), .C(n6596), .D(n6595), 
         .Z(n4_adj_900)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_18.init = 16'hfac8;
    LUT4 equal_112_i13_2_lut_3_lut_4_lut (.A(n6602), .B(n6622), .C(n6612), 
         .D(\cnt_s2_num[0] ), .Z(n13)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam equal_112_i13_2_lut_3_lut_4_lut.init = 16'hfffe;
    LUT4 i2_4_lut_adj_19 (.A(n4451), .B(cnt_s4_num[0]), .C(n6155), .D(n6613), 
         .Z(n5971)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i2_4_lut_adj_19.init = 16'h0400;
    LUT4 i3559_4_lut (.A(n4553), .B(n6556), .C(n6011), .D(n6_adj_901), 
         .Z(init_data_8__N_245[4])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i3559_4_lut.init = 16'h7fff;
    LUT4 equal_97_i13_2_lut_3_lut_4_lut (.A(n6602), .B(n6600), .C(n6604), 
         .D(cnt_s2_num[2]), .Z(n13_adj_902)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(218[13:17])
    defparam equal_97_i13_2_lut_3_lut_4_lut.init = 16'hfeff;
    LUT4 i1_3_lut (.A(cnt_s4_num[1]), .B(cnt_s4_num[2]), .C(cnt_s4_num[3]), 
         .Z(n32)) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_3_lut.init = 16'ha8a8;
    LUT4 i1_3_lut_4_lut (.A(n6585), .B(n6583), .C(n6027), .D(n6596), 
         .Z(n4_adj_899)) /* synthesis lut_function=(A (B (C (D))+!B (C))+!A (C (D))) */ ;
    defparam i1_3_lut_4_lut.init = 16'hf020;
    LUT4 i3573_4_lut (.A(n6016), .B(n7_adj_903), .C(n6024), .D(n8_adj_904), 
         .Z(init_data_8__N_245[0])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i3573_4_lut.init = 16'h7fff;
    LUT4 i1_3_lut_adj_20 (.A(state[4]), .B(n6558), .C(n6525), .Z(init_data_8__N_236[0])) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_3_lut_adj_20.init = 16'ha8a8;
    LUT4 i3579_4_lut (.A(n4603), .B(n7_adj_905), .C(n6005), .D(n8_adj_906), 
         .Z(init_data_8__N_245[2])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i3579_4_lut.init = 16'h7fff;
    LUT4 i1_3_lut_adj_21 (.A(state[4]), .B(n6558), .C(n6632), .Z(init_data_8__N_236[2])) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_3_lut_adj_21.init = 16'ha8a8;
    LUT4 i3527_4_lut (.A(n6011), .B(n7), .C(n6027), .D(n8_adj_896), 
         .Z(init_data_8__N_245[1])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i3527_4_lut.init = 16'h7fff;
    LUT4 i1_3_lut_rep_47_4_lut (.A(n6603), .B(n6622), .C(n4240), .D(n6583), 
         .Z(n6556)) /* synthesis lut_function=(A (C)+!A (B (C)+!B !((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_3_lut_rep_47_4_lut.init = 16'he0f0;
    LUT4 i49_4_lut_4_lut_4_lut (.A(cnt_s4_num[3]), .B(n6618), .C(cnt_s4_num[0]), 
         .D(n6558), .Z(n33)) /* synthesis lut_function=(A (B+(D))+!A !((D)+!C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i49_4_lut_4_lut_4_lut.init = 16'haad8;
    LUT4 i3295_4_lut (.A(n6558), .B(state[4]), .C(n84), .D(n4523), .Z(init_data_8__N_236[1])) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i3295_4_lut.init = 16'hccc8;
    LUT4 equal_74_i13_2_lut_rep_61_3_lut_4_lut (.A(n6603), .B(n6623), .C(n6605), 
         .D(\cnt_s2_num[0] ), .Z(n6570)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam equal_74_i13_2_lut_rep_61_3_lut_4_lut.init = 16'hffef;
    LUT4 i3581_4_lut (.A(n6579), .B(n5986), .C(n6635), .D(n5928), .Z(init_data_8__N_245[8])) /* synthesis lut_function=(!(A (B+(C (D)))+!A (B))) */ ;
    defparam i3581_4_lut.init = 16'h1333;
    LUT4 i1_4_lut_adj_22 (.A(state[4]), .B(n6558), .C(n48), .D(n4_adj_907), 
         .Z(init_data_8__N_236[8])) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_4_lut_adj_22.init = 16'haaa8;
    LUT4 i1_4_lut_adj_23 (.A(n6121), .B(n6178), .C(cnt_s4_num[3]), .D(cnt_s4_num[2]), 
         .Z(n4_adj_907)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A (C (D)+!C !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_4_lut_adj_23.init = 16'h0750;
    LUT4 i2_4_lut_4_lut (.A(n6591), .B(n6579), .C(n4233), .D(n6585), 
         .Z(n5939)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(233[13:18])
    defparam i2_4_lut_4_lut.init = 16'he0c0;
    LUT4 equal_86_i13_2_lut_rep_62_3_lut_4_lut (.A(cnt_s2_num[1]), .B(n6621), 
         .C(n6603), .D(n6601), .Z(n6571)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(238[13:18])
    defparam equal_86_i13_2_lut_rep_62_3_lut_4_lut.init = 16'hfdff;
    LUT4 i3577_4_lut (.A(n6029), .B(n9_adj_908), .C(n8_adj_909), .D(n10), 
         .Z(init_data_8__N_245[5])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i3577_4_lut.init = 16'h7fff;
    LUT4 i1_2_lut_3_lut_4_lut_adj_24 (.A(cnt_s2_num[1]), .B(n6621), .C(n6603), 
         .D(n6601), .Z(n7_adj_910)) /* synthesis lut_function=(A (B (C+!(D)))+!A (C+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(238[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_24.init = 16'hd0dd;
    LUT4 i5069_3_lut (.A(cnt_s4_num[1]), .B(cnt_s4_num[0]), .C(n6558), 
         .Z(n6178)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i5069_3_lut.init = 16'hfefe;
    LUT4 i3287_4_lut (.A(n85), .B(state[4]), .C(n6552), .D(n88), .Z(init_data_8__N_236[5])) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i3287_4_lut.init = 16'hccc8;
    LUT4 i1_2_lut_rep_91 (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), .Z(n6600)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_2_lut_rep_91.init = 16'heeee;
    LUT4 i2_3_lut_4_lut (.A(n6900), .B(n6590), .C(n23), .D(n6578), .Z(n5982)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_3_lut_4_lut.init = 16'h8000;
    FD1S3AX init_data_i8 (.D(init_data_8__N_102[8]), .CK(clk_50MHz), .Q(init_data[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i8.GSR = "ENABLED";
    LUT4 i5016_4_lut (.A(n5926), .B(n5675), .C(n8), .D(n6617), .Z(n6121)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i5016_4_lut.init = 16'hfffe;
    LUT4 i636_2_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), .Z(n159[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i636_2_lut.init = 16'h6666;
    LUT4 i502_1_lut (.A(state[4]), .Z(n1544)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i502_1_lut.init = 16'h5555;
    LUT4 i1_3_lut_4_lut_adj_25 (.A(n6900), .B(n6590), .C(n6585), .D(n6598), 
         .Z(n17)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i1_3_lut_4_lut_adj_25.init = 16'hf8f0;
    LUT4 i7_4_lut (.A(n13_adj_911), .B(cnt_s4_num[11]), .C(n12_adj_912), 
         .D(cnt_s4_num[0]), .Z(cnt_s4_num_done_N_279)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i7_4_lut.init = 16'h8000;
    LUT4 i5_4_lut_adj_26 (.A(cnt_s4_num[1]), .B(cnt_s4_num[17]), .C(cnt_s4_num[12]), 
         .D(cnt_s4_num[14]), .Z(n13_adj_911)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i5_4_lut_adj_26.init = 16'h4000;
    LUT4 i4_4_lut_adj_27 (.A(n51), .B(n6611), .C(n6186), .D(cnt_s4_num[16]), 
         .Z(n12_adj_912)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i4_4_lut_adj_27.init = 16'h0004;
    LUT4 i1_2_lut_rep_65_3_lut (.A(cnt_s4_num[11]), .B(cnt_s4_num[5]), .C(n51), 
         .Z(n6574)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_65_3_lut.init = 16'hfefe;
    LUT4 i1_3_lut_rep_58 (.A(n2878), .B(cnt_150ms[18]), .C(cnt_150ms[9]), 
         .Z(n6567)) /* synthesis lut_function=(A+!(B (C))) */ ;
    defparam i1_3_lut_rep_58.init = 16'hbfbf;
    LUT4 i5048_2_lut_3_lut_4_lut (.A(cnt_s4_num[11]), .B(cnt_s4_num[5]), 
         .C(n5926), .D(n51), .Z(n6155)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i5048_2_lut_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_109 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .Z(n6618)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_rep_109.init = 16'h8888;
    LUT4 i1_2_lut_4_lut (.A(n2878), .B(cnt_150ms[18]), .C(cnt_150ms[9]), 
         .D(n6066), .Z(n6077)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;
    defparam i1_2_lut_4_lut.init = 16'hffbf;
    LUT4 i5098_3_lut (.A(cnt_150ms[2]), .B(cnt_150ms[1]), .C(cnt_150ms[4]), 
         .Z(n6212)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i5098_3_lut.init = 16'h8080;
    LUT4 i2_3_lut_adj_28 (.A(cnt_150ms[20]), .B(cnt_150ms[17]), .C(cnt_150ms[7]), 
         .Z(n6035)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i2_3_lut_adj_28.init = 16'hfefe;
    LUT4 i3183_2_lut_rep_92 (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), .Z(n6601)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3183_2_lut_rep_92.init = 16'h8888;
    LUT4 i4_4_lut_adj_29 (.A(cnt_s4_num[9]), .B(cnt_s4_num[8]), .C(cnt_s4_num[7]), 
         .D(n6_adj_913), .Z(n51)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i4_4_lut_adj_29.init = 16'hfffe;
    LUT4 i3_4_lut_adj_30 (.A(cnt_150ms[15]), .B(cnt_150ms[14]), .C(cnt_150ms[16]), 
         .D(cnt_150ms[10]), .Z(n2890)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(72[26:50])
    defparam i3_4_lut_adj_30.init = 16'hfffb;
    LUT4 i1_2_lut_adj_31 (.A(cnt_s4_num[6]), .B(cnt_s4_num[10]), .Z(n6_adj_913)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_adj_31.init = 16'heeee;
    LUT4 i2_4_lut_adj_32 (.A(n5985), .B(n6592), .C(n5930), .D(n36), 
         .Z(n5986)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_32.init = 16'h8880;
    LUT4 i2_4_lut_adj_33 (.A(n6636), .B(n6582), .C(n7_adj_910), .D(n5928), 
         .Z(n5930)) /* synthesis lut_function=(A (B (D))+!A (B (C (D)))) */ ;
    defparam i2_4_lut_adj_33.init = 16'hc800;
    LUT4 i1_4_lut_adj_34 (.A(n6599), .B(n6559), .C(n5982), .D(n17), 
         .Z(n36)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;
    defparam i1_4_lut_adj_34.init = 16'ha8a0;
    LUT4 i1_4_lut_adj_35 (.A(n6585), .B(n6583), .C(n6582), .D(n6598), 
         .Z(n23)) /* synthesis lut_function=(A ((C)+!B)+!A !(B+!(D))) */ ;
    defparam i1_4_lut_adj_35.init = 16'hb3a2;
    LUT4 equal_93_i11_2_lut_rep_93 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .Z(n6602)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(244[13:18])
    defparam equal_93_i11_2_lut_rep_93.init = 16'hdddd;
    LUT4 i1_2_lut_rep_87_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[4]), .Z(n6596)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(244[13:18])
    defparam i1_2_lut_rep_87_3_lut_4_lut.init = 16'hfffd;
    LUT4 i1_3_lut_4_lut_adj_36 (.A(n6585), .B(n6582), .C(n6900), .D(n6592), 
         .Z(n6005)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(212[13:17])
    defparam i1_3_lut_4_lut_adj_36.init = 16'heee0;
    LUT4 i5015_2_lut_rep_81_3_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[3]), .Z(n6590)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(244[13:18])
    defparam i5015_2_lut_rep_81_3_lut.init = 16'hfdfd;
    LUT4 i4_4_lut_adj_37 (.A(n7_adj_914), .B(n6172), .C(cnt_150ms[22]), 
         .D(cnt_150ms[12]), .Z(n2878)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i4_4_lut_adj_37.init = 16'hffbf;
    LUT4 i2_2_lut (.A(cnt_150ms[21]), .B(cnt_150ms[13]), .Z(n7_adj_914)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i5063_3_lut (.A(cnt_150ms[19]), .B(cnt_150ms[8]), .C(cnt_150ms[11]), 
         .Z(n6172)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i5063_3_lut.init = 16'h8080;
    FD1S3AX init_data_i7 (.D(init_data_8__N_102[7]), .CK(clk_50MHz), .Q(init_data[7])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i7.GSR = "ENABLED";
    FD1S3AX init_data_i6 (.D(init_data_8__N_102[6]), .CK(clk_50MHz), .Q(init_data[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i6.GSR = "ENABLED";
    FD1S3AX init_data_i5 (.D(init_data_8__N_102[5]), .CK(clk_50MHz), .Q(init_data[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i5.GSR = "ENABLED";
    FD1S3AX init_data_i4 (.D(init_data_8__N_102[4]), .CK(clk_50MHz), .Q(init_data[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i4.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_38 (.A(n6570), .B(n6569), .C(n6568), .D(n4448), 
         .Z(n6011)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_4_lut_adj_38.init = 16'h8000;
    LUT4 equal_65_i11_2_lut_rep_94 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .Z(n6603)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(216[13:17])
    defparam equal_65_i11_2_lut_rep_94.init = 16'heeee;
    CCU2D add_153_3 (.A0(cnt_s4_num[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5480), .COUT(n5481), .S0(n357[1]), .S1(n357[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_3.INIT0 = 16'h5aaa;
    defparam add_153_3.INIT1 = 16'h5aaa;
    defparam add_153_3.INJECT1_0 = "NO";
    defparam add_153_3.INJECT1_1 = "NO";
    CCU2D add_153_13 (.A0(cnt_s4_num[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5485), .COUT(n5486), .S0(n357[11]), .S1(n357[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_13.INIT0 = 16'h5aaa;
    defparam add_153_13.INIT1 = 16'h5aaa;
    defparam add_153_13.INJECT1_0 = "NO";
    defparam add_153_13.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_39 (.A(n6593), .B(n6580), .C(n6578), .D(n6900), 
         .Z(n6002)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_39.init = 16'hfac8;
    LUT4 i178_2_lut (.A(state_5__N_197[5]), .B(state[4]), .Z(clk_50MHz_enable_8)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i178_2_lut.init = 16'h8888;
    PFUMX init_data_8__I_0_i6 (.BLUT(init_data_8__N_236[5]), .ALUT(init_data_8__N_245[5]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    LUT4 i3187_4_lut (.A(n6593), .B(n6616), .C(n6596), .D(n6595), .Z(n4233)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i3187_4_lut.init = 16'hfac8;
    LUT4 i2_4_lut_then_1_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n6900)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(216[13:17])
    defparam i2_4_lut_then_1_lut_4_lut.init = 16'hefff;
    LUT4 i1_2_lut_rep_73_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[4]), .Z(n6582)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(216[13:17])
    defparam i1_2_lut_rep_73_3_lut_4_lut.init = 16'hfffe;
    PFUMX init_data_8__I_0_i9 (.BLUT(init_data_8__N_236[8]), .ALUT(init_data_8__N_245[8]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    LUT4 i2_2_lut_3_lut_4_lut_adj_40 (.A(n6591), .B(n6598), .C(n6582), 
         .D(n6616), .Z(n9_adj_908)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(225[13:18])
    defparam i2_2_lut_3_lut_4_lut_adj_40.init = 16'heee0;
    LUT4 i1_3_lut_4_lut_adj_41 (.A(n6593), .B(n6598), .C(n6579), .D(n6599), 
         .Z(n6_adj_915)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i1_3_lut_4_lut_adj_41.init = 16'heee0;
    LUT4 i2_3_lut_4_lut_adj_42 (.A(n6593), .B(n6598), .C(n4348), .D(n6024), 
         .Z(n5945)) /* synthesis lut_function=(A (C (D))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i2_3_lut_4_lut_adj_42.init = 16'he000;
    LUT4 i3_4_lut_adj_43 (.A(n4233), .B(n6_adj_916), .C(n13_adj_902), 
         .D(n13), .Z(n4603)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut_adj_43.init = 16'h8000;
    LUT4 i2_2_lut_adj_44 (.A(n6016), .B(n6029), .Z(n6_adj_916)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut_adj_44.init = 16'h8888;
    PFUMX init_data_8__I_0_i2 (.BLUT(init_data_8__N_236[1]), .ALUT(init_data_8__N_245[1]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    CCU2D add_153_9 (.A0(cnt_s4_num[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5483), .COUT(n5484), .S0(n357[7]), .S1(n357[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_9.INIT0 = 16'h5aaa;
    defparam add_153_9.INIT1 = 16'h5aaa;
    defparam add_153_9.INJECT1_0 = "NO";
    defparam add_153_9.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut_adj_45 (.A(n6599), .B(n6900), .C(n6582), 
         .D(n6580), .Z(n8_adj_909)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(237[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_45.init = 16'heee0;
    LUT4 i1_2_lut_rep_95 (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), .Z(n6604)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_95.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_71_3_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), 
         .C(cnt_s2_num[2]), .Z(n6580)) /* synthesis lut_function=(A+!(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_71_3_lut.init = 16'hbfbf;
    LUT4 i1_4_lut_adj_46 (.A(n6616), .B(n6573), .C(n6603), .D(n6170), 
         .Z(n7_adj_905)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i1_4_lut_adj_46.init = 16'hccc8;
    PFUMX init_data_8__I_0_i3 (.BLUT(init_data_8__N_236[2]), .ALUT(init_data_8__N_245[2]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    FD1S3AX init_data_i3 (.D(init_data_8__N_102[3]), .CK(clk_50MHz), .Q(init_data[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i3.GSR = "ENABLED";
    FD1S3AX init_data_i2 (.D(init_data_8__N_102[2]), .CK(clk_50MHz), .Q(init_data[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i2.GSR = "ENABLED";
    FD1S3AX init_data_i1 (.D(init_data_8__N_102[1]), .CK(clk_50MHz), .Q(init_data[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i1.GSR = "ENABLED";
    LUT4 i2_2_lut_adj_47 (.A(n4429), .B(n4246), .Z(n8_adj_906)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut_adj_47.init = 16'h8888;
    PFUMX init_data_8__I_0_i1 (.BLUT(init_data_8__N_236[0]), .ALUT(init_data_8__N_245[0]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    FD1P3IX cnt_s4_num__i17 (.D(n357[17]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[17])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i17.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i16 (.D(n357[16]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[16])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i16.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i15 (.D(n357[15]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[15])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i15.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i14 (.D(n357[14]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[14])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i14.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i13 (.D(n357[13]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[13])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i13.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i12 (.D(n357[12]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[12])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i12.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i11 (.D(n357[11]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[11])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i11.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i10 (.D(n357[10]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[10])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i10.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i9 (.D(n357[9]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[9])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i9.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i8 (.D(n357[8]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[8])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i8.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i7 (.D(n357[7]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[7])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i7.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i6 (.D(n357[6]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i6.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i5 (.D(n357[5]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i5.GSR = "ENABLED";
    PFUMX i51 (.BLUT(n28), .ALUT(n32), .C0(cnt_s4_num[0]), .Z(n48));
    LUT4 i2_4_lut_adj_48 (.A(n6002), .B(n6566), .C(n6582), .D(n5), .Z(n4429)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_48.init = 16'h8880;
    FD1P3IX cnt_s4_num__i4 (.D(n357[4]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i4.GSR = "ENABLED";
    LUT4 i3200_4_lut (.A(n6593), .B(n6592), .C(n6582), .D(n6596), .Z(n4246)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i3200_4_lut.init = 16'hfac8;
    PFUMX init_data_8__I_0_i5 (.BLUT(init_data_8__N_236[4]), .ALUT(init_data_8__N_245[4]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[4])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    FD1P3IX cnt_s4_num__i3 (.D(n357[3]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i3.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i2 (.D(n357[2]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i2.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_76_3_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), 
         .C(cnt_s2_num[2]), .Z(n6585)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_76_3_lut.init = 16'hfbfb;
    LUT4 i3_4_lut_4_lut (.A(n6585), .B(n6578), .C(n4553), .D(n6900), 
         .Z(n8_adj_897)) /* synthesis lut_function=(A (C)+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(252[13:18])
    defparam i3_4_lut_4_lut.init = 16'he0a0;
    LUT4 i4_4_lut_adj_49 (.A(n7_adj_917), .B(n6580), .C(n6_adj_915), .D(n6595), 
         .Z(n6016)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i4_4_lut_adj_49.init = 16'ha080;
    FD1P3IX cnt_s4_num__i1 (.D(n357[1]), .SP(clk_50MHz_enable_50), .CD(n1544), 
            .CK(clk_50MHz), .Q(cnt_s4_num[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i1.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_4_lut_adj_50 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[0]), .D(cnt_s4_num[3]), .Z(n4523)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_3_lut_4_lut_adj_50.init = 16'h8000;
    LUT4 i3312_2_lut_rep_96 (.A(cnt_s2_num[1]), .B(cnt_s2_num[2]), .Z(n6605)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3312_2_lut_rep_96.init = 16'h8888;
    LUT4 i1_3_lut_rep_48_4_lut (.A(n6580), .B(n6579), .C(n6598), .D(n6583), 
         .Z(n6557)) /* synthesis lut_function=(A (C+!(D))+!A (B (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_3_lut_rep_48_4_lut.init = 16'he0ee;
    LUT4 i2_4_lut_adj_51 (.A(n6591), .B(n6583), .C(n6596), .D(n6578), 
         .Z(n7_adj_917)) /* synthesis lut_function=(A ((D)+!B)+!A (B (C (D))+!B (C))) */ ;
    defparam i2_4_lut_adj_51.init = 16'hfa32;
    FD1P3AX lcd_rst_172 (.D(n6902), .SP(lcd_rst_high_flag), .CK(clk_50MHz), 
            .Q(lcd_rst_c)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(107[10] 110[28])
    defparam lcd_rst_172.GSR = "ENABLED";
    PFUMX i89 (.BLUT(n5971), .ALUT(n73), .C0(cnt_s4_num[3]), .Z(n84));
    LUT4 cnt_s4_num_3__bdd_4_lut_5265 (.A(cnt_s4_num[3]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[2]), .D(cnt_s4_num[0]), .Z(n6406)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A !(B (D)+!B !(C+(D))))) */ ;
    defparam cnt_s4_num_3__bdd_4_lut_5265.init = 16'h6423;
    PFUMX init_data_8__I_0_i4 (.BLUT(init_data_8__N_236[3]), .ALUT(init_data_8__N_245[3]), 
          .C0(\state[2] ), .Z(init_data_8__N_102[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;
    FD1P3IX cnt_s2_num__i6 (.D(n159[6]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[6])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i6.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i5 (.D(n159[5]), .SP(clk_50MHz_enable_61), .CD(n1542), 
            .CK(clk_50MHz), .Q(cnt_s2_num[5])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i5.GSR = "ENABLED";
    LUT4 i3449_2_lut_rep_74_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[2]), 
         .C(\cnt_s2_num[0] ), .Z(n6583)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i3449_2_lut_rep_74_3_lut.init = 16'h8080;
    LUT4 i499_1_lut (.A(\state[2] ), .Z(n1542)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i499_1_lut.init = 16'h5555;
    LUT4 i2_3_lut_rep_49_4_lut (.A(n51), .B(n6617), .C(n4451), .D(n5926), 
         .Z(n6558)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i2_3_lut_rep_49_4_lut.init = 16'hfffe;
    CCU2D cnt_150ms_473_add_4_19 (.A0(cnt_150ms[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5502), .COUT(n5503), .S0(n97[17]), .S1(n97[18]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_19.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_19.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_19.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_19.INJECT1_1 = "NO";
    CCU2D add_153_19 (.A0(cnt_s4_num[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5488), .S0(n357[17]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_19.INIT0 = 16'h5aaa;
    defparam add_153_19.INIT1 = 16'h0000;
    defparam add_153_19.INJECT1_0 = "NO";
    defparam add_153_19.INJECT1_1 = "NO";
    CCU2D add_153_17 (.A0(cnt_s4_num[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5487), .COUT(n5488), .S0(n357[15]), .S1(n357[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_17.INIT0 = 16'h5aaa;
    defparam add_153_17.INIT1 = 16'h5aaa;
    defparam add_153_17.INJECT1_0 = "NO";
    defparam add_153_17.INJECT1_1 = "NO";
    CCU2D cnt_150ms_473_add_4_17 (.A0(cnt_150ms[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5501), .COUT(n5502), .S0(n97[15]), .S1(n97[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_17.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_17.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_17.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_17.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_82_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[2]), .C(\cnt_s2_num[0] ), 
         .Z(n6591)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i1_2_lut_rep_82_3_lut.init = 16'hf7f7;
    CCU2D cnt_150ms_473_add_4_15 (.A0(cnt_150ms[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5500), .COUT(n5501), .S0(n97[13]), .S1(n97[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_15.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_15.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_15.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_15.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_1_lut_2_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[2]), 
         .Z(n5)) /* synthesis lut_function=(!(A (B))) */ ;
    defparam i1_2_lut_3_lut_1_lut_2_lut.init = 16'h7777;
    LUT4 i1_2_lut_adj_52 (.A(n4246), .B(n5939), .Z(n7_adj_903)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_52.init = 16'h8888;
    CCU2D cnt_150ms_473_add_4_13 (.A0(cnt_150ms[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5499), .COUT(n5500), .S0(n97[11]), .S1(n97[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_13.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_13.INJECT1_1 = "NO";
    LUT4 i2_4_lut_adj_53 (.A(n6592), .B(n5988), .C(n6603), .D(cnt_s2_num[3]), 
         .Z(n8_adj_904)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_53.init = 16'hccc8;
    LUT4 i1_4_lut_adj_54 (.A(n4348), .B(n6900), .C(n6089), .D(n5), .Z(n5988)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_54.init = 16'ha080;
    CCU2D add_153_7 (.A0(cnt_s4_num[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n5482), .COUT(n5483), .S0(n357[5]), .S1(n357[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_7.INIT0 = 16'h5aaa;
    defparam add_153_7.INIT1 = 16'h5aaa;
    defparam add_153_7.INJECT1_0 = "NO";
    defparam add_153_7.INJECT1_1 = "NO";
    LUT4 i638_2_lut_rep_98 (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), .Z(n6607)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i638_2_lut_rep_98.init = 16'h8888;
    LUT4 i645_2_lut_rep_79_3_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), 
         .C(cnt_s2_num[2]), .Z(n6588)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i645_2_lut_rep_79_3_lut.init = 16'h8080;
    LUT4 i69_3_lut (.A(cnt_s4_num[2]), .B(cnt_s4_num[3]), .C(cnt_s4_num[0]), 
         .Z(n52)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i69_3_lut.init = 16'h1818;
    LUT4 i1_4_lut_adj_55 (.A(n4603), .B(n6582), .C(n6616), .D(n6592), 
         .Z(n6_adj_901)) /* synthesis lut_function=(A (B+(C (D)))) */ ;
    defparam i1_4_lut_adj_55.init = 16'ha888;
    LUT4 i643_2_lut_3_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), .C(cnt_s2_num[2]), 
         .Z(n159[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i643_2_lut_3_lut.init = 16'h7878;
    LUT4 i652_2_lut_rep_54_3_lut_4_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[2]), .Z(n6563)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i652_2_lut_rep_54_3_lut_4_lut.init = 16'h8000;
    LUT4 i650_2_lut_3_lut_4_lut (.A(cnt_s2_num[1]), .B(\cnt_s2_num[0] ), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[2]), .Z(n159[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i650_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i1_4_lut_4_lut (.A(cnt_s4_num[0]), .B(cnt_s4_num[2]), .C(n6552), 
         .D(n6551), .Z(n73)) /* synthesis lut_function=(!(A+!(B (C+(D))+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_4_lut_4_lut.init = 16'h5540;
    LUT4 i3288_4_lut_4_lut (.A(cnt_s4_num[1]), .B(n52), .C(n6552), .D(state[4]), 
         .Z(init_data_8__N_236[4])) /* synthesis lut_function=(A (C (D))+!A (B (D)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(280[13:16])
    defparam i3288_4_lut_4_lut.init = 16'hf400;
    LUT4 i4_4_lut_adj_56 (.A(n6616), .B(n8_adj_894), .C(n4429), .D(n6578), 
         .Z(n10_adj_898)) /* synthesis lut_function=(A (B (C))+!A (B (C (D)))) */ ;
    defparam i4_4_lut_adj_56.init = 16'hc080;
    LUT4 i2_3_lut_4_lut_adj_57 (.A(n6585), .B(n6599), .C(n4_adj_900), 
         .D(n6598), .Z(n6027)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C (D))) */ ;
    defparam i2_3_lut_4_lut_adj_57.init = 16'hf080;
    LUT4 i664_2_lut_3_lut_4_lut (.A(cnt_s2_num[3]), .B(n6588), .C(cnt_s2_num[5]), 
         .D(cnt_s2_num[4]), .Z(n159[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i664_2_lut_3_lut_4_lut.init = 16'h78f0;
    CCU2D add_153_11 (.A0(cnt_s4_num[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5484), .COUT(n5485), .S0(n357[9]), .S1(n357[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_11.INIT0 = 16'h5aaa;
    defparam add_153_11.INIT1 = 16'h5aaa;
    defparam add_153_11.INJECT1_0 = "NO";
    defparam add_153_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_102 (.A(cnt_s4_num[3]), .B(cnt_s4_num[2]), .Z(n6611)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_102.init = 16'h8888;
    LUT4 i1_2_lut_4_lut_4_lut (.A(cnt_s4_num[3]), .B(cnt_s4_num[2]), .C(cnt_s4_num[1]), 
         .D(cnt_s4_num[0]), .Z(n88)) /* synthesis lut_function=(!(A (B (C)+!B (C+(D)))+!A (B+(C+(D))))) */ ;
    defparam i1_2_lut_4_lut_4_lut.init = 16'h080b;
    FD1S3IX cnt_150ms_473__i1 (.D(n97[1]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i1.GSR = "ENABLED";
    CCU2D cnt_150ms_473_add_4_11 (.A0(cnt_150ms[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5498), .COUT(n5499), .S0(n97[9]), .S1(n97[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_11.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut (.A(cnt_s4_num[13]), .B(cnt_s4_num[15]), .C(n51), 
         .Z(n5675)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_3_lut.init = 16'hfefe;
    FD1S3IX cnt_s2_num__i0 (.D(n20), .CK(clk_50MHz), .CD(n1542), .Q(\cnt_s2_num[0] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=91, LSE_RLINE=101 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i0.GSR = "ENABLED";
    LUT4 i5170_3_lut (.A(state_c[3]), .B(state_c[1]), .C(state_c[0]), 
         .Z(cnt_150ms_22__N_226)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(89[13:86])
    defparam i5170_3_lut.init = 16'h0101;
    LUT4 i5077_3_lut_4_lut (.A(cnt_s4_num[13]), .B(cnt_s4_num[15]), .C(cnt_s4_num[4]), 
         .D(cnt_s4_num[5]), .Z(n6186)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i5077_3_lut_4_lut.init = 16'hfffe;
    FD1S3IX cnt_150ms_473__i2 (.D(n97[2]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i2.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i3 (.D(n97[3]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i3.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i4 (.D(n97[4]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i4.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i5 (.D(n97[5]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i5.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i6 (.D(n97[6]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i6.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i7 (.D(n97[7]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i7.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i8 (.D(n97[8]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i8.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i9 (.D(n97[9]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[9])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i9.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i10 (.D(n97[10]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[10])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i10.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i11 (.D(n97[11]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[11])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i11.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i12 (.D(n97[12]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[12])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i12.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i13 (.D(n97[13]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[13])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i13.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i14 (.D(n97[14]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[14])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i14.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i15 (.D(n97[15]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[15])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i15.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i16 (.D(n97[16]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[16])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i16.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i17 (.D(n97[17]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[17])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i17.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i18 (.D(n97[18]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[18])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i18.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i19 (.D(n97[19]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[19])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i19.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i20 (.D(n97[20]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[20])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i20.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i21 (.D(n97[21]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[21])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i21.GSR = "ENABLED";
    FD1S3IX cnt_150ms_473__i22 (.D(n97[22]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_226), 
            .Q(cnt_150ms[22])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473__i22.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_103 (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .Z(n6612)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_103.init = 16'hdddd;
    FD1S3AX state_FSM_i1 (.D(n2080), .CK(clk_50MHz), .Q(state[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n2082), .CK(clk_50MHz), .Q(state_c[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AX state_FSM_i3 (.D(n2084), .CK(clk_50MHz), .Q(\state[2] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    FD1S3AX state_FSM_i4 (.D(n2086), .CK(clk_50MHz), .Q(state_c[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i4.GSR = "ENABLED";
    FD1S3AY state_FSM_i5 (.D(n2087), .CK(clk_50MHz), .Q(state_c[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i5.GSR = "ENABLED";
    LUT4 i5024_3_lut_4_lut_2_lut (.A(cnt_s2_num[2]), .B(\cnt_s2_num[0] ), 
         .Z(n5985)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i5024_3_lut_4_lut_2_lut.init = 16'hdddd;
    LUT4 i2_2_lut_rep_84_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(\cnt_s2_num[0] ), 
         .Z(n6593)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i2_2_lut_rep_84_3_lut.init = 16'hfdfd;
    LUT4 i2_2_lut_3_lut_4_lut_adj_58 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[0]), .D(cnt_s4_num[3]), .Z(n85)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A ((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i2_2_lut_3_lut_4_lut_adj_58.init = 16'h00d0;
    CCU2D add_153_15 (.A0(cnt_s4_num[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5486), .COUT(n5487), .S0(n357[13]), .S1(n357[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_15.INIT0 = 16'h5aaa;
    defparam add_153_15.INIT1 = 16'h5aaa;
    defparam add_153_15.INJECT1_0 = "NO";
    defparam add_153_15.INJECT1_1 = "NO";
    LUT4 i5121_4_lut (.A(n6628), .B(n6598), .C(n6220), .D(n6559), .Z(n6236)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i5121_4_lut.init = 16'ha080;
    LUT4 i73_3_lut (.A(init_data_8__N_236[7]), .B(n6236), .C(\state[2] ), 
         .Z(init_data_8__N_102[7])) /* synthesis lut_function=(!(A (B (C))+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(275[10] 311[32])
    defparam i73_3_lut.init = 16'h3a3a;
    LUT4 i1_2_lut_rep_110 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .C(cnt_s4_num[3]), 
         .Z(n6619)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_rep_110.init = 16'h8080;
    LUT4 i1_4_lut_4_lut_3_lut (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .C(cnt_s4_num[3]), 
         .Z(n28)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_4_lut_4_lut_3_lut.init = 16'hecec;
    LUT4 i1_2_lut_rep_104 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .Z(n6613)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_104.init = 16'hdddd;
    LUT4 i1_3_lut_4_lut_adj_59 (.A(n6602), .B(n6623), .C(n6591), .D(n6580), 
         .Z(n6089)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(218[13:17])
    defparam i1_3_lut_4_lut_adj_59.init = 16'hfeee;
    LUT4 i1_2_lut_rep_112 (.A(\cnt_s2_num[0] ), .B(cnt_s2_num[2]), .Z(n6621)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_112.init = 16'heeee;
    LUT4 i1_2_lut_rep_83_3_lut (.A(\cnt_s2_num[0] ), .B(cnt_s2_num[2]), 
         .C(cnt_s2_num[1]), .Z(n6592)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_83_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut_rep_90_3_lut (.A(\cnt_s2_num[0] ), .B(cnt_s2_num[2]), 
         .C(cnt_s2_num[1]), .Z(n6599)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i1_2_lut_rep_90_3_lut.init = 16'hefef;
    LUT4 i1_2_lut_rep_113 (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), .Z(n6622)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_2_lut_rep_113.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_86_3_lut_4_lut (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n6595)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_2_lut_rep_86_3_lut_4_lut.init = 16'hfbff;
    LUT4 i1_2_lut_rep_70_3_lut_4_lut (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n6579)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(232[13:18])
    defparam i1_2_lut_rep_70_3_lut_4_lut.init = 16'hfffb;
    LUT4 i1_2_lut_rep_114 (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), .Z(n6623)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i1_2_lut_rep_114.init = 16'hbbbb;
    LUT4 i3395_2_lut_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), .C(n6598), 
         .D(n6616), .Z(n4448)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i3395_2_lut_3_lut_4_lut.init = 16'hfdf0;
    LUT4 i2_3_lut_4_lut_4_lut_4_lut (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n5928)) /* synthesis lut_function=(A (B+(C+!(D)))+!A (B (C)+!B (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i2_3_lut_4_lut_4_lut_4_lut.init = 16'hf8fb;
    LUT4 i1_2_lut_rep_89_3_lut_4_lut (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n6598)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i1_2_lut_rep_89_3_lut_4_lut.init = 16'hfffb;
    LUT4 i3235_2_lut_3_lut_2_lut (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), 
         .Z(n6170)) /* synthesis lut_function=(A (B)+!A !(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i3235_2_lut_3_lut_2_lut.init = 16'h9999;
    LUT4 i1_2_lut_rep_69_3_lut_4_lut (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n6578)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i1_2_lut_rep_69_3_lut_4_lut.init = 16'hfbff;
    LUT4 i5044_2_lut_rep_50_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), .C(n6583), 
         .D(n6616), .Z(n6559)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i5044_2_lut_rep_50_3_lut_4_lut.init = 16'h0d00;
    CCU2D cnt_150ms_473_add_4_9 (.A0(cnt_150ms[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n5497), .COUT(n5498), .S0(n97[7]), .S1(n97[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_473_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_150ms_473_add_4_9.INJECT1_0 = "NO";
    defparam cnt_150ms_473_add_4_9.INJECT1_1 = "NO";
    LUT4 i1036_4_lut (.A(state[4]), .B(state_5__N_191[3]), .C(state_5__N_197[5]), 
         .D(state_c[3]), .Z(n2080)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1036_4_lut.init = 16'h3b0a;
    PFUMX i5306 (.BLUT(n6633), .ALUT(n6900), .C0(n6582), .Z(n6635));
    LUT4 i1_4_lut_adj_60 (.A(cnt_150ms[16]), .B(n5925), .C(n4), .D(n6174), 
         .Z(state_5__N_191[3])) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i1_4_lut_adj_60.init = 16'hfdff;
    PFUMX i5303 (.BLUT(n6629), .ALUT(n6630), .C0(cnt_s2_num[5]), .Z(n4348));
    LUT4 equal_81_i13_2_lut_rep_64_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n6604), 
         .C(n6622), .D(n6603), .Z(n6573)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam equal_81_i13_2_lut_rep_64_3_lut_4_lut.init = 16'hfffd;
    PFUMX i5301 (.BLUT(n6626), .ALUT(n6627), .C0(n6579), .Z(n6628));
    
endmodule
//
// Verilog Description of module lcd_write
//

module lcd_write (clk_50MHz, lcd_cs_c, wr_done, lcd_sclk_c, cnt_sclk, 
            n6589, \data[5] , \data[6] , n6608, \state[2] , \data[4] , 
            lcd_mosi_c, clk_50MHz_enable_97, \data[0] , \data[1] , n1530, 
            \state_3__N_25[1] , \data[7] , \data[2] , \data[3] ) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    output lcd_cs_c;
    output wr_done;
    output lcd_sclk_c;
    output [3:0]cnt_sclk;
    input n6589;
    input \data[5] ;
    input \data[6] ;
    input n6608;
    output \state[2] ;
    input \data[4] ;
    output lcd_mosi_c;
    input clk_50MHz_enable_97;
    input \data[0] ;
    input \data[1] ;
    output n1530;
    input \state_3__N_25[1] ;
    input \data[7] ;
    input \data[2] ;
    input \data[3] ;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    wire [3:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(36[17:22])
    wire [3:0]state_3__N_33;
    
    wire sclk_flag, sclk_flag_N_70;
    wire [4:0]cnt_delay;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(38[17:26])
    wire [4:0]n25;
    wire [15:0]n416;
    
    wire clk_50MHz_enable_9, mosi_N_65, sclk_N_53, n1;
    wire [3:0]n15;
    wire [3:0]n100;
    
    wire n6115, n3076, n6562, n6256, n2128;
    wire [0:0]n1299;
    
    wire mosi_N_56, mosi_N_58, n2127, clk_50MHz_enable_92, n2125, 
        mosi_N_60, n2126, n6615, clk_50MHz_enable_33, n1613, mosi_N_63, 
        mosi_N_64, n2065, n2064, n2090, n6259, mosi_N_55, mosi_N_59;
    wire [3:0]state_3__N_29;
    
    wire n6, mosi_N_61, n6248, mosi_N_62, n6208, n13, n14;
    
    FD1S3IX state_FSM_i0 (.D(state_3__N_33[3]), .CK(clk_50MHz), .CD(lcd_cs_c), 
            .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    FD1S3AX sclk_flag_97 (.D(sclk_flag_N_70), .CK(clk_50MHz), .Q(sclk_flag)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(96[10] 101[27])
    defparam sclk_flag_97.GSR = "ENABLED";
    FD1S3AX wr_done_101 (.D(state[3]), .CK(clk_50MHz), .Q(wr_done)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(155[10] 158[25])
    defparam wr_done_101.GSR = "ENABLED";
    LUT4 i4398_2_lut_3_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .C(cnt_delay[2]), 
         .Z(n25[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4398_2_lut_3_lut.init = 16'h7878;
    LUT4 i4405_2_lut_3_lut_4_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .C(cnt_delay[3]), 
         .D(cnt_delay[2]), .Z(n25[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4405_2_lut_3_lut_4_lut.init = 16'h78f0;
    FD1P3JX cnt1_FSM_i0 (.D(mosi_N_65), .SP(clk_50MHz_enable_9), .PD(state[1]), 
            .CK(clk_50MHz), .Q(n416[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i0.GSR = "ENABLED";
    FD1S3IX sclk_99 (.D(sclk_N_53), .CK(clk_50MHz), .CD(state[0]), .Q(lcd_sclk_c)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(118[10] 126[22])
    defparam sclk_99.GSR = "ENABLED";
    LUT4 i5173_4_lut (.A(cnt_sclk[0]), .B(cnt_sclk[3]), .C(cnt_sclk[2]), 
         .D(cnt_sclk[1]), .Z(sclk_flag_N_70)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(98[13:44])
    defparam i5173_4_lut.init = 16'h0200;
    FD1S3IX state2_finish_flag_98 (.D(sclk_flag_N_70), .CK(clk_50MHz), .CD(n1), 
            .Q(state_3__N_33[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(107[10] 110[36])
    defparam state2_finish_flag_98.GSR = "ENABLED";
    FD1S3IX cnt_sclk__i0 (.D(n15[0]), .CK(clk_50MHz), .CD(n6589), .Q(cnt_sclk[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(86[10] 89[37])
    defparam cnt_sclk__i0.GSR = "ENABLED";
    LUT4 i592_2_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .Z(n100[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(89[21:36])
    defparam i592_2_lut.init = 16'h6666;
    LUT4 i5186_4_lut (.A(cnt_delay[4]), .B(state[1]), .C(n6115), .D(cnt_delay[2]), 
         .Z(n3076)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(68[10] 71[26])
    defparam i5186_4_lut.init = 16'hfffb;
    LUT4 i5011_2_lut (.A(state[3]), .B(cnt_delay[3]), .Z(n6115)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i5011_2_lut.init = 16'heeee;
    LUT4 i4391_2_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .Z(n25[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4391_2_lut.init = 16'h6666;
    LUT4 i4389_1_lut (.A(cnt_delay[0]), .Z(n25[0])) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4389_1_lut.init = 16'h5555;
    LUT4 i5154_4_lut_4_lut (.A(n6562), .B(n6256), .C(n2128), .D(n1299[0]), 
         .Z(mosi_N_56)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[13:57])
    defparam i5154_4_lut_4_lut.init = 16'hf4b0;
    LUT4 i1083_3_lut (.A(\data[5] ), .B(\data[6] ), .C(mosi_N_58), .Z(n2127)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i1083_3_lut.init = 16'hcaca;
    LUT4 i32_2_lut_rep_55_4_lut (.A(n6608), .B(cnt_sclk[2]), .C(cnt_sclk[3]), 
         .D(\state[2] ), .Z(clk_50MHz_enable_92)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(79[32:56])
    defparam i32_2_lut_rep_55_4_lut.init = 16'h0400;
    LUT4 i1082_3_lut (.A(n2125), .B(\data[4] ), .C(mosi_N_60), .Z(n2126)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i1082_3_lut.init = 16'hcaca;
    LUT4 i4412_3_lut_4_lut (.A(cnt_delay[2]), .B(n6615), .C(cnt_delay[3]), 
         .D(cnt_delay[4]), .Z(n25[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4412_3_lut_4_lut.init = 16'h7f80;
    FD1P3AX mosi_100 (.D(n1613), .SP(clk_50MHz_enable_33), .CK(clk_50MHz), 
            .Q(lcd_mosi_c)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[10] 149[22])
    defparam mosi_100.GSR = "ENABLED";
    LUT4 sclk_I_0_2_lut (.A(lcd_sclk_c), .B(sclk_flag), .Z(sclk_N_53)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(126[9:22])
    defparam sclk_I_0_2_lut.init = 16'h6666;
    LUT4 i1_1_lut (.A(mosi_N_65), .Z(n1)) /* synthesis lut_function=(!(A)) */ ;
    defparam i1_1_lut.init = 16'h5555;
    LUT4 i1010_2_lut (.A(cnt_sclk[0]), .B(clk_50MHz_enable_97), .Z(n15[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(86[10] 89[37])
    defparam i1010_2_lut.init = 16'h6666;
    LUT4 i1034_4_lut (.A(\data[0] ), .B(\data[1] ), .C(mosi_N_63), .D(mosi_N_64), 
         .Z(n1299[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i1034_4_lut.init = 16'hcac0;
    FD1S3JX state_FSM_i3 (.D(n2065), .CK(clk_50MHz), .PD(state[3]), .Q(state[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n2064), .CK(clk_50MHz), .Q(state[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AX state_FSM_i1 (.D(n2090), .CK(clk_50MHz), .Q(\state[2] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    LUT4 state_3__N_22_I_0_118_1_lut (.A(\state[2] ), .Z(lcd_cs_c)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(161[13:44])
    defparam state_3__N_22_I_0_118_1_lut.init = 16'h5555;
    PFUMX mosi_I_1 (.BLUT(n2126), .ALUT(mosi_N_56), .C0(n6259), .Z(mosi_N_55)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;
    LUT4 i5139_2_lut (.A(mosi_N_58), .B(mosi_N_59), .Z(n6256)) /* synthesis lut_function=(!(A+(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i5139_2_lut.init = 16'h1111;
    LUT4 i519_1_lut (.A(wr_done), .Z(n1530)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(155[10] 158[25])
    defparam i519_1_lut.init = 16'h5555;
    LUT4 i1021_2_lut (.A(state[0]), .B(\state_3__N_25[1] ), .Z(n2065)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam i1021_2_lut.init = 16'h2222;
    LUT4 i1020_4_lut (.A(state[1]), .B(\state_3__N_25[1] ), .C(state_3__N_29[1]), 
         .D(state[0]), .Z(n2064)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(54[9] 59[16])
    defparam i1020_4_lut.init = 16'heca0;
    LUT4 state_3__N_21_I_0_2_lut_rep_53 (.A(state[1]), .B(state_3__N_29[1]), 
         .Z(n6562)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[13:57])
    defparam state_3__N_21_I_0_2_lut_rep_53.init = 16'h2222;
    LUT4 i1084_3_lut_4_lut (.A(state[1]), .B(state_3__N_29[1]), .C(\data[7] ), 
         .D(n2127), .Z(n2128)) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[13:57])
    defparam i1084_3_lut_4_lut.init = 16'hfd20;
    LUT4 i1046_3_lut_4_lut (.A(state[1]), .B(state_3__N_29[1]), .C(state_3__N_33[3]), 
         .D(\state[2] ), .Z(n2090)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[13:57])
    defparam i1046_3_lut_4_lut.init = 16'h2f22;
    LUT4 i4_4_lut (.A(cnt_delay[3]), .B(cnt_delay[2]), .C(cnt_delay[0]), 
         .D(n6), .Z(state_3__N_29[1])) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[32:57])
    defparam i4_4_lut.init = 16'hfffb;
    LUT4 i1_2_lut (.A(cnt_delay[1]), .B(cnt_delay[4]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[32:57])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1081_3_lut (.A(\data[2] ), .B(\data[3] ), .C(mosi_N_61), .Z(n2125)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i1081_3_lut.init = 16'hcaca;
    LUT4 i5215_4_lut (.A(n6562), .B(mosi_N_58), .C(mosi_N_59), .D(n6248), 
         .Z(n6259)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(136[10] 149[22])
    defparam i5215_4_lut.init = 16'hfffe;
    LUT4 i5131_3_lut (.A(mosi_N_60), .B(mosi_N_61), .C(mosi_N_62), .Z(n6248)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i5131_3_lut.init = 16'h0101;
    LUT4 i5175_4_lut (.A(state[0]), .B(state_3__N_29[1]), .C(n6208), .D(state[1]), 
         .Z(clk_50MHz_enable_33)) /* synthesis lut_function=(A+(B (C)+!B (C+(D)))) */ ;
    defparam i5175_4_lut.init = 16'hfbfa;
    LUT4 i5094_4_lut (.A(\state[2] ), .B(n13), .C(sclk_flag), .D(n14), 
         .Z(n6208)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i5094_4_lut.init = 16'ha080;
    LUT4 i5_4_lut (.A(mosi_N_65), .B(mosi_N_63), .C(mosi_N_59), .D(mosi_N_61), 
         .Z(n13)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i5_4_lut.init = 16'hfffe;
    LUT4 i6_4_lut (.A(mosi_N_62), .B(mosi_N_64), .C(mosi_N_60), .D(mosi_N_58), 
         .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(137[9] 147[16])
    defparam i6_4_lut.init = 16'hfffe;
    FD1P3IX cnt1_FSM_i1 (.D(n416[0]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_58));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i1.GSR = "ENABLED";
    LUT4 i3202_2_lut (.A(mosi_N_55), .B(state[0]), .Z(n1613)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[10] 149[22])
    defparam i3202_2_lut.init = 16'h2222;
    LUT4 i599_2_lut_3_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .C(cnt_sclk[2]), 
         .Z(n100[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(89[21:36])
    defparam i599_2_lut_3_lut.init = 16'h7878;
    LUT4 i606_3_lut_4_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .C(cnt_sclk[2]), 
         .D(cnt_sclk[3]), .Z(n100[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(89[21:36])
    defparam i606_3_lut_4_lut.init = 16'h7f80;
    FD1P3IX cnt1_FSM_i2 (.D(mosi_N_58), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i2.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i3 (.D(n416[2]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_59));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i3.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i4 (.D(mosi_N_59), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i4.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i5 (.D(n416[4]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_60));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i5.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i6 (.D(mosi_N_60), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i6.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i7 (.D(n416[6]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_61));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i7.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i8 (.D(mosi_N_61), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i8.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i9 (.D(n416[8]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_62));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i9.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i10 (.D(mosi_N_62), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i10.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i11 (.D(n416[10]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_63));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i11.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i12 (.D(mosi_N_63), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i12.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i13 (.D(n416[12]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_64));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i13.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i14 (.D(mosi_N_64), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n416[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i14.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i15 (.D(n416[14]), .SP(clk_50MHz_enable_92), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_65));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(80[17:28])
    defparam cnt1_FSM_i15.GSR = "ENABLED";
    FD1P3IX cnt_sclk__i1 (.D(n100[1]), .SP(clk_50MHz_enable_97), .CD(n6589), 
            .CK(clk_50MHz), .Q(cnt_sclk[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(86[10] 89[37])
    defparam cnt_sclk__i1.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut (.A(\state[2] ), .B(n6589), .C(state[1]), .Z(clk_50MHz_enable_9)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(79[13:56])
    defparam i1_2_lut_3_lut.init = 16'hf8f8;
    LUT4 i4394_2_lut_rep_106 (.A(cnt_delay[1]), .B(cnt_delay[0]), .Z(n6615)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam i4394_2_lut_rep_106.init = 16'h8888;
    FD1P3IX cnt_sclk__i2 (.D(n100[2]), .SP(clk_50MHz_enable_97), .CD(n6589), 
            .CK(clk_50MHz), .Q(cnt_sclk[2])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(86[10] 89[37])
    defparam cnt_sclk__i2.GSR = "ENABLED";
    FD1P3IX cnt_sclk__i3 (.D(n100[3]), .SP(clk_50MHz_enable_97), .CD(n6589), 
            .CK(clk_50MHz), .Q(cnt_sclk[3])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=62, LSE_RLINE=74 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(86[10] 89[37])
    defparam cnt_sclk__i3.GSR = "ENABLED";
    FD1S3IX cnt_delay_471__i1 (.D(n25[1]), .CK(clk_50MHz), .CD(n3076), 
            .Q(cnt_delay[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam cnt_delay_471__i1.GSR = "ENABLED";
    FD1S3IX cnt_delay_471__i2 (.D(n25[2]), .CK(clk_50MHz), .CD(n3076), 
            .Q(cnt_delay[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam cnt_delay_471__i2.GSR = "ENABLED";
    FD1S3IX cnt_delay_471__i3 (.D(n25[3]), .CK(clk_50MHz), .CD(n3076), 
            .Q(cnt_delay[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam cnt_delay_471__i3.GSR = "ENABLED";
    FD1S3IX cnt_delay_471__i4 (.D(n25[4]), .CK(clk_50MHz), .CD(n3076), 
            .Q(cnt_delay[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam cnt_delay_471__i4.GSR = "ENABLED";
    FD1S3IX cnt_delay_471__i0 (.D(n25[0]), .CK(clk_50MHz), .CD(n3076), 
            .Q(cnt_delay[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(69[22:38])
    defparam cnt_delay_471__i0.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module control
//

module control (cnt1, clk_50MHz, \state_3__N_574[1] , n5, \state_3__N_25[1] , 
            \data[0] , init_data, \show_pic_data[0] , \state[5] , lcd_dc_c_8, 
            \data[7] , \data[6] , \data[5] , \data[4] , \data[3] , 
            \data[2] , \data[1] , clk_50MHz_enable_59, \show_pic_data[8] , 
            \show_pic_data[7] , \show_pic_data[6] , \show_pic_data[3] , 
            \show_pic_data[4] , \show_pic_data[2] , \show_pic_data[1] , 
            en_write_init, en_write_show_pic) /* synthesis syn_module_defined=1 */ ;
    output [1:0]cnt1;
    input clk_50MHz;
    output \state_3__N_574[1] ;
    input n5;
    output \state_3__N_25[1] ;
    output \data[0] ;
    input [8:0]init_data;
    input \show_pic_data[0] ;
    input \state[5] ;
    output lcd_dc_c_8;
    output \data[7] ;
    output \data[6] ;
    output \data[5] ;
    output \data[4] ;
    output \data[3] ;
    output \data[2] ;
    output \data[1] ;
    input clk_50MHz_enable_59;
    input \show_pic_data[8] ;
    input \show_pic_data[7] ;
    input \show_pic_data[6] ;
    input \show_pic_data[3] ;
    input \show_pic_data[4] ;
    input \show_pic_data[2] ;
    input \show_pic_data[1] ;
    input en_write_init;
    input en_write_show_pic;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    
    wire en_write_N_100;
    wire [8:0]data_8__N_73;
    
    wire show_pic_flag_N_99;
    wire [1:0]n48;
    
    FD1S3IX cnt1__i0 (.D(n5), .CK(clk_50MHz), .CD(\state_3__N_574[1] ), 
            .Q(cnt1[0])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(44[10] 49[22])
    defparam cnt1__i0.GSR = "ENABLED";
    FD1S3AX en_write_31 (.D(en_write_N_100), .CK(clk_50MHz), .Q(\state_3__N_25[1] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(34[10] 39[30])
    defparam en_write_31.GSR = "ENABLED";
    FD1S3AX data_i0 (.D(data_8__N_73[0]), .CK(clk_50MHz), .Q(\data[0] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i0.GSR = "ENABLED";
    FD1S3AX show_pic_flag_33 (.D(show_pic_flag_N_99), .CK(clk_50MHz), .Q(\state_3__N_574[1] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(54[10] 57[31])
    defparam show_pic_flag_33.GSR = "ENABLED";
    LUT4 mux_7_i1_3_lut (.A(init_data[0]), .B(\show_pic_data[0] ), .C(\state[5] ), 
         .Z(data_8__N_73[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i1_3_lut.init = 16'hcaca;
    LUT4 i5188_2_lut (.A(cnt1[0]), .B(cnt1[1]), .Z(show_pic_flag_N_99)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(54[13:24])
    defparam i5188_2_lut.init = 16'h4444;
    FD1S3AX data_i8 (.D(data_8__N_73[8]), .CK(clk_50MHz), .Q(lcd_dc_c_8)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i8.GSR = "ENABLED";
    FD1S3AX data_i7 (.D(data_8__N_73[7]), .CK(clk_50MHz), .Q(\data[7] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i7.GSR = "ENABLED";
    FD1S3AX data_i6 (.D(data_8__N_73[6]), .CK(clk_50MHz), .Q(\data[6] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i6.GSR = "ENABLED";
    FD1S3AX data_i5 (.D(data_8__N_73[5]), .CK(clk_50MHz), .Q(\data[5] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i5.GSR = "ENABLED";
    FD1S3AX data_i4 (.D(data_8__N_73[4]), .CK(clk_50MHz), .Q(\data[4] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i4.GSR = "ENABLED";
    FD1S3AX data_i3 (.D(data_8__N_73[3]), .CK(clk_50MHz), .Q(\data[3] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i3.GSR = "ENABLED";
    FD1S3AX data_i2 (.D(data_8__N_73[2]), .CK(clk_50MHz), .Q(\data[2] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i2.GSR = "ENABLED";
    FD1S3AX data_i1 (.D(data_8__N_73[1]), .CK(clk_50MHz), .Q(\data[1] )) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(24[10] 29[22])
    defparam data_i1.GSR = "ENABLED";
    FD1P3IX cnt1__i1 (.D(n48[1]), .SP(clk_50MHz_enable_59), .CD(\state_3__N_574[1] ), 
            .CK(clk_50MHz), .Q(cnt1[1])) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(44[10] 49[22])
    defparam cnt1__i1.GSR = "ENABLED";
    LUT4 mux_7_i9_3_lut (.A(init_data[8]), .B(\show_pic_data[8] ), .C(\state[5] ), 
         .Z(data_8__N_73[8])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i9_3_lut.init = 16'hcaca;
    LUT4 mux_7_i8_3_lut (.A(init_data[7]), .B(\show_pic_data[7] ), .C(\state[5] ), 
         .Z(data_8__N_73[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i8_3_lut.init = 16'hcaca;
    LUT4 mux_7_i7_3_lut (.A(init_data[6]), .B(\show_pic_data[6] ), .C(\state[5] ), 
         .Z(data_8__N_73[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i7_3_lut.init = 16'hcaca;
    LUT4 mux_7_i6_3_lut (.A(init_data[5]), .B(\show_pic_data[3] ), .C(\state[5] ), 
         .Z(data_8__N_73[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i6_3_lut.init = 16'hcaca;
    LUT4 mux_7_i5_3_lut (.A(init_data[4]), .B(\show_pic_data[4] ), .C(\state[5] ), 
         .Z(data_8__N_73[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i5_3_lut.init = 16'hcaca;
    LUT4 mux_7_i4_3_lut (.A(init_data[3]), .B(\show_pic_data[3] ), .C(\state[5] ), 
         .Z(data_8__N_73[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i4_3_lut.init = 16'hcaca;
    LUT4 mux_7_i3_3_lut (.A(init_data[2]), .B(\show_pic_data[2] ), .C(\state[5] ), 
         .Z(data_8__N_73[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i3_3_lut.init = 16'hcaca;
    LUT4 mux_7_i2_3_lut (.A(init_data[1]), .B(\show_pic_data[1] ), .C(\state[5] ), 
         .Z(data_8__N_73[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[9:22])
    defparam mux_7_i2_3_lut.init = 16'hcaca;
    LUT4 i621_2_lut (.A(cnt1[1]), .B(cnt1[0]), .Z(n48[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(47[17:28])
    defparam i621_2_lut.init = 16'h6666;
    PFUMX en_write_I_0 (.BLUT(en_write_init), .ALUT(en_write_show_pic), 
          .C0(\state[5] ), .Z(en_write_N_100)) /* synthesis LSE_LINE_FILE_ID=8, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=76, LSE_RLINE=89 */ ;
    
endmodule
//
// Verilog Description of module pll
//

module pll (clk_c, clk_50MHz, GND_net) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input clk_c;
    output clk_50MHz;
    input GND_net;
    
    wire clk_c /* synthesis is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(21[22:25])
    wire clk_50MHz /* synthesis SET_AS_NETWORK=clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(51[10:19])
    
    EHXPLLJ PLLInst_0 (.CLKI(clk_c), .CLKFB(clk_50MHz), .PHASESEL0(GND_net), 
            .PHASESEL1(GND_net), .PHASEDIR(GND_net), .PHASESTEP(GND_net), 
            .LOADREG(GND_net), .STDBY(GND_net), .PLLWAKESYNC(GND_net), 
            .RST(GND_net), .RESETC(GND_net), .RESETD(GND_net), .RESETM(GND_net), 
            .ENCLKOP(GND_net), .ENCLKOS(GND_net), .ENCLKOS2(GND_net), 
            .ENCLKOS3(GND_net), .PLLCLK(GND_net), .PLLRST(GND_net), .PLLSTB(GND_net), 
            .PLLWE(GND_net), .PLLDATI0(GND_net), .PLLDATI1(GND_net), .PLLDATI2(GND_net), 
            .PLLDATI3(GND_net), .PLLDATI4(GND_net), .PLLDATI5(GND_net), 
            .PLLDATI6(GND_net), .PLLDATI7(GND_net), .PLLADDR0(GND_net), 
            .PLLADDR1(GND_net), .PLLADDR2(GND_net), .PLLADDR3(GND_net), 
            .PLLADDR4(GND_net), .CLKOP(clk_50MHz)) /* synthesis FREQUENCY_PIN_CLKOP="48.000000", FREQUENCY_PIN_CLKI="12.000000", ICP_CURRENT="8", LPF_RESISTOR="8", syn_instantiated=1, LSE_LINE_FILE_ID=8, LSE_LCOL=5, LSE_RCOL=3, LSE_LLINE=56, LSE_RLINE=60 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/picture_display.v(56[5] 60[3])
    defparam PLLInst_0.CLKI_DIV = 1;
    defparam PLLInst_0.CLKFB_DIV = 4;
    defparam PLLInst_0.CLKOP_DIV = 11;
    defparam PLLInst_0.CLKOS_DIV = 1;
    defparam PLLInst_0.CLKOS2_DIV = 1;
    defparam PLLInst_0.CLKOS3_DIV = 1;
    defparam PLLInst_0.CLKOP_ENABLE = "ENABLED";
    defparam PLLInst_0.CLKOS_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS2_ENABLE = "DISABLED";
    defparam PLLInst_0.CLKOS3_ENABLE = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_A0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_B0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_C0 = "DISABLED";
    defparam PLLInst_0.VCO_BYPASS_D0 = "DISABLED";
    defparam PLLInst_0.CLKOP_CPHASE = 10;
    defparam PLLInst_0.CLKOS_CPHASE = 0;
    defparam PLLInst_0.CLKOS2_CPHASE = 0;
    defparam PLLInst_0.CLKOS3_CPHASE = 0;
    defparam PLLInst_0.CLKOP_FPHASE = 0;
    defparam PLLInst_0.CLKOS_FPHASE = 0;
    defparam PLLInst_0.CLKOS2_FPHASE = 0;
    defparam PLLInst_0.CLKOS3_FPHASE = 0;
    defparam PLLInst_0.FEEDBK_PATH = "CLKOP";
    defparam PLLInst_0.FRACN_ENABLE = "DISABLED";
    defparam PLLInst_0.FRACN_DIV = 0;
    defparam PLLInst_0.CLKOP_TRIM_POL = "RISING";
    defparam PLLInst_0.CLKOP_TRIM_DELAY = 0;
    defparam PLLInst_0.CLKOS_TRIM_POL = "FALLING";
    defparam PLLInst_0.CLKOS_TRIM_DELAY = 0;
    defparam PLLInst_0.PLL_USE_WB = "DISABLED";
    defparam PLLInst_0.PREDIVIDER_MUXA1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXB1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXC1 = 0;
    defparam PLLInst_0.PREDIVIDER_MUXD1 = 0;
    defparam PLLInst_0.OUTDIVIDER_MUXA2 = "DIVA";
    defparam PLLInst_0.OUTDIVIDER_MUXB2 = "DIVB";
    defparam PLLInst_0.OUTDIVIDER_MUXC2 = "DIVC";
    defparam PLLInst_0.OUTDIVIDER_MUXD2 = "DIVD";
    defparam PLLInst_0.PLL_LOCK_MODE = 0;
    defparam PLLInst_0.STDBY_ENABLE = "DISABLED";
    defparam PLLInst_0.DPHASE_SOURCE = "DISABLED";
    defparam PLLInst_0.PLLRST_ENA = "DISABLED";
    defparam PLLInst_0.MRST_ENA = "DISABLED";
    defparam PLLInst_0.DCRST_ENA = "DISABLED";
    defparam PLLInst_0.DDRST_ENA = "DISABLED";
    defparam PLLInst_0.INTFB_WAKE = "DISABLED";
    
endmodule
