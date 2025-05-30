// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Sun Mar 09 08:03:41 2025
//
// Verilog Description of module template
//

module template (clk, rst, ball_release_button, adc_dat, key_up, key_down, 
            adc_cs, adc_clk, i2c_scl, i2c_sda, lcd_rst, lcd_blk, 
            lcd_dc, lcd_sclk, lcd_mosi, lcd_cs, led, seg_led_1, 
            seg_led_2) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(1[9:17])
    input clk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    input rst;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(4[22:25])
    input ball_release_button;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(6[16:35])
    input adc_dat;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(9[13:20])
    input key_up;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(10[13:19])
    input key_down;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(11[13:21])
    output adc_cs;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(12[14:20])
    output adc_clk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(13[14:21])
    output i2c_scl;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(15[14:21])
    inout i2c_sda;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(16[13:20])
    output lcd_rst;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(18[19:26])
    output lcd_blk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(19[12:19])
    output lcd_dc;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(20[22:28])
    output lcd_sclk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(21[22:30])
    output lcd_mosi;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(22[22:30])
    output lcd_cs;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(23[22:28])
    output led;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(25[13:16])
    output [8:0]seg_led_1;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    output [8:0]seg_led_2;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire clk_24MHz /* synthesis SET_AS_NETWORK=clk_24MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(30[6:15])
    wire dat_valid /* synthesis SET_AS_NETWORK=dat_valid, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(70[6:15])
    wire clk_c_enable_20 /* synthesis is_clock=1, SET_AS_NETWORK=clk_c_enable_20 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    
    wire GND_net, VCC_net, rst_c, ball_release_button_c, adc_dat_c, 
        key_up_c_1, key_down_c_0, adc_cs_c, adc_clk_c, i2c_scl_c, 
        lcd_rst_c, lcd_dc_c_8, lcd_sclk_c, lcd_mosi_c, lcd_cs_c, led_c, 
        n18368, n18367, seg_led_2_0_3;
    wire [7:0]adc_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(39[12:20])
    wire [1:0]k;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(51[12:13])
    wire [8:0]home;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(53[12:16])
    wire [8:0]handline;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(58[12:20])
    wire [7:0]hand_velocity;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(59[11:24])
    wire [15:0]prox_dat;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(71[31:39])
    
    wire led_N_11;
    wire [16:0]home_8__N_1;
    
    wire n2283, n18366, n11822;
    wire [3:0]cnt_adj_2688;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[12:15])
    wire [3:0]cnt_main;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[17:25])
    wire [3:0]cnt_mode1;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    wire [3:0]cnt_mode2;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    wire [3:0]cnt_write;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[60:69])
    wire [3:0]cnt_read;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[71:79])
    wire [7:0]data_wr;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[12:19])
    
    wire n21529;
    wire [3:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    wire [3:0]state_back;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[20:30])
    
    wire dat_valid_N_624, n2323, n2319, n18365, n18364, n18363, 
        n324, i2c_sda_N_643, n21555, n18362, i2c_sda_N_637, n18361, 
        n2305, n2303, n2278, n18360, n13675, i2c_sda_N_620, n19914, 
        n4442, n54, n9, n8, n7, n6, n5, n4, n18359, n2295, 
        n6_adj_2665, n72, n21551, n18358, pic_y_8__N_817, pic_y_8__N_792, 
        pic_y_8__N_814, pic_y_8__N_791, pic_y_8__N_811, pic_y_8__N_790, 
        pic_y_8__N_808, pic_y_8__N_789, pic_y_8__N_805, pic_y_8__N_788, 
        pic_y_8__N_802, pic_y_8__N_787, pic_y_8__N_782, pic_y_8__N_793, 
        pic_y_8__N_785, pic_y_8__N_796, pic_y_8__N_786, pic_y_8__N_799, 
        wr_done, clk_50MHz_enable_61, clk_50MHz_enable_100, clk_50MHz_enable_30, 
        clk_50MHz_enable_79, clk_50MHz_enable_43, n18200, n9389, n18352, 
        n22429, n48, n47, n18351, n18350, n46, n18349, n45, 
        n44, n43;
    wire [3:0]state_adj_2714;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(34[17:22])
    wire [3:0]cnt_sclk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(40[17:25])
    
    wire n42, n41, n40;
    wire [5:0]state_adj_2728;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(47[13:18])
    
    wire n39, n38, n37, n11417;
    wire [3:0]state_adj_2735;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(45[17:22])
    
    wire the1_wr_done;
    wire [2:0]cnt_rom_prepare;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(55[17:32])
    
    wire length_num_flag, n8_adj_2668, n9567, n24, n30, n14616, 
        n67, n5150;
    wire [3:0]state_adj_2745;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(43[17:22])
    
    wire n4652, n22430, n22428;
    wire [3:0]state_adj_2755;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(43[17:22])
    
    wire n27, n18508, n2619, n10, n2615, n5_adj_2673, n1, n3, 
        n21688, n21, n24_adj_2674, n4_adj_2675, n2325, n18199, n20445, 
        n18198, n5151, n5152, n5153, n5154, n5155, n5156, n5161, 
        n21678, n21677, n20450, n20449, n20448, n33, n20447, n20446, 
        n21668, n9625, n21666, n21664, n20441, n21514, n21659, 
        n21653, n21652, n5039, n20432, clk_400khz_enable_5, n21450, 
        n20431, n21644, i2c_sda_out, n7_adj_2676, n20430, n20134, 
        n10_adj_2677, n20424, n21638, n21637, n21635, n21631, n21630, 
        n21386, n19972, n57, n4_adj_2678, n22433, n21542, n22431, 
        n22432, n21540, n21696, n21695, n21576, n18197, n8_adj_2679, 
        n21509, n6_adj_2680, n18375, n18374, n18598, n18373, n18372, 
        n14444, n21564, n18369, n16;
    
    VHI i2 (.Z(VCC_net));
    lcd lcd1 (.clk_c(clk_c), .GND_net(GND_net), .n21631(n21631), .ball_release_button_c(ball_release_button_c), 
        .n21630(n21630), .n21678(n21678), .n21677(n21677), .n21666(n21666), 
        .n21664(n21664), .home({home}), .n21638(n21638), .n21637(n21637), 
        .n21635(n21635), .wr_done(wr_done), .\cnt_sclk[3] (cnt_sclk[3]), 
        .clk_50MHz_enable_43(clk_50MHz_enable_43), .\cnt_sclk[2] (cnt_sclk[2]), 
        .lcd_cs_c(lcd_cs_c), .\state[2] (state_adj_2714[2]), .lcd_sclk_c(lcd_sclk_c), 
        .n21652(n21652), .lcd_mosi_c(lcd_mosi_c), .length_num_flag(length_num_flag), 
        .\cnt_rom_prepare[2] (cnt_rom_prepare[2]), .clk_50MHz_enable_30(clk_50MHz_enable_30), 
        .\state[2]_adj_16 (state_adj_2735[2]), .n14444(n14444), .the1_wr_done(the1_wr_done), 
        .clk_50MHz_enable_79(clk_50MHz_enable_79), .n22433(n22433), .lcd_rst_c(lcd_rst_c), 
        .\state[4] (state_adj_2728[4]), .handline({handline}), .\state[2]_adj_17 (state_adj_2755[2]), 
        .clk_50MHz_enable_100(clk_50MHz_enable_100), .\state[3] (state_adj_2745[3]), 
        .\state[2]_adj_18 (state_adj_2745[2]), .clk_50MHz_enable_61(clk_50MHz_enable_61), 
        .\state[3]_adj_19 (state_adj_2755[3]), .rst_c(rst_c), .lcd_dc_c_8(lcd_dc_c_8)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(127[5] 140[2])
    OB seg_led_1_pad_3 (.I(VCC_net), .O(seg_led_1[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_4 (.I(VCC_net), .O(seg_led_1[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_5 (.I(VCC_net), .O(seg_led_1[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_6 (.I(GND_net), .O(seg_led_1[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_7 (.I(VCC_net), .O(seg_led_1[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB lcd_dc_pad (.I(lcd_dc_c_8), .O(lcd_dc));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(20[22:28])
    OB seg_led_1_pad_8 (.I(GND_net), .O(seg_led_1[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB lcd_sclk_pad (.I(lcd_sclk_c), .O(lcd_sclk));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(21[22:30])
    OB lcd_blk_pad (.I(VCC_net), .O(lcd_blk));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(19[12:19])
    OB lcd_rst_pad (.I(lcd_rst_c), .O(lcd_rst));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(18[19:26])
    LUT4 n7_bdd_4_lut (.A(n21564), .B(i2c_sda_N_637), .C(n4_adj_2675), 
         .D(state[1]), .Z(n21514)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C+(D)))+!A ((D)+!C))) */ ;
    defparam n7_bdd_4_lut.init = 16'h22f0;
    jumping jump (.n21688(n21688), .pic_y_8__N_814(pic_y_8__N_814), .pic_y_8__N_791(pic_y_8__N_791), 
            .VCC_net(VCC_net), .GND_net(GND_net), .pic_y_8__N_782(pic_y_8__N_782), 
            .pic_y_8__N_793(pic_y_8__N_793), .n22433(n22433), .pic_y_8__N_792(pic_y_8__N_792), 
            .k({k}), .pic_y_8__N_785(pic_y_8__N_785), .pic_y_8__N_786(pic_y_8__N_786), 
            .pic_y_8__N_787(pic_y_8__N_787), .pic_y_8__N_788(pic_y_8__N_788), 
            .pic_y_8__N_789(pic_y_8__N_789), .pic_y_8__N_790(pic_y_8__N_790), 
            .pic_y_8__N_811(pic_y_8__N_811), .\hand_velocity[4] (hand_velocity[4]), 
            .n21664(n21664), .n21678(n21678), .n21677(n21677), .n21631(n21631), 
            .n21635(n21635), .n21637(n21637), .n21638(n21638), .n21630(n21630), 
            .handline({handline}), .\hand_velocity[5] (hand_velocity[5]), 
            .\hand_velocity[1] (hand_velocity[1]), .\hand_velocity[3] (hand_velocity[3]), 
            .pic_y_8__N_796(pic_y_8__N_796), .\hand_velocity[6] (hand_velocity[6]), 
            .pic_y_8__N_799(pic_y_8__N_799), .\hand_velocity[2] (hand_velocity[2]), 
            .pic_y_8__N_802(pic_y_8__N_802), .\hand_velocity[7] (hand_velocity[7]), 
            .pic_y_8__N_805(pic_y_8__N_805), .pic_y_8__N_808(pic_y_8__N_808), 
            .n21666(n21666), .pic_y_8__N_817(pic_y_8__N_817), .clk_c(clk_c)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(106[9] 123[2])
    OB i2c_scl_pad (.I(i2c_scl_c), .O(i2c_scl));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(15[14:21])
    LUT4 i1_4_lut_then_4_lut (.A(n4652), .B(state[1]), .C(state[0]), .D(n21564), 
         .Z(n21696)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;
    defparam i1_4_lut_then_4_lut.init = 16'h0aca;
    LUT4 n4652_bdd_4_lut (.A(n4652), .B(state[2]), .C(n21386), .D(state[0]), 
         .Z(n24)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))+!A (C (D))) */ ;
    defparam n4652_bdd_4_lut.init = 16'hf088;
    LUT4 i5_3_lut (.A(handline[8]), .B(n10_adj_2677), .C(handline[6]), 
         .Z(led_N_11)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i5_3_lut.init = 16'hfefe;
    LUT4 i4_4_lut (.A(handline[5]), .B(handline[4]), .C(n8_adj_2668), 
         .D(handline[7]), .Z(n10_adj_2677)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i2597_4_lut (.A(handline[0]), .B(handline[3]), .C(handline[2]), 
         .D(handline[1]), .Z(n8_adj_2668)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i2597_4_lut.init = 16'hc8c0;
    LUT4 i18360_3_lut (.A(data_wr[1]), .B(data_wr[0]), .C(cnt_adj_2688[0]), 
         .Z(n20448)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i18360_3_lut.init = 16'hcaca;
    VLO i1 (.Z(GND_net));
    LUT4 i2391_3_lut (.A(state_adj_2755[2]), .B(state_adj_2755[3]), .C(the1_wr_done), 
         .Z(clk_50MHz_enable_61)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;
    defparam i2391_3_lut.init = 16'hecec;
    LUT4 i18359_3_lut (.A(data_wr[3]), .B(data_wr[2]), .C(cnt_adj_2688[0]), 
         .Z(n20447)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i18359_3_lut.init = 16'hcaca;
    LUT4 i1_4_lut_else_4_lut (.A(n2619), .B(cnt_main[0]), .C(cnt_main[1]), 
         .D(dat_valid_N_624), .Z(n22429)) /* synthesis lut_function=(!(A+!(B (C (D))+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_4_lut_else_4_lut.init = 16'h5100;
    LUT4 i18358_2_lut (.A(data_wr[5]), .Z(n20446)) /* synthesis lut_function=(A) */ ;
    defparam i18358_2_lut.init = 16'haaaa;
    LUT4 i18357_3_lut (.A(data_wr[7]), .B(data_wr[6]), .C(cnt_adj_2688[0]), 
         .Z(n20445)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i18357_3_lut.init = 16'hcaca;
    FD1P3AX led_12 (.D(led_N_11), .SP(clk_c_enable_20), .CK(clk_c), .Q(led_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(98[14] 104[8])
    defparam led_12.GSR = "ENABLED";
    IB key_down_pad (.I(key_down), .O(key_down_c_0));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(11[13:21])
    IB key_up_pad (.I(key_up), .O(key_up_c_1));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(10[13:19])
    L6MUX21 mux_1267_i1 (.D0(n2305), .D1(n2319), .SD(n20424), .Z(n2325));
    IB adc_dat_pad (.I(adc_dat), .O(adc_dat_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(9[13:20])
    IB ball_release_button_pad (.I(ball_release_button), .O(ball_release_button_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(6[16:35])
    OB led_pad (.I(led_c), .O(led));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(25[13:16])
    IB rst_pad (.I(rst), .O(rst_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(4[22:25])
    PFUMX i19365 (.BLUT(n22429), .ALUT(n22430), .C0(cnt_main[2]), .Z(n22431));
    OB lcd_cs_pad (.I(lcd_cs_c), .O(lcd_cs));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(23[22:28])
    LUT4 n4442_bdd_4_lut_19281 (.A(n4442), .B(cnt_read[3]), .C(n21), .D(state[1]), 
         .Z(n21509)) /* synthesis lut_function=(!(A ((D)+!C)+!A (B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam n4442_bdd_4_lut_19281.init = 16'h11f0;
    PFUMX mux_1265_i1 (.BLUT(n2295), .ALUT(n324), .C0(n2619), .Z(n2319));
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 i18343_4_lut (.A(cnt_read[3]), .B(n21564), .C(state[0]), .D(i2c_sda_N_637), 
         .Z(n20431)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;
    defparam i18343_4_lut.init = 16'hca0a;
    LUT4 i18342_4_lut (.A(n22428), .B(cnt_write[3]), .C(state[0]), .D(n21644), 
         .Z(n20430)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;
    defparam i18342_4_lut.init = 16'hcac0;
    PFUMX mux_1255_i1 (.BLUT(n2278), .ALUT(n2283), .C0(n2615), .Z(n2305));
    LUT4 i1_4_lut_else_4_lut_adj_334 (.A(state[1]), .B(state[0]), .C(cnt_mode1[3]), 
         .D(cnt_mode1[2]), .Z(n21695)) /* synthesis lut_function=(A (B+!(C+(D)))) */ ;
    defparam i1_4_lut_else_4_lut_adj_334.init = 16'h888a;
    OB adc_clk_pad (.I(adc_clk_c), .O(adc_clk));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(13[14:21])
    OB adc_cs_pad (.I(adc_cs_c), .O(adc_cs));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(12[14:20])
    OB lcd_mosi_pad (.I(lcd_mosi_c), .O(lcd_mosi));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(22[22:30])
    GSR GSR_INST (.GSR(rst_c));
    IB clk_pad (.I(clk), .O(clk_c));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    OB seg_led_2_pad_0 (.I(VCC_net), .O(seg_led_2[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_1 (.I(k[1]), .O(seg_led_2[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_2 (.I(VCC_net), .O(seg_led_2[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_3 (.I(seg_led_2_0_3), .O(seg_led_2[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_4 (.I(k[0]), .O(seg_led_2[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_5 (.I(seg_led_2_0_3), .O(seg_led_2[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_6 (.I(seg_led_2_0_3), .O(seg_led_2[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    BB i2c_sda_pad (.I(i2c_sda_N_620), .T(n5039), .B(i2c_sda), .O(i2c_sda_out));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(70[2] 217[5])
    OB seg_led_2_pad_7 (.I(GND_net), .O(seg_led_2[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_2_pad_8 (.I(GND_net), .O(seg_led_2[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(27[20:29])
    OB seg_led_1_pad_0 (.I(VCC_net), .O(seg_led_1[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_1 (.I(VCC_net), .O(seg_led_1[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    OB seg_led_1_pad_2 (.I(VCC_net), .O(seg_led_1[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(26[20:29])
    LUT4 i2378_4_lut (.A(state_adj_2735[2]), .B(length_num_flag), .C(n14444), 
         .D(cnt_rom_prepare[2]), .Z(clk_50MHz_enable_30)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B)) */ ;
    defparam i2378_4_lut.init = 16'hceee;
    PFUMX i19007 (.BLUT(n21695), .ALUT(n21696), .C0(state[2]), .Z(n30));
    LUT4 i18514_3_lut (.A(cnt_read[0]), .B(n21555), .C(state[2]), .Z(n18598)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i18514_3_lut.init = 16'h1010;
    LUT4 i1_4_lut_then_4_lut_adj_335 (.A(n2619), .B(cnt_main[0]), .C(cnt_main[1]), 
         .D(dat_valid_N_624), .Z(n22430)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_4_lut_then_4_lut_adj_335.init = 16'h0010;
    LUT4 i3_3_lut_4_lut (.A(state[2]), .B(state[0]), .C(cnt_read[1]), 
         .D(state[3]), .Z(n8_adj_2679)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;
    defparam i3_3_lut_4_lut.init = 16'h0020;
    LUT4 mux_1241_i1_4_lut (.A(n14616), .B(state_back[0]), .C(state[2]), 
         .D(n11417), .Z(n2283)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam mux_1241_i1_4_lut.init = 16'hcfc5;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    PFUMX i18344 (.BLUT(n20430), .ALUT(n20431), .C0(state[1]), .Z(n20432));
    L6MUX21 i18353 (.D0(n21509), .D1(n21514), .SD(state[0]), .Z(n20441));
    adc081s101_driver adc_driver (.adc_clk_c(adc_clk_c), .clk_24MHz(clk_24MHz), 
            .adc_cs_c(adc_cs_c), .adc_data({adc_data}), .adc_dat_c(adc_dat_c), 
            .rst_c(rst_c), .n21653(n21653), .n21659(n21659), .n21450(n21450), 
            .clk_400khz_enable_5(clk_400khz_enable_5), .GND_net(GND_net), 
            .ball_release_button_c(ball_release_button_c), .n21688(n21688), 
            .home({home}), .pic_y_8__N_805(pic_y_8__N_805), .pic_y_8__N_786(pic_y_8__N_786), 
            .pic_y_8__N_811(pic_y_8__N_811), .pic_y_8__N_799(pic_y_8__N_799), 
            .pic_y_8__N_808(pic_y_8__N_808), .pic_y_8__N_802(pic_y_8__N_802), 
            .pic_y_8__N_814(pic_y_8__N_814), .pic_y_8__N_790(pic_y_8__N_790), 
            .pic_y_8__N_789(pic_y_8__N_789), .pic_y_8__N_796(pic_y_8__N_796), 
            .pic_y_8__N_792(pic_y_8__N_792), .pic_y_8__N_785(pic_y_8__N_785), 
            .pic_y_8__N_782(pic_y_8__N_782), .pic_y_8__N_791(pic_y_8__N_791), 
            .pic_y_8__N_817(pic_y_8__N_817), .pic_y_8__N_788(pic_y_8__N_788), 
            .pic_y_8__N_787(pic_y_8__N_787), .pic_y_8__N_793(pic_y_8__N_793), 
            .n21576(n21576), .\state[0] (state[0]), .n21542(n21542)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(41[19] 50[2])
    LUT4 i2390_3_lut (.A(state_adj_2745[2]), .B(state_adj_2745[3]), .C(the1_wr_done), 
         .Z(clk_50MHz_enable_100)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;
    defparam i2390_3_lut.init = 16'hecec;
    LUT4 i4_4_lut_4_lut (.A(cnt_write[3]), .B(n6_adj_2680), .C(cnt_write[2]), 
         .D(cnt_write[1]), .Z(i2c_sda_N_643)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i4_4_lut_4_lut.init = 16'h0004;
    LUT4 i1_3_lut_3_lut (.A(cnt_write[3]), .B(cnt_write[2]), .C(cnt_write[0]), 
         .Z(n4_adj_2678)) /* synthesis lut_function=(!(A+!((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_3_lut_3_lut.init = 16'h5151;
    CCU2D add_14_9 (.A0(home_8__N_1[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(home_8__N_1[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18200), .S0(home[7]), .S1(home[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[15:39])
    defparam add_14_9.INIT0 = 16'h5aaa;
    defparam add_14_9.INIT1 = 16'h5aaa;
    defparam add_14_9.INJECT1_0 = "NO";
    defparam add_14_9.INJECT1_1 = "NO";
    CCU2D add_14_7 (.A0(home_8__N_1[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(home_8__N_1[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18199), .COUT(n18200), .S0(home[5]), .S1(home[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[15:39])
    defparam add_14_7.INIT0 = 16'h5aaa;
    defparam add_14_7.INIT1 = 16'h5aaa;
    defparam add_14_7.INJECT1_0 = "NO";
    defparam add_14_7.INJECT1_1 = "NO";
    CCU2D add_14_5 (.A0(home_8__N_1[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(home_8__N_1[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18198), .COUT(n18199), .S0(home[3]), .S1(home[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[15:39])
    defparam add_14_5.INIT0 = 16'h5aaa;
    defparam add_14_5.INIT1 = 16'h5aaa;
    defparam add_14_5.INJECT1_0 = "NO";
    defparam add_14_5.INJECT1_1 = "NO";
    LUT4 i27_1_lut (.A(cnt_mode1[0]), .Z(n27)) /* synthesis lut_function=(!(A)) */ ;
    defparam i27_1_lut.init = 16'h5555;
    PFUMX i18361 (.BLUT(n20445), .ALUT(n20446), .C0(cnt_adj_2688[1]), 
          .Z(n20449));
    PFUMX i18362 (.BLUT(n20447), .ALUT(n20448), .C0(cnt_adj_2688[1]), 
          .Z(n20450));
    LUT4 i12393_2_lut_rep_322 (.A(cnt_read[0]), .B(cnt_read[3]), .Z(n21668)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i12393_2_lut_rep_322.init = 16'heeee;
    CCU2D add_3296_add_1_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18375), .S0(n1));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3296_add_1_cout.INIT0 = 16'h0000;
    defparam add_3296_add_1_cout.INIT1 = 16'h0000;
    defparam add_3296_add_1_cout.INJECT1_0 = "NO";
    defparam add_3296_add_1_cout.INJECT1_1 = "NO";
    CCU2D add_3296_add_1_8 (.A0(adc_data[6]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[7]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18374), .COUT(n18375), .S0(n4), .S1(n3));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3296_add_1_8.INIT0 = 16'h5aaa;
    defparam add_3296_add_1_8.INIT1 = 16'h5aaa;
    defparam add_3296_add_1_8.INJECT1_0 = "NO";
    defparam add_3296_add_1_8.INJECT1_1 = "NO";
    CCU2D add_3296_add_1_6 (.A0(adc_data[4]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[5]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18373), .COUT(n18374), .S0(n6), .S1(n5));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3296_add_1_6.INIT0 = 16'h5aaa;
    defparam add_3296_add_1_6.INIT1 = 16'h5aaa;
    defparam add_3296_add_1_6.INJECT1_0 = "NO";
    defparam add_3296_add_1_6.INJECT1_1 = "NO";
    CCU2D add_3296_add_1_4 (.A0(adc_data[2]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[3]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18372), .COUT(n18373), .S0(n8), .S1(n7));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3296_add_1_4.INIT0 = 16'h5aaa;
    defparam add_3296_add_1_4.INIT1 = 16'h5aaa;
    defparam add_3296_add_1_4.INJECT1_0 = "NO";
    defparam add_3296_add_1_4.INJECT1_1 = "NO";
    CCU2D add_3296_add_1_2 (.A0(adc_data[0]), .B0(adc_data[7]), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[1]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18372), .S1(n9));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3296_add_1_2.INIT0 = 16'h7000;
    defparam add_3296_add_1_2.INIT1 = 16'h5aaa;
    defparam add_3296_add_1_2.INJECT1_0 = "NO";
    defparam add_3296_add_1_2.INJECT1_1 = "NO";
    CCU2D add_3438_12 (.A0(n38), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n37), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18369), 
          .S0(home_8__N_1[15]), .S1(home_8__N_1[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_12.INIT0 = 16'h5aaa;
    defparam add_3438_12.INIT1 = 16'h5aaa;
    defparam add_3438_12.INJECT1_0 = "NO";
    defparam add_3438_12.INJECT1_1 = "NO";
    LUT4 i2377_2_lut (.A(wr_done), .B(state_adj_2728[4]), .Z(clk_50MHz_enable_79)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam i2377_2_lut.init = 16'hbbbb;
    CCU2D add_3438_10 (.A0(n40), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n39), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18368), 
          .COUT(n18369), .S0(home_8__N_1[13]), .S1(home_8__N_1[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_10.INIT0 = 16'h5aaa;
    defparam add_3438_10.INIT1 = 16'h5aaa;
    defparam add_3438_10.INJECT1_0 = "NO";
    defparam add_3438_10.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(n2619), .B(n54), .C(n2303), .D(n21529), .Z(n2323)) /* synthesis lut_function=(!(A+!(B (C+!(D))+!B (C (D))))) */ ;
    defparam i1_4_lut.init = 16'h5044;
    LUT4 i12358_4_lut (.A(n57), .B(n2615), .C(state[2]), .D(n11417), 
         .Z(n2303)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i12358_4_lut.init = 16'h3f37;
    CCU2D add_3438_8 (.A0(n42), .B0(adc_data[6]), .C0(GND_net), .D0(GND_net), 
          .A1(n41), .B1(adc_data[7]), .C1(GND_net), .D1(GND_net), .CIN(n18367), 
          .COUT(n18368), .S0(home_8__N_1[11]), .S1(home_8__N_1[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_8.INIT0 = 16'h5666;
    defparam add_3438_8.INIT1 = 16'h5666;
    defparam add_3438_8.INJECT1_0 = "NO";
    defparam add_3438_8.INJECT1_1 = "NO";
    CCU2D add_14_3 (.A0(home_8__N_1[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(home_8__N_1[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18197), .COUT(n18198), .S0(home[1]), .S1(home[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[15:39])
    defparam add_14_3.INIT0 = 16'h5555;
    defparam add_14_3.INIT1 = 16'h5555;
    defparam add_14_3.INJECT1_0 = "NO";
    defparam add_14_3.INJECT1_1 = "NO";
    CCU2D add_3438_6 (.A0(n44), .B0(adc_data[4]), .C0(GND_net), .D0(GND_net), 
          .A1(n43), .B1(adc_data[5]), .C1(GND_net), .D1(GND_net), .CIN(n18366), 
          .COUT(n18367), .S0(home_8__N_1[9]), .S1(home_8__N_1[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_6.INIT0 = 16'h5666;
    defparam add_3438_6.INIT1 = 16'h5666;
    defparam add_3438_6.INJECT1_0 = "NO";
    defparam add_3438_6.INJECT1_1 = "NO";
    CCU2D add_3438_4 (.A0(n46), .B0(adc_data[2]), .C0(GND_net), .D0(GND_net), 
          .A1(n45), .B1(adc_data[3]), .C1(GND_net), .D1(GND_net), .CIN(n18365), 
          .COUT(n18366), .S1(home_8__N_1[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_4.INIT0 = 16'h5666;
    defparam add_3438_4.INIT1 = 16'h5666;
    defparam add_3438_4.INJECT1_0 = "NO";
    defparam add_3438_4.INJECT1_1 = "NO";
    CCU2D add_3438_2 (.A0(n48), .B0(adc_data[0]), .C0(GND_net), .D0(GND_net), 
          .A1(n47), .B1(adc_data[1]), .C1(GND_net), .D1(GND_net), .COUT(n18365));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3438_2.INIT0 = 16'h7000;
    defparam add_3438_2.INIT1 = 16'h5666;
    defparam add_3438_2.INJECT1_0 = "NO";
    defparam add_3438_2.INJECT1_1 = "NO";
    LUT4 i1_3_lut (.A(state[2]), .B(state[3]), .C(n20441), .Z(n24_adj_2674)) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_3_lut.init = 16'ha8a8;
    CCU2D add_3435_16 (.A0(n1), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18364), 
          .S0(n37));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_16.INIT0 = 16'h5aaa;
    defparam add_3435_16.INIT1 = 16'h0000;
    defparam add_3435_16.INJECT1_0 = "NO";
    defparam add_3435_16.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_336 (.A(n9567), .B(n21529), .C(n9625), .D(cnt_mode2[3]), 
         .Z(n19914)) /* synthesis lut_function=(A ((C+!(D))+!B)+!A ((C (D))+!B)) */ ;
    defparam i1_4_lut_adj_336.init = 16'hf3bb;
    CCU2D add_3435_14 (.A0(n4), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n3), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18363), 
          .COUT(n18364), .S0(n39), .S1(n38));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_14.INIT0 = 16'h5aaa;
    defparam add_3435_14.INIT1 = 16'h5aaa;
    defparam add_3435_14.INJECT1_0 = "NO";
    defparam add_3435_14.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_337 (.A(cnt_sclk[3]), .B(n21652), .C(state_adj_2714[2]), 
         .D(cnt_sclk[2]), .Z(clk_50MHz_enable_43)) /* synthesis lut_function=(!(A+(B ((D)+!C)+!B !(C+(D))))) */ ;
    defparam i1_4_lut_adj_337.init = 16'h1150;
    LUT4 i1_3_lut_adj_338 (.A(n11822), .B(cnt_adj_2688[0]), .C(cnt_adj_2688[1]), 
         .Z(n7_adj_2676)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[12:15])
    defparam i1_3_lut_adj_338.init = 16'h2828;
    CCU2D add_3435_12 (.A0(n6), .B0(n5161), .C0(GND_net), .D0(GND_net), 
          .A1(n5), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18362), 
          .COUT(n18363), .S0(n41), .S1(n40));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_12.INIT0 = 16'h5666;
    defparam add_3435_12.INIT1 = 16'h5aaa;
    defparam add_3435_12.INJECT1_0 = "NO";
    defparam add_3435_12.INJECT1_1 = "NO";
    CCU2D add_3435_10 (.A0(n8), .B0(n5151), .C0(GND_net), .D0(GND_net), 
          .A1(n7), .B1(n5150), .C1(GND_net), .D1(GND_net), .CIN(n18361), 
          .COUT(n18362), .S0(n43), .S1(n42));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_10.INIT0 = 16'h5666;
    defparam add_3435_10.INIT1 = 16'h5666;
    defparam add_3435_10.INJECT1_0 = "NO";
    defparam add_3435_10.INJECT1_1 = "NO";
    CCU2D add_3435_8 (.A0(n10), .B0(n5153), .C0(GND_net), .D0(GND_net), 
          .A1(n9), .B1(n5152), .C1(GND_net), .D1(GND_net), .CIN(n18360), 
          .COUT(n18361), .S0(n45), .S1(n44));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_8.INIT0 = 16'h5666;
    defparam add_3435_8.INIT1 = 16'h5666;
    defparam add_3435_8.INJECT1_0 = "NO";
    defparam add_3435_8.INJECT1_1 = "NO";
    CCU2D add_3435_6 (.A0(adc_data[5]), .B0(n5155), .C0(GND_net), .D0(GND_net), 
          .A1(adc_data[6]), .B1(n5154), .C1(GND_net), .D1(GND_net), 
          .CIN(n18359), .COUT(n18360), .S0(n47), .S1(n46));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_6.INIT0 = 16'h5666;
    defparam add_3435_6.INIT1 = 16'h5666;
    defparam add_3435_6.INJECT1_0 = "NO";
    defparam add_3435_6.INJECT1_1 = "NO";
    CCU2D add_3435_4 (.A0(adc_data[2]), .B0(adc_data[0]), .C0(adc_data[3]), 
          .D0(GND_net), .A1(adc_data[4]), .B1(n5156), .C1(GND_net), 
          .D1(GND_net), .CIN(n18358), .COUT(n18359), .S1(n48));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_4.INIT0 = 16'h9696;
    defparam add_3435_4.INIT1 = 16'h5666;
    defparam add_3435_4.INJECT1_0 = "NO";
    defparam add_3435_4.INJECT1_1 = "NO";
    CCU2D add_3435_2 (.A0(adc_data[1]), .B0(adc_data[0]), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[2]), .B1(adc_data[1]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18358));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3435_2.INIT0 = 16'h7000;
    defparam add_3435_2.INIT1 = 16'h5666;
    defparam add_3435_2.INJECT1_0 = "NO";
    defparam add_3435_2.INJECT1_1 = "NO";
    LUT4 m1_lut (.Z(n22433)) /* synthesis lut_function=1, syn_instantiated=1 */ ;
    defparam m1_lut.init = 16'hffff;
    LUT4 i2_3_lut (.A(i2c_sda_out), .B(n9389), .C(state[2]), .Z(n18508)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;
    defparam i2_3_lut.init = 16'h2020;
    LUT4 i4_4_lut_adj_339 (.A(n21540), .B(n8_adj_2679), .C(n21668), .D(cnt_read[2]), 
         .Z(n13675)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i4_4_lut_adj_339.init = 16'h0008;
    LUT4 i3_4_lut (.A(n21551), .B(n21653), .C(state[2]), .D(n20134), 
         .Z(n2619)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i3_4_lut.init = 16'h0040;
    LUT4 i16388_2_lut (.A(adc_data[0]), .B(adc_data[7]), .Z(n10)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i16388_2_lut.init = 16'h6666;
    CCU2D add_3398_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18352), 
          .S0(n5161));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3398_cout.INIT0 = 16'h0000;
    defparam add_3398_cout.INIT1 = 16'h0000;
    defparam add_3398_cout.INJECT1_0 = "NO";
    defparam add_3398_cout.INJECT1_1 = "NO";
    CCU2D add_3398_8 (.A0(adc_data[6]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(adc_data[7]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18351), .COUT(n18352), .S0(n5151), .S1(n5150));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3398_8.INIT0 = 16'hfaaa;
    defparam add_3398_8.INIT1 = 16'hfaaa;
    defparam add_3398_8.INJECT1_0 = "NO";
    defparam add_3398_8.INJECT1_1 = "NO";
    CCU2D add_3398_6 (.A0(adc_data[6]), .B0(adc_data[4]), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[7]), .B1(adc_data[5]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18350), .COUT(n18351), .S0(n5153), .S1(n5152));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3398_6.INIT0 = 16'h5666;
    defparam add_3398_6.INIT1 = 16'h5666;
    defparam add_3398_6.INJECT1_0 = "NO";
    defparam add_3398_6.INJECT1_1 = "NO";
    CCU2D add_3398_4 (.A0(adc_data[4]), .B0(adc_data[2]), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[5]), .B1(adc_data[3]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18349), .COUT(n18350), .S0(n5155), .S1(n5154));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3398_4.INIT0 = 16'h5666;
    defparam add_3398_4.INIT1 = 16'h5666;
    defparam add_3398_4.INJECT1_0 = "NO";
    defparam add_3398_4.INJECT1_1 = "NO";
    CCU2D add_3398_2 (.A0(adc_data[2]), .B0(adc_data[0]), .C0(GND_net), 
          .D0(GND_net), .A1(adc_data[3]), .B1(adc_data[1]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18349), .S1(n5156));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[16:30])
    defparam add_3398_2.INIT0 = 16'h7000;
    defparam add_3398_2.INIT1 = 16'h5666;
    defparam add_3398_2.INJECT1_0 = "NO";
    defparam add_3398_2.INJECT1_1 = "NO";
    hand_control u8 (.clk_c_enable_20(clk_c_enable_20), .prox_dat({prox_dat}), 
            .dat_valid(dat_valid), .handline({handline}), .GND_net(GND_net), 
            .\hand_velocity[2] (hand_velocity[2]), .\hand_velocity[3] (hand_velocity[3]), 
            .\hand_velocity[4] (hand_velocity[4]), .\hand_velocity[5] (hand_velocity[5]), 
            .\hand_velocity[6] (hand_velocity[6]), .\hand_velocity[7] (hand_velocity[7]), 
            .\hand_velocity[1] (hand_velocity[1])) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(86[14] 92[2])
    LUT4 m0_lut (.Z(n22432)) /* synthesis lut_function=0, syn_instantiated=1 */ ;
    defparam m0_lut.init = 16'h0000;
    CCU2D add_14_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(home_8__N_1[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18197), .S1(home[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(124[15:39])
    defparam add_14_1.INIT0 = 16'hF000;
    defparam add_14_1.INIT1 = 16'h5555;
    defparam add_14_1.INJECT1_0 = "NO";
    defparam add_14_1.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_340 (.A(n22431), .B(n33), .C(n72), .D(n19972), 
         .Z(n5_adj_2673)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_340.init = 16'heccc;
    LUT4 i92_4_lut (.A(n16), .B(n20432), .C(state[2]), .D(n6_adj_2665), 
         .Z(n67)) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;
    defparam i92_4_lut.init = 16'hc5c0;
    adjuster adj (.k({k}), .clk_c(clk_c), .seg_led_2_0_3(seg_led_2_0_3), 
            .key_up_c_1(key_up_c_1), .key_down_c_0(key_down_c_0), .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(60[10] 68[2])
    LUT4 i47_4_lut (.A(n22428), .B(n4442), .C(state[1]), .D(cnt_read[3]), 
         .Z(n4652)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A (B (C (D))+!B (C)))) */ ;
    defparam i47_4_lut.init = 16'h05c5;
    PLL24M pll_u2 (.clk_c(clk_c), .clk_24MHz(clk_24MHz), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(31[8] 35[2])
    rpr0521rs_driver u7 (.clk_c(clk_c), .i2c_sda_N_620(i2c_sda_N_620), .state({state}), 
            .cnt_write({cnt_write}), .i2c_sda_out(i2c_sda_out), .\cnt_main[0] (cnt_main[0]), 
            .\cnt_main[2] (cnt_main[2]), .dat_valid_N_624(dat_valid_N_624), 
            .n21551(n21551), .\cnt_mode2[3] (cnt_mode2[3]), .n14616(n14616), 
            .n21386(n21386), .\cnt_main[1] (cnt_main[1]), .cnt({Open_0, 
            Open_1, Open_2, cnt_adj_2688[0]}), .n21576(n21576), .\state_back[0] (state_back[0]), 
            .rst_c(rst_c), .n21540(n21540), .n30(n30), .n21529(n21529), 
            .n13675(n13675), .\cnt[1] (cnt_adj_2688[1]), .n67(n67), .n21659(n21659), 
            .n33(n33), .n24(n24_adj_2674), .n24_adj_1(n24), .n2615(n2615), 
            .cnt_read({cnt_read}), .cnt_mode1({Open_3, Open_4, Open_5, 
            cnt_mode1[0]}), .\cnt_mode1[3] (cnt_mode1[3]), .GND_net(GND_net), 
            .n21668(n21668), .\cnt_mode1[2] (cnt_mode1[2]), .i2c_sda_N_643(i2c_sda_N_643), 
            .dat_valid(dat_valid), .clk_400khz_enable_5(clk_400khz_enable_5), 
            .n11417(n11417), .n21450(n21450), .n21542(n21542), .n9625(n9625), 
            .n9567(n9567), .prox_dat({prox_dat}), .\data_wr[6] (data_wr[6]), 
            .\data_wr[5] (data_wr[5]), .\data_wr[3] (data_wr[3]), .\data_wr[2] (data_wr[2]), 
            .\data_wr[1] (data_wr[1]), .n22428(n22428), .n21(n21), .n54(n54), 
            .n5039(n5039), .\data_wr[7] (data_wr[7]), .n18598(n18598), 
            .n4442(n4442), .n21564(n21564), .n19972(n19972), .n22432(n22432), 
            .n21644(n21644), .n11822(n11822), .n21653(n21653), .n2323(n2323), 
            .n4(n4_adj_2675), .n20134(n20134), .n9389(n9389), .n7(n7_adj_2676), 
            .n27(n27), .n21555(n21555), .n20449(n20449), .n20450(n20450), 
            .n6(n6_adj_2680), .i2c_scl_c(i2c_scl_c), .\data_wr[0] (data_wr[0]), 
            .n18508(n18508), .n6_adj_2(n6_adj_2665), .i2c_sda_N_637(i2c_sda_N_637), 
            .n2619(n2619), .n2278(n2278), .n2325(n2325), .n57(n57), 
            .n324(n324), .n72(n72), .n2295(n2295), .n19914(n19914), 
            .n4_adj_3(n4_adj_2678), .n20424(n20424), .n5(n5_adj_2673), 
            .n16(n16), .clk_c_enable_20(clk_c_enable_20)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(72[18] 83[2])
    
endmodule
//
// Verilog Description of module lcd
//

module lcd (clk_c, GND_net, n21631, ball_release_button_c, n21630, 
            n21678, n21677, n21666, n21664, home, n21638, n21637, 
            n21635, wr_done, \cnt_sclk[3] , clk_50MHz_enable_43, \cnt_sclk[2] , 
            lcd_cs_c, \state[2] , lcd_sclk_c, n21652, lcd_mosi_c, 
            length_num_flag, \cnt_rom_prepare[2] , clk_50MHz_enable_30, 
            \state[2]_adj_16 , n14444, the1_wr_done, clk_50MHz_enable_79, 
            n22433, lcd_rst_c, \state[4] , handline, \state[2]_adj_17 , 
            clk_50MHz_enable_100, \state[3] , \state[2]_adj_18 , clk_50MHz_enable_61, 
            \state[3]_adj_19 , rst_c, lcd_dc_c_8) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    input GND_net;
    input n21631;
    input ball_release_button_c;
    input n21630;
    input n21678;
    input n21677;
    input n21666;
    input n21664;
    input [8:0]home;
    input n21638;
    input n21637;
    input n21635;
    output wr_done;
    output \cnt_sclk[3] ;
    input clk_50MHz_enable_43;
    output \cnt_sclk[2] ;
    output lcd_cs_c;
    output \state[2] ;
    output lcd_sclk_c;
    output n21652;
    output lcd_mosi_c;
    output length_num_flag;
    output \cnt_rom_prepare[2] ;
    input clk_50MHz_enable_30;
    output \state[2]_adj_16 ;
    output n14444;
    output the1_wr_done;
    input clk_50MHz_enable_79;
    input n22433;
    output lcd_rst_c;
    output \state[4] ;
    input [8:0]handline;
    output \state[2]_adj_17 ;
    input clk_50MHz_enable_100;
    output \state[3] ;
    output \state[2]_adj_18 ;
    input clk_50MHz_enable_61;
    output \state[3]_adj_19 ;
    input rst_c;
    output lcd_dc_c_8;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [8:0]rom_addr;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(36[17:25])
    wire [8:0]q_239__N_2289;
    
    wire n16, n21518, n21520, n21602;
    wire [239:0]temp;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(62[19:23])
    wire [239:0]temp_239__N_1403;
    
    wire n21517, n19935;
    wire [8:0]data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(17[17:21])
    
    wire n3956, n3, n4;
    wire [8:0]show_pic_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(31[17:30])
    
    wire n4_adj_2653;
    wire [2:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(28[13:18])
    wire [3:0]state_3__N_1103;
    wire [3:0]state_adj_2663;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(45[17:22])
    
    wire n3961, n21671;
    wire [3:0]show_pic_counter;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(30[13:29])
    
    wire n21609;
    wire [3:0]n21;
    
    wire n4_adj_2656, n18767, n20045, n18697;
    wire [8:0]init_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(21[17:26])
    wire [5:0]state_adj_2664;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(47[13:18])
    wire [8:0]draw_line_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(40[17:31])
    
    wire en_write_draw_line, n3255;
    wire [2:0]state_2__N_1179;
    wire [3:0]draw_line_counter;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[13:30])
    
    wire n19916;
    
    pll pll_u1 (.clk_c(clk_c), .clk_50MHz(clk_50MHz), .GND_net(GND_net)) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(47[5] 51[3])
    pic_ram pic_ram_u0 (.n21631(n21631), .ball_release_button_c(ball_release_button_c), 
            .rom_addr({rom_addr}), .n21630(n21630), .n21678(n21678), .n21677(n21677), 
            .\q_239__N_2289[2] (q_239__N_2289[2]), .n21666(n21666), .n21664(n21664), 
            .GND_net(GND_net), .n16(n16), .n21518(n21518), .n21520(n21520), 
            .n21602(n21602), .\temp[3] (temp[3]), .\temp_239__N_1403[2] (temp_239__N_1403[2]), 
            .n21517(n21517), .n19935(n19935), .\temp[10] (temp[10]), .\temp_239__N_1403[9] (temp_239__N_1403[9]), 
            .home({home}), .n21638(n21638), .n21637(n21637), .n21635(n21635)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(134[9] 139[2])
    lcd_write lcd_write_inst (.clk_50MHz(clk_50MHz), .wr_done(wr_done), 
            .\cnt_sclk[3] (\cnt_sclk[3] ), .clk_50MHz_enable_43(clk_50MHz_enable_43), 
            .\cnt_sclk[2] (\cnt_sclk[2] ), .lcd_cs_c(lcd_cs_c), .\state[2] (\state[2] ), 
            .\data[7] (data[7]), .\data[5] (data[5]), .\data[6] (data[6]), 
            .\data[2] (data[2]), .\data[3] (data[3]), .n3956(n3956), .lcd_sclk_c(lcd_sclk_c), 
            .n21652(n21652), .\data[1] (data[1]), .n3(n3), .n4(n4), 
            .lcd_mosi_c(lcd_mosi_c), .\show_pic_data[0] (show_pic_data[0]), 
            .n4_adj_15(n4_adj_2653), .\state[1] (state[1]), .\state_3__N_1103[1] (state_3__N_1103[1])) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(53[12] 65[2])
    lcd_show_pic lcd_show_pic_inst (.rom_addr({rom_addr}), .clk_50MHz(clk_50MHz), 
            .length_num_flag(length_num_flag), .\temp_239__N_1403[9] (temp_239__N_1403[9]), 
            .\cnt_rom_prepare[2] (\cnt_rom_prepare[2] ), .clk_50MHz_enable_30(clk_50MHz_enable_30), 
            .n21602(n21602), .\show_pic_data[0] (show_pic_data[0]), .state({state_adj_2663[3], 
            \state[2]_adj_16 , state_adj_2663[1:0]}), .\temp[3] (temp[3]), 
            .\temp_239__N_1403[2] (temp_239__N_1403[2]), .n19935(n19935), 
            .n21518(n21518), .n3961(n3961), .n21671(n21671), .\show_pic_counter[3] (show_pic_counter[3]), 
            .\state[1]_adj_14 (state[1]), .n21609(n21609), .n14444(n14444), 
            .\show_pic_data[1] (show_pic_data[1]), .\show_pic_data[2] (show_pic_data[2]), 
            .\show_pic_data[3] (show_pic_data[3]), .\show_pic_data[4] (show_pic_data[4]), 
            .\show_pic_data[6] (show_pic_data[6]), .\show_pic_data[7] (show_pic_data[7]), 
            .n22(n21[3]), .n4(n4_adj_2656), .\show_pic_data[8] (show_pic_data[8]), 
            .GND_net(GND_net), .n18767(n18767), .the1_wr_done(the1_wr_done), 
            .\temp[10] (temp[10]), .n20045(n20045), .n21517(n21517), .n16(n16), 
            .n21520(n21520), .\q_239__N_2289[2] (q_239__N_2289[2]), .n18697(n18697)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(110[15] 121[2])
    lcd_init lcd_init_inst (.clk_50MHz(clk_50MHz), .clk_50MHz_enable_79(clk_50MHz_enable_79), 
            .init_data({init_data}), .state({state_adj_2664[5], Open_6, 
            Open_7, state_adj_2664[2], Open_8, Open_9}), .n22433(n22433), 
            .n3956(n3956), .lcd_rst_c(lcd_rst_c), .\state[4] (\state[4] ), 
            .GND_net(GND_net), .wr_done(wr_done)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(88[11] 98[2])
    draw_line lcd_draw_line_inst (.clk_50MHz(clk_50MHz), .handline({handline}), 
            .draw_line_data({draw_line_data}), .en_write_draw_line(en_write_draw_line), 
            .GND_net(GND_net), .n3255(n3255), .\state[2] (\state[2]_adj_17 ), 
            .\state_2__N_1179[2] (state_2__N_1179[2]), .\draw_line_counter[3] (draw_line_counter[3]), 
            .n19916(n19916), .\state[2]_adj_11 (state[2]), .clk_50MHz_enable_100(clk_50MHz_enable_100), 
            .\state[3] (\state[3] ), .\state[2]_adj_12 (\state[2]_adj_18 ), 
            .n3961(n3961), .the1_wr_done(the1_wr_done), .clk_50MHz_enable_61(clk_50MHz_enable_61), 
            .\state[3]_adj_13 (\state[3]_adj_19 ), .wr_done(wr_done), .rst_c(rst_c)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(123[12] 133[2])
    control control_inst (.state({state[2:1], Open_10}), .clk_50MHz(clk_50MHz), 
            .\show_pic_data[7] (show_pic_data[7]), .\data[7] (data[7]), 
            .init_data({init_data}), .draw_line_data({draw_line_data}), 
            .n4(n4_adj_2653), .n20045(n20045), .n21671(n21671), .n21609(n21609), 
            .n18697(n18697), .\state_2__N_1179[2] (state_2__N_1179[2]), 
            .\data[3] (data[3]), .\state[0]_adj_4 (state_adj_2663[0]), .n4_adj_5(n4_adj_2656), 
            .\state[5] (state_adj_2664[5]), .\state[3] (state_adj_2663[3]), 
            .\draw_line_counter[3] (draw_line_counter[3]), .n3255(n3255), 
            .n19916(n19916), .\show_pic_data[2] (show_pic_data[2]), .\data[2] (data[2]), 
            .\state[1]_adj_6 (state_adj_2663[1]), .n18767(n18767), .\state_3__N_1103[1] (state_3__N_1103[1]), 
            .\state[2]_adj_7 (state_adj_2664[2]), .\state[4] (\state[4] ), 
            .en_write_draw_line(en_write_draw_line), .\show_pic_data[8] (show_pic_data[8]), 
            .lcd_dc_c_8(lcd_dc_c_8), .\show_pic_data[4] (show_pic_data[4]), 
            .n3(n3), .n4_adj_8(n4), .\show_pic_counter[3] (show_pic_counter[3]), 
            .n22(n21[3]), .\show_pic_data[6] (show_pic_data[6]), .\data[6] (data[6]), 
            .\data[5] (data[5]), .\show_pic_data[3] (show_pic_data[3]), 
            .\show_pic_data[1] (show_pic_data[1]), .\data[1] (data[1])) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(67[10] 86[2])
    
endmodule
//
// Verilog Description of module pll
//

module pll (clk_c, clk_50MHz, GND_net) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input clk_c;
    output clk_50MHz;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    
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
            .PLLADDR4(GND_net), .CLKOP(clk_50MHz)) /* synthesis FREQUENCY_PIN_CLKOP="96.000000", FREQUENCY_PIN_CLKI="12.000000", ICP_CURRENT="7", LPF_RESISTOR="8", syn_instantiated=1, LSE_LINE_FILE_ID=15, LSE_LCOL=5, LSE_RCOL=3, LSE_LLINE=47, LSE_RLINE=51 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(47[5] 51[3])
    defparam PLLInst_0.CLKI_DIV = 1;
    defparam PLLInst_0.CLKFB_DIV = 8;
    defparam PLLInst_0.CLKOP_DIV = 5;
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
    defparam PLLInst_0.CLKOP_CPHASE = 4;
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
//
// Verilog Description of module pic_ram
//

module pic_ram (n21631, ball_release_button_c, rom_addr, n21630, n21678, 
            n21677, \q_239__N_2289[2] , n21666, n21664, GND_net, n16, 
            n21518, n21520, n21602, \temp[3] , \temp_239__N_1403[2] , 
            n21517, n19935, \temp[10] , \temp_239__N_1403[9] , home, 
            n21638, n21637, n21635) /* synthesis syn_module_defined=1 */ ;
    input n21631;
    input ball_release_button_c;
    input [8:0]rom_addr;
    input n21630;
    input n21678;
    input n21677;
    output \q_239__N_2289[2] ;
    input n21666;
    input n21664;
    input GND_net;
    output n16;
    output n21518;
    output n21520;
    input n21602;
    input \temp[3] ;
    output \temp_239__N_1403[2] ;
    output n21517;
    output n19935;
    input \temp[10] ;
    output \temp_239__N_1403[9] ;
    input [8:0]home;
    input n21638;
    input n21637;
    input n21635;
    
    
    wire n18331;
    wire [8:0]n1;
    wire [8:0]q_239__N_2289;
    
    wire n18332, n18330, n18329, n21521, n4, n21267, n21519, n21522, 
        n18801, n11, n6, n18341, n18340, n18339, n18338, n18333;
    
    CCU2D address_8__I_0_rep_6_add_2_7 (.A0(n21631), .B0(ball_release_button_c), 
          .C0(n1[4]), .D0(rom_addr[4]), .A1(n21630), .B1(ball_release_button_c), 
          .C1(n1[5]), .D1(rom_addr[5]), .CIN(n18331), .COUT(n18332), 
          .S0(q_239__N_2289[4]), .S1(q_239__N_2289[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_7.INIT0 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_7.INIT1 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_7.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_7.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_6_add_2_5 (.A0(n21678), .B0(ball_release_button_c), 
          .C0(n1[2]), .D0(rom_addr[2]), .A1(n21677), .B1(ball_release_button_c), 
          .C1(n1[3]), .D1(rom_addr[3]), .CIN(n18330), .COUT(n18331), 
          .S0(\q_239__N_2289[2] ), .S1(q_239__N_2289[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_5.INIT0 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_5.INIT1 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_5.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_5.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_6_add_2_3 (.A0(n21666), .B0(ball_release_button_c), 
          .C0(n1[0]), .D0(rom_addr[0]), .A1(n21664), .B1(ball_release_button_c), 
          .C1(n1[1]), .D1(rom_addr[1]), .CIN(n18329), .COUT(n18330), 
          .S0(q_239__N_2289[0]), .S1(q_239__N_2289[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_3.INIT0 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_3.INIT1 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_3.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_3.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_6_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(ball_release_button_c), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18329));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_1.INIT0 = 16'hF000;
    defparam address_8__I_0_rep_6_add_2_1.INIT1 = 16'h0555;
    defparam address_8__I_0_rep_6_add_2_1.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_1.INJECT1_1 = "NO";
    LUT4 i18597_3_lut_rep_172_3_lut_4_lut_4_lut (.A(q_239__N_2289[0]), .B(q_239__N_2289[1]), 
         .C(n16), .D(n21521), .Z(n21518)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A ((C+(D))+!B))) */ ;
    defparam i18597_3_lut_rep_172_3_lut_4_lut_4_lut.init = 16'h0006;
    LUT4 i1_2_lut_3_lut (.A(q_239__N_2289[0]), .B(q_239__N_2289[1]), .C(n16), 
         .Z(n4)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(14[13:17])
    defparam i1_2_lut_3_lut.init = 16'hfdfd;
    LUT4 i12149_2_lut_rep_174_3_lut_2_lut (.A(q_239__N_2289[0]), .B(q_239__N_2289[1]), 
         .Z(n21520)) /* synthesis lut_function=(A (B)+!A !(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(14[13:17])
    defparam i12149_2_lut_rep_174_3_lut_2_lut.init = 16'h9999;
    LUT4 q_239__N_2289_8__I_0_22_i11_2_lut_rep_175 (.A(\q_239__N_2289[2] ), 
         .B(q_239__N_2289[3]), .Z(n21521)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(16[13:17])
    defparam q_239__N_2289_8__I_0_22_i11_2_lut_rep_175.init = 16'hdddd;
    LUT4 n16_bdd_4_lut_18963 (.A(q_239__N_2289[0]), .B(q_239__N_2289[1]), 
         .C(q_239__N_2289[3]), .D(\q_239__N_2289[2] ), .Z(n21267)) /* synthesis lut_function=(A ((C)+!B)+!A (B+(C (D)+!C !(D)))) */ ;
    defparam n16_bdd_4_lut_18963.init = 16'hf6e7;
    LUT4 temp_239__I_0_i3_3_lut_4_lut (.A(n21519), .B(n21518), .C(n21602), 
         .D(\temp[3] ), .Z(\temp_239__N_1403[2] )) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (C+(D))) */ ;
    defparam temp_239__I_0_i3_3_lut_4_lut.init = 16'hdfd0;
    LUT4 i2_3_lut_4_lut (.A(n16), .B(q_239__N_2289[3]), .C(\q_239__N_2289[2] ), 
         .D(n21522), .Z(n18801)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i2_3_lut_4_lut.init = 16'hfffe;
    LUT4 q_239__N_2289_8__I_0_23_i11_2_lut (.A(\q_239__N_2289[2] ), .B(q_239__N_2289[3]), 
         .Z(n11)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(17[13:17])
    defparam q_239__N_2289_8__I_0_23_i11_2_lut.init = 16'hbbbb;
    LUT4 i4_4_lut (.A(q_239__N_2289[7]), .B(q_239__N_2289[6]), .C(q_239__N_2289[4]), 
         .D(n6), .Z(n16)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(16[13:17])
    defparam i4_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut (.A(q_239__N_2289[5]), .B(q_239__N_2289[8]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(16[13:17])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i1_4_lut (.A(n21517), .B(n11), .C(n18801), .D(n4), .Z(n19935)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut.init = 16'ha080;
    LUT4 temp_239__I_0_i10_3_lut_4_lut (.A(n21519), .B(n21518), .C(n21602), 
         .D(\temp[10] ), .Z(\temp_239__N_1403[9] )) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (C+(D))) */ ;
    defparam temp_239__I_0_i10_3_lut_4_lut.init = 16'hdfd0;
    LUT4 n21268_bdd_2_lut_rep_171_4_lut_4_lut_4_lut (.A(n21521), .B(n21520), 
         .C(n16), .D(n21267), .Z(n21517)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;
    defparam n21268_bdd_2_lut_rep_171_4_lut_4_lut_4_lut.init = 16'hfef0;
    LUT4 n21267_bdd_2_lut_rep_173 (.A(n21267), .B(n16), .Z(n21519)) /* synthesis lut_function=(A+(B)) */ ;
    defparam n21267_bdd_2_lut_rep_173.init = 16'heeee;
    LUT4 q_239__N_2289_8__I_0_17_i10_2_lut_rep_176 (.A(q_239__N_2289[0]), 
         .B(q_239__N_2289[1]), .Z(n21522)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(11[13:17])
    defparam q_239__N_2289_8__I_0_17_i10_2_lut_rep_176.init = 16'hbbbb;
    CCU2D address_8__I_0_rep_5_add_2_9 (.A0(rom_addr[7]), .B0(home[7]), 
          .C0(GND_net), .D0(GND_net), .A1(rom_addr[8]), .B1(home[8]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18341), .S0(n1[7]), .S1(n1[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_5_add_2_9.INIT0 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_9.INIT1 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_9.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_5_add_2_9.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_5_add_2_7 (.A0(rom_addr[5]), .B0(home[5]), 
          .C0(GND_net), .D0(GND_net), .A1(rom_addr[6]), .B1(home[6]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18340), .COUT(n18341), .S0(n1[5]), 
          .S1(n1[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_5_add_2_7.INIT0 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_7.INIT1 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_7.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_5_add_2_7.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_5_add_2_5 (.A0(rom_addr[3]), .B0(home[3]), 
          .C0(GND_net), .D0(GND_net), .A1(rom_addr[4]), .B1(home[4]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18339), .COUT(n18340), .S0(n1[3]), 
          .S1(n1[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_5_add_2_5.INIT0 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_5.INIT1 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_5.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_5_add_2_5.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_5_add_2_3 (.A0(rom_addr[1]), .B0(home[1]), 
          .C0(GND_net), .D0(GND_net), .A1(rom_addr[2]), .B1(home[2]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18338), .COUT(n18339), .S0(n1[1]), 
          .S1(n1[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_5_add_2_3.INIT0 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_3.INIT1 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_3.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_5_add_2_3.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_5_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(rom_addr[0]), .B1(home[0]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18338), .S1(n1[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_5_add_2_1.INIT0 = 16'h0000;
    defparam address_8__I_0_rep_5_add_2_1.INIT1 = 16'h5999;
    defparam address_8__I_0_rep_5_add_2_1.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_5_add_2_1.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_6_add_2_11 (.A0(n21638), .B0(ball_release_button_c), 
          .C0(n1[8]), .D0(rom_addr[8]), .A1(GND_net), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18333), .S0(q_239__N_2289[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_11.INIT0 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_11.INIT1 = 16'h0000;
    defparam address_8__I_0_rep_6_add_2_11.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_11.INJECT1_1 = "NO";
    CCU2D address_8__I_0_rep_6_add_2_9 (.A0(n21637), .B0(ball_release_button_c), 
          .C0(n1[6]), .D0(rom_addr[6]), .A1(n21635), .B1(ball_release_button_c), 
          .C1(n1[7]), .D1(rom_addr[7]), .CIN(n18332), .COUT(n18333), 
          .S0(q_239__N_2289[6]), .S1(q_239__N_2289[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pic_ram.v(9[14:30])
    defparam address_8__I_0_rep_6_add_2_9.INIT0 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_9.INIT1 = 16'hb874;
    defparam address_8__I_0_rep_6_add_2_9.INJECT1_0 = "NO";
    defparam address_8__I_0_rep_6_add_2_9.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module lcd_write
//

module lcd_write (clk_50MHz, wr_done, \cnt_sclk[3] , clk_50MHz_enable_43, 
            \cnt_sclk[2] , lcd_cs_c, \state[2] , \data[7] , \data[5] , 
            \data[6] , \data[2] , \data[3] , n3956, lcd_sclk_c, n21652, 
            \data[1] , n3, n4, lcd_mosi_c, \show_pic_data[0] , n4_adj_15, 
            \state[1] , \state_3__N_1103[1] ) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    output wr_done;
    output \cnt_sclk[3] ;
    input clk_50MHz_enable_43;
    output \cnt_sclk[2] ;
    output lcd_cs_c;
    output \state[2] ;
    input \data[7] ;
    input \data[5] ;
    input \data[6] ;
    input \data[2] ;
    input \data[3] ;
    output n3956;
    output lcd_sclk_c;
    output n21652;
    input \data[1] ;
    input n3;
    input n4;
    output lcd_mosi_c;
    input \show_pic_data[0] ;
    input n4_adj_15;
    input \state[1] ;
    input \state_3__N_1103[1] ;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [3:0]cnt_sclk;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(40[17:25])
    
    wire n21599;
    wire [3:0]n15;
    
    wire mosi_N_1143, clk_50MHz_enable_46;
    wire [3:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(34[17:22])
    wire [15:0]n645;
    
    wire sclk_flag, sclk_flag_N_1148, mosi_N_1142, mosi_N_1141, mosi_N_1140, 
        mosi_N_1139, mosi_N_1138;
    wire [3:0]n100;
    
    wire mosi_N_1137, mosi_N_1136;
    wire [3:0]state_3__N_1111;
    
    wire clk_50MHz_enable_168;
    wire [3:0]state_3__N_1107;
    
    wire n21572, n5745, n5746, n5373, n5747, n1;
    wire [4:0]cnt_delay;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(36[17:26])
    
    wire n21639;
    wire [4:0]n25;
    
    wire sclk_N_1131, n20272, n10899, n6, n5358;
    wire [0:0]n3358;
    
    wire n5332, n20341, clk_50MHz_enable_111, n13, n14, n4225, mosi_N_1133, 
        n5381, n5384, mosi_N_1134, n20395, n20392, n20384;
    
    FD1S3IX cnt_sclk__i0 (.D(n15[0]), .CK(clk_50MHz), .CD(n21599), .Q(cnt_sclk[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(84[10] 87[37])
    defparam cnt_sclk__i0.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i15 (.D(n645[14]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1143));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i15.GSR = "ENABLED";
    FD1S3AX sclk_flag_97 (.D(sclk_flag_N_1148), .CK(clk_50MHz), .Q(sclk_flag)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(94[10] 99[27])
    defparam sclk_flag_97.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i14 (.D(mosi_N_1142), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i14.GSR = "ENABLED";
    FD1S3AX wr_done_101 (.D(state[3]), .CK(clk_50MHz), .Q(wr_done)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(153[10] 156[25])
    defparam wr_done_101.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i13 (.D(n645[12]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1142));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i13.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i12 (.D(mosi_N_1141), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i12.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i11 (.D(n645[10]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1141));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i11.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i10 (.D(mosi_N_1140), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i10.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i9 (.D(n645[8]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1140));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i9.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i8 (.D(mosi_N_1139), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i8.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i7 (.D(n645[6]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1139));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i7.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i6 (.D(mosi_N_1138), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i6.GSR = "ENABLED";
    FD1P3IX cnt_sclk__i3 (.D(n100[3]), .SP(clk_50MHz_enable_43), .CD(n21599), 
            .CK(clk_50MHz), .Q(\cnt_sclk[3] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(84[10] 87[37])
    defparam cnt_sclk__i3.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i5 (.D(n645[4]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1138));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i5.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i4 (.D(mosi_N_1137), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i4.GSR = "ENABLED";
    FD1P3IX cnt_sclk__i2 (.D(n100[2]), .SP(clk_50MHz_enable_43), .CD(n21599), 
            .CK(clk_50MHz), .Q(\cnt_sclk[2] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(84[10] 87[37])
    defparam cnt_sclk__i2.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i3 (.D(n645[2]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1137));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i3.GSR = "ENABLED";
    FD1P3IX cnt_sclk__i1 (.D(n100[1]), .SP(clk_50MHz_enable_43), .CD(n21599), 
            .CK(clk_50MHz), .Q(cnt_sclk[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(84[10] 87[37])
    defparam cnt_sclk__i1.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i2 (.D(mosi_N_1136), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(n645[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i2.GSR = "ENABLED";
    FD1P3IX cnt1_FSM_i1 (.D(n645[0]), .SP(clk_50MHz_enable_46), .CD(state[1]), 
            .CK(clk_50MHz), .Q(mosi_N_1136));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i1.GSR = "ENABLED";
    FD1S3IX state_FSM_i0 (.D(state_3__N_1111[3]), .CK(clk_50MHz), .CD(lcd_cs_c), 
            .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut (.A(\state[2] ), .B(n21599), .C(state[1]), .Z(clk_50MHz_enable_168)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(77[13:56])
    defparam i1_2_lut_3_lut.init = 16'hf8f8;
    LUT4 state_3__N_1099_I_0_2_lut_rep_226 (.A(state[1]), .B(state_3__N_1107[1]), 
         .Z(n21572)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[13:57])
    defparam state_3__N_1099_I_0_2_lut_rep_226.init = 16'h2222;
    LUT4 i3964_3_lut_4_lut (.A(state[1]), .B(state_3__N_1107[1]), .C(\data[7] ), 
         .D(n5745), .Z(n5746)) /* synthesis lut_function=(A (B (D)+!B (C))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[13:57])
    defparam i3964_3_lut_4_lut.init = 16'hfd20;
    LUT4 i3594_3_lut_4_lut (.A(state[1]), .B(state_3__N_1107[1]), .C(state_3__N_1111[3]), 
         .D(\state[2] ), .Z(n5373)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[13:57])
    defparam i3594_3_lut_4_lut.init = 16'h2f22;
    PFUMX i3963 (.BLUT(\data[5] ), .ALUT(\data[6] ), .C0(mosi_N_1136), 
          .Z(n5745));
    PFUMX i3965 (.BLUT(\data[2] ), .ALUT(\data[3] ), .C0(mosi_N_1139), 
          .Z(n5747));
    LUT4 i1_1_lut (.A(mosi_N_1143), .Z(n1)) /* synthesis lut_function=(!(A)) */ ;
    defparam i1_1_lut.init = 16'h5555;
    LUT4 i2406_1_lut (.A(wr_done), .Z(n3956)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(153[10] 156[25])
    defparam i2406_1_lut.init = 16'h5555;
    LUT4 i16368_3_lut_4_lut (.A(cnt_delay[2]), .B(n21639), .C(cnt_delay[3]), 
         .D(cnt_delay[4]), .Z(n25[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16368_3_lut_4_lut.init = 16'h7f80;
    FD1S3IX sclk_99 (.D(sclk_N_1131), .CK(clk_50MHz), .CD(state[0]), .Q(lcd_sclk_c)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(116[10] 124[22])
    defparam sclk_99.GSR = "ENABLED";
    LUT4 i32_2_lut_rep_224_4_lut (.A(n21652), .B(\cnt_sclk[2] ), .C(\cnt_sclk[3] ), 
         .D(\state[2] ), .Z(clk_50MHz_enable_46)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(77[32:56])
    defparam i32_2_lut_rep_224_4_lut.init = 16'h0400;
    FD1S3IX state2_finish_flag_98 (.D(sclk_flag_N_1148), .CK(clk_50MHz), 
            .CD(n1), .Q(state_3__N_1111[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(105[10] 108[36])
    defparam state2_finish_flag_98.GSR = "ENABLED";
    LUT4 i18664_4_lut (.A(cnt_delay[4]), .B(cnt_delay[2]), .C(n20272), 
         .D(state[1]), .Z(n10899)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(66[10] 69[26])
    defparam i18664_4_lut.init = 16'hfeff;
    LUT4 i18192_2_lut (.A(state[3]), .B(cnt_delay[3]), .Z(n20272)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18192_2_lut.init = 16'heeee;
    LUT4 i16345_1_lut (.A(cnt_delay[0]), .Z(n25[0])) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16345_1_lut.init = 16'h5555;
    LUT4 i4_4_lut (.A(cnt_delay[3]), .B(cnt_delay[2]), .C(cnt_delay[0]), 
         .D(n6), .Z(state_3__N_1107[1])) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[32:57])
    defparam i4_4_lut.init = 16'hfffb;
    LUT4 i1_2_lut (.A(cnt_delay[1]), .B(cnt_delay[4]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[32:57])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i18416_3_lut (.A(n5358), .B(\data[1] ), .C(mosi_N_1141), .Z(n3358[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i18416_3_lut.init = 16'hcaca;
    FD1S3IX cnt_delay_2098__i0 (.D(n25[0]), .CK(clk_50MHz), .CD(n10899), 
            .Q(cnt_delay[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam cnt_delay_2098__i0.GSR = "ENABLED";
    LUT4 i3966_4_lut (.A(n5747), .B(n3), .C(mosi_N_1138), .D(n4), .Z(n5332)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i3966_4_lut.init = 16'hfaca;
    LUT4 i18642_4_lut (.A(state[0]), .B(state_3__N_1107[1]), .C(n20341), 
         .D(state[1]), .Z(clk_50MHz_enable_111)) /* synthesis lut_function=(A+(B (C)+!B (C+(D)))) */ ;
    defparam i18642_4_lut.init = 16'hfbfa;
    LUT4 i18258_4_lut (.A(\state[2] ), .B(n13), .C(sclk_flag), .D(n14), 
         .Z(n20341)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i18258_4_lut.init = 16'ha080;
    LUT4 i5_4_lut (.A(mosi_N_1143), .B(mosi_N_1141), .C(mosi_N_1137), 
         .D(mosi_N_1139), .Z(n13)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i5_4_lut.init = 16'hfffe;
    FD1P3AX mosi_100 (.D(n4225), .SP(clk_50MHz_enable_111), .CK(clk_50MHz), 
            .Q(lcd_mosi_c)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(130[10] 147[22])
    defparam mosi_100.GSR = "ENABLED";
    LUT4 i6_4_lut (.A(mosi_N_1140), .B(mosi_N_1142), .C(mosi_N_1138), 
         .D(mosi_N_1136), .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i12099_2_lut (.A(mosi_N_1133), .B(state[0]), .Z(n4225)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(130[10] 147[22])
    defparam i12099_2_lut.init = 16'h2222;
    LUT4 i12277_4_lut (.A(\show_pic_data[0] ), .B(mosi_N_1142), .C(n4_adj_15), 
         .D(\state[1] ), .Z(n5358)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i12277_4_lut.init = 16'hc8c0;
    LUT4 i18625_4_lut (.A(cnt_sclk[0]), .B(\cnt_sclk[3] ), .C(\cnt_sclk[2] ), 
         .D(cnt_sclk[1]), .Z(sclk_flag_N_1148)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(96[13:44])
    defparam i18625_4_lut.init = 16'h0200;
    FD1S3AX state_FSM_i1 (.D(n5373), .CK(clk_50MHz), .Q(\state[2] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n5381), .CK(clk_50MHz), .Q(state[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3JX state_FSM_i3 (.D(n5384), .CK(clk_50MHz), .PD(state[3]), .Q(state[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i16350_2_lut_rep_293 (.A(cnt_delay[1]), .B(cnt_delay[0]), .Z(n21639)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16350_2_lut_rep_293.init = 16'h8888;
    LUT4 i16354_2_lut_3_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .C(cnt_delay[2]), 
         .Z(n25[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16354_2_lut_3_lut.init = 16'h7878;
    LUT4 i16361_2_lut_3_lut_4_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .C(cnt_delay[3]), 
         .D(cnt_delay[2]), .Z(n25[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16361_2_lut_3_lut_4_lut.init = 16'h78f0;
    PFUMX mosi_I_19 (.BLUT(n5332), .ALUT(mosi_N_1134), .C0(n20395), .Z(mosi_N_1133)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=53, LSE_RLINE=65 */ ;
    LUT4 i1_2_lut_rep_306 (.A(cnt_sclk[0]), .B(cnt_sclk[1]), .Z(n21652)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(77[32:56])
    defparam i1_2_lut_rep_306.init = 16'heeee;
    LUT4 i3601_4_lut (.A(state[1]), .B(\state_3__N_1103[1] ), .C(state_3__N_1107[1]), 
         .D(state[0]), .Z(n5381)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam i3601_4_lut.init = 16'heca0;
    LUT4 i18628_3_lut_rep_253_4_lut (.A(cnt_sclk[0]), .B(cnt_sclk[1]), .C(\cnt_sclk[3] ), 
         .D(\cnt_sclk[2] ), .Z(n21599)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(77[32:56])
    defparam i18628_3_lut_rep_253_4_lut.init = 16'h0100;
    LUT4 i2930_3_lut_4_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .C(\cnt_sclk[2] ), 
         .D(\cnt_sclk[3] ), .Z(n100[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(87[21:36])
    defparam i2930_3_lut_4_lut.init = 16'h7f80;
    LUT4 i2923_2_lut_3_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .C(\cnt_sclk[2] ), 
         .Z(n100[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(87[21:36])
    defparam i2923_2_lut_3_lut.init = 16'h7878;
    LUT4 i3604_2_lut (.A(state[0]), .B(\state_3__N_1103[1] ), .Z(n5384)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(52[9] 57[16])
    defparam i3604_2_lut.init = 16'h2222;
    LUT4 i18304_2_lut (.A(mosi_N_1136), .B(mosi_N_1137), .Z(n20392)) /* synthesis lut_function=(!(A+(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i18304_2_lut.init = 16'h1111;
    FD1P3JX cnt1_FSM_i0 (.D(mosi_N_1143), .SP(clk_50MHz_enable_168), .PD(state[1]), 
            .CK(clk_50MHz), .Q(n645[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(78[17:28])
    defparam cnt1_FSM_i0.GSR = "ENABLED";
    LUT4 i18723_4_lut (.A(n21572), .B(mosi_N_1136), .C(mosi_N_1137), .D(n20384), 
         .Z(n20395)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(134[10] 147[22])
    defparam i18723_4_lut.init = 16'hfffe;
    LUT4 i18296_3_lut (.A(mosi_N_1138), .B(mosi_N_1139), .C(mosi_N_1140), 
         .Z(n20384)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(135[9] 145[16])
    defparam i18296_3_lut.init = 16'h0101;
    LUT4 i3450_2_lut (.A(cnt_sclk[0]), .B(clk_50MHz_enable_43), .Z(n15[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(84[10] 87[37])
    defparam i3450_2_lut.init = 16'h6666;
    LUT4 sclk_I_0_2_lut (.A(lcd_sclk_c), .B(sclk_flag), .Z(sclk_N_1131)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(124[9:22])
    defparam sclk_I_0_2_lut.init = 16'h6666;
    LUT4 i2916_2_lut (.A(cnt_sclk[1]), .B(cnt_sclk[0]), .Z(n100[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(87[21:36])
    defparam i2916_2_lut.init = 16'h6666;
    LUT4 i18424_4_lut_4_lut (.A(n21572), .B(n20392), .C(n5746), .D(n3358[0]), 
         .Z(mosi_N_1134)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(132[13:57])
    defparam i18424_4_lut_4_lut.init = 16'hf4b0;
    FD1S3IX cnt_delay_2098__i1 (.D(n25[1]), .CK(clk_50MHz), .CD(n10899), 
            .Q(cnt_delay[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam cnt_delay_2098__i1.GSR = "ENABLED";
    FD1S3IX cnt_delay_2098__i2 (.D(n25[2]), .CK(clk_50MHz), .CD(n10899), 
            .Q(cnt_delay[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam cnt_delay_2098__i2.GSR = "ENABLED";
    FD1S3IX cnt_delay_2098__i3 (.D(n25[3]), .CK(clk_50MHz), .CD(n10899), 
            .Q(cnt_delay[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam cnt_delay_2098__i3.GSR = "ENABLED";
    FD1S3IX cnt_delay_2098__i4 (.D(n25[4]), .CK(clk_50MHz), .CD(n10899), 
            .Q(cnt_delay[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam cnt_delay_2098__i4.GSR = "ENABLED";
    LUT4 i16347_2_lut (.A(cnt_delay[1]), .B(cnt_delay[0]), .Z(n25[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(67[22:38])
    defparam i16347_2_lut.init = 16'h6666;
    LUT4 state_3__N_1100_I_0_118_1_lut (.A(\state[2] ), .Z(lcd_cs_c)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_write.v(159[13:44])
    defparam state_3__N_1100_I_0_118_1_lut.init = 16'h5555;
    
endmodule
//
// Verilog Description of module lcd_show_pic
//

module lcd_show_pic (rom_addr, clk_50MHz, length_num_flag, \temp_239__N_1403[9] , 
            \cnt_rom_prepare[2] , clk_50MHz_enable_30, n21602, \show_pic_data[0] , 
            state, \temp[3] , \temp_239__N_1403[2] , n19935, n21518, 
            n3961, n21671, \show_pic_counter[3] , \state[1]_adj_14 , 
            n21609, n14444, \show_pic_data[1] , \show_pic_data[2] , 
            \show_pic_data[3] , \show_pic_data[4] , \show_pic_data[6] , 
            \show_pic_data[7] , n22, n4, \show_pic_data[8] , GND_net, 
            n18767, the1_wr_done, \temp[10] , n20045, n21517, n16, 
            n21520, \q_239__N_2289[2] , n18697) /* synthesis syn_module_defined=1 */ ;
    output [8:0]rom_addr;
    input clk_50MHz;
    output length_num_flag;
    input \temp_239__N_1403[9] ;
    output \cnt_rom_prepare[2] ;
    input clk_50MHz_enable_30;
    output n21602;
    output \show_pic_data[0] ;
    output [3:0]state;
    output \temp[3] ;
    input \temp_239__N_1403[2] ;
    input n19935;
    input n21518;
    input n3961;
    input n21671;
    input \show_pic_counter[3] ;
    input \state[1]_adj_14 ;
    output n21609;
    output n14444;
    output \show_pic_data[1] ;
    output \show_pic_data[2] ;
    output \show_pic_data[3] ;
    output \show_pic_data[4] ;
    output \show_pic_data[6] ;
    output \show_pic_data[7] ;
    input n22;
    input n4;
    output \show_pic_data[8] ;
    input GND_net;
    output n18767;
    input the1_wr_done;
    output \temp[10] ;
    output n20045;
    input n21517;
    input n16;
    input n21520;
    input \q_239__N_2289[2] ;
    input n18697;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    
    wire clk_50MHz_enable_173, n10903;
    wire [8:0]cnt_length_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    wire [9:0]cnt_wr_color_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(71[17:34])
    
    wire clk_50MHz_enable_89, cnt_wr_color_data_9__N_1975;
    wire [9:0]n1160;
    wire [2:0]cnt_rom_prepare;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(55[17:32])
    wire [2:0]n1;
    wire [239:0]temp;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(62[19:23])
    
    wire clk_50MHz_enable_167;
    wire [239:0]temp_239__N_1403;
    wire [2:0]n79;
    
    wire clk_50MHz_enable_35, clk_50MHz_enable_151;
    wire [8:0]show_pic_data_8__N_1383;
    
    wire n21513;
    wire [3:0]cnt_set_windows;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(49[17:32])
    
    wire n21717, n21716, n21720, n21453, n21452, n20357, n12, 
        length_num_flag_N_1998, n20258, state1_finish_flag_N_1996, n21606, 
        n21674, n21656, n10860, n14;
    wire [3:0]state_3__N_1666;
    wire [3:0]state_3__N_1670;
    
    wire n21640;
    wire [8:0]show_pic_data_8__N_1985;
    
    wire n10, n4_c, n20043, n16277, n20997, n21261, n16263, clk_50MHz_enable_165, 
        n16264, clk_50MHz_enable_156, n10897, n4_adj_2647;
    wire [8:0]n41;
    
    wire n14_adj_2648, n20289, n5353, n18391, n18390, n18389, n18388;
    wire [3:0]n21;
    
    wire n21670, n18274, n18273, n18272, n18271, n18270;
    
    FD1P3IX rom_addr_i5 (.D(cnt_length_num[5]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i5.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i0 (.D(n1160[0]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i0.GSR = "ENABLED";
    FD1S3IX cnt_rom_prepare__i0 (.D(n1[0]), .CK(clk_50MHz), .CD(length_num_flag), 
            .Q(cnt_rom_prepare[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(126[10] 129[51])
    defparam cnt_rom_prepare__i0.GSR = "ENABLED";
    FD1P3IX rom_addr_i6 (.D(cnt_length_num[6]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i6.GSR = "ENABLED";
    FD1P3AX temp_i9 (.D(\temp_239__N_1403[9] ), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[9])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i9.GSR = "ENABLED";
    FD1P3AX temp_i8 (.D(temp_239__N_1403[8]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i8.GSR = "ENABLED";
    FD1P3AX temp_i7 (.D(temp_239__N_1403[7]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i7.GSR = "ENABLED";
    FD1P3AX temp_i6 (.D(temp_239__N_1403[6]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i6.GSR = "ENABLED";
    FD1P3IX cnt_rom_prepare__i2 (.D(n79[2]), .SP(clk_50MHz_enable_30), .CD(length_num_flag), 
            .CK(clk_50MHz), .Q(\cnt_rom_prepare[2] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(126[10] 129[51])
    defparam cnt_rom_prepare__i2.GSR = "ENABLED";
    FD1P3IX cnt_rom_prepare__i1 (.D(n79[1]), .SP(clk_50MHz_enable_30), .CD(length_num_flag), 
            .CK(clk_50MHz), .Q(cnt_rom_prepare[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(126[10] 129[51])
    defparam cnt_rom_prepare__i1.GSR = "ENABLED";
    FD1P3IX temp_i0 (.D(temp[1]), .SP(clk_50MHz_enable_35), .CD(n21602), 
            .CK(clk_50MHz), .Q(temp[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i0.GSR = "ENABLED";
    FD1P3AX data_i0 (.D(show_pic_data_8__N_1383[0]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[0] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i0.GSR = "ENABLED";
    FD1P3AX temp_i5 (.D(temp_239__N_1403[5]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i5.GSR = "ENABLED";
    FD1P3AX temp_i4 (.D(temp_239__N_1403[4]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i4.GSR = "ENABLED";
    FD1S3AX state_FSM_i0 (.D(n21513), .CK(clk_50MHz), .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    FD1P3AX temp_i3 (.D(temp_239__N_1403[3]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(\temp[3] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i3.GSR = "ENABLED";
    FD1P3AX temp_i2 (.D(\temp_239__N_1403[2] ), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i2.GSR = "ENABLED";
    LUT4 i12305_4_lut_4_lut_then_3_lut (.A(state[1]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .Z(n21717)) /* synthesis lut_function=(!(A (B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i12305_4_lut_4_lut_then_3_lut.init = 16'h5757;
    FD1P3AX temp_i1 (.D(temp_239__N_1403[1]), .SP(clk_50MHz_enable_167), 
            .CK(clk_50MHz), .Q(temp[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i1.GSR = "ENABLED";
    LUT4 i12305_4_lut_4_lut_else_3_lut (.A(state[1]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[0]), .Z(n21716)) /* synthesis lut_function=((B (C+!(D))+!B (C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i12305_4_lut_4_lut_else_3_lut.init = 16'hf7fd;
    LUT4 show_pic_data_8__I_0_i8_4_lut_then_4_lut (.A(cnt_set_windows[3]), 
         .B(cnt_set_windows[0]), .C(cnt_set_windows[2]), .D(cnt_set_windows[1]), 
         .Z(n21720)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[10] 220[22])
    defparam show_pic_data_8__I_0_i8_4_lut_then_4_lut.init = 16'h0010;
    FD1P3IX rom_addr_i7 (.D(cnt_length_num[7]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i7.GSR = "ENABLED";
    PFUMX i18983 (.BLUT(n21453), .ALUT(n21452), .C0(state[1]), .Z(show_pic_data_8__N_1383[6]));
    LUT4 i6_4_lut (.A(n20357), .B(n12), .C(cnt_wr_color_data[5]), .D(state[2]), 
         .Z(length_num_flag_N_1998)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i6_4_lut.init = 16'h4000;
    LUT4 i18273_4_lut (.A(cnt_wr_color_data[4]), .B(cnt_wr_color_data[6]), 
         .C(cnt_wr_color_data[7]), .D(n20258), .Z(n20357)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i18273_4_lut.init = 16'hfffe;
    LUT4 i5_4_lut (.A(cnt_wr_color_data[1]), .B(cnt_wr_color_data[0]), .C(cnt_wr_color_data[2]), 
         .D(cnt_wr_color_data[3]), .Z(n12)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i5_4_lut.init = 16'h8000;
    LUT4 i18178_2_lut (.A(cnt_wr_color_data[8]), .B(cnt_wr_color_data[9]), 
         .Z(n20258)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18178_2_lut.init = 16'heeee;
    LUT4 i18603_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[2]), .C(cnt_set_windows[1]), 
         .D(cnt_set_windows[3]), .Z(state1_finish_flag_N_1996)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(117[13:36])
    defparam i18603_4_lut.init = 16'h1000;
    LUT4 n21606_bdd_3_lut (.A(n21606), .B(n21720), .C(state[1]), .Z(show_pic_data_8__N_1383[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam n21606_bdd_3_lut.init = 16'hcaca;
    FD1P3IX rom_addr_i8 (.D(cnt_length_num[8]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i8.GSR = "ENABLED";
    LUT4 i2_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), .C(n21656), 
         .D(state[3]), .Z(clk_50MHz_enable_89)) /* synthesis lut_function=(A ((C+(D))+!B)+!A (C+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam i2_3_lut_4_lut.init = 16'hfff2;
    LUT4 i9043_2_lut_2_lut_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(n21656), .D(cnt_wr_color_data[0]), .Z(n10860)) /* synthesis lut_function=(A (B (C (D)))+!A (C (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam i9043_2_lut_2_lut_3_lut_4_lut.init = 16'hd000;
    LUT4 temp_239__I_0_i9_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(temp[9]), .D(n19935), .Z(temp_239__N_1403[8])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam temp_239__I_0_i9_3_lut_4_lut.init = 16'hd0f2;
    LUT4 temp_239__I_0_i8_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(temp[8]), .D(n19935), .Z(temp_239__N_1403[7])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam temp_239__I_0_i8_3_lut_4_lut.init = 16'hd0f2;
    LUT4 i28_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), .C(temp[7]), 
         .D(n14), .Z(temp_239__N_1403[6])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam i28_3_lut_4_lut.init = 16'hd0f2;
    LUT4 i28_3_lut_4_lut_adj_327 (.A(cnt_rom_prepare[1]), .B(n21674), .C(temp[6]), 
         .D(n14), .Z(temp_239__N_1403[5])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam i28_3_lut_4_lut_adj_327.init = 16'hd0f2;
    LUT4 temp_239__I_0_i5_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(temp[5]), .D(n19935), .Z(temp_239__N_1403[4])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam temp_239__I_0_i5_3_lut_4_lut.init = 16'hd0f2;
    LUT4 temp_239__I_0_i4_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(temp[4]), .D(n19935), .Z(temp_239__N_1403[3])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam temp_239__I_0_i4_3_lut_4_lut.init = 16'hd0f2;
    LUT4 i1_2_lut_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), .C(n21656), 
         .D(cnt_wr_color_data[0]), .Z(clk_50MHz_enable_167)) /* synthesis lut_function=(A ((C (D))+!B)+!A (C (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf222;
    LUT4 temp_239__I_0_i2_3_lut_4_lut (.A(cnt_rom_prepare[1]), .B(n21674), 
         .C(temp[2]), .D(n21518), .Z(temp_239__N_1403[1])) /* synthesis lut_function=(A (B (C)+!B (D))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[13:35])
    defparam temp_239__I_0_i2_3_lut_4_lut.init = 16'hf2d0;
    FD1S3IX length_num_flag_120 (.D(length_num_flag_N_1998), .CK(clk_50MHz), 
            .CD(n3961), .Q(length_num_flag)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(161[9] 168[32])
    defparam length_num_flag_120.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut (.A(n21671), .B(\show_pic_counter[3] ), .C(\state[1]_adj_14 ), 
         .Z(state_3__N_1666[1])) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(30[13:29])
    defparam i1_2_lut_3_lut.init = 16'h1010;
    FD1S3IX state1_finish_flag_116 (.D(state1_finish_flag_N_1996), .CK(clk_50MHz), 
            .CD(n3961), .Q(state_3__N_1670[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(117[10] 120[36])
    defparam state1_finish_flag_116.GSR = "ENABLED";
    LUT4 show_pic_data_8__I_0_i5_3_lut_4_lut (.A(cnt_wr_color_data[0]), .B(n21640), 
         .C(state[1]), .D(show_pic_data_8__N_1985[4]), .Z(show_pic_data_8__N_1383[4])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A ((D)+!C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(214[10] 220[22])
    defparam show_pic_data_8__I_0_i5_3_lut_4_lut.init = 16'hfd0d;
    LUT4 i5_3_lut_rep_263 (.A(cnt_length_num[3]), .B(n10), .C(cnt_length_num[5]), 
         .Z(n21609)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    defparam i5_3_lut_rep_263.init = 16'h8080;
    LUT4 i1_2_lut_4_lut (.A(cnt_length_num[3]), .B(n10), .C(cnt_length_num[5]), 
         .D(cnt_length_num[6]), .Z(n4_c)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    defparam i1_2_lut_4_lut.init = 16'hff80;
    LUT4 i1_2_lut_4_lut_adj_328 (.A(cnt_length_num[3]), .B(n10), .C(cnt_length_num[5]), 
         .D(n20043), .Z(n16277)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    defparam i1_2_lut_4_lut_adj_328.init = 16'h8000;
    LUT4 cnt_set_windows_0__bdd_4_lut_18904 (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[3]), .Z(n20997)) /* synthesis lut_function=(!(A (B+(C (D)+!C !(D)))+!A (B (C+(D))+!B (C+!(D))))) */ ;
    defparam cnt_set_windows_0__bdd_4_lut_18904.init = 16'h0324;
    LUT4 i2_2_lut (.A(state[1]), .B(state[2]), .Z(clk_50MHz_enable_151)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2_2_lut.init = 16'heeee;
    LUT4 show_pic_data_8__N_1976_7__bdd_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[3]), .Z(n21261)) /* synthesis lut_function=(!(A (B+(C (D)+!C !(D)))+!A (B (C)+!B (C+(D))))) */ ;
    defparam show_pic_data_8__N_1976_7__bdd_4_lut.init = 16'h0625;
    FD1P3IX cnt_wr_color_data__i9 (.D(n1160[9]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[9])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i9.GSR = "ENABLED";
    LUT4 i1_2_lut (.A(state[3]), .B(n16263), .Z(clk_50MHz_enable_165)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1_2_lut.init = 16'hbbbb;
    LUT4 i1_2_lut_adj_329 (.A(state[3]), .B(n16263), .Z(n16264)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i1_2_lut_adj_329.init = 16'h8888;
    LUT4 i1_4_lut (.A(length_num_flag), .B(cnt_length_num[7]), .C(cnt_length_num[8]), 
         .D(n4_c), .Z(n16263)) /* synthesis lut_function=((B (C)+!B (C (D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(161[9] 168[32])
    defparam i1_4_lut.init = 16'hf5d5;
    LUT4 i4_4_lut (.A(cnt_length_num[4]), .B(cnt_length_num[1]), .C(cnt_length_num[0]), 
         .D(cnt_length_num[2]), .Z(n10)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(68[17:31])
    defparam i4_4_lut.init = 16'h8000;
    FD1P3IX cnt_wr_color_data__i8 (.D(n1160[8]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i8.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i7 (.D(n1160[7]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i7.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i6 (.D(n1160[6]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i6.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i5 (.D(n1160[5]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i5.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i4 (.D(n1160[4]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i4.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i3 (.D(n1160[3]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i3.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i2 (.D(n1160[2]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i2.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i1 (.D(n1160[1]), .SP(clk_50MHz_enable_89), 
            .CD(cnt_wr_color_data_9__N_1975), .CK(clk_50MHz), .Q(cnt_wr_color_data[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(185[10] 188[55])
    defparam cnt_wr_color_data__i1.GSR = "ENABLED";
    FD1P3IX cnt_set_windows_2106__i0 (.D(n4_adj_2647), .SP(clk_50MHz_enable_156), 
            .CD(n10897), .CK(clk_50MHz), .Q(cnt_set_windows[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_2106__i0.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i0 (.D(n41[0]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i0.GSR = "ENABLED";
    LUT4 cnt_set_windows_0__bdd_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(show_pic_data_8__N_1985[1])) /* synthesis lut_function=(!(A (B (C+(D))+!B (C+!(D)))+!A (B+(C+(D))))) */ ;
    defparam cnt_set_windows_0__bdd_4_lut.init = 16'h0209;
    LUT4 i3448_2_lut (.A(cnt_rom_prepare[0]), .B(clk_50MHz_enable_30), .Z(n1[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(126[10] 129[51])
    defparam i3448_2_lut.init = 16'h6666;
    LUT4 i12640_2_lut (.A(cnt_rom_prepare[0]), .B(cnt_rom_prepare[1]), .Z(n14444)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i12640_2_lut.init = 16'heeee;
    LUT4 cnt_set_windows_1__bdd_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[0]), .Z(show_pic_data_8__N_1985[4])) /* synthesis lut_function=(!(A (B+(C+(D)))+!A (B (C+!(D))+!B ((D)+!C)))) */ ;
    defparam cnt_set_windows_1__bdd_4_lut.init = 16'h0412;
    FD1P3AX data_i1 (.D(show_pic_data_8__N_1383[1]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[1] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i1.GSR = "ENABLED";
    FD1P3AX data_i2 (.D(show_pic_data_8__N_1383[2]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[2] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i2.GSR = "ENABLED";
    FD1P3AX data_i3 (.D(show_pic_data_8__N_1383[3]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[3] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i3.GSR = "ENABLED";
    FD1P3AX data_i4 (.D(show_pic_data_8__N_1383[4]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[4] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i4.GSR = "ENABLED";
    FD1P3AX data_i6 (.D(show_pic_data_8__N_1383[6]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[6] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i6.GSR = "ENABLED";
    FD1P3AX data_i7 (.D(show_pic_data_8__N_1383[7]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[7] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i7.GSR = "ENABLED";
    LUT4 show_pic_data_8__I_0_i3_4_lut (.A(n21606), .B(cnt_set_windows[3]), 
         .C(state[1]), .D(n14_adj_2648), .Z(show_pic_data_8__N_1383[2])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[10] 220[22])
    defparam show_pic_data_8__I_0_i3_4_lut.init = 16'hca0a;
    FD1S3AX state_FSM_i1 (.D(n20289), .CK(clk_50MHz), .Q(state[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n5353), .CK(clk_50MHz), .Q(state[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1P3AY state_FSM_i3 (.D(state[3]), .SP(state_3__N_1666[1]), .CK(clk_50MHz), 
            .Q(state[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i94_2_lut_rep_294 (.A(state[2]), .B(temp[0]), .Z(n21640)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[13:55])
    defparam i94_2_lut_rep_294.init = 16'h2222;
    LUT4 show_pic_data_8__N_1976_1__bdd_2_lut_3_lut (.A(state[2]), .B(temp[0]), 
         .C(cnt_wr_color_data[0]), .Z(n21453)) /* synthesis lut_function=(A ((C)+!B)+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[13:55])
    defparam show_pic_data_8__N_1976_1__bdd_2_lut_3_lut.init = 16'hf2f2;
    LUT4 show_pic_data_8__I_0_i2_3_lut_4_lut (.A(state[2]), .B(temp[0]), 
         .C(state[1]), .D(show_pic_data_8__N_1985[1]), .Z(show_pic_data_8__N_1383[1])) /* synthesis lut_function=(A (B (C (D))+!B ((D)+!C))+!A (C (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[13:55])
    defparam show_pic_data_8__I_0_i2_3_lut_4_lut.init = 16'hf202;
    LUT4 i12303_2_lut_rep_260_3_lut (.A(state[2]), .B(temp[0]), .C(cnt_wr_color_data[0]), 
         .Z(n21606)) /* synthesis lut_function=(!(A (B (C))+!A (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(209[13:55])
    defparam i12303_2_lut_rep_260_3_lut.init = 16'h2f2f;
    LUT4 i18208_4_lut (.A(state[1]), .B(state[2]), .C(state_3__N_1670[2]), 
         .D(n16277), .Z(n20289)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A !((D)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(45[17:22])
    defparam i18208_4_lut.init = 16'ha0ec;
    LUT4 i3_4_lut (.A(length_num_flag), .B(cnt_length_num[8]), .C(cnt_length_num[7]), 
         .D(cnt_length_num[6]), .Z(n20043)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i3_4_lut.init = 16'h0008;
    LUT4 i3576_4_lut (.A(state[1]), .B(n22), .C(state_3__N_1670[2]), .D(n4), 
         .Z(n5353)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(87[9] 92[16])
    defparam i3576_4_lut.init = 16'h3b0a;
    FD1P3AX data_i8 (.D(show_pic_data_8__N_1383[8]), .SP(clk_50MHz_enable_151), 
            .CK(clk_50MHz), .Q(\show_pic_data[8] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(194[10] 220[22])
    defparam data_i8.GSR = "ENABLED";
    CCU2D cnt_length_num_2108_add_4_9 (.A0(cnt_length_num[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[8]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18391), .S0(n41[7]), .S1(n41[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_9.INJECT1_0 = "NO";
    defparam cnt_length_num_2108_add_4_9.INJECT1_1 = "NO";
    CCU2D cnt_length_num_2108_add_4_7 (.A0(cnt_length_num[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18390), .COUT(n18391), .S0(n41[5]), 
          .S1(n41[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_7.INJECT1_0 = "NO";
    defparam cnt_length_num_2108_add_4_7.INJECT1_1 = "NO";
    CCU2D cnt_length_num_2108_add_4_5 (.A0(cnt_length_num[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18389), .COUT(n18390), .S0(n41[3]), 
          .S1(n41[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_5.INJECT1_0 = "NO";
    defparam cnt_length_num_2108_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_length_num_2108_add_4_3 (.A0(cnt_length_num[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18388), .COUT(n18389), .S0(n41[1]), 
          .S1(n41[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2108_add_4_3.INJECT1_0 = "NO";
    defparam cnt_length_num_2108_add_4_3.INJECT1_1 = "NO";
    LUT4 i2_3_lut (.A(cnt_rom_prepare[0]), .B(\cnt_rom_prepare[2] ), .C(cnt_rom_prepare[1]), 
         .Z(n18767)) /* synthesis lut_function=(((C)+!B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(232[48:70])
    defparam i2_3_lut.init = 16'hf7f7;
    CCU2D cnt_length_num_2108_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_length_num[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18388), .S1(n41[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108_add_4_1.INIT0 = 16'hF000;
    defparam cnt_length_num_2108_add_4_1.INIT1 = 16'h0555;
    defparam cnt_length_num_2108_add_4_1.INJECT1_0 = "NO";
    defparam cnt_length_num_2108_add_4_1.INJECT1_1 = "NO";
    LUT4 i16275_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[3]), .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam i16275_3_lut_4_lut.init = 16'h7f80;
    LUT4 i16268_2_lut_3_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .Z(n21[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam i16268_2_lut_3_lut.init = 16'h7878;
    FD1P3IX cnt_set_windows_2106__i3 (.D(n21[3]), .SP(clk_50MHz_enable_156), 
            .CD(n10897), .CK(clk_50MHz), .Q(cnt_set_windows[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_2106__i3.GSR = "ENABLED";
    FD1P3IX cnt_set_windows_2106__i2 (.D(n21[2]), .SP(clk_50MHz_enable_156), 
            .CD(n10897), .CK(clk_50MHz), .Q(cnt_set_windows[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_2106__i2.GSR = "ENABLED";
    LUT4 i54_2_lut_rep_310 (.A(state[2]), .B(the1_wr_done), .Z(n21656)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(148[13:44])
    defparam i54_2_lut_rep_310.init = 16'h8888;
    LUT4 i664_2_lut_rep_255_3_lut (.A(state[2]), .B(the1_wr_done), .C(cnt_wr_color_data[0]), 
         .Z(clk_50MHz_enable_35)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(148[13:44])
    defparam i664_2_lut_rep_255_3_lut.init = 16'h8080;
    FD1P3IX cnt_set_windows_2106__i1 (.D(n21670), .SP(clk_50MHz_enable_156), 
            .CD(n10897), .CK(clk_50MHz), .Q(cnt_set_windows[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(107[28:50])
    defparam cnt_set_windows_2106__i1.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i8 (.D(n41[8]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i8.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i7 (.D(n41[7]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i7.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i6 (.D(n41[6]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i6.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i5 (.D(n41[5]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i5.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i4 (.D(n41[4]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i4.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i3 (.D(n41[3]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i3.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i2 (.D(n41[2]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i2.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2108__i1 (.D(n41[1]), .SP(clk_50MHz_enable_165), 
            .CD(n16264), .CK(clk_50MHz), .Q(cnt_length_num[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(175[27:48])
    defparam cnt_length_num_2108__i1.GSR = "ENABLED";
    FD1P3IX rom_addr_i0 (.D(cnt_length_num[0]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i0.GSR = "ENABLED";
    FD1P3IX temp_i10 (.D(n21518), .SP(clk_50MHz_enable_167), .CD(n10860), 
            .CK(clk_50MHz), .Q(\temp[10] )) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(146[10] 154[7])
    defparam temp_i10.GSR = "ENABLED";
    CCU2D add_82_11 (.A0(cnt_wr_color_data[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18274), .S0(n1160[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_11.INIT0 = 16'h5aaa;
    defparam add_82_11.INIT1 = 16'h0000;
    defparam add_82_11.INJECT1_0 = "NO";
    defparam add_82_11.INJECT1_1 = "NO";
    LUT4 show_pic_data_8__N_1976_1__bdd_3_lut_4_lut (.A(cnt_set_windows[0]), 
         .B(cnt_set_windows[3]), .C(cnt_set_windows[2]), .D(cnt_set_windows[1]), 
         .Z(n21452)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam show_pic_data_8__N_1976_1__bdd_3_lut_4_lut.init = 16'h0100;
    PFUMX i18893 (.BLUT(n21606), .ALUT(n21261), .C0(state[1]), .Z(show_pic_data_8__N_1383[3]));
    LUT4 i1_2_lut_adj_330 (.A(state[2]), .B(n20043), .Z(n20045)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_330.init = 16'h8888;
    CCU2D add_82_9 (.A0(cnt_wr_color_data[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18273), .COUT(n18274), .S0(n1160[7]), 
          .S1(n1160[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_9.INIT0 = 16'h5aaa;
    defparam add_82_9.INIT1 = 16'h5aaa;
    defparam add_82_9.INJECT1_0 = "NO";
    defparam add_82_9.INJECT1_1 = "NO";
    CCU2D add_82_7 (.A0(cnt_wr_color_data[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18272), .COUT(n18273), .S0(n1160[5]), 
          .S1(n1160[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_7.INIT0 = 16'h5aaa;
    defparam add_82_7.INIT1 = 16'h5aaa;
    defparam add_82_7.INJECT1_0 = "NO";
    defparam add_82_7.INJECT1_1 = "NO";
    CCU2D add_82_5 (.A0(cnt_wr_color_data[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18271), .COUT(n18272), .S0(n1160[3]), 
          .S1(n1160[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_5.INIT0 = 16'h5aaa;
    defparam add_82_5.INIT1 = 16'h5aaa;
    defparam add_82_5.INJECT1_0 = "NO";
    defparam add_82_5.INJECT1_1 = "NO";
    CCU2D add_82_3 (.A0(cnt_wr_color_data[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18270), .COUT(n18271), .S0(n1160[1]), 
          .S1(n1160[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_3.INIT0 = 16'h5aaa;
    defparam add_82_3.INIT1 = 16'h5aaa;
    defparam add_82_3.INJECT1_0 = "NO";
    defparam add_82_3.INJECT1_1 = "NO";
    LUT4 i1804_2_lut_rep_324 (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .Z(n21670)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(195[9] 208[16])
    defparam i1804_2_lut_rep_324.init = 16'h6666;
    LUT4 i12103_2_lut_3_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(cnt_set_windows[2]), .Z(n14_adj_2648)) /* synthesis lut_function=(!(A (B+(C))+!A ((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(195[9] 208[16])
    defparam i12103_2_lut_3_lut.init = 16'h0606;
    CCU2D add_82_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_wr_color_data[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18270), .S1(n1160[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(188[30:54])
    defparam add_82_1.INIT0 = 16'hF000;
    defparam add_82_1.INIT1 = 16'h5555;
    defparam add_82_1.INJECT1_0 = "NO";
    defparam add_82_1.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_331 (.A(n21517), .B(n16), .C(n21520), .D(\q_239__N_2289[2] ), 
         .Z(n14)) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(148[10] 154[7])
    defparam i1_4_lut_adj_331.init = 16'haaa8;
    LUT4 i3002_3_lut (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[1]), 
         .C(cnt_rom_prepare[0]), .Z(n79[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(129[28:50])
    defparam i3002_3_lut.init = 16'h6a6a;
    LUT4 i2995_2_lut (.A(cnt_rom_prepare[1]), .B(cnt_rom_prepare[0]), .Z(n79[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(129[28:50])
    defparam i2995_2_lut.init = 16'h6666;
    PFUMX i18768 (.BLUT(n21640), .ALUT(n20997), .C0(state[1]), .Z(show_pic_data_8__N_1383[0]));
    LUT4 i1_2_lut_rep_328 (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[0]), 
         .Z(n21674)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam i1_2_lut_rep_328.init = 16'hbbbb;
    LUT4 i18583_2_lut_rep_256_3_lut (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[0]), 
         .C(cnt_rom_prepare[1]), .Z(n21602)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;
    defparam i18583_2_lut_rep_256_3_lut.init = 16'h4040;
    LUT4 temp_239__N_1944_I_0_2_lut_3_lut_4_lut (.A(\cnt_rom_prepare[2] ), 
         .B(cnt_rom_prepare[0]), .C(state[3]), .D(cnt_rom_prepare[1]), 
         .Z(cnt_wr_color_data_9__N_1975)) /* synthesis lut_function=(A (C)+!A (B (C+(D))+!B (C))) */ ;
    defparam temp_239__N_1944_I_0_2_lut_3_lut_4_lut.init = 16'hf4f0;
    LUT4 i9092_2_lut_3_lut_4_lut (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[0]), 
         .C(state[3]), .D(cnt_rom_prepare[1]), .Z(n10903)) /* synthesis lut_function=(A (C)+!A (B (C (D))+!B (C))) */ ;
    defparam i9092_2_lut_3_lut_4_lut.init = 16'hf0b0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_332 (.A(\cnt_rom_prepare[2] ), .B(cnt_rom_prepare[0]), 
         .C(state[3]), .D(cnt_rom_prepare[1]), .Z(clk_50MHz_enable_173)) /* synthesis lut_function=(A (C)+!A (B (C+!(D))+!B (C))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_332.init = 16'hf0f4;
    LUT4 i9080_2_lut_3_lut (.A(state[1]), .B(the1_wr_done), .C(state[3]), 
         .Z(n10897)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(106[13:44])
    defparam i9080_2_lut_3_lut.init = 16'h7070;
    LUT4 i1_2_lut_3_lut_adj_333 (.A(state[1]), .B(the1_wr_done), .C(state[3]), 
         .Z(clk_50MHz_enable_156)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(106[13:44])
    defparam i1_2_lut_3_lut_adj_333.init = 16'hf8f8;
    FD1P3IX rom_addr_i1 (.D(cnt_length_num[1]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i1.GSR = "ENABLED";
    FD1P3IX rom_addr_i2 (.D(cnt_length_num[2]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i2.GSR = "ENABLED";
    FD1P3IX rom_addr_i3 (.D(cnt_length_num[3]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i3.GSR = "ENABLED";
    LUT4 i1805_1_lut (.A(cnt_set_windows[0]), .Z(n4_adj_2647)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(195[9] 208[16])
    defparam i1805_1_lut.init = 16'h5555;
    LUT4 state_2__bdd_4_lut_19062 (.A(state[2]), .B(n16277), .C(n18697), 
         .D(state[3]), .Z(n21513)) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))+!A (C (D))) */ ;
    defparam state_2__bdd_4_lut_19062.init = 16'hf088;
    FD1P3IX rom_addr_i4 (.D(cnt_length_num[4]), .SP(clk_50MHz_enable_173), 
            .CD(n10903), .CK(clk_50MHz), .Q(rom_addr[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(135[10] 139[25])
    defparam rom_addr_i4.GSR = "ENABLED";
    PFUMX i19021 (.BLUT(n21716), .ALUT(n21717), .C0(cnt_set_windows[3]), 
          .Z(show_pic_data_8__N_1383[8]));
    
endmodule
//
// Verilog Description of module lcd_init
//

module lcd_init (clk_50MHz, clk_50MHz_enable_79, init_data, state, n22433, 
            n3956, lcd_rst_c, \state[4] , GND_net, wr_done) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    input clk_50MHz_enable_79;
    output [8:0]init_data;
    output [5:0]state;
    input n22433;
    input n3956;
    output lcd_rst_c;
    output \state[4] ;
    input GND_net;
    input wr_done;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [17:0]cnt_s4_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(59[13:23])
    
    wire n20270, n3943;
    wire [17:0]n357;
    wire [8:0]init_data_8__N_1194;
    
    wire clk_50MHz_enable_48, n14, n10, n20116, n21622, n21580, 
        n21619, n13936, n7, n21538, n9575, n21692, n75, n13938, 
        n12, n13930, n21530, n19966, n14624, n13940, n14628;
    wire [6:0]cnt_s2_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(57[13:23])
    
    wire n21650;
    wire [6:0]n24;
    
    wire n21563, n10_adj_2623, n21624, n21623, n20056, n7_adj_2624, 
        n14283, n21617, n12_adj_2625, n13934, n14626, n21582, n21626, 
        n20146, n21581, n8, n21545, n21726, n21725, n21729, n21728, 
        n21603;
    wire [6:0]n159;
    
    wire n9719, n9707, n21569, n9704, n20096, n21536, n21577, 
        n7_adj_2626, n21621, n12_adj_2627, n13926, n21578, n21616, 
        n21615, n10_adj_2628, n19996, n20158, n21618, n5, n14358, 
        n4, n14578, n21546, n21620, n21625, n14414, n6, n20053, 
        n7_adj_2629, n7_adj_2630, n52, n21629, n56, n21583, n21627, 
        n20242, n12_adj_2631, n21628, cnt_s4_num_done_N_1371, n21584, 
        n21693, n21694, n21548, n19178;
    wire [8:0]init_data_8__N_1337;
    
    wire n87, n21562, n8_adj_2632, n7_adj_2633, n20305, n21614, 
        n20033, n21684, n21683, n21687, n19874, n9;
    wire [8:0]init_data_8__N_1328;
    
    wire n6_adj_2634, n21561, n20030, n21447;
    wire [5:0]state_5__N_1277;
    
    wire cnt_s2_num_done_N_1369;
    wire [5:0]state_5__N_1289;
    
    wire n21658;
    wire [5:0]state_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(47[13:18])
    
    wire cnt_150ms_22__N_1318, n19981, n91, n4_adj_2635, lcd_rst_high_flag, 
        n21681, n21559, n21575, n21690, n31, n21689, n21560, n21685, 
        n21557, n21682, n21574, n21686, n13, n8_adj_2636, n18486, 
        n4_adj_2637;
    wire [22:0]cnt_150ms;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(55[13:22])
    wire [22:0]n97;
    
    wire n33, n18533, n20068, n21571, n8_adj_2638, n19943, n73, 
        n84, n3, n9517, n41, n10874, n21558, n71, n83, n20121, 
        n4_adj_2639, n20111, lcd_rst_high_flag_N_1367, n20319, n20213, 
        n20329, n6_adj_2640, n87_adj_2641, n5291, n5293, n5295, 
        n5369, n5370, clk_50MHz_enable_135, n18403, n18402, n18401, 
        n18400, n18399, n18398, n18397, n18396, n8_adj_2642, n18395;
    wire [5:0]state_5__N_1283;
    
    wire n18394, n20110, n20199, n18393, n19861, n20108, n20228, 
        n6_adj_2643;
    wire [5:0]state_5__N_1271;
    
    wire n20123, n8_adj_2644, n20256;
    wire [5:0]state_5__N_1265;
    
    wire n9523, n21414, n21535, n21727, n21568, n18269, n20071, 
        n18268, n18267, n18266, n8_adj_2645, n18265, n18264, n28, 
        n18263, n18262, n18261, n21549, n21531, n20347;
    
    LUT4 i18190_2_lut (.A(cnt_s4_num[17]), .B(cnt_s4_num[14]), .Z(n20270)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18190_2_lut.init = 16'heeee;
    FD1P3IX cnt_s4_num__i0 (.D(n357[0]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i0.GSR = "ENABLED";
    FD1S3AX init_data_i0 (.D(init_data_8__N_1194[0]), .CK(clk_50MHz), .Q(init_data[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i0.GSR = "ENABLED";
    FD1P3AX state_FSM_i0 (.D(n22433), .SP(clk_50MHz_enable_48), .CK(clk_50MHz), 
            .Q(state[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    LUT4 i7_4_lut (.A(cnt_s4_num[10]), .B(n14), .C(n10), .D(cnt_s4_num[4]), 
         .Z(n20116)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i7_4_lut.init = 16'hfffe;
    LUT4 i6_4_lut (.A(cnt_s4_num[8]), .B(cnt_s4_num[15]), .C(cnt_s4_num[7]), 
         .D(cnt_s4_num[13]), .Z(n14)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i2_2_lut (.A(cnt_s4_num[16]), .B(cnt_s4_num[6]), .Z(n10)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i2_2_lut.init = 16'heeee;
    LUT4 i1_3_lut_4_lut_4_lut (.A(n21622), .B(n21580), .C(n21619), .D(n13936), 
         .Z(n7)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(233[13:18])
    defparam i1_3_lut_4_lut_4_lut.init = 16'hec00;
    LUT4 i1_4_lut (.A(n21538), .B(cnt_s4_num[0]), .C(n9575), .D(n21692), 
         .Z(n75)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_4_lut.init = 16'ha8a0;
    LUT4 i6_4_lut_adj_269 (.A(n13938), .B(n12), .C(n13930), .D(n21530), 
         .Z(n19966)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i6_4_lut_adj_269.init = 16'h8000;
    LUT4 i5_4_lut (.A(n13936), .B(n14624), .C(n13940), .D(n14628), .Z(n12)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i5_4_lut.init = 16'h8000;
    FD1S3IX cnt_s2_num__i0 (.D(n24[0]), .CK(clk_50MHz), .CD(n21650), .Q(cnt_s2_num[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i0.GSR = "ENABLED";
    LUT4 i5_4_lut_adj_270 (.A(n21563), .B(n10_adj_2623), .C(n21624), .D(n21623), 
         .Z(n20056)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i5_4_lut_adj_270.init = 16'h8880;
    LUT4 i4_4_lut (.A(n7_adj_2624), .B(n14283), .C(n21617), .D(n12_adj_2625), 
         .Z(n10_adj_2623)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i4_4_lut.init = 16'h8880;
    LUT4 i1_2_lut (.A(n13934), .B(n14626), .Z(n7_adj_2624)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i2_4_lut (.A(n21582), .B(n21626), .C(n20146), .D(n21581), .Z(n8)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i2_4_lut.init = 16'ha080;
    LUT4 i1_4_lut_then_4_lut (.A(n21545), .B(cnt_s4_num[1]), .C(cnt_s4_num[0]), 
         .D(cnt_s4_num[2]), .Z(n21726)) /* synthesis lut_function=(!((B ((D)+!C)+!B (C))+!A)) */ ;
    defparam i1_4_lut_then_4_lut.init = 16'h0282;
    LUT4 i1_4_lut_else_4_lut (.A(n21545), .B(cnt_s4_num[1]), .C(cnt_s4_num[0]), 
         .D(cnt_s4_num[2]), .Z(n21725)) /* synthesis lut_function=(A (B (C (D))+!B !(C+(D)))) */ ;
    defparam i1_4_lut_else_4_lut.init = 16'h8002;
    LUT4 i1_4_lut_then_4_lut_adj_271 (.A(n12_adj_2625), .B(cnt_s2_num[0]), 
         .C(cnt_s2_num[1]), .D(cnt_s2_num[2]), .Z(n21729)) /* synthesis lut_function=(A+(B (C+!(D))+!B !(C (D)))) */ ;
    defparam i1_4_lut_then_4_lut_adj_271.init = 16'hebff;
    LUT4 i1_4_lut_else_4_lut_adj_272 (.A(n12_adj_2625), .B(cnt_s2_num[0]), 
         .C(cnt_s2_num[1]), .D(cnt_s2_num[2]), .Z(n21728)) /* synthesis lut_function=(!(A (C (D))+!A (B (D)+!B (C (D))))) */ ;
    defparam i1_4_lut_else_4_lut_adj_272.init = 16'h0bff;
    LUT4 i2973_2_lut_3_lut_4_lut (.A(cnt_s2_num[3]), .B(n21603), .C(cnt_s2_num[5]), 
         .D(cnt_s2_num[4]), .Z(n159[5])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2973_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i1_2_lut_rep_223 (.A(n9719), .B(n9707), .Z(n21569)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_223.init = 16'heeee;
    LUT4 i1_2_lut_3_lut (.A(n9719), .B(n9707), .C(n9704), .Z(n20096)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n21626), .B(n21623), .C(n21536), .D(n21577), 
         .Z(n7_adj_2626)) /* synthesis lut_function=(A (C (D))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(237[13:18])
    defparam i1_2_lut_3_lut_4_lut.init = 16'he000;
    LUT4 i12133_4_lut (.A(n21624), .B(n21621), .C(n21581), .D(n12_adj_2627), 
         .Z(n13926)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i12133_4_lut.init = 16'hfac8;
    LUT4 i12141_4_lut (.A(n21617), .B(n21626), .C(n12_adj_2627), .D(n21578), 
         .Z(n13934)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i12141_4_lut.init = 16'hfac8;
    LUT4 i3_2_lut_3_lut_4_lut (.A(n21619), .B(n21616), .C(n21580), .D(n21615), 
         .Z(n10_adj_2628)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(224[13:18])
    defparam i3_2_lut_3_lut_4_lut.init = 16'heee0;
    LUT4 i1_4_lut_adj_273 (.A(n21624), .B(n21619), .C(n12_adj_2625), .D(n21623), 
         .Z(n19996)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_273.init = 16'hfac8;
    LUT4 i12143_4_lut (.A(n21624), .B(n21617), .C(n12_adj_2627), .D(n21578), 
         .Z(n13936)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i12143_4_lut.init = 16'hfac8;
    LUT4 i1_4_lut_adj_274 (.A(n12_adj_2627), .B(n20158), .C(n21615), .D(n21618), 
         .Z(n14624)) /* synthesis lut_function=(A (B)+!A !(((D)+!C)+!B)) */ ;
    defparam i1_4_lut_adj_274.init = 16'h88c8;
    LUT4 i12147_4_lut (.A(n21621), .B(n21618), .C(n12_adj_2625), .D(n21578), 
         .Z(n13940)) /* synthesis lut_function=(A ((D)+!B)+!A (B (C (D))+!B (C))) */ ;
    defparam i12147_4_lut.init = 16'hfa32;
    LUT4 i3_4_lut (.A(n5), .B(n21618), .C(n14358), .D(n12_adj_2625), 
         .Z(n14628)) /* synthesis lut_function=(A (B (C (D))+!B (C))) */ ;
    defparam i3_4_lut.init = 16'ha020;
    LUT4 i1_4_lut_adj_275 (.A(n21626), .B(n21622), .C(n21580), .D(n12_adj_2627), 
         .Z(n5)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_275.init = 16'hfac8;
    LUT4 i12145_4_lut (.A(n21619), .B(n21624), .C(n12_adj_2627), .D(n21578), 
         .Z(n13938)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i12145_4_lut.init = 16'hfac8;
    LUT4 i12137_4_lut (.A(n21617), .B(n21626), .C(n21623), .D(n12_adj_2625), 
         .Z(n13930)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i12137_4_lut.init = 16'hfac8;
    LUT4 i2_4_lut_adj_276 (.A(n21616), .B(n4), .C(n21615), .D(n21626), 
         .Z(n14578)) /* synthesis lut_function=(A (B)+!A (B (C (D)))) */ ;
    defparam i2_4_lut_adj_276.init = 16'hc888;
    LUT4 i1_3_lut_rep_200_4_lut (.A(n21615), .B(n21580), .C(n21616), .D(n21618), 
         .Z(n21546)) /* synthesis lut_function=(A (C+!(D))+!A (B (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(228[13:18])
    defparam i1_3_lut_rep_200_4_lut.init = 16'he0ee;
    LUT4 i1_4_lut_adj_277 (.A(n21626), .B(n21615), .C(n12_adj_2627), .D(n21578), 
         .Z(n4)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_277.init = 16'hfac8;
    LUT4 i1_2_lut_rep_184_4_lut_4_lut (.A(n21624), .B(n21616), .C(n21622), 
         .D(n14578), .Z(n21530)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(223[13:18])
    defparam i1_2_lut_rep_184_4_lut_4_lut.init = 16'hec00;
    LUT4 i1_3_lut_4_lut (.A(cnt_s2_num[4]), .B(n21620), .C(n21622), .D(n21621), 
         .Z(n20158)) /* synthesis lut_function=((B+(C (D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(266[13:18])
    defparam i1_3_lut_4_lut.init = 16'hfddd;
    LUT4 i1_3_lut_4_lut_adj_278 (.A(n21622), .B(n21618), .C(n19996), .D(n21581), 
         .Z(n14283)) /* synthesis lut_function=(A (B (C (D))+!B (C))+!A (C (D))) */ ;
    defparam i1_3_lut_4_lut_adj_278.init = 16'hf020;
    LUT4 i1_2_lut_3_lut_4_lut_adj_279 (.A(cnt_s2_num[4]), .B(n21625), .C(n14283), 
         .D(n14414), .Z(n6)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(266[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_279.init = 16'hf0d0;
    LUT4 i1_4_lut_adj_280 (.A(n21619), .B(n21616), .C(n21581), .D(n14414), 
         .Z(n20053)) /* synthesis lut_function=(A (B+(D))+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_4_lut_adj_280.init = 16'hfac8;
    LUT4 i1_3_lut_4_lut_adj_281 (.A(cnt_s2_num[4]), .B(n21625), .C(n21616), 
         .D(n21621), .Z(n20146)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (C+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(266[13:18])
    defparam i1_3_lut_4_lut_adj_281.init = 16'hffd0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_282 (.A(cnt_s2_num[4]), .B(n21625), .C(n13926), 
         .D(n21624), .Z(n7_adj_2629)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(266[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_282.init = 16'hf0d0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_283 (.A(cnt_s2_num[4]), .B(n21625), .C(n13930), 
         .D(n14414), .Z(n7_adj_2630)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(266[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_283.init = 16'hf0d0;
    LUT4 i69_3_lut (.A(cnt_s4_num[2]), .B(cnt_s4_num[3]), .C(cnt_s4_num[0]), 
         .Z(n52)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i69_3_lut.init = 16'h1818;
    LUT4 i1_4_lut_adj_284 (.A(n21538), .B(cnt_s4_num[1]), .C(n9575), .D(n21629), 
         .Z(n56)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_4_lut_adj_284.init = 16'ha8a0;
    LUT4 i1_2_lut_rep_237 (.A(cnt_s4_num[14]), .B(n20116), .Z(n21583)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_237.init = 16'heeee;
    LUT4 i1_3_lut_4_lut_adj_285 (.A(cnt_s4_num[14]), .B(n20116), .C(cnt_s4_num[17]), 
         .D(n21627), .Z(n9575)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_3_lut_4_lut_adj_285.init = 16'hfffe;
    LUT4 i18554_2_lut_rep_199_3_lut_4_lut (.A(cnt_s4_num[14]), .B(n20116), 
         .C(cnt_s4_num[17]), .D(n21627), .Z(n21545)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i18554_2_lut_rep_199_3_lut_4_lut.init = 16'h0001;
    LUT4 i18659_4_lut (.A(n20242), .B(n12_adj_2631), .C(cnt_s4_num[17]), 
         .D(n21628), .Z(cnt_s4_num_done_N_1371)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(328[13:36])
    defparam i18659_4_lut.init = 16'h0020;
    LUT4 i18162_2_lut (.A(cnt_s4_num[11]), .B(cnt_s4_num[12]), .Z(n20242)) /* synthesis lut_function=(A (B)) */ ;
    defparam i18162_2_lut.init = 16'h8888;
    LUT4 i5_4_lut_adj_286 (.A(cnt_s4_num[2]), .B(cnt_s4_num[14]), .C(n21584), 
         .D(cnt_s4_num[3]), .Z(n12_adj_2631)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i5_4_lut_adj_286.init = 16'hf7ff;
    LUT4 i3_2_lut_rep_202_3_lut_4_lut (.A(n21693), .B(n20116), .C(n20270), 
         .D(n21694), .Z(n21548)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i3_2_lut_rep_202_3_lut_4_lut.init = 16'hfffe;
    FD1P3IX cnt_s4_num__i17 (.D(n357[17]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[17])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i17.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i16 (.D(n357[16]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[16])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i16.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i15 (.D(n357[15]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[15])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i15.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i14 (.D(n357[14]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[14])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i14.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i13 (.D(n357[13]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[13])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i13.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i12 (.D(n357[12]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[12])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i12.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i11 (.D(n357[11]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[11])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i11.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i10 (.D(n357[10]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[10])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i10.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i9 (.D(n357[9]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[9])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i9.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i8 (.D(n357[8]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i8.GSR = "ENABLED";
    PFUMX i10167 (.BLUT(n19178), .ALUT(init_data_8__N_1337[8]), .C0(state[2]), 
          .Z(init_data_8__N_1194[8]));
    LUT4 i1_3_lut (.A(cnt_s4_num[1]), .B(cnt_s4_num[2]), .C(cnt_s4_num[3]), 
         .Z(n87)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_3_lut.init = 16'h2828;
    LUT4 i2_2_lut_3_lut_4_lut (.A(n21617), .B(n21581), .C(n21562), .D(n20053), 
         .Z(n8_adj_2632)) /* synthesis lut_function=(A (C (D))+!A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(214[13:17])
    defparam i2_2_lut_3_lut_4_lut.init = 16'he000;
    LUT4 i4_4_lut_adj_287 (.A(n7_adj_2633), .B(n21621), .C(n20305), .D(n21614), 
         .Z(n20033)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i4_4_lut_adj_287.init = 16'ha080;
    LUT4 i18223_4_lut (.A(n21615), .B(n21684), .C(n21683), .D(n21687), 
         .Z(n20305)) /* synthesis lut_function=(A+(B+!((D)+!C))) */ ;
    defparam i18223_4_lut.init = 16'heefe;
    FD1P3IX cnt_s4_num__i7 (.D(n357[7]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i7.GSR = "ENABLED";
    LUT4 i2_2_lut_adj_288 (.A(n14626), .B(n19874), .Z(n9)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut_adj_288.init = 16'h8888;
    PFUMX init_data_8__I_0_i2 (.BLUT(init_data_8__N_1328[1]), .ALUT(init_data_8__N_1337[1]), 
          .C0(state[2]), .Z(init_data_8__N_1194[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 i4_4_lut_adj_289 (.A(n13926), .B(n21577), .C(n14628), .D(n6_adj_2634), 
         .Z(n19874)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i4_4_lut_adj_289.init = 16'h8000;
    FD1P3IX cnt_s4_num__i6 (.D(n357[6]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i6.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i5 (.D(n357[5]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i5.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i4 (.D(n357[4]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i4.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i3 (.D(n357[3]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i3.GSR = "ENABLED";
    FD1P3IX cnt_s4_num__i2 (.D(n357[2]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i2.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_290 (.A(n13940), .B(n21561), .C(n21621), .D(n21623), 
         .Z(n20030)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i2_4_lut_adj_290.init = 16'h8880;
    FD1P3IX cnt_s4_num__i1 (.D(n357[1]), .SP(clk_50MHz_enable_79), .CD(n3943), 
            .CK(clk_50MHz), .Q(cnt_s4_num[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam cnt_s4_num__i1.GSR = "ENABLED";
    PFUMX init_data_8__I_0_i5 (.BLUT(init_data_8__N_1328[4]), .ALUT(init_data_8__N_1337[4]), 
          .C0(state[2]), .Z(init_data_8__N_1194[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 cnt_s4_num_3__bdd_3_lut_19185 (.A(cnt_s4_num[3]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[2]), .Z(n21447)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam cnt_s4_num_3__bdd_3_lut_19185.init = 16'h8080;
    FD1S3IX cnt_s2_num_done_174 (.D(cnt_s2_num_done_N_1369), .CK(clk_50MHz), 
            .CD(n3956), .Q(state_5__N_1277[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(127[10] 130[33])
    defparam cnt_s2_num_done_174.GSR = "ENABLED";
    FD1S3IX cnt_s4_num_done_177 (.D(cnt_s4_num_done_N_1371), .CK(clk_50MHz), 
            .CD(n3956), .Q(state_5__N_1289[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(328[10] 331[33])
    defparam cnt_s4_num_done_177.GSR = "ENABLED";
    LUT4 i2966_2_lut_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n21658), .C(cnt_s2_num[4]), 
         .D(cnt_s2_num[3]), .Z(n159[4])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2966_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i18662_3_lut (.A(state_c[3]), .B(state_c[1]), .C(state_c[0]), 
         .Z(cnt_150ms_22__N_1318)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(89[13:86])
    defparam i18662_3_lut.init = 16'h0101;
    LUT4 i1_4_lut_adj_291 (.A(n19981), .B(n91), .C(cnt_s4_num[1]), .D(n21545), 
         .Z(n4_adj_2635)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(59[13:23])
    defparam i1_4_lut_adj_291.init = 16'heccc;
    LUT4 i1_2_lut_adj_292 (.A(cnt_s4_num[0]), .B(cnt_s4_num[3]), .Z(n19981)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_2_lut_adj_292.init = 16'h2222;
    FD1P3AX lcd_rst_172 (.D(n22433), .SP(lcd_rst_high_flag), .CK(clk_50MHz), 
            .Q(lcd_rst_c)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(107[10] 110[28])
    defparam lcd_rst_172.GSR = "ENABLED";
    FD1S3AX init_data_i8 (.D(init_data_8__N_1194[8]), .CK(clk_50MHz), .Q(init_data[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i8.GSR = "ENABLED";
    LUT4 equal_77_i13_2_lut_rep_213_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21681), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21559)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam equal_77_i13_2_lut_rep_213_3_lut_4_lut.init = 16'hfdff;
    LUT4 i1_2_lut_rep_229_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21681), .C(n21687), 
         .D(n21684), .Z(n21575)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam i1_2_lut_rep_229_3_lut_4_lut.init = 16'hffdf;
    LUT4 cnt_s2_num_6__I_0_i14_1_lut_2_lut_3_lut_4_lut (.A(cnt_s2_num[0]), 
         .B(n21681), .C(n21687), .D(n21684), .Z(cnt_s2_num_done_N_1369)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam cnt_s2_num_6__I_0_i14_1_lut_2_lut_3_lut_4_lut.init = 16'h0020;
    LUT4 i2_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21681), .C(n21623), .D(n14624), 
         .Z(n7_adj_2633)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam i2_3_lut_4_lut.init = 16'hfd00;
    LUT4 equal_61_i13_2_lut_rep_215_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21681), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21561)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam equal_61_i13_2_lut_rep_215_3_lut_4_lut.init = 16'hfffd;
    LUT4 i1_3_lut_rep_190_4_lut (.A(n21690), .B(n21683), .C(n21622), .D(n14578), 
         .Z(n21536)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_3_lut_rep_190_4_lut.init = 16'hfe00;
    LUT4 i1_3_lut_4_lut_adj_293 (.A(cnt_s4_num[0]), .B(n21548), .C(n21629), 
         .D(cnt_s4_num[1]), .Z(n31)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(293[13:17])
    defparam i1_3_lut_4_lut_adj_293.init = 16'h0100;
    LUT4 equal_63_i13_2_lut_rep_214_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21689), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21560)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam equal_63_i13_2_lut_rep_214_3_lut_4_lut.init = 16'hfffd;
    PFUMX init_data_8__I_0_i1 (.BLUT(init_data_8__N_1328[0]), .ALUT(init_data_8__N_1337[0]), 
          .C0(state[2]), .Z(init_data_8__N_1194[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 equal_83_i13_2_lut_rep_211_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21685), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21557)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam equal_83_i13_2_lut_rep_211_3_lut_4_lut.init = 16'hf7ff;
    LUT4 i12560_2_lut_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21682), .C(n21620), 
         .D(cnt_s2_num[4]), .Z(n14358)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam i12560_2_lut_3_lut_4_lut.init = 16'hfdff;
    LUT4 equal_73_i13_2_lut_rep_228_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21682), 
         .C(n21683), .D(n21690), .Z(n21574)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam equal_73_i13_2_lut_rep_228_3_lut_4_lut.init = 16'hfffd;
    PFUMX init_data_8__I_0_i3 (.BLUT(init_data_8__N_1328[2]), .ALUT(init_data_8__N_1337[2]), 
          .C0(state[2]), .Z(init_data_8__N_1194[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 equal_60_i13_2_lut_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n21686), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n13)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam equal_60_i13_2_lut_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_3_lut_4_lut_adj_294 (.A(cnt_s2_num[2]), .B(n21686), .C(n21625), 
         .D(n14578), .Z(n8_adj_2636)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_3_lut_4_lut_adj_294.init = 16'hfe00;
    LUT4 i16424_2_lut (.A(cnt_s4_num[1]), .B(cnt_s4_num[2]), .Z(n18486)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(59[13:23])
    defparam i16424_2_lut.init = 16'h4444;
    LUT4 equal_82_i13_2_lut_rep_217_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21685), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21563)) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(258[13:18])
    defparam equal_82_i13_2_lut_rep_217_3_lut_4_lut.init = 16'hfbff;
    LUT4 i1_2_lut_3_lut_4_lut_adj_295 (.A(n21687), .B(n21690), .C(n20053), 
         .D(n21681), .Z(n4_adj_2637)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_295.init = 16'hf0d0;
    FD1S3IX cnt_150ms_2104__i0 (.D(n97[0]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i0.GSR = "ENABLED";
    PFUMX init_data_8__I_0_i4 (.BLUT(init_data_8__N_1328[3]), .ALUT(init_data_8__N_1337[3]), 
          .C0(state[2]), .Z(init_data_8__N_1194[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 i49_3_lut_4_lut (.A(n21545), .B(cnt_s4_num[0]), .C(cnt_s4_num[3]), 
         .D(n21538), .Z(n33)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A (C (D))) */ ;
    defparam i49_3_lut_4_lut.init = 16'hf808;
    LUT4 i2_3_lut_4_lut_adj_296 (.A(n21545), .B(cnt_s4_num[0]), .C(cnt_s4_num[2]), 
         .D(cnt_s4_num[1]), .Z(n18533)) /* synthesis lut_function=(A (B (C (D)+!C !(D)))) */ ;
    defparam i2_3_lut_4_lut_adj_296.init = 16'h8008;
    PFUMX init_data_8__I_0_i6 (.BLUT(init_data_8__N_1328[5]), .ALUT(init_data_8__N_1337[5]), 
          .C0(state[2]), .Z(init_data_8__N_1194[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 init_data_8__I_0_i8_4_lut (.A(init_data_8__N_1328[7]), .B(n20068), 
         .C(state[2]), .D(n4_adj_2637), .Z(init_data_8__N_1194[7])) /* synthesis lut_function=(!(A (B (C (D)))+!A (B ((D)+!C)+!B !(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(275[10] 311[32])
    defparam init_data_8__I_0_i8_4_lut.init = 16'h3afa;
    LUT4 equal_72_i13_2_lut_rep_231_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n21686), 
         .C(n21683), .D(n21690), .Z(n21577)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam equal_72_i13_2_lut_rep_231_3_lut_4_lut.init = 16'hfffd;
    LUT4 i12037_4_lut (.A(n33), .B(\state[4] ), .C(n21548), .D(n21692), 
         .Z(init_data_8__N_1328[7])) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i12037_4_lut.init = 16'hc8c0;
    LUT4 i5_4_lut_adj_297 (.A(n21571), .B(n7_adj_2630), .C(n21546), .D(n8_adj_2638), 
         .Z(n20068)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i5_4_lut_adj_297.init = 16'h8000;
    LUT4 equal_80_i13_2_lut_rep_216_3_lut_4_lut (.A(cnt_s2_num[2]), .B(n21686), 
         .C(n21625), .D(cnt_s2_num[4]), .Z(n21562)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam equal_80_i13_2_lut_rep_216_3_lut_4_lut.init = 16'hfdff;
    LUT4 init_data_8__I_0_i7_4_lut (.A(init_data_8__N_1328[7]), .B(n13934), 
         .C(state[2]), .D(n20068), .Z(init_data_8__N_1194[6])) /* synthesis lut_function=(!(A (B (C (D)))+!A (B ((D)+!C)+!B !(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(275[10] 311[32])
    defparam init_data_8__I_0_i7_4_lut.init = 16'h3afa;
    PFUMX i89 (.BLUT(n19943), .ALUT(n73), .C0(cnt_s4_num[3]), .Z(n84));
    PFUMX i46 (.BLUT(n3), .ALUT(n9517), .C0(cnt_s4_num[0]), .Z(n41));
    LUT4 equal_86_i13_2_lut_rep_225_3_lut_4_lut (.A(cnt_s2_num[0]), .B(n21689), 
         .C(n21690), .D(n21687), .Z(n21571)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam equal_86_i13_2_lut_rep_225_3_lut_4_lut.init = 16'hfeff;
    FD1S3AX init_data_i7 (.D(init_data_8__N_1194[7]), .CK(clk_50MHz), .Q(init_data[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i7.GSR = "ENABLED";
    FD1S3AX init_data_i6 (.D(init_data_8__N_1194[6]), .CK(clk_50MHz), .Q(init_data[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i6.GSR = "ENABLED";
    FD1S3AX init_data_i5 (.D(init_data_8__N_1194[5]), .CK(clk_50MHz), .Q(init_data[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i5.GSR = "ENABLED";
    FD1S3AX init_data_i4 (.D(init_data_8__N_1194[4]), .CK(clk_50MHz), .Q(init_data[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i4.GSR = "ENABLED";
    FD1S3AX init_data_i3 (.D(init_data_8__N_1194[3]), .CK(clk_50MHz), .Q(init_data[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i3.GSR = "ENABLED";
    FD1S3AX init_data_i2 (.D(init_data_8__N_1194[2]), .CK(clk_50MHz), .Q(init_data[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i2.GSR = "ENABLED";
    FD1S3AX init_data_i1 (.D(init_data_8__N_1194[1]), .CK(clk_50MHz), .Q(init_data[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(136[10] 311[32])
    defparam init_data_i1.GSR = "ENABLED";
    LUT4 i9057_1_lut (.A(state_c[0]), .Z(n10874)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i9057_1_lut.init = 16'h5555;
    LUT4 i1_2_lut_rep_212_3_lut_4_lut (.A(n21693), .B(n21694), .C(n20116), 
         .D(cnt_s4_num[14]), .Z(n21558)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_212_3_lut_4_lut.init = 16'hfffe;
    PFUMX i88 (.BLUT(n18533), .ALUT(n71), .C0(cnt_s4_num[3]), .Z(n83));
    LUT4 i1_2_lut_rep_335 (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .Z(n21681)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_335.init = 16'heeee;
    LUT4 i1_2_lut_rep_282 (.A(cnt_s4_num[1]), .B(cnt_s4_num[0]), .Z(n21628)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(292[13:16])
    defparam i1_2_lut_rep_282.init = 16'hbbbb;
    LUT4 i18654_4_lut (.A(n20121), .B(cnt_150ms[6]), .C(n4_adj_2639), 
         .D(n20111), .Z(lcd_rst_high_flag_N_1367)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i18654_4_lut.init = 16'h0001;
    LUT4 i1_4_lut_adj_298 (.A(n9719), .B(cnt_150ms[3]), .C(n20319), .D(cnt_150ms[0]), 
         .Z(n4_adj_2639)) /* synthesis lut_function=(A+!(B (C (D)))) */ ;
    defparam i1_4_lut_adj_298.init = 16'hbfff;
    LUT4 i18134_3_lut_4_lut (.A(cnt_s4_num[1]), .B(cnt_s4_num[0]), .C(cnt_s4_num[3]), 
         .D(cnt_s4_num[2]), .Z(n20213)) /* synthesis lut_function=(A+(((D)+!C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(292[13:16])
    defparam i18134_3_lut_4_lut.init = 16'hffbf;
    LUT4 i18236_3_lut (.A(cnt_150ms[2]), .B(cnt_150ms[1]), .C(cnt_150ms[4]), 
         .Z(n20319)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i18236_3_lut.init = 16'h8080;
    LUT4 i3_4_lut_adj_299 (.A(cnt_150ms[13]), .B(cnt_150ms[12]), .C(cnt_150ms[21]), 
         .D(n20329), .Z(n9719)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i3_4_lut_adj_299.init = 16'hfeff;
    LUT4 i18246_3_lut (.A(cnt_150ms[8]), .B(cnt_150ms[19]), .C(cnt_150ms[11]), 
         .Z(n20329)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i18246_3_lut.init = 16'h8080;
    LUT4 i1_3_lut_adj_300 (.A(n9704), .B(cnt_150ms[5]), .C(cnt_150ms[22]), 
         .Z(n20121)) /* synthesis lut_function=(A+!(B (C))) */ ;
    defparam i1_3_lut_adj_300.init = 16'hbfbf;
    LUT4 i4_4_lut_adj_301 (.A(cnt_150ms[18]), .B(cnt_150ms[17]), .C(cnt_150ms[7]), 
         .D(n6_adj_2640), .Z(n20111)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(70[26:50])
    defparam i4_4_lut_adj_301.init = 16'hfffd;
    LUT4 i1_2_lut_adj_302 (.A(cnt_150ms[20]), .B(cnt_150ms[9]), .Z(n6_adj_2640)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(70[26:50])
    defparam i1_2_lut_adj_302.init = 16'hbbbb;
    LUT4 i3_4_lut_adj_303 (.A(cnt_150ms[15]), .B(cnt_150ms[14]), .C(cnt_150ms[16]), 
         .D(cnt_150ms[10]), .Z(n9704)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(70[26:50])
    defparam i3_4_lut_adj_303.init = 16'hfffb;
    LUT4 i1_2_lut_rep_283 (.A(cnt_s4_num[3]), .B(cnt_s4_num[2]), .Z(n21629)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_rep_283.init = 16'h8888;
    LUT4 i1_3_lut_3_lut (.A(cnt_s4_num[3]), .B(cnt_s4_num[2]), .C(cnt_s4_num[0]), 
         .Z(n87_adj_2641)) /* synthesis lut_function=(A (B+!(C))+!A !(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_3_lut_3_lut.init = 16'h8b8b;
    FD1S3IX lcd_rst_high_flag_171 (.D(lcd_rst_high_flag_N_1367), .CK(clk_50MHz), 
            .CD(n10874), .Q(lcd_rst_high_flag)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[10] 101[35])
    defparam lcd_rst_high_flag_171.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_269_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(cnt_s2_num[0]), 
         .Z(n21615)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i1_2_lut_rep_269_3_lut.init = 16'hefef;
    FD1S3AX state_FSM_i1 (.D(n5291), .CK(clk_50MHz), .Q(\state[4] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n5293), .CK(clk_50MHz), .Q(state_c[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AX state_FSM_i3 (.D(n5295), .CK(clk_50MHz), .Q(state[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    FD1S3AX state_FSM_i4 (.D(n5369), .CK(clk_50MHz), .Q(state_c[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i4.GSR = "ENABLED";
    FD1S3AY state_FSM_i5 (.D(n5370), .CK(clk_50MHz), .Q(state_c[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam state_FSM_i5.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i1 (.D(n159[1]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i1.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i2 (.D(n159[2]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i2.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i3 (.D(n159[3]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i3.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i4 (.D(n159[4]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i4.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i5 (.D(n159[5]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i5.GSR = "ENABLED";
    FD1P3IX cnt_s2_num__i6 (.D(n159[6]), .SP(clk_50MHz_enable_135), .CD(n21650), 
            .CK(clk_50MHz), .Q(cnt_s2_num[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=11, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(116[10] 121[34])
    defparam cnt_s2_num__i6.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_4_lut_adj_304 (.A(n21545), .B(cnt_s4_num[1]), .C(cnt_s4_num[2]), 
         .D(n21538), .Z(n71)) /* synthesis lut_function=(A (B (C (D))+!B (C))+!A (C (D))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_304.init = 16'hf020;
    LUT4 i1_2_lut_3_lut_4_lut_adj_305 (.A(n21545), .B(cnt_s4_num[1]), .C(n21629), 
         .D(n21538), .Z(n3)) /* synthesis lut_function=(A (B (C (D))+!B (C))+!A (C (D))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_305.init = 16'hf020;
    CCU2D cnt_150ms_2104_add_4_23 (.A0(cnt_150ms[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18403), .S0(n97[21]), .S1(n97[22]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_23.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_23.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_23.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_23.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_21 (.A0(cnt_150ms[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18402), .COUT(n18403), .S0(n97[19]), .S1(n97[20]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_21.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_21.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_21.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_21.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_19 (.A0(cnt_150ms[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18401), .COUT(n18402), .S0(n97[17]), .S1(n97[18]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_19.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_19.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_19.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_19.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_17 (.A0(cnt_150ms[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18400), .COUT(n18401), .S0(n97[15]), .S1(n97[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_17.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_17.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_17.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_17.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_15 (.A0(cnt_150ms[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18399), .COUT(n18400), .S0(n97[13]), .S1(n97[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_15.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_15.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_15.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_15.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_13 (.A0(cnt_150ms[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18398), .COUT(n18399), .S0(n97[11]), .S1(n97[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_13.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_13.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_11 (.A0(cnt_150ms[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18397), .COUT(n18398), .S0(n97[9]), .S1(n97[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_11.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_11.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_9 (.A0(cnt_150ms[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18396), .COUT(n18397), .S0(n97[7]), .S1(n97[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_9.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_9.INJECT1_1 = "NO";
    LUT4 i3_4_lut_adj_306 (.A(n41), .B(n75), .C(n21548), .D(n20213), 
         .Z(n8_adj_2642)) /* synthesis lut_function=(A+(B+!(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3_4_lut_adj_306.init = 16'heeef;
    CCU2D cnt_150ms_2104_add_4_7 (.A0(cnt_150ms[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18395), .COUT(n18396), .S0(n97[5]), .S1(n97[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_7.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_7.INJECT1_1 = "NO";
    LUT4 i3514_4_lut (.A(\state[4] ), .B(state_5__N_1283[3]), .C(state_5__N_1289[5]), 
         .D(state_c[3]), .Z(n5291)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3514_4_lut.init = 16'h3b0a;
    CCU2D cnt_150ms_2104_add_4_5 (.A0(cnt_150ms[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18394), .COUT(n18395), .S0(n97[3]), .S1(n97[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_5.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_5.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_307 (.A(n20110), .B(cnt_150ms[16]), .C(n21569), 
         .D(n20199), .Z(state_5__N_1283[3])) /* synthesis lut_function=(A+((C+!(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i1_4_lut_adj_307.init = 16'hfbff;
    CCU2D cnt_150ms_2104_add_4_3 (.A0(cnt_150ms[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18393), .COUT(n18394), .S0(n97[1]), .S1(n97[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_150ms_2104_add_4_3.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_3.INJECT1_1 = "NO";
    CCU2D cnt_150ms_2104_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_150ms[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18393), .S1(n97[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104_add_4_1.INIT0 = 16'hF000;
    defparam cnt_150ms_2104_add_4_1.INIT1 = 16'h0555;
    defparam cnt_150ms_2104_add_4_1.INJECT1_0 = "NO";
    defparam cnt_150ms_2104_add_4_1.INJECT1_1 = "NO";
    LUT4 i3_4_lut_adj_308 (.A(cnt_150ms[14]), .B(n19861), .C(cnt_150ms[6]), 
         .D(n20108), .Z(n20110)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(76[26:50])
    defparam i3_4_lut_adj_308.init = 16'hfffe;
    LUT4 i18120_2_lut (.A(cnt_150ms[10]), .B(cnt_150ms[15]), .Z(n20199)) /* synthesis lut_function=(A (B)) */ ;
    defparam i18120_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_309 (.A(cnt_150ms[17]), .B(cnt_150ms[9]), .C(n20228), 
         .D(cnt_150ms[18]), .Z(n19861)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i2_4_lut_adj_309.init = 16'hffdf;
    LUT4 i18148_2_lut (.A(cnt_150ms[20]), .B(cnt_150ms[7]), .Z(n20228)) /* synthesis lut_function=(A (B)) */ ;
    defparam i18148_2_lut.init = 16'h8888;
    LUT4 i2373_1_lut_rep_304 (.A(state[2]), .Z(n21650)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i2373_1_lut_rep_304.init = 16'h5555;
    LUT4 i3447_2_lut_3_lut_3_lut (.A(state[2]), .B(cnt_s2_num[0]), .C(wr_done), 
         .Z(n24[0])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A (B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3447_2_lut_3_lut_3_lut.init = 16'h3939;
    LUT4 i2374_2_lut_rep_251_2_lut (.A(state[2]), .B(wr_done), .Z(clk_50MHz_enable_135)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i2374_2_lut_rep_251_2_lut.init = 16'hdddd;
    LUT4 i1_2_lut_adj_310 (.A(cnt_150ms[5]), .B(cnt_150ms[22]), .Z(n20108)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(70[26:50])
    defparam i1_2_lut_adj_310.init = 16'hbbbb;
    LUT4 i4_4_lut_adj_311 (.A(cnt_150ms[3]), .B(cnt_150ms[2]), .C(cnt_150ms[0]), 
         .D(n6_adj_2643), .Z(n9707)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(72[26:50])
    defparam i4_4_lut_adj_311.init = 16'hfffe;
    LUT4 i1_2_lut_adj_312 (.A(cnt_150ms[1]), .B(cnt_150ms[4]), .Z(n6_adj_2643)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(72[26:50])
    defparam i1_2_lut_adj_312.init = 16'heeee;
    LUT4 i3516_4_lut (.A(state_c[3]), .B(state_5__N_1277[3]), .C(state_5__N_1283[3]), 
         .D(state[2]), .Z(n5293)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3516_4_lut.init = 16'heca0;
    LUT4 i3518_4_lut (.A(state[2]), .B(state_5__N_1271[1]), .C(state_5__N_1277[3]), 
         .D(state_c[1]), .Z(n5295)) /* synthesis lut_function=(!(A (B (C)+!B !((D)+!C))+!A (B+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3518_4_lut.init = 16'h3b0a;
    LUT4 i1_4_lut_adj_313 (.A(cnt_150ms[8]), .B(n20123), .C(n8_adj_2644), 
         .D(cnt_150ms[19]), .Z(state_5__N_1271[1])) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i1_4_lut_adj_313.init = 16'hfffe;
    LUT4 i2_4_lut_adj_314 (.A(n20121), .B(n9707), .C(cnt_150ms[13]), .D(n20256), 
         .Z(n20123)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i2_4_lut_adj_314.init = 16'hefff;
    LUT4 i12918_4_lut (.A(n20030), .B(n7_adj_2626), .C(n20033), .D(n8_adj_2632), 
         .Z(init_data_8__N_1337[5])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12918_4_lut.init = 16'h7fff;
    LUT4 i3_3_lut (.A(n19861), .B(cnt_150ms[11]), .C(cnt_150ms[6]), .Z(n8_adj_2644)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(98[39:70])
    defparam i3_3_lut.init = 16'hefef;
    LUT4 i18176_2_lut (.A(cnt_150ms[21]), .B(cnt_150ms[12]), .Z(n20256)) /* synthesis lut_function=(A (B)) */ ;
    defparam i18176_2_lut.init = 16'h8888;
    LUT4 i3590_4_lut (.A(state_c[1]), .B(state_5__N_1265[0]), .C(state_5__N_1271[1]), 
         .D(state_c[0]), .Z(n5369)) /* synthesis lut_function=(A (B (C)+!B (C+(D)))+!A !(B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3590_4_lut.init = 16'hb3a0;
    LUT4 i1_3_lut_4_lut_adj_315 (.A(n9523), .B(n21548), .C(n9575), .D(n21629), 
         .Z(n91)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D)))) */ ;
    defparam i1_3_lut_4_lut_adj_315.init = 16'heee0;
    LUT4 i1_4_lut_adj_316 (.A(n20111), .B(n20096), .C(cnt_150ms[6]), .D(n20108), 
         .Z(state_5__N_1265[0])) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(70[26:50])
    defparam i1_4_lut_adj_316.init = 16'hffef;
    LUT4 i3591_2_lut (.A(state_c[0]), .B(state_5__N_1265[0]), .Z(n5370)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i3591_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_317 (.A(\state[4] ), .B(n91), .C(n21545), .D(n21414), 
         .Z(init_data_8__N_1328[5])) /* synthesis lut_function=(A (B+(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i1_4_lut_adj_317.init = 16'ha888;
    LUT4 i12894_4_lut (.A(n21560), .B(n21575), .C(n21574), .D(n20056), 
         .Z(init_data_8__N_1337[3])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12894_4_lut.init = 16'h7fff;
    LUT4 i12044_4_lut (.A(n21535), .B(\state[4] ), .C(n4_adj_2635), .D(n87_adj_2641), 
         .Z(init_data_8__N_1328[3])) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i12044_4_lut.init = 16'hc8c0;
    LUT4 i2945_2_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .Z(n159[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2945_2_lut.init = 16'h6666;
    LUT4 i12926_4_lut (.A(n13938), .B(n20030), .C(n19874), .D(n6), .Z(init_data_8__N_1337[2])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12926_4_lut.init = 16'h7fff;
    LUT4 i12928_4_lut (.A(n20033), .B(n9), .C(n8_adj_2636), .D(n10_adj_2628), 
         .Z(init_data_8__N_1337[0])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12928_4_lut.init = 16'h7fff;
    LUT4 i12046_4_lut (.A(n21548), .B(\state[4] ), .C(n21727), .D(n21447), 
         .Z(init_data_8__N_1328[0])) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i12046_4_lut.init = 16'hccc8;
    LUT4 i2947_2_lut_rep_312 (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .Z(n21658)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2947_2_lut_rep_312.init = 16'h8888;
    LUT4 i2952_2_lut_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .C(cnt_s2_num[2]), 
         .Z(n159[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2952_2_lut_3_lut.init = 16'h7878;
    LUT4 i2954_2_lut_rep_257_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), 
         .C(cnt_s2_num[2]), .Z(n21603)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2954_2_lut_rep_257_3_lut.init = 16'h8080;
    LUT4 i2959_2_lut_3_lut_4_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[2]), .Z(n159[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2959_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i2961_2_lut_rep_222_3_lut_4_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[2]), .Z(n21568)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2961_2_lut_rep_222_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_rep_236_3_lut_4_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), 
         .C(n21690), .D(n21687), .Z(n21582)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i1_2_lut_rep_236_3_lut_4_lut.init = 16'hfeff;
    CCU2D add_153_19 (.A0(cnt_s4_num[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18269), .S0(n357[17]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_19.INIT0 = 16'h5aaa;
    defparam add_153_19.INIT1 = 16'h0000;
    defparam add_153_19.INJECT1_0 = "NO";
    defparam add_153_19.INJECT1_1 = "NO";
    LUT4 i12922_4_lut (.A(n21557), .B(n19966), .C(n13), .D(n20071), 
         .Z(init_data_8__N_1337[4])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12922_4_lut.init = 16'h7fff;
    CCU2D add_153_17 (.A0(cnt_s4_num[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18268), .COUT(n18269), .S0(n357[15]), 
          .S1(n357[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_17.INIT0 = 16'h5aaa;
    defparam add_153_17.INIT1 = 16'h5aaa;
    defparam add_153_17.INJECT1_0 = "NO";
    defparam add_153_17.INJECT1_1 = "NO";
    CCU2D add_153_15 (.A0(cnt_s4_num[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18267), .COUT(n18268), .S0(n357[13]), 
          .S1(n357[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_15.INIT0 = 16'h5aaa;
    defparam add_153_15.INIT1 = 16'h5aaa;
    defparam add_153_15.INJECT1_0 = "NO";
    defparam add_153_15.INJECT1_1 = "NO";
    LUT4 i12043_4_lut (.A(n52), .B(\state[4] ), .C(n56), .D(n21535), 
         .Z(init_data_8__N_1328[4])) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(311[9:32])
    defparam i12043_4_lut.init = 16'hc8c0;
    CCU2D add_153_13 (.A0(cnt_s4_num[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18266), .COUT(n18267), .S0(n357[11]), 
          .S1(n357[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_13.INIT0 = 16'h5aaa;
    defparam add_153_13.INIT1 = 16'h5aaa;
    defparam add_153_13.INJECT1_0 = "NO";
    defparam add_153_13.INJECT1_1 = "NO";
    LUT4 i12908_4_lut (.A(n21536), .B(n7), .C(n20071), .D(n8_adj_2645), 
         .Z(init_data_8__N_1337[1])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12908_4_lut.init = 16'h7fff;
    LUT4 i1_3_lut_adj_318 (.A(\state[4] ), .B(n75), .C(n84), .Z(init_data_8__N_1328[1])) /* synthesis lut_function=(A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1_3_lut_adj_318.init = 16'ha8a8;
    LUT4 i1_2_lut_rep_336 (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .Z(n21682)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam i1_2_lut_rep_336.init = 16'hdddd;
    LUT4 i1_3_lut_4_lut_adj_319 (.A(n21563), .B(n13936), .C(n21616), .D(n21617), 
         .Z(n6_adj_2634)) /* synthesis lut_function=(A (B (C+(D)))) */ ;
    defparam i1_3_lut_4_lut_adj_319.init = 16'h8880;
    CCU2D add_153_11 (.A0(cnt_s4_num[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_s4_num[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18265), .COUT(n18266), .S0(n357[9]), .S1(n357[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_11.INIT0 = 16'h5aaa;
    defparam add_153_11.INIT1 = 16'h5aaa;
    defparam add_153_11.INJECT1_0 = "NO";
    defparam add_153_11.INJECT1_1 = "NO";
    LUT4 i1_4_lut_4_lut (.A(cnt_s4_num[0]), .B(cnt_s4_num[2]), .C(n21538), 
         .D(n21535), .Z(n73)) /* synthesis lut_function=(!(A+!(B (C+(D))+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_4_lut_4_lut.init = 16'h5540;
    LUT4 i2_4_lut_4_lut (.A(cnt_s4_num[17]), .B(n18486), .C(cnt_s4_num[0]), 
         .D(n21558), .Z(n19943)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i2_4_lut_4_lut.init = 16'h0010;
    CCU2D add_153_9 (.A0(cnt_s4_num[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18264), .COUT(n18265), .S0(n357[7]), .S1(n357[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_9.INIT0 = 16'h5aaa;
    defparam add_153_9.INIT1 = 16'h5aaa;
    defparam add_153_9.INJECT1_0 = "NO";
    defparam add_153_9.INJECT1_1 = "NO";
    LUT4 i12930_4_lut (.A(n19966), .B(n7_adj_2629), .C(n20056), .D(n8), 
         .Z(init_data_8__N_1337[8])) /* synthesis lut_function=(!(A (B (C (D))))) */ ;
    defparam i12930_4_lut.init = 16'h7fff;
    LUT4 i2_2_lut_rep_273_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(cnt_s2_num[0]), 
         .Z(n21619)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(251[13:18])
    defparam i2_2_lut_rep_273_3_lut.init = 16'hdfdf;
    LUT4 i1_4_lut_adj_320 (.A(\state[4] ), .B(n28), .C(n8_adj_2642), .D(n31), 
         .Z(n19178)) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1_4_lut_adj_320.init = 16'haaa8;
    LUT4 i2376_1_lut (.A(\state[4] ), .Z(n3943)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i2376_1_lut.init = 16'h5555;
    CCU2D add_153_7 (.A0(cnt_s4_num[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18263), .COUT(n18264), .S0(n357[5]), .S1(n357[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_7.INIT0 = 16'h5aaa;
    defparam add_153_7.INIT1 = 16'h5aaa;
    defparam add_153_7.INJECT1_0 = "NO";
    defparam add_153_7.INJECT1_1 = "NO";
    LUT4 i2_2_lut_4_lut (.A(n21559), .B(n21618), .C(n21616), .D(n19996), 
         .Z(n8_adj_2645)) /* synthesis lut_function=(A (B (C (D))+!B (D))) */ ;
    defparam i2_2_lut_4_lut.init = 16'ha200;
    LUT4 cnt_s4_num_2__bdd_4_lut (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), 
         .C(cnt_s4_num[0]), .D(cnt_s4_num[3]), .Z(n21414)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(D))+!A (B ((D)+!C)+!B (C (D))))) */ ;
    defparam cnt_s4_num_2__bdd_4_lut.init = 16'h23d1;
    CCU2D add_153_5 (.A0(cnt_s4_num[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18262), .COUT(n18263), .S0(n357[3]), .S1(n357[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_5.INIT0 = 16'h5aaa;
    defparam add_153_5.INIT1 = 16'h5aaa;
    defparam add_153_5.INJECT1_0 = "NO";
    defparam add_153_5.INJECT1_1 = "NO";
    CCU2D add_153_3 (.A0(cnt_s4_num[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18261), .COUT(n18262), .S0(n357[1]), .S1(n357[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_3.INIT0 = 16'h5aaa;
    defparam add_153_3.INIT1 = 16'h5aaa;
    defparam add_153_3.INJECT1_0 = "NO";
    defparam add_153_3.INJECT1_1 = "NO";
    CCU2D add_153_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_s4_num[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18261), .S1(n357[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(320[23:40])
    defparam add_153_1.INIT0 = 16'hF000;
    defparam add_153_1.INIT1 = 16'h5555;
    defparam add_153_1.INJECT1_0 = "NO";
    defparam add_153_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_337 (.A(cnt_s2_num[4]), .B(cnt_s2_num[3]), .Z(n21683)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_2_lut_rep_337.init = 16'hbbbb;
    LUT4 i12045_3_lut_4_lut (.A(n21549), .B(n20270), .C(n83), .D(\state[4] ), 
         .Z(init_data_8__N_1328[2])) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(286[13:16])
    defparam i12045_3_lut_4_lut.init = 16'hfe00;
    LUT4 equal_113_i11_2_lut_rep_338 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .Z(n21684)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(264[13:18])
    defparam equal_113_i11_2_lut_rep_338.init = 16'hdddd;
    LUT4 i1_2_lut_rep_232_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n21578)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(264[13:18])
    defparam i1_2_lut_rep_232_3_lut_4_lut.init = 16'hffdf;
    LUT4 i1_2_lut_3_lut_4_lut_adj_321 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n12_adj_2627)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(264[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_321.init = 16'hfffd;
    LUT4 i1_2_lut_rep_274_3_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), .C(cnt_s2_num[3]), 
         .Z(n21620)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(264[13:18])
    defparam i1_2_lut_rep_274_3_lut.init = 16'hfdfd;
    LUT4 i1_2_lut_3_lut_4_lut_adj_322 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[4]), .Z(n12_adj_2625)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(264[13:18])
    defparam i1_2_lut_3_lut_4_lut_adj_322.init = 16'hffdf;
    LUT4 i1_2_lut_rep_192_3_lut_4_lut (.A(n21694), .B(n21584), .C(n9523), 
         .D(n20270), .Z(n21538)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_2_lut_rep_192_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_185_3_lut_4_lut (.A(n21694), .B(n21584), .C(cnt_s4_num[0]), 
         .D(n20270), .Z(n21531)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_2_lut_rep_185_3_lut_4_lut.init = 16'hfffe;
    LUT4 i12293_2_lut_rep_339 (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .Z(n21685)) /* synthesis lut_function=(A (B)) */ ;
    defparam i12293_2_lut_rep_339.init = 16'h8888;
    LUT4 i12659_2_lut_rep_272_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), 
         .C(cnt_s2_num[0]), .Z(n21618)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i12659_2_lut_rep_272_3_lut.init = 16'h8080;
    LUT4 i1_2_lut_rep_276_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(cnt_s2_num[0]), 
         .Z(n21622)) /* synthesis lut_function=(((C)+!B)+!A) */ ;
    defparam i1_2_lut_rep_276_3_lut.init = 16'hf7f7;
    LUT4 i1_2_lut_rep_340 (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .Z(n21686)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_2_lut_rep_340.init = 16'heeee;
    LUT4 i1_2_lut_rep_275_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .C(cnt_s2_num[2]), 
         .Z(n21621)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_2_lut_rep_275_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut_rep_278_3_lut (.A(cnt_s2_num[1]), .B(cnt_s2_num[0]), .C(cnt_s2_num[2]), 
         .Z(n21624)) /* synthesis lut_function=(A+(B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(256[13:18])
    defparam i1_2_lut_rep_278_3_lut.init = 16'hefef;
    LUT4 i12107_2_lut_rep_341 (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), .Z(n21687)) /* synthesis lut_function=(A (B)) */ ;
    defparam i12107_2_lut_rep_341.init = 16'h8888;
    LUT4 i1_4_lut_adj_323 (.A(cnt_s4_num[2]), .B(n20347), .C(cnt_s4_num[3]), 
         .D(n21531), .Z(n28)) /* synthesis lut_function=(!((B (C+(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i1_4_lut_adj_323.init = 16'h222a;
    LUT4 i1_2_lut_rep_268_3_lut_4_lut (.A(cnt_s2_num[3]), .B(cnt_s2_num[4]), 
         .C(cnt_s2_num[6]), .D(cnt_s2_num[5]), .Z(n21614)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i1_2_lut_rep_268_3_lut_4_lut.init = 16'hf7ff;
    LUT4 i18264_4_lut (.A(n20270), .B(n21549), .C(cnt_s4_num[3]), .D(n21628), 
         .Z(n20347)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i18264_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_343 (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .Z(n21689)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam i1_2_lut_rep_343.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_271_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(cnt_s2_num[0]), 
         .Z(n21617)) /* synthesis lut_function=(A+!(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam i1_2_lut_rep_271_3_lut.init = 16'hbfbf;
    LUT4 i1_2_lut_rep_280_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), .C(cnt_s2_num[0]), 
         .Z(n21626)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam i1_2_lut_rep_280_3_lut.init = 16'hfbfb;
    LUT4 i18116_3_lut_4_lut_3_lut (.A(cnt_s2_num[2]), .B(cnt_s2_num[1]), 
         .C(cnt_s2_num[0]), .Z(n14414)) /* synthesis lut_function=(A (B+!(C))+!A !(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(254[13:18])
    defparam i18116_3_lut_4_lut_3_lut.init = 16'h9f9f;
    FD1S3IX cnt_150ms_2104__i1 (.D(n97[1]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i1.GSR = "ENABLED";
    LUT4 equal_91_i11_2_lut_rep_344 (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .Z(n21690)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam equal_91_i11_2_lut_rep_344.init = 16'heeee;
    LUT4 i1_2_lut_rep_235_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n21581)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam i1_2_lut_rep_235_3_lut_4_lut.init = 16'hfffe;
    LUT4 equal_91_i12_2_lut_rep_277_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n21623)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam equal_91_i12_2_lut_rep_277_3_lut_4_lut.init = 16'hefff;
    LUT4 i1_2_lut_rep_234_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[4]), .D(cnt_s2_num[3]), .Z(n21580)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam i1_2_lut_rep_234_3_lut_4_lut.init = 16'hffef;
    LUT4 i1_2_lut_rep_270_3_lut_4_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), 
         .C(cnt_s2_num[3]), .D(cnt_s2_num[4]), .Z(n21616)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam i1_2_lut_rep_270_3_lut_4_lut.init = 16'hffef;
    LUT4 i1_2_lut_rep_279_3_lut (.A(cnt_s2_num[5]), .B(cnt_s2_num[6]), .C(cnt_s2_num[3]), 
         .Z(n21625)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(242[13:18])
    defparam i1_2_lut_rep_279_3_lut.init = 16'hfefe;
    LUT4 i2980_3_lut_4_lut (.A(cnt_s2_num[4]), .B(n21568), .C(cnt_s2_num[5]), 
         .D(cnt_s2_num[6]), .Z(n159[6])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(119[23:40])
    defparam i2980_3_lut_4_lut.init = 16'h7f80;
    FD1S3IX cnt_150ms_2104__i2 (.D(n97[2]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i2.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i3 (.D(n97[3]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i3.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i4 (.D(n97[4]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i4.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i5 (.D(n97[5]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i5.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i6 (.D(n97[6]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i6.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i7 (.D(n97[7]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i7.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i8 (.D(n97[8]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i8.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i9 (.D(n97[9]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[9])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i9.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i10 (.D(n97[10]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[10])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i10.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i11 (.D(n97[11]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[11])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i11.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i12 (.D(n97[12]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[12])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i12.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i13 (.D(n97[13]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[13])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i13.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i14 (.D(n97[14]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[14])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i14.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i15 (.D(n97[15]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[15])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i15.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i16 (.D(n97[16]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[16])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i16.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i17 (.D(n97[17]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[17])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i17.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i18 (.D(n97[18]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[18])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i18.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i19 (.D(n97[19]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[19])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i19.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i20 (.D(n97[20]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[20])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i20.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i21 (.D(n97[21]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[21])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i21.GSR = "ENABLED";
    FD1S3IX cnt_150ms_2104__i22 (.D(n97[22]), .CK(clk_50MHz), .CD(cnt_150ms_22__N_1318), 
            .Q(cnt_150ms[22])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(90[22:38])
    defparam cnt_150ms_2104__i22.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_346 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .Z(n21692)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_rep_346.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_adj_324 (.A(cnt_s4_num[2]), .B(cnt_s4_num[1]), .C(cnt_s4_num[3]), 
         .Z(n9523)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(276[9] 309[16])
    defparam i1_2_lut_3_lut_adj_324.init = 16'h8080;
    LUT4 i1_2_lut_rep_347 (.A(cnt_s4_num[5]), .B(cnt_s4_num[9]), .Z(n21693)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_347.init = 16'heeee;
    LUT4 i1_2_lut_rep_238_3_lut (.A(cnt_s4_num[5]), .B(cnt_s4_num[9]), .C(n20116), 
         .Z(n21584)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_238_3_lut.init = 16'hfefe;
    LUT4 i18113_2_lut_rep_203_3_lut_4_lut (.A(cnt_s4_num[5]), .B(cnt_s4_num[9]), 
         .C(n21694), .D(n20116), .Z(n21549)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i18113_2_lut_rep_203_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_2_lut_rep_348 (.A(cnt_s4_num[12]), .B(cnt_s4_num[11]), .Z(n21694)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_348.init = 16'heeee;
    LUT4 i1_2_lut_rep_281_3_lut_4_lut (.A(cnt_s4_num[12]), .B(cnt_s4_num[11]), 
         .C(cnt_s4_num[9]), .D(cnt_s4_num[5]), .Z(n21627)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_rep_281_3_lut_4_lut.init = 16'hfffe;
    LUT4 i2_3_lut_4_lut_adj_325 (.A(n21618), .B(n21580), .C(n12_adj_2625), 
         .D(n21615), .Z(n8_adj_2638)) /* synthesis lut_function=(A (B (C+(D)))+!A (C+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(234[13:18])
    defparam i2_3_lut_4_lut_adj_325.init = 16'hddd0;
    LUT4 i386_2_lut (.A(state_5__N_1289[5]), .B(\state[4] ), .Z(clk_50MHz_enable_48)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(68[9] 83[16])
    defparam i386_2_lut.init = 16'h8888;
    LUT4 i18656_2_lut_rep_189_3_lut_4_lut (.A(n21627), .B(n21583), .C(cnt_s4_num[1]), 
         .D(cnt_s4_num[17]), .Z(n21535)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i18656_2_lut_rep_189_3_lut_4_lut.init = 16'h0001;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(n21615), .B(n21581), .C(n20053), 
         .D(n21617), .Z(n20071)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(212[13:17])
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'he0c0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_326 (.A(n21627), .B(n21583), .C(n87), 
         .D(cnt_s4_num[17]), .Z(n9517)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_init.v(317[10] 322[34])
    defparam i1_2_lut_3_lut_4_lut_adj_326.init = 16'h0010;
    PFUMX i19029 (.BLUT(n21728), .ALUT(n21729), .C0(n21623), .Z(n14626));
    PFUMX i19027 (.BLUT(n21725), .ALUT(n21726), .C0(cnt_s4_num[3]), .Z(n21727));
    
endmodule
//
// Verilog Description of module draw_line
//

module draw_line (clk_50MHz, handline, draw_line_data, en_write_draw_line, 
            GND_net, n3255, \state[2] , \state_2__N_1179[2] , \draw_line_counter[3] , 
            n19916, \state[2]_adj_11 , clk_50MHz_enable_100, \state[3] , 
            \state[2]_adj_12 , n3961, the1_wr_done, clk_50MHz_enable_61, 
            \state[3]_adj_13 , wr_done, rst_c) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    input [8:0]handline;
    output [8:0]draw_line_data;
    output en_write_draw_line;
    input GND_net;
    output n3255;
    output \state[2] ;
    output \state_2__N_1179[2] ;
    input \draw_line_counter[3] ;
    input n19916;
    input \state[2]_adj_11 ;
    input clk_50MHz_enable_100;
    output \state[3] ;
    output \state[2]_adj_12 ;
    output n3961;
    output the1_wr_done;
    input clk_50MHz_enable_61;
    output \state[3]_adj_13 ;
    input wr_done;
    input rst_c;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [8:0]past_y;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(33[13:19])
    
    wire clk_50MHz_enable_110, clk_50MHz_enable_129;
    wire [8:0]draw_line_data_8__N_2001;
    
    wire en_write_draw_line_N_2054;
    wire [2:0]state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(35[11:16])
    
    wire clk_50MHz_enable_42;
    wire [2:0]state_2__N_2021;
    
    wire signal_r, draw_finish_flag, n9437, n17923;
    wire [3:0]state_adj_2622;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(43[17:22])
    
    wire n21641, en_write_draw_line_N_2055;
    wire [8:0]clear_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(36[12:22])
    wire [8:0]draw_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(40[12:21])
    
    wire n21649, en_clear, draw_line_flag_prev, n21595, n21642, draw_line_flag_prev_adj_2617, 
        n21594, n17922, n2633, n14672, signal_r_adj_2618, clear_finish_flag, 
        n20310;
    
    FD1P3AX past_y_i0_i3 (.D(handline[3]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i3.GSR = "DISABLED";
    FD1P3AX past_y_i0_i2 (.D(handline[2]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i2.GSR = "DISABLED";
    FD1P3AX past_y_i0_i1 (.D(handline[1]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i1.GSR = "DISABLED";
    FD1P3AX past_y_i0_i0 (.D(handline[0]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i0.GSR = "DISABLED";
    FD1P3AX data_i0 (.D(draw_line_data_8__N_2001[0]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[0])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i0.GSR = "ENABLED";
    FD1S3AX en_38 (.D(en_write_draw_line_N_2054), .CK(clk_50MHz), .Q(en_write_draw_line)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam en_38.GSR = "ENABLED";
    FD1P3AX state_i0 (.D(state_2__N_2021[0]), .SP(clk_50MHz_enable_42), 
            .CK(clk_50MHz), .Q(state[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam state_i0.GSR = "ENABLED";
    FD1P3AX state_i1 (.D(state_2__N_2021[1]), .SP(clk_50MHz_enable_42), 
            .CK(clk_50MHz), .Q(state[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam state_i1.GSR = "ENABLED";
    FD1S3AY state_i2 (.D(state_2__N_2021[2]), .CK(clk_50MHz), .Q(state[2])) /* synthesis lse_init_val=1, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam state_i2.GSR = "ENABLED";
    LUT4 i2_3_lut (.A(state[0]), .B(signal_r), .C(draw_finish_flag), .Z(n9437)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam i2_3_lut.init = 16'h1010;
    CCU2D not_equal_8_9 (.A0(past_y[1]), .B0(handline[1]), .C0(past_y[0]), 
          .D0(handline[0]), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n17923), .S1(n3255));
    defparam not_equal_8_9.INIT0 = 16'h9009;
    defparam not_equal_8_9.INIT1 = 16'hFFFF;
    defparam not_equal_8_9.INJECT1_0 = "YES";
    defparam not_equal_8_9.INJECT1_1 = "NO";
    FD1P3AX past_y_i0_i8 (.D(handline[8]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i8.GSR = "DISABLED";
    FD1P3AX past_y_i0_i7 (.D(handline[7]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i7.GSR = "DISABLED";
    FD1P3AX past_y_i0_i6 (.D(handline[6]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i6.GSR = "DISABLED";
    FD1P3AX past_y_i0_i5 (.D(handline[5]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i5.GSR = "DISABLED";
    FD1P3AX past_y_i0_i4 (.D(handline[4]), .SP(clk_50MHz_enable_110), .CK(clk_50MHz), 
            .Q(past_y[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam past_y_i0_i4.GSR = "DISABLED";
    LUT4 i12057_3_lut (.A(state_adj_2622[1]), .B(n21641), .C(\state[2] ), 
         .Z(en_write_draw_line_N_2055)) /* synthesis lut_function=(A (B)+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(124[10] 127[5])
    defparam i12057_3_lut.init = 16'hc8c8;
    FD1P3AX data_i1 (.D(draw_line_data_8__N_2001[1]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[1])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i1.GSR = "ENABLED";
    FD1P3AX data_i2 (.D(draw_line_data_8__N_2001[2]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[2])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i2.GSR = "ENABLED";
    FD1P3AX data_i3 (.D(draw_line_data_8__N_2001[3]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[3])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i3.GSR = "ENABLED";
    FD1P3AX data_i4 (.D(draw_line_data_8__N_2001[4]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[4])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i4.GSR = "ENABLED";
    FD1P3AX data_i5 (.D(draw_line_data_8__N_2001[5]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[5])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i5.GSR = "ENABLED";
    FD1P3AX data_i6 (.D(draw_line_data_8__N_2001[6]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[6])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i6.GSR = "ENABLED";
    FD1P3AX data_i7 (.D(draw_line_data_8__N_2001[7]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[7])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i7.GSR = "ENABLED";
    FD1P3AX data_i8 (.D(draw_line_data_8__N_2001[8]), .SP(clk_50MHz_enable_129), 
            .CK(clk_50MHz), .Q(draw_line_data[8])) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[10] 127[5])
    defparam data_i8.GSR = "ENABLED";
    LUT4 draw_line_data_8__I_0_i2_3_lut (.A(clear_data[1]), .B(draw_data[1]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[1])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i2_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i3_3_lut (.A(clear_data[2]), .B(draw_data[2]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[2])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i3_3_lut.init = 16'hacac;
    PFUMX en_write_draw_line_I_0 (.BLUT(en_write_draw_line_N_2055), .ALUT(en_clear), 
          .C0(n21649), .Z(en_write_draw_line_N_2054)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=12, LSE_RCOL=2, LSE_LLINE=123, LSE_RLINE=133 */ ;
    LUT4 draw_line_data_8__I_0_i4_3_lut (.A(clear_data[3]), .B(draw_data[3]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[3])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i4_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i5_3_lut (.A(clear_data[4]), .B(draw_data[4]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[4])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i5_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i6_3_lut (.A(clear_data[5]), .B(draw_data[5]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[5])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i6_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i7_3_lut (.A(clear_data[6]), .B(draw_data[6]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[6])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i7_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i8_3_lut (.A(clear_data[7]), .B(draw_data[7]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[7])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i8_3_lut.init = 16'hacac;
    LUT4 draw_line_data_8__I_0_i9_3_lut (.A(clear_data[8]), .B(draw_data[8]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[8])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i9_3_lut.init = 16'hacac;
    LUT4 i18608_3_lut_rep_295 (.A(state[2]), .B(state[0]), .C(state[1]), 
         .Z(n21641)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[13:26])
    defparam i18608_3_lut_rep_295.init = 16'h1010;
    LUT4 i12097_2_lut_rep_249_4_lut (.A(state[2]), .B(state[0]), .C(state[1]), 
         .D(draw_line_flag_prev), .Z(n21595)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[13:26])
    defparam i12097_2_lut_rep_249_4_lut.init = 16'hffef;
    LUT4 i1_2_lut_rep_296 (.A(state[1]), .B(state[0]), .Z(n21642)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(130[25:40])
    defparam i1_2_lut_rep_296.init = 16'heeee;
    LUT4 i18600_2_lut_3_lut (.A(state[1]), .B(state[0]), .C(state[2]), 
         .Z(\state_2__N_1179[2] )) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(130[25:40])
    defparam i18600_2_lut_3_lut.init = 16'h1010;
    LUT4 i18622_3_lut_rep_303 (.A(state[2]), .B(state[0]), .C(state[1]), 
         .Z(n21649)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[13:27])
    defparam i18622_3_lut_rep_303.init = 16'h0404;
    LUT4 i12092_2_lut_rep_248_4_lut (.A(state[2]), .B(state[0]), .C(state[1]), 
         .D(draw_line_flag_prev_adj_2617), .Z(n21594)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(116[13:27])
    defparam i12092_2_lut_rep_248_4_lut.init = 16'hfffb;
    LUT4 i1_3_lut (.A(state[2]), .B(state[1]), .C(state[0]), .Z(clk_50MHz_enable_129)) /* synthesis lut_function=(!(A+(B (C)+!B !(C)))) */ ;
    defparam i1_3_lut.init = 16'h1414;
    LUT4 draw_line_data_8__I_0_i1_3_lut (.A(clear_data[0]), .B(draw_data[0]), 
         .C(n21649), .Z(draw_line_data_8__N_2001[0])) /* synthesis lut_function=(A (B+(C))+!A !((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(120[10] 127[5])
    defparam draw_line_data_8__I_0_i1_3_lut.init = 16'hacac;
    CCU2D not_equal_8_8 (.A0(past_y[5]), .B0(handline[5]), .C0(past_y[4]), 
          .D0(handline[4]), .A1(past_y[3]), .B1(handline[3]), .C1(past_y[2]), 
          .D1(handline[2]), .CIN(n17922), .COUT(n17923));
    defparam not_equal_8_8.INIT0 = 16'h9009;
    defparam not_equal_8_8.INIT1 = 16'h9009;
    defparam not_equal_8_8.INJECT1_0 = "YES";
    defparam not_equal_8_8.INJECT1_1 = "YES";
    CCU2D not_equal_8_0 (.A0(past_y[8]), .B0(handline[8]), .C0(GND_net), 
          .D0(GND_net), .A1(past_y[7]), .B1(handline[7]), .C1(past_y[6]), 
          .D1(handline[6]), .COUT(n17922));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(81[39:58])
    defparam not_equal_8_0.INIT0 = 16'h9000;
    defparam not_equal_8_0.INIT1 = 16'h9009;
    defparam not_equal_8_0.INJECT1_0 = "NO";
    defparam not_equal_8_0.INJECT1_1 = "YES";
    LUT4 i1_3_lut_adj_268 (.A(state[2]), .B(n2633), .C(n14672), .Z(clk_50MHz_enable_42)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;
    defparam i1_3_lut_adj_268.init = 16'hcece;
    LUT4 i18590_4_lut (.A(signal_r_adj_2618), .B(n2633), .C(state[1]), 
         .D(clear_finish_flag), .Z(state_2__N_2021[0])) /* synthesis lut_function=(!(A (B (C))+!A (B (C+(D))))) */ ;
    defparam i18590_4_lut.init = 16'h3b3f;
    LUT4 i1578_4_lut (.A(state[2]), .B(state[0]), .C(n9437), .D(state[1]), 
         .Z(n2633)) /* synthesis lut_function=(!(A+!(B (C+!(D))+!B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam i1578_4_lut.init = 16'h5044;
    LUT4 i3_4_lut (.A(\draw_line_counter[3] ), .B(n19916), .C(\state[2]_adj_11 ), 
         .D(n21642), .Z(n14672)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;
    defparam i3_4_lut.init = 16'hffef;
    LUT4 i4_4_lut (.A(n20310), .B(state[0]), .C(clear_finish_flag), .D(state[1]), 
         .Z(state_2__N_2021[1])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i4_4_lut.init = 16'h0040;
    LUT4 i18228_2_lut (.A(state[2]), .B(signal_r_adj_2618), .Z(n20310)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18228_2_lut.init = 16'heeee;
    LUT4 mux_1570_i3_4_lut (.A(n14672), .B(state[1]), .C(n2633), .D(state[2]), 
         .Z(state_2__N_2021[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(68[9] 85[16])
    defparam mux_1570_i3_4_lut.init = 16'hcac0;
    \lcd_draw_line(COLOR=16'b1111111111111111,SIZE_LENGTH_MAX=3'b111)  lcd_draw_white_line_inst (.clk_50MHz(clk_50MHz), 
            .clk_50MHz_enable_100(clk_50MHz_enable_100), .state({\state[3] , 
            Open_11, Open_12, Open_13}), .clear_finish_flag(clear_finish_flag), 
            .draw_line_flag_prev(draw_line_flag_prev_adj_2617), .n21649(n21649), 
            .\state[2] (\state[2]_adj_12 ), .past_y({past_y}), .GND_net(GND_net), 
            .n3961(n3961), .en_clear(en_clear), .clear_data({clear_data}), 
            .the1_wr_done(the1_wr_done), .n21594(n21594)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(88[55] 98[2])
    \lcd_draw_line(COLOR=16'b1011110001000000,SIZE_LENGTH_MAX=1'b0)  lcd_draw_brown_line_inst (.clk_50MHz(clk_50MHz), 
            .clk_50MHz_enable_61(clk_50MHz_enable_61), .state({\state[3]_adj_13 , 
            Open_14, Open_15, Open_16}), .the1_wr_done(the1_wr_done), 
            .wr_done(wr_done), .\state[1] (state[1]), .rst_c(rst_c), .\state[2] (state[2]), 
            .n9437(n9437), .clk_50MHz_enable_110(clk_50MHz_enable_110), 
            .draw_finish_flag(draw_finish_flag), .draw_line_flag_prev(draw_line_flag_prev), 
            .n21641(n21641), .handline({handline}), .n3961(n3961), .GND_net(GND_net), 
            .\state[1]_adj_9 (state_adj_2622[1]), .draw_data({draw_data}), 
            .\state[2]_adj_10 (\state[2] ), .n21595(n21595)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(99[55] 109[2])
    edge_detect draw_edge (.signal_r(signal_r), .clk_50MHz(clk_50MHz), .draw_finish_flag(draw_finish_flag)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(55[13] 61[2])
    edge_detect_U0 clear_edge (.signal_r(signal_r_adj_2618), .clk_50MHz(clk_50MHz), 
            .clear_finish_flag(clear_finish_flag)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/draw_line.v(48[13] 54[2])
    
endmodule
//
// Verilog Description of module \lcd_draw_line(COLOR=16'b1111111111111111,SIZE_LENGTH_MAX=3'b111) 
//

module \lcd_draw_line(COLOR=16'b1111111111111111,SIZE_LENGTH_MAX=3'b111)  (clk_50MHz, 
            clk_50MHz_enable_100, state, clear_finish_flag, draw_line_flag_prev, 
            n21649, \state[2] , past_y, GND_net, n3961, en_clear, 
            clear_data, the1_wr_done, n21594) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    input clk_50MHz_enable_100;
    output [3:0]state;
    output clear_finish_flag;
    output draw_line_flag_prev;
    input n21649;
    output \state[2] ;
    input [8:0]past_y;
    input GND_net;
    input n3961;
    output en_clear;
    output [8:0]clear_data;
    input the1_wr_done;
    input n21594;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [3:0]cnt_set_windows;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(47[17:32])
    
    wire clk_50MHz_enable_172, n10893;
    wire [3:0]n21;
    wire [9:0]cnt_wr_color_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(56[17:34])
    wire [9:0]n137;
    wire [8:0]cnt_length_num;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(59[17:31])
    
    wire clk_50MHz_enable_153, n10889;
    wire [8:0]n41;
    
    wire n5323;
    wire [7:0]n184;
    
    wire n7;
    wire [7:0]n194;
    
    wire n14, n7_adj_2607, n7_adj_2608;
    wire [3:0]state_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(43[17:22])
    
    wire n21714, n21713;
    wire [8:0]draw_line_data_8__N_2060;
    
    wire n14_adj_2609, n21648, n20020, n15, n16, length_num_flag_N_2179, 
        n10, n18312, state1_finish_flag_N_2177, n18311, n18310, n18309, 
        n5329, n7_adj_2610, n20024, length_num_flag;
    wire [3:0]state_3__N_2107;
    
    wire n18299, n18298, n21662, n18297, n18296, n18295, n21305, 
        n21304;
    wire [8:0]draw_line_data_8__N_2167;
    
    wire n18524, n21665, n21293, n21292, n7_adj_2611, n14_adj_2612, 
        n5325, n5327, clk_50MHz_enable_152, n14_adj_2613;
    wire [3:0]state_3__N_2111;
    
    wire n14_adj_2614, n18386, n18385, n18384, n5, n18383, n20260, 
        n18337, n18336, n18335, n18334;
    
    FD1P3IX cnt_set_windows_2110__i2 (.D(n21[2]), .SP(clk_50MHz_enable_172), 
            .CD(n10893), .CK(clk_50MHz), .Q(cnt_set_windows[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2110__i2.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i0 (.D(n137[0]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[0])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i0.GSR = "ENABLED";
    FD1P3IX cnt_set_windows_2110__i1 (.D(n21[1]), .SP(clk_50MHz_enable_172), 
            .CD(n10893), .CK(clk_50MHz), .Q(cnt_set_windows[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2110__i1.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2112__i8 (.D(n41[8]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i8.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2112__i7 (.D(n41[7]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i7.GSR = "ENABLED";
    LUT4 i16246_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[3]), .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16246_3_lut_4_lut.init = 16'h7f80;
    FD1P3IX cnt_length_num_2112__i6 (.D(n41[6]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i6.GSR = "ENABLED";
    FD1S3AX state_FSM_i0 (.D(n5323), .CK(clk_50MHz), .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    LUT4 i12531_4_lut_4_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(n184[6]), .D(cnt_set_windows[2]), .Z(n7)) /* synthesis lut_function=(A (B (C (D)))+!A !(B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i12531_4_lut_4_lut_4_lut.init = 16'h9100;
    LUT4 i12518_4_lut_4_lut_4_lut_4_lut (.A(cnt_set_windows[0]), .B(n194[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(n14)) /* synthesis lut_function=(!(A ((C+(D))+!B)+!A ((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i12518_4_lut_4_lut_4_lut_4_lut.init = 16'h0058;
    FD1P3IX cnt_length_num_2112__i5 (.D(n41[5]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i5.GSR = "ENABLED";
    LUT4 i12512_4_lut_4_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(n184[2]), .D(cnt_set_windows[2]), .Z(n7_adj_2607)) /* synthesis lut_function=(A (B (C (D)))+!A !(B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i12512_4_lut_4_lut_4_lut.init = 16'h9100;
    LUT4 mux_68_Mux_1_i7_4_lut_4_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n184[1]), .D(cnt_set_windows[0]), .Z(n7_adj_2608)) /* synthesis lut_function=(A (B (C (D)))+!A (B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(117[13:36])
    defparam mux_68_Mux_1_i7_4_lut_4_lut_4_lut.init = 16'hc455;
    LUT4 i12337_4_lut_then_4_lut (.A(state_c[1]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(n21714)) /* synthesis lut_function=(!(A (B (C+(D))+!B !(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12337_4_lut_then_4_lut.init = 16'h757f;
    LUT4 i12337_4_lut_else_4_lut (.A(state_c[1]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(n21713)) /* synthesis lut_function=(!(A (B (C+(D))+!B !(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12337_4_lut_else_4_lut.init = 16'h777d;
    LUT4 n7_bdd_4_lut (.A(n7_adj_2607), .B(n14), .C(cnt_set_windows[3]), 
         .D(state_c[1]), .Z(draw_line_data_8__N_2060[2])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;
    defparam n7_bdd_4_lut.init = 16'hcaff;
    LUT4 n7_bdd_4_lut_adj_263 (.A(n7_adj_2608), .B(n14_adj_2609), .C(cnt_set_windows[3]), 
         .D(state_c[1]), .Z(draw_line_data_8__N_2060[1])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;
    defparam n7_bdd_4_lut_adj_263.init = 16'hcaff;
    FD1S3AX draw_line_done_reg_94 (.D(state[3]), .CK(clk_50MHz), .Q(clear_finish_flag)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(197[10] 200[36])
    defparam draw_line_done_reg_94.GSR = "ENABLED";
    FD1S3AX draw_line_flag_prev_84 (.D(n21649), .CK(clk_50MHz), .Q(draw_line_flag_prev)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(77[9:47])
    defparam draw_line_flag_prev_84.GSR = "ENABLED";
    LUT4 i9072_2_lut_3_lut (.A(n21648), .B(n20020), .C(state[3]), .Z(n10889)) /* synthesis lut_function=(A (C)+!A !(B+!(C))) */ ;
    defparam i9072_2_lut_3_lut.init = 16'hb0b0;
    LUT4 i1_2_lut_3_lut (.A(n21648), .B(n20020), .C(state[3]), .Z(clk_50MHz_enable_153)) /* synthesis lut_function=(A (C)+!A (B+(C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'hf4f4;
    LUT4 i2_4_lut (.A(cnt_wr_color_data[9]), .B(n15), .C(cnt_wr_color_data[5]), 
         .D(n16), .Z(length_num_flag_N_2179)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;
    defparam i2_4_lut.init = 16'h0400;
    LUT4 i6_4_lut (.A(cnt_wr_color_data[3]), .B(\state[2] ), .C(cnt_wr_color_data[6]), 
         .D(cnt_wr_color_data[8]), .Z(n15)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i6_4_lut.init = 16'h8000;
    LUT4 i7_4_lut (.A(cnt_wr_color_data[2]), .B(cnt_wr_color_data[1]), .C(cnt_wr_color_data[0]), 
         .D(n10), .Z(n16)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i7_4_lut.init = 16'h8000;
    LUT4 i1_2_lut (.A(cnt_wr_color_data[7]), .B(cnt_wr_color_data[4]), .Z(n10)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut.init = 16'h8888;
    CCU2D add_67_9 (.A0(past_y[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18312), 
          .S0(n194[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(169[31:61])
    defparam add_67_9.INIT0 = 16'h5aaa;
    defparam add_67_9.INIT1 = 16'h0000;
    defparam add_67_9.INJECT1_0 = "NO";
    defparam add_67_9.INJECT1_1 = "NO";
    LUT4 i18557_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[2]), .C(cnt_set_windows[1]), 
         .D(cnt_set_windows[3]), .Z(state1_finish_flag_N_2177)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(117[13:36])
    defparam i18557_4_lut.init = 16'h1000;
    CCU2D add_67_7 (.A0(past_y[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(past_y[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18311), .COUT(n18312), .S0(n194[5]), .S1(n194[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(169[31:61])
    defparam add_67_7.INIT0 = 16'h5aaa;
    defparam add_67_7.INIT1 = 16'h5aaa;
    defparam add_67_7.INJECT1_0 = "NO";
    defparam add_67_7.INJECT1_1 = "NO";
    CCU2D add_67_5 (.A0(past_y[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(past_y[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18310), .COUT(n18311), .S0(n194[3]), .S1(n194[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(169[31:61])
    defparam add_67_5.INIT0 = 16'h5aaa;
    defparam add_67_5.INIT1 = 16'h5aaa;
    defparam add_67_5.INJECT1_0 = "NO";
    defparam add_67_5.INJECT1_1 = "NO";
    CCU2D add_67_3 (.A0(past_y[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(past_y[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18309), .COUT(n18310), .S0(n194[1]), .S1(n194[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(169[31:61])
    defparam add_67_3.INIT0 = 16'h5555;
    defparam add_67_3.INIT1 = 16'h5555;
    defparam add_67_3.INJECT1_0 = "NO";
    defparam add_67_3.INJECT1_1 = "NO";
    LUT4 i3552_4_lut_4_lut (.A(draw_line_flag_prev), .B(n21649), .C(state[3]), 
         .D(state_c[0]), .Z(n5329)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;
    defparam i3552_4_lut_4_lut.init = 16'h7340;
    LUT4 n7_bdd_4_lut_adj_264 (.A(n7_adj_2610), .B(n20024), .C(cnt_set_windows[3]), 
         .D(state_c[1]), .Z(draw_line_data_8__N_2060[0])) /* synthesis lut_function=(A (B+!(C (D)))+!A (B (C+!(D))+!B !(D))) */ ;
    defparam n7_bdd_4_lut_adj_264.init = 16'hcaff;
    CCU2D add_67_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(past_y[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18309), .S1(n194[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(169[31:61])
    defparam add_67_1.INIT0 = 16'hF000;
    defparam add_67_1.INIT1 = 16'h5555;
    defparam add_67_1.INJECT1_0 = "NO";
    defparam add_67_1.INJECT1_1 = "NO";
    FD1S3IX length_num_flag_90 (.D(length_num_flag_N_2179), .CK(clk_50MHz), 
            .CD(n3961), .Q(length_num_flag)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(126[9] 133[32])
    defparam length_num_flag_90.GSR = "ENABLED";
    FD1S3IX state1_finish_flag_89 (.D(state1_finish_flag_N_2177), .CK(clk_50MHz), 
            .CD(n3961), .Q(state_3__N_2107[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(117[10] 120[36])
    defparam state1_finish_flag_89.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2112__i4 (.D(n41[4]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i4.GSR = "ENABLED";
    CCU2D add_59_11 (.A0(cnt_wr_color_data[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18299), .S0(n137[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_11.INIT0 = 16'h5aaa;
    defparam add_59_11.INIT1 = 16'h0000;
    defparam add_59_11.INJECT1_0 = "NO";
    defparam add_59_11.INJECT1_1 = "NO";
    CCU2D add_59_9 (.A0(cnt_wr_color_data[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18298), .COUT(n18299), .S0(n137[7]), .S1(n137[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_9.INIT0 = 16'h5aaa;
    defparam add_59_9.INIT1 = 16'h5aaa;
    defparam add_59_9.INJECT1_0 = "NO";
    defparam add_59_9.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(past_y[8]), .B(n21662), .C(n194[0]), .D(cnt_set_windows[0]), 
         .Z(n20024)) /* synthesis lut_function=(A (B (C+!(D)))+!A (B (C (D)))) */ ;
    defparam i1_4_lut.init = 16'hc088;
    CCU2D add_59_7 (.A0(cnt_wr_color_data[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18297), .COUT(n18298), .S0(n137[5]), .S1(n137[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_7.INIT0 = 16'h5aaa;
    defparam add_59_7.INIT1 = 16'h5aaa;
    defparam add_59_7.INJECT1_0 = "NO";
    defparam add_59_7.INJECT1_1 = "NO";
    CCU2D add_59_5 (.A0(cnt_wr_color_data[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18296), .COUT(n18297), .S0(n137[3]), .S1(n137[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_5.INIT0 = 16'h5aaa;
    defparam add_59_5.INIT1 = 16'h5aaa;
    defparam add_59_5.INJECT1_0 = "NO";
    defparam add_59_5.INJECT1_1 = "NO";
    CCU2D add_59_3 (.A0(cnt_wr_color_data[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18295), .COUT(n18296), .S0(n137[1]), .S1(n137[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_3.INIT0 = 16'h5aaa;
    defparam add_59_3.INIT1 = 16'h5aaa;
    defparam add_59_3.INJECT1_0 = "NO";
    defparam add_59_3.INJECT1_1 = "NO";
    CCU2D add_59_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_wr_color_data[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18295), .S1(n137[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_59_1.INIT0 = 16'hF000;
    defparam add_59_1.INIT1 = 16'h5555;
    defparam add_59_1.INJECT1_0 = "NO";
    defparam add_59_1.INJECT1_1 = "NO";
    FD1P3IX cnt_length_num_2112__i3 (.D(n41[3]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i3.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2112__i2 (.D(n41[2]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i2.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i9 (.D(n137[9]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[9])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i9.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i8 (.D(n137[8]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[8])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i8.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i7 (.D(n137[7]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[7])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i7.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i6 (.D(n137[6]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[6])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i6.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i5 (.D(n137[5]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[5])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i5.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i4 (.D(n137[4]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[4])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i4.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i3 (.D(n137[3]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[3])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i3.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i2 (.D(n137[2]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i2.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i1 (.D(n137[1]), .SP(clk_50MHz_enable_100), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[1])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i1.GSR = "ENABLED";
    FD1P3IX cnt_length_num_2112__i1 (.D(n41[1]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i1.GSR = "ENABLED";
    PFUMX i18917 (.BLUT(n21305), .ALUT(n21304), .C0(cnt_set_windows[3]), 
          .Z(draw_line_data_8__N_2167[3]));
    LUT4 i3_4_lut (.A(n184[4]), .B(cnt_set_windows[0]), .C(cnt_set_windows[1]), 
         .D(cnt_set_windows[2]), .Z(n18524)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i3_4_lut.init = 16'h8000;
    FD1P3IX cnt_set_windows_2110__i0 (.D(n21665), .SP(clk_50MHz_enable_172), 
            .CD(n10893), .CK(clk_50MHz), .Q(cnt_set_windows[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2110__i0.GSR = "ENABLED";
    LUT4 state_3__N_2099_I_0_2_lut (.A(state_c[1]), .B(\state[2] ), .Z(en_clear)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(191[29:65])
    defparam state_3__N_2099_I_0_2_lut.init = 16'heeee;
    LUT4 n187_bdd_4_lut_19157 (.A(n184[5]), .B(cnt_set_windows[1]), .C(cnt_set_windows[2]), 
         .D(cnt_set_windows[0]), .Z(n21293)) /* synthesis lut_function=(A (B (C (D))+!B (C+!(D)))+!A !(B+!(C+!(D)))) */ ;
    defparam n187_bdd_4_lut_19157.init = 16'hb033;
    PFUMX i18910 (.BLUT(n21293), .ALUT(n21292), .C0(cnt_set_windows[3]), 
          .Z(draw_line_data_8__N_2167[5]));
    PFUMX mux_68_Mux_7_i15 (.BLUT(n7_adj_2611), .ALUT(n14_adj_2612), .C0(cnt_set_windows[3]), 
          .Z(draw_line_data_8__N_2167[7])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    FD1S3AX state_FSM_i1 (.D(n5325), .CK(clk_50MHz), .Q(\state[2] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n5327), .CK(clk_50MHz), .Q(state_c[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AY state_FSM_i3 (.D(n5329), .CK(clk_50MHz), .Q(state_c[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i12537_4_lut_4_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(n184[7]), .D(cnt_set_windows[2]), .Z(n7_adj_2611)) /* synthesis lut_function=(A (B (C (D)))+!A !(B+!(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i12537_4_lut_4_lut_4_lut.init = 16'h9100;
    FD1P3AX data_i1 (.D(draw_line_data_8__N_2060[1]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[1])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i1.GSR = "ENABLED";
    FD1P3AX data_i2 (.D(draw_line_data_8__N_2060[2]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i2.GSR = "ENABLED";
    FD1P3AX data_i3 (.D(draw_line_data_8__N_2060[3]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[3])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i3.GSR = "ENABLED";
    FD1P3AX data_i4 (.D(draw_line_data_8__N_2060[4]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[4])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i4.GSR = "ENABLED";
    FD1P3AX data_i5 (.D(draw_line_data_8__N_2060[5]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[5])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i5.GSR = "ENABLED";
    FD1P3AX data_i6 (.D(draw_line_data_8__N_2060[6]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[6])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i6.GSR = "ENABLED";
    FD1P3AX data_i7 (.D(draw_line_data_8__N_2060[7]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[7])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i7.GSR = "ENABLED";
    FD1P3AX data_i8 (.D(draw_line_data_8__N_2060[8]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[8])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i8.GSR = "ENABLED";
    PFUMX mux_68_Mux_6_i15 (.BLUT(n7), .ALUT(n14_adj_2613), .C0(cnt_set_windows[3]), 
          .Z(draw_line_data_8__N_2167[6])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 i3548_4_lut (.A(\state[2] ), .B(state_3__N_2107[2]), .C(state_3__N_2111[3]), 
         .D(state_c[1]), .Z(n5325)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3548_4_lut.init = 16'hce0a;
    LUT4 i3550_4_lut (.A(state_c[1]), .B(n21649), .C(state_3__N_2107[2]), 
         .D(state_c[0]), .Z(n5327)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3550_4_lut.init = 16'hce0a;
    FD1P3AX data_i0 (.D(draw_line_data_8__N_2060[0]), .SP(clk_50MHz_enable_152), 
            .CK(clk_50MHz), .Q(clear_data[0])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i0.GSR = "ENABLED";
    LUT4 n189_bdd_4_lut_19164 (.A(n184[3]), .B(cnt_set_windows[1]), .C(cnt_set_windows[2]), 
         .D(cnt_set_windows[0]), .Z(n21305)) /* synthesis lut_function=(A (B (C (D))+!B (C+!(D)))+!A !(B+!(C+!(D)))) */ ;
    defparam n189_bdd_4_lut_19164.init = 16'hb033;
    FD1P3IX cnt_length_num_2112__i0 (.D(n41[0]), .SP(clk_50MHz_enable_153), 
            .CD(n10889), .CK(clk_50MHz), .Q(cnt_length_num[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112__i0.GSR = "ENABLED";
    PFUMX mux_68_Mux_4_i15 (.BLUT(n18524), .ALUT(n14_adj_2614), .C0(cnt_set_windows[3]), 
          .Z(draw_line_data_8__N_2167[4])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=88, LSE_RLINE=98 */ ;
    LUT4 i2_3_lut_rep_302 (.A(cnt_length_num[2]), .B(cnt_length_num[3]), 
         .C(cnt_length_num[4]), .Z(n21648)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut_rep_302.init = 16'h8080;
    CCU2D cnt_length_num_2112_add_4_9 (.A0(cnt_length_num[7]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[8]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18386), .S0(n41[7]), .S1(n41[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_9.INJECT1_0 = "NO";
    defparam cnt_length_num_2112_add_4_9.INJECT1_1 = "NO";
    CCU2D cnt_length_num_2112_add_4_7 (.A0(cnt_length_num[5]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[6]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18385), .COUT(n18386), .S0(n41[5]), 
          .S1(n41[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_7.INJECT1_0 = "NO";
    defparam cnt_length_num_2112_add_4_7.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_265 (.A(\state[2] ), .B(state_c[1]), .Z(clk_50MHz_enable_152)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_265.init = 16'heeee;
    CCU2D cnt_length_num_2112_add_4_5 (.A0(cnt_length_num[3]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[4]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18384), .COUT(n18385), .S0(n41[3]), 
          .S1(n41[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_5.INJECT1_0 = "NO";
    defparam cnt_length_num_2112_add_4_5.INJECT1_1 = "NO";
    LUT4 i12332_2_lut (.A(draw_line_data_8__N_2167[3]), .B(state_c[1]), 
         .Z(draw_line_data_8__N_2060[3])) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12332_2_lut.init = 16'hbbbb;
    LUT4 i12333_2_lut (.A(draw_line_data_8__N_2167[4]), .B(state_c[1]), 
         .Z(draw_line_data_8__N_2060[4])) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12333_2_lut.init = 16'hbbbb;
    LUT4 i12334_2_lut (.A(draw_line_data_8__N_2167[5]), .B(state_c[1]), 
         .Z(draw_line_data_8__N_2060[5])) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12334_2_lut.init = 16'hbbbb;
    LUT4 i12325_3_lut_3_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n5), .Z(n7_adj_2610)) /* synthesis lut_function=(A (B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(117[13:36])
    defparam i12325_3_lut_3_lut.init = 16'hc4c4;
    LUT4 i12335_2_lut (.A(draw_line_data_8__N_2167[6]), .B(state_c[1]), 
         .Z(draw_line_data_8__N_2060[6])) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12335_2_lut.init = 16'hbbbb;
    LUT4 i12336_2_lut (.A(draw_line_data_8__N_2167[7]), .B(state_c[1]), 
         .Z(draw_line_data_8__N_2060[7])) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam i12336_2_lut.init = 16'hbbbb;
    CCU2D cnt_length_num_2112_add_4_3 (.A0(cnt_length_num[1]), .B0(GND_net), 
          .C0(GND_net), .D0(GND_net), .A1(cnt_length_num[2]), .B1(GND_net), 
          .C1(GND_net), .D1(GND_net), .CIN(n18383), .COUT(n18384), .S0(n41[1]), 
          .S1(n41[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_length_num_2112_add_4_3.INJECT1_0 = "NO";
    defparam cnt_length_num_2112_add_4_3.INJECT1_1 = "NO";
    CCU2D cnt_length_num_2112_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_length_num[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18383), .S1(n41[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(140[27:48])
    defparam cnt_length_num_2112_add_4_1.INIT0 = 16'hF000;
    defparam cnt_length_num_2112_add_4_1.INIT1 = 16'h0555;
    defparam cnt_length_num_2112_add_4_1.INJECT1_0 = "NO";
    defparam cnt_length_num_2112_add_4_1.INJECT1_1 = "NO";
    LUT4 i18678_2_lut_rep_316 (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .Z(n21662)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i18678_2_lut_rep_316.init = 16'h1111;
    LUT4 i12216_2_lut_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n194[1]), .D(cnt_set_windows[0]), .Z(n14_adj_2609)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i12216_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i12212_2_lut_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n194[4]), .D(cnt_set_windows[0]), .Z(n14_adj_2614)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i12212_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i12209_2_lut_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n194[6]), .D(cnt_set_windows[0]), .Z(n14_adj_2613)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i12209_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i12207_2_lut_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(n194[7]), .D(cnt_set_windows[0]), .Z(n14_adj_2612)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i12207_2_lut_3_lut_4_lut.init = 16'h1000;
    LUT4 i16230_1_lut_rep_319 (.A(cnt_set_windows[0]), .Z(n21665)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16230_1_lut_rep_319.init = 16'h5555;
    LUT4 n21291_bdd_2_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(n194[5]), .D(cnt_set_windows[2]), .Z(n21292)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A ((D)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam n21291_bdd_2_lut_4_lut.init = 16'h0064;
    LUT4 n21303_bdd_2_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[1]), 
         .C(n194[3]), .D(cnt_set_windows[2]), .Z(n21304)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A ((D)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam n21303_bdd_2_lut_4_lut.init = 16'h0064;
    LUT4 mux_68_Mux_0_i5_3_lut (.A(past_y[8]), .B(n184[0]), .C(cnt_set_windows[0]), 
         .Z(n5)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(159[9] 172[16])
    defparam mux_68_Mux_0_i5_3_lut.init = 16'hcaca;
    LUT4 i16239_2_lut_3_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .Z(n21[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16239_2_lut_3_lut.init = 16'h7878;
    LUT4 i1_2_lut_3_lut_adj_266 (.A(state_c[1]), .B(the1_wr_done), .C(state[3]), 
         .Z(clk_50MHz_enable_172)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(106[13:44])
    defparam i1_2_lut_3_lut_adj_266.init = 16'hf8f8;
    LUT4 i16232_2_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), .Z(n21[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16232_2_lut.init = 16'h6666;
    LUT4 i9076_2_lut_3_lut (.A(state_c[1]), .B(the1_wr_done), .C(state[3]), 
         .Z(n10893)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(106[13:44])
    defparam i9076_2_lut_3_lut.init = 16'h7070;
    LUT4 i4_4_lut (.A(n20260), .B(cnt_length_num[6]), .C(length_num_flag), 
         .D(cnt_length_num[7]), .Z(n20020)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;
    defparam i4_4_lut.init = 16'h0010;
    LUT4 i18180_2_lut (.A(cnt_length_num[5]), .B(cnt_length_num[8]), .Z(n20260)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18180_2_lut.init = 16'heeee;
    FD1P3IX cnt_set_windows_2110__i3 (.D(n21[3]), .SP(clk_50MHz_enable_172), 
            .CD(n10893), .CK(clk_50MHz), .Q(cnt_set_windows[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2110__i3.GSR = "ENABLED";
    LUT4 i3546_4_lut (.A(state[3]), .B(state_3__N_2111[3]), .C(n21594), 
         .D(\state[2] ), .Z(n5323)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3546_4_lut.init = 16'heca0;
    LUT4 i2_4_lut_adj_267 (.A(n20020), .B(n21648), .C(cnt_length_num[1]), 
         .D(cnt_length_num[0]), .Z(state_3__N_2111[3])) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i2_4_lut_adj_267.init = 16'h0008;
    CCU2D sub_66_add_2_9 (.A0(past_y[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18337), .S0(n184[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(167[31:61])
    defparam sub_66_add_2_9.INIT0 = 16'h5555;
    defparam sub_66_add_2_9.INIT1 = 16'h0000;
    defparam sub_66_add_2_9.INJECT1_0 = "NO";
    defparam sub_66_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_66_add_2_7 (.A0(past_y[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(past_y[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18336), .COUT(n18337), .S0(n184[5]), .S1(n184[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(167[31:61])
    defparam sub_66_add_2_7.INIT0 = 16'h5555;
    defparam sub_66_add_2_7.INIT1 = 16'h5555;
    defparam sub_66_add_2_7.INJECT1_0 = "NO";
    defparam sub_66_add_2_7.INJECT1_1 = "NO";
    CCU2D sub_66_add_2_5 (.A0(past_y[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(past_y[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18335), .COUT(n18336), .S0(n184[3]), .S1(n184[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(167[31:61])
    defparam sub_66_add_2_5.INIT0 = 16'h5555;
    defparam sub_66_add_2_5.INIT1 = 16'h5555;
    defparam sub_66_add_2_5.INJECT1_0 = "NO";
    defparam sub_66_add_2_5.INJECT1_1 = "NO";
    PFUMX i19019 (.BLUT(n21713), .ALUT(n21714), .C0(cnt_set_windows[0]), 
          .Z(draw_line_data_8__N_2060[8]));
    CCU2D sub_66_add_2_3 (.A0(past_y[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(past_y[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18334), .COUT(n18335), .S0(n184[1]), .S1(n184[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(167[31:61])
    defparam sub_66_add_2_3.INIT0 = 16'h5aaa;
    defparam sub_66_add_2_3.INIT1 = 16'h5aaa;
    defparam sub_66_add_2_3.INJECT1_0 = "NO";
    defparam sub_66_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_66_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(past_y[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18334), .S1(n184[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(167[31:61])
    defparam sub_66_add_2_1.INIT0 = 16'hF000;
    defparam sub_66_add_2_1.INIT1 = 16'h5555;
    defparam sub_66_add_2_1.INJECT1_0 = "NO";
    defparam sub_66_add_2_1.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module \lcd_draw_line(COLOR=16'b1011110001000000,SIZE_LENGTH_MAX=1'b0) 
//

module \lcd_draw_line(COLOR=16'b1011110001000000,SIZE_LENGTH_MAX=1'b0)  (clk_50MHz, 
            clk_50MHz_enable_61, state, the1_wr_done, wr_done, \state[1] , 
            rst_c, \state[2] , n9437, clk_50MHz_enable_110, draw_finish_flag, 
            draw_line_flag_prev, n21641, handline, n3961, GND_net, 
            \state[1]_adj_9 , draw_data, \state[2]_adj_10 , n21595) /* synthesis syn_module_defined=1 */ ;
    input clk_50MHz;
    input clk_50MHz_enable_61;
    output [3:0]state;
    output the1_wr_done;
    input wr_done;
    input \state[1] ;
    input rst_c;
    input \state[2] ;
    input n9437;
    output clk_50MHz_enable_110;
    output draw_finish_flag;
    output draw_line_flag_prev;
    input n21641;
    input [8:0]handline;
    output n3961;
    input GND_net;
    output \state[1]_adj_9 ;
    output [8:0]draw_data;
    output \state[2]_adj_10 ;
    input n21595;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    wire [9:0]cnt_wr_color_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(56[17:34])
    wire [9:0]n114;
    
    wire n5315;
    wire [3:0]cnt_set_windows;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(47[17:32])
    
    wire n21732, n21731, n21113;
    wire [3:0]state_3__N_2231;
    
    wire n21566, n21124, n21123, n21036, n21035;
    wire [8:0]draw_line_data_8__N_2271;
    
    wire length_num_flag, length_num_flag_N_2283, n18317, n18316, n18315, 
        n18314, n18313, n82;
    wire [3:0]state_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(43[17:22])
    
    wire n5321, n21399, n21398, n21400, clk_50MHz_enable_113, n10882;
    wire [3:0]n21;
    
    wire n21125;
    wire [8:0]draw_line_data_8__N_2184;
    
    wire n21673, n21282, clk_50MHz_enable_157, n10870, n21283, n5317, 
        n5319, n17290, n21733, n83, n17363, n21115, n15, n16, 
        n10;
    
    FD1P3IX cnt_wr_color_data__i0 (.D(n114[0]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[0])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i0.GSR = "ENABLED";
    FD1S3AX the1_wr_done_114 (.D(wr_done), .CK(clk_50MHz), .Q(the1_wr_done)) /* synthesis LSE_LINE_FILE_ID=15, LSE_LCOL=15, LSE_RCOL=2, LSE_LLINE=110, LSE_RLINE=121 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(97[10] 100[30])
    defparam the1_wr_done_114.GSR = "ENABLED";
    FD1S3AX state_FSM_i0 (.D(n5315), .CK(clk_50MHz), .Q(state[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i0.GSR = "ENABLED";
    LUT4 i3_4_lut (.A(\state[1] ), .B(rst_c), .C(\state[2] ), .D(n9437), 
         .Z(clk_50MHz_enable_110)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(197[10] 200[36])
    defparam i3_4_lut.init = 16'h0800;
    FD1P3IX cnt_wr_color_data__i9 (.D(n114[9]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[9])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i9.GSR = "ENABLED";
    FD1S3AX draw_line_done_reg_91 (.D(state[3]), .CK(clk_50MHz), .Q(draw_finish_flag)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(197[10] 200[36])
    defparam draw_line_done_reg_91.GSR = "ENABLED";
    FD1S3AX draw_line_flag_prev_81 (.D(n21641), .CK(clk_50MHz), .Q(draw_line_flag_prev)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(77[9:47])
    defparam draw_line_flag_prev_81.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut_then_4_lut (.A(cnt_set_windows[3]), .B(cnt_set_windows[0]), 
         .C(handline[2]), .D(cnt_set_windows[2]), .Z(n21732)) /* synthesis lut_function=(!(A (B+(D))+!A !(B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_3_lut_4_lut_then_4_lut.init = 16'h4022;
    FD1P3IX cnt_wr_color_data__i8 (.D(n114[8]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[8])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i8.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut_else_4_lut (.A(cnt_set_windows[3]), .B(cnt_set_windows[0]), 
         .C(handline[2]), .D(cnt_set_windows[2]), .Z(n21731)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_3_lut_4_lut_else_4_lut.init = 16'h0080;
    LUT4 cnt_set_windows_0__bdd_4_lut_18823 (.A(handline[5]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[3]), .Z(n21113)) /* synthesis lut_function=(!(A (B (D)+!B (C+!(D)))+!A ((C+(D))+!B))) */ ;
    defparam cnt_set_windows_0__bdd_4_lut_18823.init = 16'h028c;
    FD1P3IX cnt_wr_color_data__i7 (.D(n114[7]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[7])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i7.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i6 (.D(n114[6]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[6])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i6.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i5 (.D(n114[5]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[5])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i5.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i4 (.D(n114[4]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[4])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i4.GSR = "ENABLED";
    FD1S3IX state1_finish_flag_86 (.D(n21566), .CK(clk_50MHz), .CD(n3961), 
            .Q(state_3__N_2231[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(117[10] 120[36])
    defparam state1_finish_flag_86.GSR = "ENABLED";
    LUT4 cnt_set_windows_0__bdd_3_lut_18887 (.A(cnt_set_windows[2]), .B(cnt_set_windows[1]), 
         .C(cnt_set_windows[3]), .Z(n21124)) /* synthesis lut_function=(!(A (B+(C))+!A !(B (C)+!B !(C)))) */ ;
    defparam cnt_set_windows_0__bdd_3_lut_18887.init = 16'h4343;
    LUT4 cnt_set_windows_0__bdd_4_lut_18834 (.A(cnt_set_windows[2]), .B(cnt_set_windows[1]), 
         .C(cnt_set_windows[3]), .D(handline[3]), .Z(n21123)) /* synthesis lut_function=(!(A (B (C+!(D))+!B (C))+!A (B+!(C (D))))) */ ;
    defparam cnt_set_windows_0__bdd_4_lut_18834.init = 16'h1a02;
    FD1P3IX cnt_wr_color_data__i3 (.D(n114[3]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[3])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i3.GSR = "ENABLED";
    PFUMX i18788 (.BLUT(n21036), .ALUT(n21035), .C0(cnt_set_windows[0]), 
          .Z(draw_line_data_8__N_2271[1]));
    FD1S3IX length_num_flag_87 (.D(length_num_flag_N_2283), .CK(clk_50MHz), 
            .CD(n3961), .Q(length_num_flag)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(126[9] 133[32])
    defparam length_num_flag_87.GSR = "ENABLED";
    FD1P3IX cnt_wr_color_data__i2 (.D(n114[2]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i2.GSR = "ENABLED";
    CCU2D add_55_11 (.A0(cnt_wr_color_data[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18317), .S0(n114[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_11.INIT0 = 16'h5aaa;
    defparam add_55_11.INIT1 = 16'h0000;
    defparam add_55_11.INJECT1_0 = "NO";
    defparam add_55_11.INJECT1_1 = "NO";
    CCU2D add_55_9 (.A0(cnt_wr_color_data[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18316), .COUT(n18317), .S0(n114[7]), .S1(n114[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_9.INIT0 = 16'h5aaa;
    defparam add_55_9.INIT1 = 16'h5aaa;
    defparam add_55_9.INJECT1_0 = "NO";
    defparam add_55_9.INJECT1_1 = "NO";
    CCU2D add_55_7 (.A0(cnt_wr_color_data[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18315), .COUT(n18316), .S0(n114[5]), .S1(n114[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_7.INIT0 = 16'h5aaa;
    defparam add_55_7.INIT1 = 16'h5aaa;
    defparam add_55_7.INJECT1_0 = "NO";
    defparam add_55_7.INJECT1_1 = "NO";
    CCU2D add_55_5 (.A0(cnt_wr_color_data[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18314), .COUT(n18315), .S0(n114[3]), .S1(n114[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_5.INIT0 = 16'h5aaa;
    defparam add_55_5.INIT1 = 16'h5aaa;
    defparam add_55_5.INJECT1_0 = "NO";
    defparam add_55_5.INJECT1_1 = "NO";
    CCU2D add_55_3 (.A0(cnt_wr_color_data[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_wr_color_data[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18313), .COUT(n18314), .S0(n114[1]), .S1(n114[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_3.INIT0 = 16'h5aaa;
    defparam add_55_3.INIT1 = 16'h5aaa;
    defparam add_55_3.INJECT1_0 = "NO";
    defparam add_55_3.INJECT1_1 = "NO";
    CCU2D add_55_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_wr_color_data[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18313), .S1(n114[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(152[30:54])
    defparam add_55_1.INIT0 = 16'hF000;
    defparam add_55_1.INIT1 = 16'h5555;
    defparam add_55_1.INJECT1_0 = "NO";
    defparam add_55_1.INJECT1_1 = "NO";
    LUT4 cnt_set_windows_0__bdd_4_lut_18886 (.A(cnt_set_windows[0]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(n82)) /* synthesis lut_function=(!((B (C+(D))+!B !(C (D)))+!A)) */ ;
    defparam cnt_set_windows_0__bdd_4_lut_18886.init = 16'h2008;
    FD1P3IX cnt_wr_color_data__i1 (.D(n114[1]), .SP(clk_50MHz_enable_61), 
            .CD(state[3]), .CK(clk_50MHz), .Q(cnt_wr_color_data[1])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(149[10] 152[55])
    defparam cnt_wr_color_data__i1.GSR = "ENABLED";
    LUT4 i3544_4_lut_4_lut (.A(draw_line_flag_prev), .B(n21641), .C(state[3]), 
         .D(state_c[0]), .Z(n5321)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;
    defparam i3544_4_lut_4_lut.init = 16'h7340;
    PFUMX i18961 (.BLUT(n21399), .ALUT(n21398), .C0(cnt_set_windows[0]), 
          .Z(n21400));
    LUT4 cnt_set_windows_1__bdd_2_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[3]), 
         .Z(n21036)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam cnt_set_windows_1__bdd_2_lut.init = 16'h1111;
    FD1P3IX cnt_set_windows_2114__i3 (.D(n21[3]), .SP(clk_50MHz_enable_113), 
            .CD(n10882), .CK(clk_50MHz), .Q(cnt_set_windows[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2114__i3.GSR = "ENABLED";
    LUT4 n21126_bdd_3_lut_3_lut (.A(cnt_wr_color_data[0]), .B(\state[1]_adj_9 ), 
         .C(n21125), .Z(draw_line_data_8__N_2184[3])) /* synthesis lut_function=(A (B (C))+!A ((C)+!B)) */ ;
    defparam n21126_bdd_3_lut_3_lut.init = 16'hd1d1;
    FD1P3IX cnt_set_windows_2114__i0 (.D(n21673), .SP(clk_50MHz_enable_113), 
            .CD(n10882), .CK(clk_50MHz), .Q(cnt_set_windows[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2114__i0.GSR = "ENABLED";
    FD1P3IX cnt_set_windows_2114__i2 (.D(n21[2]), .SP(clk_50MHz_enable_113), 
            .CD(n10882), .CK(clk_50MHz), .Q(cnt_set_windows[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2114__i2.GSR = "ENABLED";
    LUT4 handline_0__bdd_4_lut_18905 (.A(handline[0]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[3]), .Z(n21282)) /* synthesis lut_function=(!(A (B (D)+!B (C+!(D)))+!A ((C+(D))+!B))) */ ;
    defparam handline_0__bdd_4_lut_18905.init = 16'h028c;
    FD1P3IX cnt_set_windows_2114__i1 (.D(n21[1]), .SP(clk_50MHz_enable_113), 
            .CD(n10882), .CK(clk_50MHz), .Q(cnt_set_windows[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam cnt_set_windows_2114__i1.GSR = "ENABLED";
    FD1P3IX data_i0 (.D(draw_line_data_8__N_2271[0]), .SP(clk_50MHz_enable_157), 
            .CD(n10870), .CK(clk_50MHz), .Q(draw_data[0])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i0.GSR = "ENABLED";
    LUT4 handline_0__bdd_4_lut_18985 (.A(handline[8]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[3]), .Z(n21283)) /* synthesis lut_function=(!(A (B (D)+!B (C+!(D)))+!A ((C+(D))+!B))) */ ;
    defparam handline_0__bdd_4_lut_18985.init = 16'h028c;
    LUT4 i16203_2_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), .Z(n21[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16203_2_lut.init = 16'h6666;
    LUT4 i1_2_lut (.A(\state[2]_adj_10 ), .B(\state[1]_adj_9 ), .Z(clk_50MHz_enable_157)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut.init = 16'heeee;
    LUT4 i9053_2_lut (.A(\state[2]_adj_10 ), .B(\state[1]_adj_9 ), .Z(n10870)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam i9053_2_lut.init = 16'h2222;
    FD1S3AX state_FSM_i1 (.D(n5317), .CK(clk_50MHz), .Q(\state[2]_adj_10 ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    FD1S3AX state_FSM_i2 (.D(n5319), .CK(clk_50MHz), .Q(\state[1]_adj_9 ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AY state_FSM_i3 (.D(n5321), .CK(clk_50MHz), .Q(state_c[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    LUT4 i3540_4_lut (.A(\state[2]_adj_10 ), .B(state_3__N_2231[2]), .C(length_num_flag), 
         .D(\state[1]_adj_9 ), .Z(n5317)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3540_4_lut.init = 16'hce0a;
    LUT4 i3542_4_lut (.A(\state[1]_adj_9 ), .B(n21641), .C(state_3__N_2231[2]), 
         .D(state_c[0]), .Z(n5319)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3542_4_lut.init = 16'hce0a;
    PFUMX i18906 (.BLUT(n21283), .ALUT(n21282), .C0(cnt_set_windows[0]), 
          .Z(draw_line_data_8__N_2271[0]));
    FD1P3AX data_i2 (.D(draw_line_data_8__N_2184[2]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[2])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i2.GSR = "ENABLED";
    FD1P3AX data_i3 (.D(draw_line_data_8__N_2184[3]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[3])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i3.GSR = "ENABLED";
    FD1P3AX data_i4 (.D(draw_line_data_8__N_2184[4]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[4])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i4.GSR = "ENABLED";
    FD1P3AX data_i5 (.D(draw_line_data_8__N_2184[5]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[5])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i5.GSR = "ENABLED";
    FD1P3AX data_i6 (.D(draw_line_data_8__N_2184[6]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[6])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i6.GSR = "ENABLED";
    FD1P3AX data_i7 (.D(draw_line_data_8__N_2184[7]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[7])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i7.GSR = "ENABLED";
    FD1P3AX data_i8 (.D(draw_line_data_8__N_2184[8]), .SP(clk_50MHz_enable_157), 
            .CK(clk_50MHz), .Q(draw_data[8])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i8.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_220_3_lut_4_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[2]), .Z(n21566)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_2_lut_rep_220_3_lut_4_lut.init = 16'h0040;
    FD1P3IX data_i1 (.D(draw_line_data_8__N_2271[1]), .SP(clk_50MHz_enable_157), 
            .CD(n10870), .CK(clk_50MHz), .Q(draw_data[1])) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=55, LSE_RCOL=2, LSE_LLINE=99, LSE_RLINE=109 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(158[10] 179[22])
    defparam data_i1.GSR = "ENABLED";
    LUT4 draw_line_data_8__I_0_i3_4_lut (.A(cnt_wr_color_data[0]), .B(n17290), 
         .C(\state[1]_adj_9 ), .D(n21733), .Z(draw_line_data_8__N_2184[2])) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam draw_line_data_8__I_0_i3_4_lut.init = 16'hf5c5;
    LUT4 draw_line_data_8__I_0_i5_4_lut (.A(cnt_wr_color_data[0]), .B(handline[4]), 
         .C(\state[1]_adj_9 ), .D(n82), .Z(draw_line_data_8__N_2184[4])) /* synthesis lut_function=(A (B (C (D)))+!A (B ((D)+!C)+!B !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam draw_line_data_8__I_0_i5_4_lut.init = 16'hc505;
    LUT4 draw_line_data_8__I_0_i8_4_lut (.A(cnt_wr_color_data[0]), .B(n83), 
         .C(\state[1]_adj_9 ), .D(n17290), .Z(draw_line_data_8__N_2184[7])) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (B+((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(173[10] 179[22])
    defparam draw_line_data_8__I_0_i8_4_lut.init = 16'hf5c5;
    LUT4 i1_2_lut_adj_261 (.A(handline[7]), .B(n82), .Z(n83)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_2_lut_adj_261.init = 16'h8888;
    LUT4 i15577_3_lut (.A(cnt_set_windows[0]), .B(cnt_set_windows[3]), .C(cnt_set_windows[2]), 
         .Z(n17363)) /* synthesis lut_function=(!(A (C)+!A (B (C)+!B !(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(47[17:32])
    defparam i15577_3_lut.init = 16'h1e1e;
    LUT4 cnt_wr_color_data_0__bdd_3_lut (.A(cnt_wr_color_data[0]), .B(n21400), 
         .C(\state[1]_adj_9 ), .Z(draw_line_data_8__N_2184[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam cnt_wr_color_data_0__bdd_3_lut.init = 16'hcaca;
    LUT4 cnt_set_windows_2__bdd_3_lut_18994 (.A(cnt_set_windows[2]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .Z(n21399)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;
    defparam cnt_set_windows_2__bdd_3_lut_18994.init = 16'h0202;
    LUT4 i16201_1_lut_rep_327 (.A(cnt_set_windows[0]), .Z(n21673)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16201_1_lut_rep_327.init = 16'h5555;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut_4_lut (.A(cnt_set_windows[3]), .B(cnt_set_windows[2]), 
         .C(cnt_set_windows[1]), .D(cnt_set_windows[0]), .Z(n17290)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_2_lut_3_lut_4_lut_4_lut_4_lut.init = 16'h0004;
    LUT4 cnt_set_windows_2__bdd_4_lut_18993 (.A(cnt_set_windows[2]), .B(cnt_set_windows[3]), 
         .C(cnt_set_windows[1]), .D(handline[6]), .Z(n21398)) /* synthesis lut_function=(!(A (B+!(C (D)))+!A ((C+!(D))+!B))) */ ;
    defparam cnt_set_windows_2__bdd_4_lut_18993.init = 16'h2400;
    LUT4 i1_4_lut_4_lut (.A(cnt_set_windows[3]), .B(cnt_set_windows[1]), 
         .C(n17363), .D(\state[1]_adj_9 ), .Z(draw_line_data_8__N_2184[8])) /* synthesis lut_function=(!(A (B (D)+!B !(C+!(D)))+!A !(B+(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i1_4_lut_4_lut.init = 16'h74ff;
    LUT4 i9065_2_lut_3_lut (.A(\state[1]_adj_9 ), .B(the1_wr_done), .C(state[3]), 
         .Z(n10882)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(106[13:44])
    defparam i9065_2_lut_3_lut.init = 16'h7070;
    LUT4 i1_2_lut_3_lut (.A(\state[1]_adj_9 ), .B(the1_wr_done), .C(state[3]), 
         .Z(clk_50MHz_enable_113)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(106[13:44])
    defparam i1_2_lut_3_lut.init = 16'hf8f8;
    LUT4 i16217_3_lut_4_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .D(cnt_set_windows[3]), .Z(n21[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16217_3_lut_4_lut.init = 16'h7f80;
    LUT4 i16210_2_lut_3_lut (.A(cnt_set_windows[1]), .B(cnt_set_windows[0]), 
         .C(cnt_set_windows[2]), .Z(n21[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(107[28:50])
    defparam i16210_2_lut_3_lut.init = 16'h7878;
    LUT4 cnt_set_windows_1__bdd_4_lut_18895 (.A(cnt_set_windows[1]), .B(cnt_set_windows[2]), 
         .C(handline[1]), .D(cnt_set_windows[3]), .Z(n21035)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A (B (D)+!B !(C (D))))) */ ;
    defparam cnt_set_windows_1__bdd_4_lut_18895.init = 16'h10c4;
    LUT4 n21116_bdd_3_lut_3_lut (.A(cnt_wr_color_data[0]), .B(\state[1]_adj_9 ), 
         .C(n21115), .Z(draw_line_data_8__N_2184[5])) /* synthesis lut_function=(A (B (C))+!A ((C)+!B)) */ ;
    defparam n21116_bdd_3_lut_3_lut.init = 16'hd1d1;
    LUT4 i2412_1_lut (.A(the1_wr_done), .Z(n3961)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_show_pic.v(97[10] 100[30])
    defparam i2412_1_lut.init = 16'h5555;
    LUT4 i3538_4_lut (.A(state[3]), .B(length_num_flag), .C(n21595), .D(\state[2]_adj_10 ), 
         .Z(n5315)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd_draw_line.v(86[9] 91[16])
    defparam i3538_4_lut.init = 16'heca0;
    PFUMX i18825 (.BLUT(n21124), .ALUT(n21123), .C0(cnt_set_windows[0]), 
          .Z(n21125));
    PFUMX i19031 (.BLUT(n21731), .ALUT(n21732), .C0(cnt_set_windows[1]), 
          .Z(n21733));
    LUT4 i2_4_lut (.A(cnt_wr_color_data[9]), .B(n15), .C(cnt_wr_color_data[5]), 
         .D(n16), .Z(length_num_flag_N_2283)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;
    defparam i2_4_lut.init = 16'h0400;
    LUT4 i6_4_lut (.A(cnt_wr_color_data[3]), .B(\state[2]_adj_10 ), .C(cnt_wr_color_data[6]), 
         .D(cnt_wr_color_data[8]), .Z(n15)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i6_4_lut.init = 16'h8000;
    PFUMX i18818 (.BLUT(n21124), .ALUT(n21113), .C0(cnt_set_windows[0]), 
          .Z(n21115));
    LUT4 i7_4_lut (.A(cnt_wr_color_data[2]), .B(cnt_wr_color_data[1]), .C(cnt_wr_color_data[0]), 
         .D(n10), .Z(n16)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i7_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_adj_262 (.A(cnt_wr_color_data[7]), .B(cnt_wr_color_data[4]), 
         .Z(n10)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_262.init = 16'h8888;
    
endmodule
//
// Verilog Description of module edge_detect
//

module edge_detect (signal_r, clk_50MHz, draw_finish_flag) /* synthesis syn_module_defined=1 */ ;
    output signal_r;
    input clk_50MHz;
    input draw_finish_flag;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    
    FD1S3AX signal_r_9 (.D(draw_finish_flag), .CK(clk_50MHz), .Q(signal_r)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=13, LSE_RCOL=2, LSE_LLINE=55, LSE_RLINE=61 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pos_edge_detect.v(15[13:32])
    defparam signal_r_9.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module edge_detect_U0
//

module edge_detect_U0 (signal_r, clk_50MHz, clear_finish_flag) /* synthesis syn_module_defined=1 */ ;
    output signal_r;
    input clk_50MHz;
    input clear_finish_flag;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    
    FD1S3AX signal_r_9 (.D(clear_finish_flag), .CK(clk_50MHz), .Q(signal_r)) /* synthesis LSE_LINE_FILE_ID=24, LSE_LCOL=13, LSE_RCOL=2, LSE_LLINE=48, LSE_RLINE=54 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/pos_edge_detect.v(15[13:32])
    defparam signal_r_9.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module control
//

module control (state, clk_50MHz, \show_pic_data[7] , \data[7] , init_data, 
            draw_line_data, n4, n20045, n21671, n21609, n18697, 
            \state_2__N_1179[2] , \data[3] , \state[0]_adj_4 , n4_adj_5, 
            \state[5] , \state[3] , \draw_line_counter[3] , n3255, n19916, 
            \show_pic_data[2] , \data[2] , \state[1]_adj_6 , n18767, 
            \state_3__N_1103[1] , \state[2]_adj_7 , \state[4] , en_write_draw_line, 
            \show_pic_data[8] , lcd_dc_c_8, \show_pic_data[4] , n3, 
            n4_adj_8, \show_pic_counter[3] , n22, \show_pic_data[6] , 
            \data[6] , \data[5] , \show_pic_data[3] , \show_pic_data[1] , 
            \data[1] ) /* synthesis syn_module_defined=1 */ ;
    output [2:0]state;
    input clk_50MHz;
    input \show_pic_data[7] ;
    output \data[7] ;
    input [8:0]init_data;
    input [8:0]draw_line_data;
    output n4;
    input n20045;
    output n21671;
    input n21609;
    output n18697;
    input \state_2__N_1179[2] ;
    output \data[3] ;
    input \state[0]_adj_4 ;
    output n4_adj_5;
    input \state[5] ;
    input \state[3] ;
    output \draw_line_counter[3] ;
    input n3255;
    output n19916;
    input \show_pic_data[2] ;
    output \data[2] ;
    input \state[1]_adj_6 ;
    input n18767;
    output \state_3__N_1103[1] ;
    input \state[2]_adj_7 ;
    input \state[4] ;
    input en_write_draw_line;
    input \show_pic_data[8] ;
    output lcd_dc_c_8;
    input \show_pic_data[4] ;
    output n3;
    output n4_adj_8;
    output \show_pic_counter[3] ;
    output n22;
    input \show_pic_data[6] ;
    output \data[6] ;
    output \data[5] ;
    input \show_pic_data[3] ;
    input \show_pic_data[1] ;
    output \data[1] ;
    
    wire clk_50MHz /* synthesis SET_AS_NETWORK=\lcd1/clk_50MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/lcd.v(38[10:19])
    
    wire n5375, n4_c, n2, n5301;
    wire [2:0]state_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(28[13:18])
    wire [3:0]show_pic_counter;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(30[13:29])
    
    wire n21672, n18700;
    wire [3:0]draw_line_counter;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(29[13:30])
    
    wire n21643, n4_adj_2583, n4_adj_2584, n2_adj_2585, n5379, n5658, 
        state_2__N_1168, n3_c, n2_adj_2586, n21661;
    wire [3:0]n21;
    
    wire n4_adj_2589, n2_adj_2590, n4_adj_2592, n2_adj_2594, n4_adj_2595;
    wire [3:0]n21_adj_2604;
    
    wire n4_adj_2601, n2_adj_2602, n2_adj_2603;
    
    FD1S3AX state_FSM_i1 (.D(n5375), .CK(clk_50MHz), .Q(state[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam state_FSM_i1.GSR = "ENABLED";
    LUT4 i2_4_lut (.A(\show_pic_data[7] ), .B(n4_c), .C(state[1]), .D(n2), 
         .Z(\data[7] )) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_4_lut.init = 16'hffec;
    LUT4 i3524_1_lut (.A(state[2]), .Z(n5301)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i3524_1_lut.init = 16'h5555;
    LUT4 i1_4_lut (.A(init_data[0]), .B(draw_line_data[0]), .C(state_c[0]), 
         .D(state[2]), .Z(n4)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut.init = 16'heca0;
    FD1S3IX show_pic_counter_2102__i0 (.D(n18700), .CK(clk_50MHz), .CD(n21672), 
            .Q(show_pic_counter[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(78[25:45])
    defparam show_pic_counter_2102__i0.GSR = "ENABLED";
    FD1S3IX draw_line_counter_2100__i0 (.D(n21643), .CK(clk_50MHz), .CD(n5301), 
            .Q(draw_line_counter[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(85[26:47])
    defparam draw_line_counter_2100__i0.GSR = "ENABLED";
    LUT4 i2_4_lut_adj_251 (.A(n20045), .B(n4_adj_2583), .C(n21671), .D(n21609), 
         .Z(n18697)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i2_4_lut_adj_251.init = 16'hfefc;
    LUT4 data_8__I_0_Select_1_i4_2_lut (.A(init_data[1]), .B(state_c[0]), 
         .Z(n4_adj_2584)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_1_i4_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_1_i2_2_lut (.A(draw_line_data[1]), .B(state[2]), 
         .Z(n2_adj_2585)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_1_i2_2_lut.init = 16'h8888;
    FD1S3AX state_FSM_i2 (.D(n5379), .CK(clk_50MHz), .Q(state[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam state_FSM_i2.GSR = "ENABLED";
    FD1S3AY state_FSM_i3 (.D(n5658), .CK(clk_50MHz), .Q(state_c[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam state_FSM_i3.GSR = "ENABLED";
    FD1S3IX state_FSM_i4 (.D(\state_2__N_1179[2] ), .CK(clk_50MHz), .CD(n5301), 
            .Q(state_2__N_1168));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam state_FSM_i4.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_252 (.A(n3_c), .B(init_data[3]), .C(n2_adj_2586), 
         .D(state_c[0]), .Z(\data[3] )) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut_adj_252.init = 16'hfefa;
    LUT4 i1_2_lut (.A(state[1]), .B(\state[0]_adj_4 ), .Z(n4_adj_5)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i1_2_lut.init = 16'h8888;
    LUT4 i3599_4_lut (.A(state[1]), .B(\state[5] ), .C(\state[3] ), .D(n21661), 
         .Z(n5379)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i3599_4_lut.init = 16'hce0a;
    LUT4 i16318_2_lut_4_lut_4_lut (.A(draw_line_counter[1]), .B(draw_line_counter[2]), 
         .C(draw_line_counter[0]), .D(\draw_line_counter[3] ), .Z(n21[1])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(84[9:36])
    defparam i16318_2_lut_4_lut_4_lut.init = 16'hda5a;
    LUT4 i1_3_lut_4_lut (.A(draw_line_counter[1]), .B(draw_line_counter[2]), 
         .C(n3255), .D(draw_line_counter[0]), .Z(n19916)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(84[9:36])
    defparam i1_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i2_4_lut_adj_253 (.A(\show_pic_data[2] ), .B(n4_adj_2589), .C(state[1]), 
         .D(n2_adj_2590), .Z(\data[2] )) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_4_lut_adj_253.init = 16'hffec;
    LUT4 i18587_3_lut_rep_297 (.A(draw_line_counter[1]), .B(draw_line_counter[2]), 
         .C(draw_line_counter[0]), .D(\draw_line_counter[3] ), .Z(n21643)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A !(C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(84[9:36])
    defparam i18587_3_lut_rep_297.init = 16'h8f0f;
    LUT4 i16332_3_lut_4_lut_4_lut (.A(draw_line_counter[1]), .B(draw_line_counter[2]), 
         .C(draw_line_counter[0]), .D(\draw_line_counter[3] ), .Z(n21[3])) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(84[9:36])
    defparam i16332_3_lut_4_lut_4_lut.init = 16'hff80;
    LUT4 i16325_2_lut_3_lut_4_lut (.A(draw_line_counter[1]), .B(draw_line_counter[2]), 
         .C(draw_line_counter[0]), .D(\draw_line_counter[3] ), .Z(n21[2])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(84[9:36])
    defparam i16325_2_lut_3_lut_4_lut.init = 16'hec6c;
    LUT4 i2_4_lut_adj_254 (.A(\state[1]_adj_6 ), .B(n4_adj_2592), .C(state[1]), 
         .D(n18767), .Z(\state_3__N_1103[1] )) /* synthesis lut_function=(A (B+(C))+!A (B+!((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_4_lut_adj_254.init = 16'hecfc;
    LUT4 i1_4_lut_adj_255 (.A(\state[2]_adj_7 ), .B(n2_adj_2594), .C(state_c[0]), 
         .D(\state[4] ), .Z(n4_adj_2592)) /* synthesis lut_function=(A (B+(C))+!A (B+(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut_adj_255.init = 16'hfcec;
    LUT4 data_8__N_1151_I_0_i2_2_lut (.A(en_write_draw_line), .B(state[2]), 
         .Z(n2_adj_2594)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__N_1151_I_0_i2_2_lut.init = 16'h8888;
    LUT4 i2_3_lut (.A(\show_pic_data[8] ), .B(n4_adj_2595), .C(state[1]), 
         .Z(lcd_dc_c_8)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_3_lut.init = 16'hecec;
    LUT4 i1_4_lut_adj_256 (.A(init_data[8]), .B(draw_line_data[8]), .C(state_c[0]), 
         .D(state[2]), .Z(n4_adj_2595)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut_adj_256.init = 16'heca0;
    LUT4 reduce_or_340_i1_2_lut_rep_315 (.A(state_c[0]), .B(state_2__N_1168), 
         .Z(n21661)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam reduce_or_340_i1_2_lut_rep_315.init = 16'heeee;
    LUT4 i3876_2_lut_3_lut (.A(state_c[0]), .B(state_2__N_1168), .C(\state[5] ), 
         .Z(n5658)) /* synthesis lut_function=(!(A (C)+!A ((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i3876_2_lut_3_lut.init = 16'h0e0e;
    LUT4 data_8__I_0_Select_4_i3_2_lut (.A(\show_pic_data[4] ), .B(state[1]), 
         .Z(n3)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_4_i3_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_257 (.A(init_data[4]), .B(draw_line_data[4]), .C(state_c[0]), 
         .D(state[2]), .Z(n4_adj_8)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut_adj_257.init = 16'heca0;
    LUT4 i2_3_lut_rep_325 (.A(show_pic_counter[1]), .B(show_pic_counter[0]), 
         .C(show_pic_counter[2]), .Z(n21671)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i2_3_lut_rep_325.init = 16'h8080;
    LUT4 i1_2_lut_3_lut_4_lut (.A(show_pic_counter[1]), .B(show_pic_counter[0]), 
         .C(show_pic_counter[2]), .D(\show_pic_counter[3] ), .Z(n18700)) /* synthesis lut_function=(A ((C (D))+!B)+!A !(B)) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hb333;
    LUT4 i16289_2_lut_3_lut_4_lut_4_lut (.A(show_pic_counter[1]), .B(show_pic_counter[0]), 
         .C(show_pic_counter[2]), .D(\show_pic_counter[3] ), .Z(n21_adj_2604[1])) /* synthesis lut_function=(A ((C (D))+!B)+!A (B)) */ ;
    defparam i16289_2_lut_3_lut_4_lut_4_lut.init = 16'he666;
    LUT4 i16303_3_lut_4_lut_4_lut (.A(show_pic_counter[1]), .B(show_pic_counter[0]), 
         .C(show_pic_counter[2]), .D(\show_pic_counter[3] ), .Z(n22)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;
    defparam i16303_3_lut_4_lut_4_lut.init = 16'hff80;
    LUT4 i16296_2_lut_3_lut_4_lut_4_lut (.A(show_pic_counter[1]), .B(show_pic_counter[0]), 
         .C(show_pic_counter[2]), .D(\show_pic_counter[3] ), .Z(n21_adj_2604[2])) /* synthesis lut_function=(A (B ((D)+!C)+!B (C))+!A (C)) */ ;
    defparam i16296_2_lut_3_lut_4_lut_4_lut.init = 16'hf878;
    LUT4 i3521_1_lut_rep_326 (.A(state[1]), .Z(n21672)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i3521_1_lut_rep_326.init = 16'h5555;
    LUT4 i1_2_lut_2_lut (.A(state[1]), .B(\show_pic_counter[3] ), .Z(n4_adj_2583)) /* synthesis lut_function=((B)+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i1_2_lut_2_lut.init = 16'hdddd;
    LUT4 data_8__I_0_Select_7_i4_2_lut (.A(init_data[7]), .B(state_c[0]), 
         .Z(n4_c)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_7_i4_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_7_i2_2_lut (.A(draw_line_data[7]), .B(state[2]), 
         .Z(n2)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_7_i2_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_258 (.A(\show_pic_data[6] ), .B(n4_adj_2601), .C(state[1]), 
         .D(n2_adj_2602), .Z(\data[6] )) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_4_lut_adj_258.init = 16'hffec;
    LUT4 i1_4_lut_adj_259 (.A(n3_c), .B(init_data[5]), .C(n2_adj_2603), 
         .D(state_c[0]), .Z(\data[5] )) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i1_4_lut_adj_259.init = 16'hfefa;
    FD1S3IX show_pic_counter_2102__i1 (.D(n21_adj_2604[1]), .CK(clk_50MHz), 
            .CD(n21672), .Q(show_pic_counter[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(78[25:45])
    defparam show_pic_counter_2102__i1.GSR = "ENABLED";
    FD1S3IX show_pic_counter_2102__i2 (.D(n21_adj_2604[2]), .CK(clk_50MHz), 
            .CD(n21672), .Q(show_pic_counter[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(78[25:45])
    defparam show_pic_counter_2102__i2.GSR = "ENABLED";
    FD1S3IX show_pic_counter_2102__i3 (.D(n22), .CK(clk_50MHz), .CD(n21672), 
            .Q(\show_pic_counter[3] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(78[25:45])
    defparam show_pic_counter_2102__i3.GSR = "ENABLED";
    FD1S3IX draw_line_counter_2100__i1 (.D(n21[1]), .CK(clk_50MHz), .CD(n5301), 
            .Q(draw_line_counter[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(85[26:47])
    defparam draw_line_counter_2100__i1.GSR = "ENABLED";
    FD1S3IX draw_line_counter_2100__i2 (.D(n21[2]), .CK(clk_50MHz), .CD(n5301), 
            .Q(draw_line_counter[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(85[26:47])
    defparam draw_line_counter_2100__i2.GSR = "ENABLED";
    FD1S3IX draw_line_counter_2100__i3 (.D(n21[3]), .CK(clk_50MHz), .CD(n5301), 
            .Q(\draw_line_counter[3] ));   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(85[26:47])
    defparam draw_line_counter_2100__i3.GSR = "ENABLED";
    LUT4 data_8__I_0_Select_5_i3_2_lut (.A(\show_pic_data[3] ), .B(state[1]), 
         .Z(n3_c)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_5_i3_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_5_i2_2_lut (.A(draw_line_data[5]), .B(state[2]), 
         .Z(n2_adj_2603)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_5_i2_2_lut.init = 16'h8888;
    LUT4 i3596_4_lut (.A(state[2]), .B(\state[3] ), .C(\state_2__N_1179[2] ), 
         .D(state[1]), .Z(n5375)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(36[9] 66[16])
    defparam i3596_4_lut.init = 16'hce0a;
    LUT4 data_8__I_0_Select_6_i4_2_lut (.A(init_data[6]), .B(state_c[0]), 
         .Z(n4_adj_2601)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_6_i4_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_6_i2_2_lut (.A(draw_line_data[6]), .B(state[2]), 
         .Z(n2_adj_2602)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_6_i2_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_2_i4_2_lut (.A(init_data[2]), .B(state_c[0]), 
         .Z(n4_adj_2589)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_2_i4_2_lut.init = 16'h8888;
    LUT4 i2_4_lut_adj_260 (.A(\show_pic_data[1] ), .B(n4_adj_2584), .C(state[1]), 
         .D(n2_adj_2585), .Z(\data[1] )) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam i2_4_lut_adj_260.init = 16'hffec;
    LUT4 data_8__I_0_Select_2_i2_2_lut (.A(draw_line_data[2]), .B(state[2]), 
         .Z(n2_adj_2590)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_2_i2_2_lut.init = 16'h8888;
    LUT4 data_8__I_0_Select_3_i2_2_lut (.A(draw_line_data[3]), .B(state[2]), 
         .Z(n2_adj_2586)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/lcd/control.v(97[5] 129[12])
    defparam data_8__I_0_Select_3_i2_2_lut.init = 16'h8888;
    
endmodule
//
// Verilog Description of module jumping
//

module jumping (n21688, pic_y_8__N_814, pic_y_8__N_791, VCC_net, GND_net, 
            pic_y_8__N_782, pic_y_8__N_793, n22433, pic_y_8__N_792, 
            k, pic_y_8__N_785, pic_y_8__N_786, pic_y_8__N_787, pic_y_8__N_788, 
            pic_y_8__N_789, pic_y_8__N_790, pic_y_8__N_811, \hand_velocity[4] , 
            n21664, n21678, n21677, n21631, n21635, n21637, n21638, 
            n21630, handline, \hand_velocity[5] , \hand_velocity[1] , 
            \hand_velocity[3] , pic_y_8__N_796, \hand_velocity[6] , pic_y_8__N_799, 
            \hand_velocity[2] , pic_y_8__N_802, \hand_velocity[7] , pic_y_8__N_805, 
            pic_y_8__N_808, n21666, pic_y_8__N_817, clk_c) /* synthesis syn_module_defined=1 */ ;
    input n21688;
    input pic_y_8__N_814;
    input pic_y_8__N_791;
    input VCC_net;
    input GND_net;
    input pic_y_8__N_782;
    input pic_y_8__N_793;
    input n22433;
    input pic_y_8__N_792;
    input [1:0]k;
    input pic_y_8__N_785;
    input pic_y_8__N_786;
    input pic_y_8__N_787;
    input pic_y_8__N_788;
    input pic_y_8__N_789;
    input pic_y_8__N_790;
    input pic_y_8__N_811;
    input \hand_velocity[4] ;
    output n21664;
    output n21678;
    output n21677;
    output n21631;
    output n21635;
    output n21637;
    output n21638;
    output n21630;
    input [8:0]handline;
    input \hand_velocity[5] ;
    input \hand_velocity[1] ;
    input \hand_velocity[3] ;
    input pic_y_8__N_796;
    input \hand_velocity[6] ;
    input pic_y_8__N_799;
    input \hand_velocity[2] ;
    input pic_y_8__N_802;
    input \hand_velocity[7] ;
    input pic_y_8__N_805;
    input pic_y_8__N_808;
    output n21666;
    input pic_y_8__N_817;
    input clk_c;
    
    wire clk_out /* synthesis is_clock=1, SET_AS_NETWORK=\jump/clk_out */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(22[6:13])
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire [14:0]time_count_up;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(38[30:43])
    
    wire mult_15u_15u_0_pp_5_12, mult_15u_15u_0_pp_5_11, mult_15u_15u_0_cin_lr_10;
    wire [8:0]position;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(39[27:35])
    
    wire clk_out_enable_39;
    wire [8:0]position_8__N_925;
    wire [14:0]time_count_r;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(38[46:58])
    
    wire mult_15u_15u_0_pp_3_10, mult_15u_15u_0_pp_3_9, mco_21, mult_15u_15u_0_pp_3_8, 
        mult_15u_15u_0_pp_3_7, mult_15u_15u_0_cin_lr_6, mult_15u_15u_0_pp_4_12, 
        mult_15u_15u_0_pp_4_11, mco_28, mult_15u_15u_0_pp_4_10, mult_15u_15u_0_pp_4_9, 
        mult_15u_15u_0_cin_lr_8, mult_15u_15u_0_pp_3_12, mult_15u_15u_0_pp_3_11, 
        mco_22, mult_15u_15u_0_pp_3_10_adj_2335, mult_15u_15u_0_pp_3_9_adj_2336, 
        mco_21_adj_2337, mult_15u_15u_0_pp_3_8_adj_2338, mult_15u_15u_0_pp_3_7_adj_2339, 
        mult_15u_15u_0_cin_lr_6_adj_2340, mult_15u_15u_0_pp_2_10, mult_15u_15u_0_pp_2_9, 
        mco_15, mult_15u_15u_0_pp_2_8, mult_15u_15u_0_pp_2_7, mco_14, 
        mult_15u_15u_0_pp_2_12, mult_15u_15u_0_pp_2_11, mco_16, mult_15u_15u_0_pp_2_6, 
        mult_15u_15u_0_pp_2_5, mult_15u_15u_0_cin_lr_4, mult_15u_15u_0_pp_2_10_adj_2341, 
        mult_15u_15u_0_pp_2_9_adj_2342, mco_15_adj_2343, mult_15u_15u_0_pp_2_8_adj_2344, 
        mult_15u_15u_0_pp_2_7_adj_2345, mco_14_adj_2346, n10823;
    wire [8:0]pic_y_8__N_773;
    
    wire mult_15u_15u_0_pp_2_6_adj_2347, mult_15u_15u_0_pp_2_5_adj_2348, 
        mult_15u_15u_0_cin_lr_4_adj_2349, mult_15u_15u_0_pp_1_10, mult_15u_15u_0_pp_1_9, 
        mco_9, n10822, mult_15u_15u_0_pp_1_8, mult_15u_15u_0_pp_1_7, 
        mco_8, mult_15u_15u_0_pp_1_12, mult_15u_15u_0_pp_1_11, mco_10, 
        mult_15u_15u_0_pp_1_10_adj_2350, mult_15u_15u_0_pp_1_9_adj_2351, 
        mco_9_adj_2352, mult_15u_15u_0_pp_1_8_adj_2353, mult_15u_15u_0_pp_1_7_adj_2354, 
        mco_8_adj_2355, mult_15u_15u_0_pp_1_6, mult_15u_15u_0_pp_1_5, 
        mco_7, mult_15u_15u_0_pp_1_6_adj_2356, mult_15u_15u_0_pp_1_5_adj_2357, 
        mco_7_adj_2358, mult_15u_15u_0_pp_1_4, mult_15u_15u_0_pp_1_3, 
        mult_15u_15u_0_cin_lr_2, mult_15u_15u_0_pp_1_4_adj_2359, mult_15u_15u_0_pp_1_3_adj_2360, 
        mult_15u_15u_0_cin_lr_2_adj_2361, mult_15u_15u_0_pp_0_10, mult_15u_15u_0_pp_0_9, 
        mco_3, mult_15u_15u_0_pp_0_8, mult_15u_15u_0_pp_0_7, mco_2, 
        mult_15u_15u_0_pp_0_6, mult_15u_15u_0_pp_0_5, mco_1, mult_15u_15u_0_pp_0_4, 
        mult_15u_15u_0_pp_0_3, mco, mult_15u_15u_0_pp_0_12, mult_15u_15u_0_pp_0_11, 
        mco_4, mult_15u_15u_0_pp_0_10_adj_2362, mult_15u_15u_0_pp_0_9_adj_2363, 
        mco_3_adj_2364, mult_15u_15u_0_pp_0_8_adj_2365, mult_15u_15u_0_pp_0_7_adj_2366, 
        mco_2_adj_2367, mult_15u_15u_0_pp_0_6_adj_2368, mult_15u_15u_0_pp_0_5_adj_2369, 
        mco_1_adj_2370, mult_15u_15u_0_pp_0_4_adj_2371, mult_15u_15u_0_pp_0_3_adj_2372, 
        mco_adj_2373, mult_15u_15u_0_pp_0_2, mult_15u_15u_0_cin_lr_0, 
        mult_15u_15u_0_pp_0_2_adj_2374, mult_15u_15u_0_cin_lr_0_adj_2375, 
        clk_out_enable_25, n3664;
    wire [15:0]n134;
    
    wire mult_32u_3u_0_pp_1_5;
    wire [15:0]n419;
    
    wire mult_32u_3u_0_pp_1_5_adj_2376, mult_15u_15u_0_pp_4_8;
    wire [29:0]n537;
    
    wire co_t_mult_15u_15u_0_6_2, s_mult_15u_15u_0_2_11, s_mult_15u_15u_0_5_12, 
        s_mult_15u_15u_0_4_11, s_mult_15u_15u_0_4_12, co_t_mult_15u_15u_0_6_1, 
        s_mult_15u_15u_0_2_10, s_mult_15u_15u_0_4_9, s_mult_15u_15u_0_4_10, 
        s_mult_15u_15u_0_4_8, mult_15u_15u_0_pp_4_8_adj_2377;
    wire [1:0]current_state;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(35[11:24])
    wire [14:0]time_count_up_14__N_1005;
    wire [29:0]n585;
    
    wire co_t_mult_15u_15u_0_6_1_adj_2378, s_mult_15u_15u_0_2_10_adj_2379, 
        s_mult_15u_15u_0_4_9_adj_2380, s_mult_15u_15u_0_4_10_adj_2381, mult_15u_15u_0_pp_4_9_adj_2382, 
        s_mult_15u_15u_0_4_8_adj_2383;
    wire [1:0]current_state_1__N_822;
    wire [14:0]time_count_down;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(38[12:27])
    wire [14:0]time_count_down_14__N_956;
    
    wire n10772, n10769, n10094, mult_15u_15u_0_pp_6_12, s_mult_15u_15u_0_2_12, 
        co_mult_15u_15u_0_4_4, s_mult_15u_15u_0_1_11, s_mult_15u_15u_0_1_12, 
        s_mult_15u_15u_0_0_11, s_mult_15u_15u_0_0_12, co_mult_15u_15u_0_4_3, 
        s_mult_15u_15u_0_1_9, s_mult_15u_15u_0_1_10, s_mult_15u_15u_0_0_9, 
        s_mult_15u_15u_0_0_10, co_mult_15u_15u_0_4_2, s_mult_15u_15u_0_1_7, 
        s_mult_15u_15u_0_1_8, s_mult_15u_15u_0_0_7, s_mult_15u_15u_0_0_8, 
        co_mult_15u_15u_0_4_1, s_mult_15u_15u_0_1_6, s_mult_15u_15u_0_0_5, 
        s_mult_15u_15u_0_0_6, n22446, mult_15u_15u_0_pp_2_4, s_mult_15u_15u_0_0_4, 
        co_mult_15u_15u_0_4_3_adj_2384, s_mult_15u_15u_0_1_9_adj_2385, s_mult_15u_15u_0_1_10_adj_2386, 
        s_mult_15u_15u_0_0_9_adj_2387, s_mult_15u_15u_0_0_10_adj_2388, co_mult_15u_15u_0_2_1, 
        mult_15u_15u_0_pp_5_10, co_mult_15u_15u_0_4_2_adj_2389, s_mult_15u_15u_0_1_7_adj_2390, 
        s_mult_15u_15u_0_1_8_adj_2391, s_mult_15u_15u_0_0_7_adj_2392, s_mult_15u_15u_0_0_8_adj_2393, 
        co_mult_15u_15u_0_1_3, co_mult_15u_15u_0_1_2, co_mult_15u_15u_0_4_1_adj_2394, 
        s_mult_15u_15u_0_1_6_adj_2395, s_mult_15u_15u_0_0_5_adj_2396, s_mult_15u_15u_0_0_6_adj_2397, 
        co_mult_15u_15u_0_1_1, mult_15u_15u_0_pp_3_6, mult_15u_15u_0_pp_2_4_adj_2398, 
        s_mult_15u_15u_0_0_4_adj_2399, co_mult_15u_15u_0_0_5, co_mult_15u_15u_0_0_4, 
        co_mult_15u_15u_0_0_3, co_mult_15u_15u_0_0_2, co_mult_15u_15u_0_0_1, 
        mult_15u_15u_0_pp_1_2, mult_32u_3u_0_cin_lr_0, mult_15u_15u_0_pp_5_10_adj_2400, 
        mult_15u_15u_0_pp_4_10_adj_2401, co_mult_15u_15u_0_1_2_adj_2402, 
        co_mult_15u_15u_0_1_1_adj_2403, mult_15u_15u_0_pp_3_6_adj_2404, 
        co_mult_15u_15u_0_0_4_adj_2405, mult_32u_3u_0_pp_1_14, mult_32u_3u_0_pp_1_13, 
        mult_32u_3u_0_pp_1_12, mult_32u_3u_0_pp_1_11, mult_32u_3u_0_pp_1_10, 
        mult_32u_3u_0_pp_1_9, co_mult_15u_15u_0_0_3_adj_2406, mult_32u_3u_0_pp_1_8, 
        mult_32u_3u_0_pp_1_7, mult_32u_3u_0_pp_1_6, co_mult_15u_15u_0_0_2_adj_2407, 
        co_mult_15u_15u_0_0_1_adj_2408, n10776, n10166, mult_15u_15u_0_pp_1_2_adj_2409, 
        n18325, stop_flag_N_1026, mult_15u_15u_0_cin_lr_8_adj_2410;
    wire [14:0]n5057;
    
    wire mult_32u_3u_0_pp_0_14, mult_32u_3u_0_pp_0_13, mco_5, mult_32u_3u_0_pp_0_12, 
        mult_32u_3u_0_pp_0_11, mco_4_adj_2411, mult_32u_3u_0_pp_0_10, 
        mult_32u_3u_0_pp_0_9, mco_3_adj_2412, mult_32u_3u_0_pp_0_8, mult_32u_3u_0_pp_0_7, 
        mco_2_adj_2413, mult_32u_3u_0_pp_0_6, mult_32u_3u_0_pp_0_5, mco_1_adj_2414, 
        mult_32u_3u_0_pp_0_4, mult_32u_3u_0_pp_0_3, mco_adj_2415, n10783, 
        n10170, mult_32u_3u_0_pp_0_2, n18230;
    wire [14:0]n118;
    
    wire n10790, n10174;
    wire [34:0]n3207;
    
    wire co_t_mult_32u_3u_0_0_6, co_t_mult_32u_3u_0_0_5, co_t_mult_32u_3u_0_0_4, 
        co_t_mult_32u_3u_0_0_3, co_t_mult_32u_3u_0_0_2, co_t_mult_32u_3u_0_0_1, 
        mult_32u_3u_0_pp_1_3, mult_32u_3u_0_pp_1_4, mult_32u_3u_0_pp_1_2, 
        mult_32u_3u_0_cin_lr_0_adj_2416, n10797, n10178, n10804, n10182, 
        mult_32u_3u_0_pp_1_18, mult_32u_3u_0_pp_1_17, mult_32u_3u_0_pp_1_16, 
        mult_32u_3u_0_pp_1_15, mult_32u_3u_0_pp_1_14_adj_2417, mult_32u_3u_0_pp_1_13_adj_2418, 
        mult_32u_3u_0_pp_1_12_adj_2419, mult_32u_3u_0_pp_1_11_adj_2420, 
        mult_32u_3u_0_pp_1_10_adj_2421, mult_32u_3u_0_pp_1_9_adj_2422, mult_32u_3u_0_pp_1_8_adj_2423, 
        mult_32u_3u_0_pp_1_7_adj_2424, mult_32u_3u_0_pp_1_6_adj_2425;
    wire [8:0]n1205;
    
    wire n21537, n10811, n10190, mult_32u_3u_0_pp_0_18, mult_32u_3u_0_pp_0_17, 
        mco_7_adj_2426, mult_32u_3u_0_pp_0_16, mult_32u_3u_0_pp_0_15, 
        mco_6, mult_32u_3u_0_pp_0_14_adj_2427, mult_32u_3u_0_pp_0_13_adj_2428, 
        mco_5_adj_2429, mult_32u_3u_0_pp_0_12_adj_2430, mult_32u_3u_0_pp_0_11_adj_2431, 
        mco_4_adj_2432, mult_32u_3u_0_pp_0_10_adj_2433, mult_32u_3u_0_pp_0_9_adj_2434, 
        mco_3_adj_2435, n4, n12, n20419, n14, mult_32u_3u_0_pp_0_8_adj_2436, 
        mult_32u_3u_0_pp_0_7_adj_2437, mco_2_adj_2438, mult_32u_3u_0_pp_0_6_adj_2439, 
        mult_32u_3u_0_pp_0_5_adj_2440, mco_1_adj_2441, mult_32u_3u_0_pp_0_4_adj_2442, 
        mult_32u_3u_0_pp_0_3_adj_2443, mco_adj_2444, mult_32u_3u_0_pp_0_2_adj_2445, 
        n10818, n10194;
    wire [34:0]n3170;
    
    wire co_t_mult_32u_3u_0_0_8, co_t_mult_32u_3u_0_0_7, co_t_mult_32u_3u_0_0_6_adj_2446, 
        co_t_mult_32u_3u_0_0_5_adj_2447, co_t_mult_32u_3u_0_0_4_adj_2448, 
        co_t_mult_32u_3u_0_0_3_adj_2449, co_t_mult_32u_3u_0_0_2_adj_2450, 
        co_t_mult_32u_3u_0_0_1_adj_2451, mult_32u_3u_0_pp_1_3_adj_2452, 
        mult_32u_3u_0_pp_1_4_adj_2453, mult_32u_3u_0_pp_1_2_adj_2454, n10819, 
        n18229, n18228, n18324;
    wire [10:0]n105;
    
    wire n21547;
    wire [10:0]n727;
    wire [8:0]n2;
    wire [8:0]n13;
    wire [8:0]n17998;
    
    wire n18323, n18227, n18322, n18321;
    wire [8:0]n1;
    
    wire n14426, n18596, n536, n1284, n18226, n18320, n18225, 
        n18319, n18318;
    wire [10:0]init_velocity;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(40[12:25])
    
    wire n21524, n8, n10, n18224, n19848, n21550, n6, n21590, 
        n21589, mult_15u_15u_0_pp_4_8_adj_2455, n10_adj_2456, n10093, 
        n8_adj_2457, n16, clk_out_enable_46, n10914, n6_adj_2458, 
        n10849;
    wire [10:0]init_velocity_10__N_934;
    
    wire n10825, n10252;
    wire [8:0]pic_y_8__N_907;
    
    wire n10916;
    wire [8:0]pic_y_8__N_916;
    
    wire n3816, n3814, n3812, n18447, n3810, n3808, n3806, n3804, 
        n10918, n3802, n18222, n10779, n10784, n10777, n18446, 
        n18445, n18444, n3800;
    wire [8:0]init_position;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(39[11:24])
    wire [8:0]init_position_8__N_990;
    
    wire n18221, n10793, n10798, n10786, n10791, n10912, n18220, 
        n10807, n10812, n10800, n10805, n18219, n10821, n10826, 
        n10814;
    wire [10:0]init_velocity_10__N_945;
    
    wire n10828, n10910;
    wire [10:0]init_velocity_10__N_887;
    
    wire n10765, n10770, mult_11u_15u_0_pp_4_8, n3798, n3796, n14432, 
        n3794, n3792, n3790, n18294, n18293;
    wire [29:0]n29;
    wire [25:0]n60;
    
    wire n19938, n18292;
    wire [8:0]n397;
    
    wire mult_15u_15u_0_pp_3_6_adj_2467, mult_15u_15u_0_pp_2_4_adj_2468, 
        mult_15u_15u_0_pp_1_2_adj_2469, mult_15u_15u_0_cin_lr_2_adj_2470, 
        mult_15u_15u_0_cin_lr_4_adj_2471, mult_15u_15u_0_cin_lr_6_adj_2472, 
        mult_15u_15u_0_cin_lr_8_adj_2473, mult_15u_15u_0_cin_lr_10_adj_2474, 
        co_mult_15u_15u_0_0_1_adj_2475, mult_15u_15u_0_pp_0_2_adj_2476, 
        co_mult_15u_15u_0_0_2_adj_2477, s_mult_15u_15u_0_0_4_adj_2478, mult_15u_15u_0_pp_0_4_adj_2479, 
        mult_15u_15u_0_pp_0_3_adj_2480, mult_15u_15u_0_pp_1_4_adj_2481, 
        mult_15u_15u_0_pp_1_3_adj_2482, co_mult_15u_15u_0_0_3_adj_2483, 
        s_mult_15u_15u_0_0_5_adj_2484, s_mult_15u_15u_0_0_6_adj_2485, mult_15u_15u_0_pp_0_6_adj_2486, 
        mult_15u_15u_0_pp_0_5_adj_2487, mult_15u_15u_0_pp_1_6_adj_2488, 
        mult_15u_15u_0_pp_1_5_adj_2489, co_mult_15u_15u_0_0_4_adj_2490, 
        s_mult_15u_15u_0_0_7_adj_2491, s_mult_15u_15u_0_0_8_adj_2492, mult_15u_15u_0_pp_0_8_adj_2493, 
        mult_15u_15u_0_pp_0_7_adj_2494, mult_15u_15u_0_pp_1_8_adj_2495, 
        mult_15u_15u_0_pp_1_7_adj_2496, co_mult_15u_15u_0_0_5_adj_2497, 
        s_mult_15u_15u_0_0_9_adj_2498, s_mult_15u_15u_0_0_10_adj_2499, mult_15u_15u_0_pp_0_10_adj_2500, 
        mult_15u_15u_0_pp_0_9_adj_2501, mult_15u_15u_0_pp_1_10_adj_2502, 
        mult_15u_15u_0_pp_1_9_adj_2503, s_mult_15u_15u_0_0_11_adj_2504, 
        s_mult_15u_15u_0_0_12_adj_2505, mult_15u_15u_0_pp_0_12_adj_2506, 
        mult_15u_15u_0_pp_0_11_adj_2507, mult_15u_15u_0_pp_1_12_adj_2508, 
        mult_15u_15u_0_pp_1_11_adj_2509, co_mult_15u_15u_0_1_1_adj_2510, 
        s_mult_15u_15u_0_1_6_adj_2511, mult_15u_15u_0_pp_2_6_adj_2512, co_mult_15u_15u_0_1_2_adj_2513, 
        s_mult_15u_15u_0_1_7_adj_2514, s_mult_15u_15u_0_1_8_adj_2515, mult_15u_15u_0_pp_2_8_adj_2516, 
        mult_15u_15u_0_pp_2_7_adj_2517, mult_15u_15u_0_pp_3_8_adj_2518, 
        mult_15u_15u_0_pp_3_7_adj_2519, co_mult_15u_15u_0_1_3_adj_2520, 
        s_mult_15u_15u_0_1_9_adj_2521, s_mult_15u_15u_0_1_10_adj_2522, mult_15u_15u_0_pp_2_10_adj_2523, 
        mult_15u_15u_0_pp_2_9_adj_2524, mult_15u_15u_0_pp_3_10_adj_2525, 
        mult_15u_15u_0_pp_3_9_adj_2526, s_mult_15u_15u_0_1_11_adj_2527, 
        s_mult_15u_15u_0_1_12_adj_2528, mult_15u_15u_0_pp_2_12_adj_2529, 
        mult_15u_15u_0_pp_2_11_adj_2530, mult_15u_15u_0_pp_3_12_adj_2531, 
        mult_15u_15u_0_pp_3_11_adj_2532, mult_15u_15u_0_pp_5_10_adj_2533, 
        co_mult_15u_15u_0_2_1_adj_2534, s_mult_15u_15u_0_2_10_adj_2535, 
        mult_15u_15u_0_pp_4_10_adj_2536, s_mult_15u_15u_0_2_12_adj_2537, 
        s_mult_15u_15u_0_2_11_adj_2538, mult_15u_15u_0_pp_4_12_adj_2539, 
        mult_15u_15u_0_pp_4_11_adj_2540, mult_15u_15u_0_pp_5_12_adj_2541, 
        mult_15u_15u_0_pp_5_11_adj_2542, co_mult_15u_15u_0_4_1_adj_2543, 
        co_mult_15u_15u_0_4_2_adj_2544, mult_15u_15u_0_pp_2_5_adj_2545, 
        co_mult_15u_15u_0_4_3_adj_2546, s_mult_15u_15u_0_4_8_adj_2547, co_mult_15u_15u_0_4_4_adj_2548, 
        s_mult_15u_15u_0_4_9_adj_2549, s_mult_15u_15u_0_4_10_adj_2550, s_mult_15u_15u_0_4_11_adj_2551, 
        s_mult_15u_15u_0_4_12_adj_2552, mult_15u_15u_0_pp_6_12_adj_2553, 
        s_mult_15u_15u_0_5_12_adj_2554, co_t_mult_15u_15u_0_6_1_adj_2555, 
        co_t_mult_15u_15u_0_6_2_adj_2556, mult_15u_15u_0_pp_4_9_adj_2557, 
        mult_15u_15u_0_cin_lr_0_adj_2558, mco_adj_2559, mco_1_adj_2560, 
        mco_2_adj_2561, mco_3_adj_2562, mco_4_adj_2563, mco_7_adj_2564, 
        mco_8_adj_2565, mco_9_adj_2566, mco_10_adj_2567, mco_14_adj_2568, 
        mco_15_adj_2569, mco_16_adj_2570, mco_21_adj_2571, mco_22_adj_2572, 
        mco_28_adj_2573, mult_11u_15u_0_pp_3_6, mult_11u_15u_0_pp_2_4, 
        mult_11u_15u_0_pp_1_2, mult_11u_15u_0_cin_lr_2, mult_11u_15u_0_cin_lr_4, 
        mult_11u_15u_0_cin_lr_6, co_mult_11u_15u_0_0_1, mult_11u_15u_0_pp_0_2, 
        co_mult_11u_15u_0_0_2, s_mult_11u_15u_0_0_4, mult_11u_15u_0_pp_0_4, 
        mult_11u_15u_0_pp_0_3, mult_11u_15u_0_pp_1_4, mult_11u_15u_0_pp_1_3, 
        co_mult_11u_15u_0_0_3, s_mult_11u_15u_0_0_5, s_mult_11u_15u_0_0_6, 
        mult_11u_15u_0_pp_0_6, mult_11u_15u_0_pp_0_5, mult_11u_15u_0_pp_1_6, 
        mult_11u_15u_0_pp_1_5, s_mult_11u_15u_0_0_7, s_mult_11u_15u_0_0_8, 
        mult_11u_15u_0_pp_0_8, mult_11u_15u_0_pp_0_7, mult_11u_15u_0_pp_1_8, 
        mult_11u_15u_0_pp_1_7, co_mult_11u_15u_0_1_1, s_mult_11u_15u_0_1_6, 
        mult_11u_15u_0_pp_2_6, s_mult_11u_15u_0_1_7, s_mult_11u_15u_0_1_8, 
        mult_11u_15u_0_pp_2_8, mult_11u_15u_0_pp_2_7, mult_11u_15u_0_pp_3_8, 
        mult_11u_15u_0_pp_3_7, co_mult_11u_15u_0_3_1, co_mult_11u_15u_0_3_2, 
        mult_11u_15u_0_pp_2_5, s_mult_11u_15u_0_3_8, mult_11u_15u_0_cin_lr_0, 
        mco_adj_2574, mco_1_adj_2575, mco_2_adj_2576, mco_7_adj_2577, 
        mco_8_adj_2578, mco_14_adj_2579, n10816, n18291, n10815, n10795, 
        n10794, n21588, n10809, n10808, n10802, n10801, n21556, 
        n21593, n10781, n10780, n21586, n18290, n10788, n10787, 
        n18289, n4_adj_2580, n10774, n10773, n18288, n21591, n18287, 
        n21526;
    wire [14:0]n1274;
    
    wire n18282;
    wire [14:0]n2231;
    
    wire n18281, n18280, n18279, n18278, n18277, n8889, n18276, 
        n21525, n10767, n10766, n18259, n21592, n18258, n18257, 
        n18256, n18255, n18356, n18355, n18354, n18353, n18254, 
        n18253, n18252, n18251, n18346, n18345, n18344, n18250, 
        n18343, n18249, n20417, n20406, n18246, n18245, n18244, 
        n18243, n18242, n18241, n18240;
    
    MULT2 mult_15u_15u_0_mult_10_0 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[11]), 
          .B1(time_count_up[10]), .B2(time_count_up[11]), .B3(time_count_up[10]), 
          .CI(mult_15u_15u_0_cin_lr_10), .P0(mult_15u_15u_0_pp_5_11), .P1(mult_15u_15u_0_pp_5_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX position_i8 (.D(position_8__N_925[8]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i8.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_6_1 (.A0(time_count_r[2]), .A1(time_count_r[3]), 
          .A2(time_count_r[3]), .A3(time_count_r[4]), .B0(time_count_up[7]), 
          .B1(time_count_up[6]), .B2(time_count_up[7]), .B3(time_count_up[6]), 
          .CI(mco_21), .P0(mult_15u_15u_0_pp_3_9), .P1(mult_15u_15u_0_pp_3_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_6_0 (.A0(time_count_r[0]), .A1(time_count_r[1]), 
          .A2(time_count_r[1]), .A3(time_count_r[2]), .B0(time_count_up[7]), 
          .B1(time_count_up[6]), .B2(time_count_up[7]), .B3(time_count_up[6]), 
          .CI(mult_15u_15u_0_cin_lr_6), .CO(mco_21), .P0(mult_15u_15u_0_pp_3_7), 
          .P1(mult_15u_15u_0_pp_3_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_8_1 (.A0(time_count_up[2]), .A1(time_count_up[3]), 
          .A2(time_count_up[3]), .A3(time_count_up[4]), .B0(time_count_up[9]), 
          .B1(time_count_up[8]), .B2(time_count_up[9]), .B3(time_count_up[8]), 
          .CI(mco_28), .P0(mult_15u_15u_0_pp_4_11), .P1(mult_15u_15u_0_pp_4_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_8_0 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[9]), 
          .B1(time_count_up[8]), .B2(time_count_up[9]), .B3(time_count_up[8]), 
          .CI(mult_15u_15u_0_cin_lr_8), .CO(mco_28), .P0(mult_15u_15u_0_pp_4_9), 
          .P1(mult_15u_15u_0_pp_4_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX position_i7 (.D(position_8__N_925[7]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i7.GSR = "DISABLED";
    FD1P3DX position_i6 (.D(position_8__N_925[6]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i6.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_6_2 (.A0(time_count_up[4]), .A1(time_count_up[5]), 
          .A2(time_count_up[5]), .A3(time_count_up[6]), .B0(time_count_up[7]), 
          .B1(time_count_up[6]), .B2(time_count_up[7]), .B3(time_count_up[6]), 
          .CI(mco_22), .P0(mult_15u_15u_0_pp_3_11), .P1(mult_15u_15u_0_pp_3_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_6_1_adj_94 (.A0(time_count_up[2]), .A1(time_count_up[3]), 
          .A2(time_count_up[3]), .A3(time_count_up[4]), .B0(time_count_up[7]), 
          .B1(time_count_up[6]), .B2(time_count_up[7]), .B3(time_count_up[6]), 
          .CI(mco_21_adj_2337), .CO(mco_22), .P0(mult_15u_15u_0_pp_3_9_adj_2336), 
          .P1(mult_15u_15u_0_pp_3_10_adj_2335)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_6_0_adj_95 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[7]), 
          .B1(time_count_up[6]), .B2(time_count_up[7]), .B3(time_count_up[6]), 
          .CI(mult_15u_15u_0_cin_lr_6_adj_2340), .CO(mco_21_adj_2337), .P0(mult_15u_15u_0_pp_3_7_adj_2339), 
          .P1(mult_15u_15u_0_pp_3_8_adj_2338)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_4_2 (.A0(time_count_r[4]), .A1(time_count_r[5]), 
          .A2(time_count_r[5]), .A3(time_count_r[6]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mco_15), .P0(mult_15u_15u_0_pp_2_9), .P1(mult_15u_15u_0_pp_2_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_4_1 (.A0(time_count_r[2]), .A1(time_count_r[3]), 
          .A2(time_count_r[3]), .A3(time_count_r[4]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mco_14), .CO(mco_15), .P0(mult_15u_15u_0_pp_2_7), .P1(mult_15u_15u_0_pp_2_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_4_3 (.A0(time_count_up[6]), .A1(time_count_up[7]), 
          .A2(time_count_up[7]), .A3(time_count_up[8]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mco_16), .P0(mult_15u_15u_0_pp_2_11), .P1(mult_15u_15u_0_pp_2_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_4_0 (.A0(time_count_r[0]), .A1(time_count_r[1]), 
          .A2(time_count_r[1]), .A3(time_count_r[2]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mult_15u_15u_0_cin_lr_4), .CO(mco_14), .P0(mult_15u_15u_0_pp_2_5), 
          .P1(mult_15u_15u_0_pp_2_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_4_2_adj_96 (.A0(time_count_up[4]), .A1(time_count_up[5]), 
          .A2(time_count_up[5]), .A3(time_count_up[6]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mco_15_adj_2343), .CO(mco_16), .P0(mult_15u_15u_0_pp_2_9_adj_2342), 
          .P1(mult_15u_15u_0_pp_2_10_adj_2341)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_4_1_adj_97 (.A0(time_count_up[2]), .A1(time_count_up[3]), 
          .A2(time_count_up[3]), .A3(time_count_up[4]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mco_14_adj_2346), .CO(mco_15_adj_2343), .P0(mult_15u_15u_0_pp_2_7_adj_2345), 
          .P1(mult_15u_15u_0_pp_2_8_adj_2344)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1S3DX pic_y_i1_9005_9006_reset (.D(pic_y_8__N_773[1]), .CK(clk_out), 
            .CD(pic_y_8__N_814), .Q(n10823)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i1_9005_9006_reset.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_4_0_adj_98 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[5]), 
          .B1(time_count_up[4]), .B2(time_count_up[5]), .B3(time_count_up[4]), 
          .CI(mult_15u_15u_0_cin_lr_4_adj_2349), .CO(mco_14_adj_2346), .P0(mult_15u_15u_0_pp_2_5_adj_2348), 
          .P1(mult_15u_15u_0_pp_2_6_adj_2347)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_3 (.A0(time_count_r[6]), .A1(time_count_r[7]), 
          .A2(time_count_r[7]), .A3(time_count_r[8]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_9), .P0(mult_15u_15u_0_pp_1_9), .P1(mult_15u_15u_0_pp_1_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1S3BX pic_y_i1_9005_9006_set (.D(pic_y_8__N_773[1]), .CK(clk_out), 
            .PD(pic_y_8__N_791), .Q(n10822)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i1_9005_9006_set.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_2_2 (.A0(time_count_r[4]), .A1(time_count_r[5]), 
          .A2(time_count_r[5]), .A3(time_count_r[6]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_8), .CO(mco_9), .P0(mult_15u_15u_0_pp_1_7), .P1(mult_15u_15u_0_pp_1_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_2_4 (.A0(time_count_up[8]), .A1(time_count_up[9]), 
          .A2(time_count_up[9]), .A3(time_count_up[10]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_10), .P0(mult_15u_15u_0_pp_1_11), .P1(mult_15u_15u_0_pp_1_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_3_adj_99 (.A0(time_count_up[6]), .A1(time_count_up[7]), 
          .A2(time_count_up[7]), .A3(time_count_up[8]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_9_adj_2352), .CO(mco_10), .P0(mult_15u_15u_0_pp_1_9_adj_2351), 
          .P1(mult_15u_15u_0_pp_1_10_adj_2350)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_2_adj_100 (.A0(time_count_up[4]), .A1(time_count_up[5]), 
          .A2(time_count_up[5]), .A3(time_count_up[6]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_8_adj_2355), .CO(mco_9_adj_2352), .P0(mult_15u_15u_0_pp_1_7_adj_2354), 
          .P1(mult_15u_15u_0_pp_1_8_adj_2353)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_1 (.A0(time_count_r[2]), .A1(time_count_r[3]), 
          .A2(time_count_r[3]), .A3(time_count_r[4]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_7), .CO(mco_8), .P0(mult_15u_15u_0_pp_1_5), .P1(mult_15u_15u_0_pp_1_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_2_1_adj_101 (.A0(time_count_up[2]), .A1(time_count_up[3]), 
          .A2(time_count_up[3]), .A3(time_count_up[4]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mco_7_adj_2358), .CO(mco_8_adj_2355), .P0(mult_15u_15u_0_pp_1_5_adj_2357), 
          .P1(mult_15u_15u_0_pp_1_6_adj_2356)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_0 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mult_15u_15u_0_cin_lr_2), .CO(mco_7_adj_2358), .P0(mult_15u_15u_0_pp_1_3), 
          .P1(mult_15u_15u_0_pp_1_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_2_0_adj_102 (.A0(time_count_r[0]), .A1(time_count_r[1]), 
          .A2(time_count_r[1]), .A3(time_count_r[2]), .B0(time_count_up[3]), 
          .B1(time_count_up[2]), .B2(time_count_up[3]), .B3(time_count_up[2]), 
          .CI(mult_15u_15u_0_cin_lr_2_adj_2361), .CO(mco_7), .P0(mult_15u_15u_0_pp_1_3_adj_2360), 
          .P1(mult_15u_15u_0_pp_1_4_adj_2359)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_0_4 (.A0(time_count_r[8]), .A1(time_count_r[9]), 
          .A2(time_count_r[9]), .A3(time_count_r[10]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_3), .P0(mult_15u_15u_0_pp_0_9), .P1(mult_15u_15u_0_pp_0_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_0_3 (.A0(time_count_r[6]), .A1(time_count_r[7]), 
          .A2(time_count_r[7]), .A3(time_count_r[8]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_2), .CO(mco_3), .P0(mult_15u_15u_0_pp_0_7), .P1(mult_15u_15u_0_pp_0_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_0_2 (.A0(time_count_r[4]), .A1(time_count_r[5]), 
          .A2(time_count_r[5]), .A3(time_count_r[6]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_1), .CO(mco_2), .P0(mult_15u_15u_0_pp_0_5), .P1(mult_15u_15u_0_pp_0_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_0_1 (.A0(time_count_r[2]), .A1(time_count_r[3]), 
          .A2(time_count_r[3]), .A3(time_count_r[4]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco), .CO(mco_1), .P0(mult_15u_15u_0_pp_0_3), .P1(mult_15u_15u_0_pp_0_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_15u_15u_0_mult_0_5 (.A0(time_count_up[10]), .A1(time_count_up[11]), 
          .A2(time_count_up[11]), .A3(time_count_up[12]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_4), .P0(mult_15u_15u_0_pp_0_11), .P1(mult_15u_15u_0_pp_0_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_4_adj_103 (.A0(time_count_up[8]), .A1(time_count_up[9]), 
          .A2(time_count_up[9]), .A3(time_count_up[10]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_3_adj_2364), .CO(mco_4), .P0(mult_15u_15u_0_pp_0_9_adj_2363), 
          .P1(mult_15u_15u_0_pp_0_10_adj_2362)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_3_adj_104 (.A0(time_count_up[6]), .A1(time_count_up[7]), 
          .A2(time_count_up[7]), .A3(time_count_up[8]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_2_adj_2367), .CO(mco_3_adj_2364), .P0(mult_15u_15u_0_pp_0_7_adj_2366), 
          .P1(mult_15u_15u_0_pp_0_8_adj_2365)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_2_adj_105 (.A0(time_count_up[4]), .A1(time_count_up[5]), 
          .A2(time_count_up[5]), .A3(time_count_up[6]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_1_adj_2370), .CO(mco_2_adj_2367), .P0(mult_15u_15u_0_pp_0_5_adj_2369), 
          .P1(mult_15u_15u_0_pp_0_6_adj_2368)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_1_adj_106 (.A0(time_count_up[2]), .A1(time_count_up[3]), 
          .A2(time_count_up[3]), .A3(time_count_up[4]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mco_adj_2373), .CO(mco_1_adj_2370), .P0(mult_15u_15u_0_pp_0_3_adj_2372), 
          .P1(mult_15u_15u_0_pp_0_4_adj_2371)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_0 (.A0(time_count_up[0]), .A1(time_count_up[1]), 
          .A2(time_count_up[1]), .A3(time_count_up[2]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mult_15u_15u_0_cin_lr_0), .CO(mco_adj_2373), .P1(mult_15u_15u_0_pp_0_2)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    MULT2 mult_15u_15u_0_mult_0_0_adj_107 (.A0(time_count_r[0]), .A1(time_count_r[1]), 
          .A2(time_count_r[1]), .A3(time_count_r[2]), .B0(time_count_up[1]), 
          .B1(time_count_up[0]), .B2(time_count_up[1]), .B3(time_count_up[0]), 
          .CI(mult_15u_15u_0_cin_lr_0_adj_2375), .CO(mco), .P1(mult_15u_15u_0_pp_0_2_adj_2374)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1P3DX time_count_r_i0_i0 (.D(n3664), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i0.GSR = "DISABLED";
    AND2 AND2_t28 (.A(n134[3]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_5)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(126[10:65])
    AND2 AND2_t28_adj_108 (.A(n419[3]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_5_adj_2376)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(126[10:65])
    AND2 AND2_t17 (.A(time_count_up[0]), .B(time_count_up[8]), .Z(mult_15u_15u_0_pp_4_8)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(401[10:66])
    FD1P3DX position_i5 (.D(position_8__N_925[5]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i5.GSR = "DISABLED";
    FADD2B t_mult_15u_15u_0_add_6_3 (.A0(s_mult_15u_15u_0_4_11), .A1(s_mult_15u_15u_0_4_12), 
           .B0(s_mult_15u_15u_0_2_11), .B1(s_mult_15u_15u_0_5_12), .CI(co_t_mult_15u_15u_0_6_2), 
           .S0(n537[11])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B t_mult_15u_15u_0_add_6_2 (.A0(s_mult_15u_15u_0_4_9), .A1(s_mult_15u_15u_0_4_10), 
           .B0(mult_15u_15u_0_pp_4_9), .B1(s_mult_15u_15u_0_2_10), .CI(co_t_mult_15u_15u_0_6_1), 
           .COUT(co_t_mult_15u_15u_0_6_2), .S0(n537[9]), .S1(n537[10])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B Cadd_t_mult_15u_15u_0_6_1 (.A0(GND_net), .A1(s_mult_15u_15u_0_4_8), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_4_8), .CI(GND_net), .COUT(co_t_mult_15u_15u_0_6_1), 
           .S1(n537[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX position_i4 (.D(position_8__N_925[4]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i4.GSR = "DISABLED";
    AND2 AND2_t17_adj_109 (.A(time_count_r[0]), .B(time_count_up[8]), .Z(mult_15u_15u_0_pp_4_8_adj_2377)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(401[10:66])
    FD1P3DX time_count_up_i0 (.D(time_count_up_14__N_1005[0]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i0.GSR = "DISABLED";
    FD1P3DX position_i3 (.D(position_8__N_925[3]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i3.GSR = "DISABLED";
    FADD2B t_mult_15u_15u_0_add_6_2_adj_110 (.A0(s_mult_15u_15u_0_4_9_adj_2380), 
           .A1(s_mult_15u_15u_0_4_10_adj_2381), .B0(mult_15u_15u_0_pp_4_9_adj_2382), 
           .B1(s_mult_15u_15u_0_2_10_adj_2379), .CI(co_t_mult_15u_15u_0_6_1_adj_2378), 
           .S0(n585[9]), .S1(n585[10])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B Cadd_t_mult_15u_15u_0_6_1_adj_111 (.A0(GND_net), .A1(s_mult_15u_15u_0_4_8_adj_2383), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_4_8_adj_2377), .CI(GND_net), 
           .COUT(co_t_mult_15u_15u_0_6_1_adj_2378), .S1(n585[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1P3DX position_i0 (.D(position_8__N_925[0]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i0.GSR = "DISABLED";
    FD1S3DX current_state_i0 (.D(current_state_1__N_822[0]), .CK(clk_out), 
            .CD(n21688), .Q(current_state[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam current_state_i0.GSR = "DISABLED";
    FD1P3DX time_count_down_i0 (.D(time_count_down_14__N_956[0]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i0.GSR = "DISABLED";
    FD1S1D i8955 (.D(n22433), .CK(pic_y_8__N_782), .CD(pic_y_8__N_793), 
           .Q(n10772));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8955.GSR = "DISABLED";
    FD1S3BX init_position_i0_8952_8953_set (.D(n10094), .CK(clk_out), .PD(pic_y_8__N_792), 
            .Q(n10769)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i0_8952_8953_set.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_5_1 (.A0(GND_net), .A1(s_mult_15u_15u_0_2_12), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_6_12), .CI(GND_net), .S1(s_mult_15u_15u_0_5_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX position_i2 (.D(position_8__N_925[2]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i2.GSR = "DISABLED";
    FD1P3DX position_i1 (.D(position_8__N_925[1]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(position[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam position_i1.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_4_5 (.A0(s_mult_15u_15u_0_0_11), .A1(s_mult_15u_15u_0_0_12), 
           .B0(s_mult_15u_15u_0_1_11), .B1(s_mult_15u_15u_0_1_12), .CI(co_mult_15u_15u_0_4_4), 
           .S0(s_mult_15u_15u_0_4_11), .S1(s_mult_15u_15u_0_4_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_4_4 (.A0(s_mult_15u_15u_0_0_9), .A1(s_mult_15u_15u_0_0_10), 
           .B0(s_mult_15u_15u_0_1_9), .B1(s_mult_15u_15u_0_1_10), .CI(co_mult_15u_15u_0_4_3), 
           .COUT(co_mult_15u_15u_0_4_4), .S0(s_mult_15u_15u_0_4_9), .S1(s_mult_15u_15u_0_4_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_4_3 (.A0(s_mult_15u_15u_0_0_7), .A1(s_mult_15u_15u_0_0_8), 
           .B0(s_mult_15u_15u_0_1_7), .B1(s_mult_15u_15u_0_1_8), .CI(co_mult_15u_15u_0_4_2), 
           .COUT(co_mult_15u_15u_0_4_3), .S0(n537[7]), .S1(s_mult_15u_15u_0_4_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_4_2 (.A0(s_mult_15u_15u_0_0_5), .A1(s_mult_15u_15u_0_0_6), 
           .B0(mult_15u_15u_0_pp_2_5_adj_2348), .B1(s_mult_15u_15u_0_1_6), 
           .CI(co_mult_15u_15u_0_4_1), .COUT(co_mult_15u_15u_0_4_2), .S0(n537[5]), 
           .S1(n537[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1S3DX current_state_i0_rep_350 (.D(current_state_1__N_822[0]), .CK(clk_out), 
            .CD(n21688), .Q(n22446)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam current_state_i0_rep_350.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_4_1 (.A0(GND_net), .A1(s_mult_15u_15u_0_0_4), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_2_4), .CI(GND_net), .COUT(co_mult_15u_15u_0_4_1), 
           .S1(n537[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_4_4_adj_112 (.A0(s_mult_15u_15u_0_0_9_adj_2387), 
           .A1(s_mult_15u_15u_0_0_10_adj_2388), .B0(s_mult_15u_15u_0_1_9_adj_2385), 
           .B1(s_mult_15u_15u_0_1_10_adj_2386), .CI(co_mult_15u_15u_0_4_3_adj_2384), 
           .S0(s_mult_15u_15u_0_4_9_adj_2380), .S1(s_mult_15u_15u_0_4_10_adj_2381)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_add_2_2 (.A0(mult_15u_15u_0_pp_4_11), .A1(mult_15u_15u_0_pp_4_12), 
           .B0(mult_15u_15u_0_pp_5_11), .B1(mult_15u_15u_0_pp_5_12), .CI(co_mult_15u_15u_0_2_1), 
           .S0(s_mult_15u_15u_0_2_11), .S1(s_mult_15u_15u_0_2_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B Cadd_mult_15u_15u_0_2_1 (.A0(GND_net), .A1(mult_15u_15u_0_pp_4_10), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_5_10), .CI(GND_net), .COUT(co_mult_15u_15u_0_2_1), 
           .S1(s_mult_15u_15u_0_2_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX time_count_up_i14 (.D(time_count_up_14__N_1005[14]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i14.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_4_3_adj_113 (.A0(s_mult_15u_15u_0_0_7_adj_2392), 
           .A1(s_mult_15u_15u_0_0_8_adj_2393), .B0(s_mult_15u_15u_0_1_7_adj_2390), 
           .B1(s_mult_15u_15u_0_1_8_adj_2391), .CI(co_mult_15u_15u_0_4_2_adj_2389), 
           .COUT(co_mult_15u_15u_0_4_3_adj_2384), .S0(n585[7]), .S1(s_mult_15u_15u_0_4_8_adj_2383)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_add_1_4 (.A0(mult_15u_15u_0_pp_2_11), .A1(mult_15u_15u_0_pp_2_12), 
           .B0(mult_15u_15u_0_pp_3_11), .B1(mult_15u_15u_0_pp_3_12), .CI(co_mult_15u_15u_0_1_3), 
           .S0(s_mult_15u_15u_0_1_11), .S1(s_mult_15u_15u_0_1_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_1_3 (.A0(mult_15u_15u_0_pp_2_9_adj_2342), .A1(mult_15u_15u_0_pp_2_10_adj_2341), 
           .B0(mult_15u_15u_0_pp_3_9_adj_2336), .B1(mult_15u_15u_0_pp_3_10_adj_2335), 
           .CI(co_mult_15u_15u_0_1_2), .COUT(co_mult_15u_15u_0_1_3), .S0(s_mult_15u_15u_0_1_9), 
           .S1(s_mult_15u_15u_0_1_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_4_2_adj_114 (.A0(s_mult_15u_15u_0_0_5_adj_2396), 
           .A1(s_mult_15u_15u_0_0_6_adj_2397), .B0(mult_15u_15u_0_pp_2_5), 
           .B1(s_mult_15u_15u_0_1_6_adj_2395), .CI(co_mult_15u_15u_0_4_1_adj_2394), 
           .COUT(co_mult_15u_15u_0_4_2_adj_2389), .S0(n585[5]), .S1(n585[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_add_1_2 (.A0(mult_15u_15u_0_pp_2_7_adj_2345), .A1(mult_15u_15u_0_pp_2_8_adj_2344), 
           .B0(mult_15u_15u_0_pp_3_7_adj_2339), .B1(mult_15u_15u_0_pp_3_8_adj_2338), 
           .CI(co_mult_15u_15u_0_1_1), .COUT(co_mult_15u_15u_0_1_2), .S0(s_mult_15u_15u_0_1_7), 
           .S1(s_mult_15u_15u_0_1_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B Cadd_mult_15u_15u_0_1_1 (.A0(GND_net), .A1(mult_15u_15u_0_pp_2_6_adj_2347), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_3_6), .CI(GND_net), .COUT(co_mult_15u_15u_0_1_1), 
           .S1(s_mult_15u_15u_0_1_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B Cadd_mult_15u_15u_0_4_1_adj_115 (.A0(GND_net), .A1(s_mult_15u_15u_0_0_4_adj_2399), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_2_4_adj_2398), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_4_1_adj_2394), .S1(n585[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1P3DX time_count_up_i13 (.D(time_count_up_14__N_1005[13]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i13.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_0_6 (.A0(mult_15u_15u_0_pp_0_11), .A1(mult_15u_15u_0_pp_0_12), 
           .B0(mult_15u_15u_0_pp_1_11), .B1(mult_15u_15u_0_pp_1_12), .CI(co_mult_15u_15u_0_0_5), 
           .S0(s_mult_15u_15u_0_0_11), .S1(s_mult_15u_15u_0_0_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_0_5 (.A0(mult_15u_15u_0_pp_0_9_adj_2363), .A1(mult_15u_15u_0_pp_0_10_adj_2362), 
           .B0(mult_15u_15u_0_pp_1_9_adj_2351), .B1(mult_15u_15u_0_pp_1_10_adj_2350), 
           .CI(co_mult_15u_15u_0_0_4), .COUT(co_mult_15u_15u_0_0_5), .S0(s_mult_15u_15u_0_0_9), 
           .S1(s_mult_15u_15u_0_0_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_0_4 (.A0(mult_15u_15u_0_pp_0_7_adj_2366), .A1(mult_15u_15u_0_pp_0_8_adj_2365), 
           .B0(mult_15u_15u_0_pp_1_7_adj_2354), .B1(mult_15u_15u_0_pp_1_8_adj_2353), 
           .CI(co_mult_15u_15u_0_0_3), .COUT(co_mult_15u_15u_0_0_4), .S0(s_mult_15u_15u_0_0_7), 
           .S1(s_mult_15u_15u_0_0_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_add_0_3 (.A0(mult_15u_15u_0_pp_0_5_adj_2369), .A1(mult_15u_15u_0_pp_0_6_adj_2368), 
           .B0(mult_15u_15u_0_pp_1_5_adj_2357), .B1(mult_15u_15u_0_pp_1_6_adj_2356), 
           .CI(co_mult_15u_15u_0_0_2), .COUT(co_mult_15u_15u_0_0_3), .S0(s_mult_15u_15u_0_0_5), 
           .S1(s_mult_15u_15u_0_0_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX time_count_up_i12 (.D(time_count_up_14__N_1005[12]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i12.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_0_2 (.A0(mult_15u_15u_0_pp_0_3_adj_2372), .A1(mult_15u_15u_0_pp_0_4_adj_2371), 
           .B0(mult_15u_15u_0_pp_1_3), .B1(mult_15u_15u_0_pp_1_4), .CI(co_mult_15u_15u_0_0_1), 
           .COUT(co_mult_15u_15u_0_0_2), .S0(n537[3]), .S1(s_mult_15u_15u_0_0_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B Cadd_mult_15u_15u_0_0_1 (.A0(GND_net), .A1(mult_15u_15u_0_pp_0_2), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_1_2), .CI(GND_net), .COUT(co_mult_15u_15u_0_0_1)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_cin_lr_add_10 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_cin_lr_add_8 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_cin_lr_add_6 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_6_adj_2340)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_cin_lr_add_4 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_4_adj_2349)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FADD2B mult_15u_15u_0_cin_lr_add_2 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_2)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1P3DX time_count_up_i11 (.D(time_count_up_14__N_1005[11]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i11.GSR = "DISABLED";
    AND2 AND2_t20 (.A(time_count_up[0]), .B(time_count_up[2]), .Z(mult_15u_15u_0_pp_1_2)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(395[10:66])
    AND2 AND2_t19 (.A(time_count_up[0]), .B(time_count_up[4]), .Z(mult_15u_15u_0_pp_2_4)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(397[10:66])
    AND2 AND2_t18 (.A(time_count_up[0]), .B(time_count_up[6]), .Z(mult_15u_15u_0_pp_3_6)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(399[10:66])
    FADD2B mult_32u_3u_0_cin_lr_add_0 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_32u_3u_0_cin_lr_0)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B Cadd_mult_15u_15u_0_2_1_adj_116 (.A0(GND_net), .A1(mult_15u_15u_0_pp_4_10_adj_2401), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_5_10_adj_2400), .CI(GND_net), 
           .S1(s_mult_15u_15u_0_2_10_adj_2379)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1P3DX time_count_up_i10 (.D(time_count_up_14__N_1005[10]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i10.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_1_3_adj_117 (.A0(mult_15u_15u_0_pp_2_9), .A1(mult_15u_15u_0_pp_2_10), 
           .B0(mult_15u_15u_0_pp_3_9), .B1(mult_15u_15u_0_pp_3_10), .CI(co_mult_15u_15u_0_1_2_adj_2402), 
           .S0(s_mult_15u_15u_0_1_9_adj_2385), .S1(s_mult_15u_15u_0_1_10_adj_2386)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_add_1_2_adj_118 (.A0(mult_15u_15u_0_pp_2_7), .A1(mult_15u_15u_0_pp_2_8), 
           .B0(mult_15u_15u_0_pp_3_7), .B1(mult_15u_15u_0_pp_3_8), .CI(co_mult_15u_15u_0_1_1_adj_2403), 
           .COUT(co_mult_15u_15u_0_1_2_adj_2402), .S0(s_mult_15u_15u_0_1_7_adj_2390), 
           .S1(s_mult_15u_15u_0_1_8_adj_2391)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B Cadd_mult_15u_15u_0_1_1_adj_119 (.A0(GND_net), .A1(mult_15u_15u_0_pp_2_6), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_3_6_adj_2404), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_1_1_adj_2403), .S1(s_mult_15u_15u_0_1_6_adj_2395)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1P3DX time_count_up_i9 (.D(time_count_up_14__N_1005[9]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i9.GSR = "DISABLED";
    FD1P3DX time_count_up_i8 (.D(time_count_up_14__N_1005[8]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i8.GSR = "DISABLED";
    FD1P3DX time_count_up_i7 (.D(time_count_up_14__N_1005[7]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i7.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_add_0_5_adj_120 (.A0(mult_15u_15u_0_pp_0_9), .A1(mult_15u_15u_0_pp_0_10), 
           .B0(mult_15u_15u_0_pp_1_9), .B1(mult_15u_15u_0_pp_1_10), .CI(co_mult_15u_15u_0_0_4_adj_2405), 
           .S0(s_mult_15u_15u_0_0_9_adj_2387), .S1(s_mult_15u_15u_0_0_10_adj_2388)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    AND2 AND2_t19_adj_121 (.A(n419[12]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_14)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(144[10:67])
    AND2 AND2_t20_adj_122 (.A(n419[11]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_13)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(142[10:67])
    AND2 AND2_t21 (.A(n419[10]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_12)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(140[10:67])
    AND2 AND2_t22 (.A(n419[9]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_11)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(138[10:66])
    AND2 AND2_t23 (.A(n419[8]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_10)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(136[10:66])
    AND2 AND2_t24 (.A(n419[7]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_9)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(134[10:65])
    FADD2B mult_15u_15u_0_add_0_4_adj_123 (.A0(mult_15u_15u_0_pp_0_7), .A1(mult_15u_15u_0_pp_0_8), 
           .B0(mult_15u_15u_0_pp_1_7), .B1(mult_15u_15u_0_pp_1_8), .CI(co_mult_15u_15u_0_0_3_adj_2406), 
           .COUT(co_mult_15u_15u_0_0_4_adj_2405), .S0(s_mult_15u_15u_0_0_7_adj_2392), 
           .S1(s_mult_15u_15u_0_0_8_adj_2393)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    AND2 AND2_t25 (.A(n419[6]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_8)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(132[10:65])
    AND2 AND2_t26 (.A(n419[5]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_7)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(130[10:65])
    AND2 AND2_t27 (.A(n419[4]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_6)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(128[10:65])
    FADD2B mult_15u_15u_0_add_0_3_adj_124 (.A0(mult_15u_15u_0_pp_0_5), .A1(mult_15u_15u_0_pp_0_6), 
           .B0(mult_15u_15u_0_pp_1_5), .B1(mult_15u_15u_0_pp_1_6), .CI(co_mult_15u_15u_0_0_2_adj_2407), 
           .COUT(co_mult_15u_15u_0_0_3_adj_2406), .S0(s_mult_15u_15u_0_0_5_adj_2396), 
           .S1(s_mult_15u_15u_0_0_6_adj_2397)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_add_0_2_adj_125 (.A0(mult_15u_15u_0_pp_0_3), .A1(mult_15u_15u_0_pp_0_4), 
           .B0(mult_15u_15u_0_pp_1_3_adj_2360), .B1(mult_15u_15u_0_pp_1_4_adj_2359), 
           .CI(co_mult_15u_15u_0_0_1_adj_2408), .COUT(co_mult_15u_15u_0_0_2_adj_2407), 
           .S0(n585[3]), .S1(s_mult_15u_15u_0_0_4_adj_2399)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FD1S3BX init_position_i8_8959_8960_set (.D(n10166), .CK(clk_out), .PD(pic_y_8__N_782), 
            .Q(n10776)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i8_8959_8960_set.GSR = "DISABLED";
    FD1P3DX time_count_up_i6 (.D(time_count_up_14__N_1005[6]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i6.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_0_1_adj_126 (.A0(GND_net), .A1(mult_15u_15u_0_pp_0_2_adj_2374), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_1_2_adj_2409), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_0_1_adj_2408), .S1(n585[2])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    CCU2D sub_1765_add_2_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18325), .S0(stop_flag_N_1026));
    defparam sub_1765_add_2_cout.INIT0 = 16'h0000;
    defparam sub_1765_add_2_cout.INIT1 = 16'h0000;
    defparam sub_1765_add_2_cout.INJECT1_0 = "NO";
    defparam sub_1765_add_2_cout.INJECT1_1 = "NO";
    FADD2B mult_15u_15u_0_cin_lr_add_8_adj_127 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_8_adj_2410)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    FADD2B mult_15u_15u_0_cin_lr_add_6_adj_128 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_32u_3u_0_mult_0_6 (.A0(n419[12]), .A1(n419[13]), .A2(n419[13]), 
          .A3(n5057[14]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_5), .P0(mult_32u_3u_0_pp_0_13), .P1(mult_32u_3u_0_pp_0_14)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B mult_15u_15u_0_cin_lr_add_4_adj_129 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_32u_3u_0_mult_0_5 (.A0(n419[10]), .A1(n419[11]), .A2(n419[11]), 
          .A3(n419[12]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_4_adj_2411), .CO(mco_5), .P0(mult_32u_3u_0_pp_0_11), 
          .P1(mult_32u_3u_0_pp_0_12)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B mult_15u_15u_0_cin_lr_add_2_adj_130 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_2_adj_2361)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    MULT2 mult_32u_3u_0_mult_0_4 (.A0(n419[8]), .A1(n419[9]), .A2(n419[9]), 
          .A3(n419[10]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_3_adj_2412), .CO(mco_4_adj_2411), .P0(mult_32u_3u_0_pp_0_9), 
          .P1(mult_32u_3u_0_pp_0_10)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    AND2 AND2_t20_adj_131 (.A(time_count_r[0]), .B(time_count_up[2]), .Z(mult_15u_15u_0_pp_1_2_adj_2409)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(395[10:66])
    MULT2 mult_32u_3u_0_mult_0_3 (.A0(n419[6]), .A1(n419[7]), .A2(n419[7]), 
          .A3(n419[8]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_2_adj_2413), .CO(mco_3_adj_2412), .P0(mult_32u_3u_0_pp_0_7), 
          .P1(mult_32u_3u_0_pp_0_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    MULT2 mult_32u_3u_0_mult_0_2 (.A0(n419[4]), .A1(n419[5]), .A2(n419[5]), 
          .A3(n419[6]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_1_adj_2414), .CO(mco_2_adj_2413), .P0(mult_32u_3u_0_pp_0_5), 
          .P1(mult_32u_3u_0_pp_0_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    MULT2 mult_32u_3u_0_mult_0_1 (.A0(n419[2]), .A1(n419[3]), .A2(n419[3]), 
          .A3(n419[4]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_adj_2415), .CO(mco_1_adj_2414), .P0(mult_32u_3u_0_pp_0_3), 
          .P1(mult_32u_3u_0_pp_0_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FD1S3BX init_position_i7_8966_8967_set (.D(n10170), .CK(clk_out), .PD(pic_y_8__N_785), 
            .Q(n10783)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i7_8966_8967_set.GSR = "DISABLED";
    MULT2 mult_32u_3u_0_mult_0_0 (.A0(n419[0]), .A1(n419[1]), .A2(n419[1]), 
          .A3(n419[2]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mult_32u_3u_0_cin_lr_0), .CO(mco_adj_2415), .P1(mult_32u_3u_0_pp_0_2)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    CCU2D add_14_15 (.A0(time_count_down[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18230), .S0(n118[13]), .S1(n118[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_15.INIT0 = 16'h5aaa;
    defparam add_14_15.INIT1 = 16'h5aaa;
    defparam add_14_15.INJECT1_0 = "NO";
    defparam add_14_15.INJECT1_1 = "NO";
    FD1S3BX init_position_i6_8973_8974_set (.D(n10174), .CK(clk_out), .PD(pic_y_8__N_786), 
            .Q(n10790)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i6_8973_8974_set.GSR = "DISABLED";
    FD1P3DX time_count_up_i5 (.D(time_count_up_14__N_1005[5]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i5.GSR = "DISABLED";
    FADD2B t_mult_32u_3u_0_add_0_7 (.A0(mult_32u_3u_0_pp_0_13), .A1(mult_32u_3u_0_pp_0_14), 
           .B0(mult_32u_3u_0_pp_1_13), .B1(mult_32u_3u_0_pp_1_14), .CI(co_t_mult_32u_3u_0_0_6), 
           .S0(n3207[13])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B t_mult_32u_3u_0_add_0_6 (.A0(mult_32u_3u_0_pp_0_11), .A1(mult_32u_3u_0_pp_0_12), 
           .B0(mult_32u_3u_0_pp_1_11), .B1(mult_32u_3u_0_pp_1_12), .CI(co_t_mult_32u_3u_0_0_5), 
           .COUT(co_t_mult_32u_3u_0_0_6), .S0(n3207[11]), .S1(n3207[12])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B t_mult_32u_3u_0_add_0_5 (.A0(mult_32u_3u_0_pp_0_9), .A1(mult_32u_3u_0_pp_0_10), 
           .B0(mult_32u_3u_0_pp_1_9), .B1(mult_32u_3u_0_pp_1_10), .CI(co_t_mult_32u_3u_0_0_4), 
           .COUT(co_t_mult_32u_3u_0_0_5), .S0(n3207[9]), .S1(n3207[10])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B t_mult_32u_3u_0_add_0_4 (.A0(mult_32u_3u_0_pp_0_7), .A1(mult_32u_3u_0_pp_0_8), 
           .B0(mult_32u_3u_0_pp_1_7), .B1(mult_32u_3u_0_pp_1_8), .CI(co_t_mult_32u_3u_0_0_3), 
           .COUT(co_t_mult_32u_3u_0_0_4), .S0(n3207[7]), .S1(n3207[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B t_mult_32u_3u_0_add_0_3 (.A0(mult_32u_3u_0_pp_0_5), .A1(mult_32u_3u_0_pp_0_6), 
           .B0(mult_32u_3u_0_pp_1_5_adj_2376), .B1(mult_32u_3u_0_pp_1_6), 
           .CI(co_t_mult_32u_3u_0_0_2), .COUT(co_t_mult_32u_3u_0_0_3), .S0(n3207[5]), 
           .S1(n3207[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FADD2B t_mult_32u_3u_0_add_0_2 (.A0(mult_32u_3u_0_pp_0_3), .A1(mult_32u_3u_0_pp_0_4), 
           .B0(mult_32u_3u_0_pp_1_3), .B1(mult_32u_3u_0_pp_1_4), .CI(co_t_mult_32u_3u_0_0_1), 
           .COUT(co_t_mult_32u_3u_0_0_2), .S0(n3207[3]), .S1(n3207[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FD1P3DX time_count_up_i4 (.D(time_count_up_14__N_1005[4]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i4.GSR = "DISABLED";
    FADD2B Cadd_t_mult_32u_3u_0_0_1 (.A0(GND_net), .A1(mult_32u_3u_0_pp_0_2), 
           .B0(GND_net), .B1(mult_32u_3u_0_pp_1_2), .CI(GND_net), .COUT(co_t_mult_32u_3u_0_0_1)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[26:68])
    FD1P3DX time_count_up_i3 (.D(time_count_up_14__N_1005[3]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i3.GSR = "DISABLED";
    AND2 AND2_t19_adj_132 (.A(time_count_r[0]), .B(time_count_up[4]), .Z(mult_15u_15u_0_pp_2_4_adj_2398)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(397[10:66])
    AND2 AND2_t31 (.A(n419[0]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_2)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(120[10:65])
    AND2 AND2_t30 (.A(n419[1]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_3)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(122[10:65])
    AND2 AND2_t29 (.A(n419[2]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_4)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(124[10:65])
    AND2 AND2_t18_adj_133 (.A(time_count_r[0]), .B(time_count_up[6]), .Z(mult_15u_15u_0_pp_3_6_adj_2404)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(399[10:66])
    FADD2B mult_32u_3u_0_cin_lr_add_0_adj_134 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_32u_3u_0_cin_lr_0_adj_2416)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FD1S3BX init_position_i5_8980_8981_set (.D(n10178), .CK(clk_out), .PD(pic_y_8__N_787), 
            .Q(n10797)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i5_8980_8981_set.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_cin_lr_add_0 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_0)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[28:59])
    FD1S3BX init_position_i4_8987_8988_set (.D(n10182), .CK(clk_out), .PD(pic_y_8__N_788), 
            .Q(n10804)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i4_8987_8988_set.GSR = "DISABLED";
    FD1P3DX time_count_up_i2 (.D(time_count_up_14__N_1005[2]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i2.GSR = "DISABLED";
    FD1P3DX time_count_up_i1 (.D(time_count_up_14__N_1005[1]), .SP(current_state[0]), 
            .CK(clk_out), .CD(n21688), .Q(time_count_up[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_up_i1.GSR = "DISABLED";
    AND2 AND2_t15 (.A(n134[15]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_18)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(152[10:67])
    AND2 AND2_t16 (.A(n134[15]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_17)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(150[10:67])
    AND2 AND2_t17_adj_135 (.A(n134[14]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_16)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(148[10:67])
    AND2 AND2_t18_adj_136 (.A(n134[13]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_15)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(146[10:67])
    AND2 AND2_t19_adj_137 (.A(n134[12]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_14_adj_2417)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(144[10:67])
    AND2 AND2_t20_adj_138 (.A(n134[11]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_13_adj_2418)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(142[10:67])
    AND2 AND2_t21_adj_139 (.A(n134[10]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_12_adj_2419)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(140[10:67])
    AND2 AND2_t22_adj_140 (.A(n134[9]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_11_adj_2420)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(138[10:66])
    AND2 AND2_t23_adj_141 (.A(n134[8]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_10_adj_2421)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(136[10:66])
    AND2 AND2_t24_adj_142 (.A(n134[7]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_9_adj_2422)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(134[10:65])
    AND2 AND2_t25_adj_143 (.A(n134[6]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_8_adj_2423)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(132[10:65])
    AND2 AND2_t26_adj_144 (.A(n134[5]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_7_adj_2424)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(130[10:65])
    AND2 AND2_t27_adj_145 (.A(n134[4]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_6_adj_2425)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(128[10:65])
    LUT4 i12286_2_lut (.A(n1205[3]), .B(n21537), .Z(position_8__N_925[3])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12286_2_lut.init = 16'h2222;
    FD1S3BX init_position_i3_8994_8995_set (.D(n10190), .CK(clk_out), .PD(pic_y_8__N_789), 
            .Q(n10811)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i3_8994_8995_set.GSR = "DISABLED";
    MULT2 mult_32u_3u_0_mult_0_8 (.A0(n134[15]), .A1(n134[15]), .A2(n134[15]), 
          .A3(n134[15]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_7_adj_2426), .P0(mult_32u_3u_0_pp_0_17), .P1(mult_32u_3u_0_pp_0_18)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_7 (.A0(n134[14]), .A1(n134[15]), .A2(n134[15]), 
          .A3(n134[15]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_6), .CO(mco_7_adj_2426), .P0(mult_32u_3u_0_pp_0_15), 
          .P1(mult_32u_3u_0_pp_0_16)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_6_adj_146 (.A0(n134[12]), .A1(n134[13]), 
          .A2(n134[13]), .A3(n134[14]), .B0(k[1]), .B1(k[0]), .B2(k[1]), 
          .B3(k[0]), .CI(mco_5_adj_2429), .CO(mco_6), .P0(mult_32u_3u_0_pp_0_13_adj_2428), 
          .P1(mult_32u_3u_0_pp_0_14_adj_2427)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_5_adj_147 (.A0(n134[10]), .A1(n134[11]), 
          .A2(n134[11]), .A3(n134[12]), .B0(k[1]), .B1(k[0]), .B2(k[1]), 
          .B3(k[0]), .CI(mco_4_adj_2432), .CO(mco_5_adj_2429), .P0(mult_32u_3u_0_pp_0_11_adj_2431), 
          .P1(mult_32u_3u_0_pp_0_12_adj_2430)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_4_adj_148 (.A0(n134[8]), .A1(n134[9]), .A2(n134[9]), 
          .A3(n134[10]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_3_adj_2435), .CO(mco_4_adj_2432), .P0(mult_32u_3u_0_pp_0_9_adj_2434), 
          .P1(mult_32u_3u_0_pp_0_10_adj_2433)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    PFUMX LessThan_43_i14 (.BLUT(n4), .ALUT(n12), .C0(n20419), .Z(n14)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;
    MULT2 mult_32u_3u_0_mult_0_3_adj_149 (.A0(n134[6]), .A1(n134[7]), .A2(n134[7]), 
          .A3(n134[8]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_2_adj_2438), .CO(mco_3_adj_2435), .P0(mult_32u_3u_0_pp_0_7_adj_2437), 
          .P1(mult_32u_3u_0_pp_0_8_adj_2436)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_2_adj_150 (.A0(n134[4]), .A1(n134[5]), .A2(n134[5]), 
          .A3(n134[6]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_1_adj_2441), .CO(mco_2_adj_2438), .P0(mult_32u_3u_0_pp_0_5_adj_2440), 
          .P1(mult_32u_3u_0_pp_0_6_adj_2439)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_1_adj_151 (.A0(n134[2]), .A1(n134[3]), .A2(n134[3]), 
          .A3(n134[4]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mco_adj_2444), .CO(mco_1_adj_2441), .P0(mult_32u_3u_0_pp_0_3_adj_2443), 
          .P1(mult_32u_3u_0_pp_0_4_adj_2442)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    MULT2 mult_32u_3u_0_mult_0_0_adj_152 (.A0(n134[0]), .A1(n134[1]), .A2(n134[1]), 
          .A3(n134[2]), .B0(k[1]), .B1(k[0]), .B2(k[1]), .B3(k[0]), 
          .CI(mult_32u_3u_0_cin_lr_0_adj_2416), .CO(mco_adj_2444), .P1(mult_32u_3u_0_pp_0_2_adj_2445)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FD1S3BX init_position_i2_9001_9002_set (.D(n10194), .CK(clk_out), .PD(pic_y_8__N_790), 
            .Q(n10818)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i2_9001_9002_set.GSR = "DISABLED";
    FADD2B t_mult_32u_3u_0_add_0_9 (.A0(mult_32u_3u_0_pp_0_17), .A1(mult_32u_3u_0_pp_0_18), 
           .B0(mult_32u_3u_0_pp_1_17), .B1(mult_32u_3u_0_pp_1_18), .CI(co_t_mult_32u_3u_0_0_8), 
           .S0(n3170[17])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    LUT4 i12281_2_lut (.A(n1205[8]), .B(n21537), .Z(position_8__N_925[8])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12281_2_lut.init = 16'h2222;
    FADD2B t_mult_32u_3u_0_add_0_8 (.A0(mult_32u_3u_0_pp_0_15), .A1(mult_32u_3u_0_pp_0_16), 
           .B0(mult_32u_3u_0_pp_1_15), .B1(mult_32u_3u_0_pp_1_16), .CI(co_t_mult_32u_3u_0_0_7), 
           .COUT(co_t_mult_32u_3u_0_0_8), .S0(n3170[15]), .S1(n3170[16])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_7_adj_153 (.A0(mult_32u_3u_0_pp_0_13_adj_2428), 
           .A1(mult_32u_3u_0_pp_0_14_adj_2427), .B0(mult_32u_3u_0_pp_1_13_adj_2418), 
           .B1(mult_32u_3u_0_pp_1_14_adj_2417), .CI(co_t_mult_32u_3u_0_0_6_adj_2446), 
           .COUT(co_t_mult_32u_3u_0_0_7), .S0(n3170[13]), .S1(n3170[14])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_6_adj_154 (.A0(mult_32u_3u_0_pp_0_11_adj_2431), 
           .A1(mult_32u_3u_0_pp_0_12_adj_2430), .B0(mult_32u_3u_0_pp_1_11_adj_2420), 
           .B1(mult_32u_3u_0_pp_1_12_adj_2419), .CI(co_t_mult_32u_3u_0_0_5_adj_2447), 
           .COUT(co_t_mult_32u_3u_0_0_6_adj_2446), .S0(n3170[11]), .S1(n3170[12])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_5_adj_155 (.A0(mult_32u_3u_0_pp_0_9_adj_2434), 
           .A1(mult_32u_3u_0_pp_0_10_adj_2433), .B0(mult_32u_3u_0_pp_1_9_adj_2422), 
           .B1(mult_32u_3u_0_pp_1_10_adj_2421), .CI(co_t_mult_32u_3u_0_0_4_adj_2448), 
           .COUT(co_t_mult_32u_3u_0_0_5_adj_2447), .S0(n3170[9]), .S1(n3170[10])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_4_adj_156 (.A0(mult_32u_3u_0_pp_0_7_adj_2437), 
           .A1(mult_32u_3u_0_pp_0_8_adj_2436), .B0(mult_32u_3u_0_pp_1_7_adj_2424), 
           .B1(mult_32u_3u_0_pp_1_8_adj_2423), .CI(co_t_mult_32u_3u_0_0_3_adj_2449), 
           .COUT(co_t_mult_32u_3u_0_0_4_adj_2448), .S0(n3170[7]), .S1(n3170[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_3_adj_157 (.A0(mult_32u_3u_0_pp_0_5_adj_2440), 
           .A1(mult_32u_3u_0_pp_0_6_adj_2439), .B0(mult_32u_3u_0_pp_1_5), 
           .B1(mult_32u_3u_0_pp_1_6_adj_2425), .CI(co_t_mult_32u_3u_0_0_2_adj_2450), 
           .COUT(co_t_mult_32u_3u_0_0_3_adj_2449), .S0(n3170[5]), .S1(n3170[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B t_mult_32u_3u_0_add_0_2_adj_158 (.A0(mult_32u_3u_0_pp_0_3_adj_2443), 
           .A1(mult_32u_3u_0_pp_0_4_adj_2442), .B0(mult_32u_3u_0_pp_1_3_adj_2452), 
           .B1(mult_32u_3u_0_pp_1_4_adj_2453), .CI(co_t_mult_32u_3u_0_0_1_adj_2451), 
           .COUT(co_t_mult_32u_3u_0_0_2_adj_2450), .S0(n3170[3]), .S1(n3170[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FADD2B Cadd_t_mult_32u_3u_0_0_1_adj_159 (.A0(GND_net), .A1(mult_32u_3u_0_pp_0_2_adj_2445), 
           .B0(GND_net), .B1(mult_32u_3u_0_pp_1_2_adj_2454), .CI(GND_net), 
           .COUT(co_t_mult_32u_3u_0_0_1_adj_2451)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[26:60])
    FD1S3DX init_position_i2_9001_9002_reset (.D(n10194), .CK(clk_out), 
            .CD(pic_y_8__N_811), .Q(n10819)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i2_9001_9002_reset.GSR = "DISABLED";
    AND2 AND2_t31_adj_160 (.A(n134[0]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_2_adj_2454)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(120[10:65])
    CCU2D add_14_13 (.A0(time_count_down[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18229), .COUT(n18230), .S0(n118[11]), 
          .S1(n118[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_13.INIT0 = 16'h5aaa;
    defparam add_14_13.INIT1 = 16'h5aaa;
    defparam add_14_13.INJECT1_0 = "NO";
    defparam add_14_13.INJECT1_1 = "NO";
    AND2 AND2_t30_adj_161 (.A(n134[1]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_3_adj_2452)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(122[10:65])
    AND2 AND2_t29_adj_162 (.A(n134[2]), .B(VCC_net), .Z(mult_32u_3u_0_pp_1_4_adj_2453)) /* synthesis syn_instantiated=1 */ ;   // mult_32u_3u.v(124[10:65])
    CCU2D add_14_11 (.A0(time_count_down[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18228), .COUT(n18229), .S0(n118[9]), .S1(n118[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_11.INIT0 = 16'h5aaa;
    defparam add_14_11.INIT1 = 16'h5aaa;
    defparam add_14_11.INJECT1_0 = "NO";
    defparam add_14_11.INJECT1_1 = "NO";
    CCU2D sub_1765_add_2_15 (.A0(time_count_up[13]), .B0(time_count_r[13]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[14]), .B1(time_count_r[14]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18324), .COUT(n18325));
    defparam sub_1765_add_2_15.INIT0 = 16'h5999;
    defparam sub_1765_add_2_15.INIT1 = 16'h5999;
    defparam sub_1765_add_2_15.INJECT1_0 = "NO";
    defparam sub_1765_add_2_15.INJECT1_1 = "NO";
    LUT4 mux_55_i4_3_lut (.A(n105[3]), .B(n3207[6]), .C(n21547), .Z(n727[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i4_3_lut.init = 16'hcaca;
    LUT4 i16391_2_lut (.A(n2[0]), .B(n13[0]), .Z(n17998[0])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i16391_2_lut.init = 16'h6666;
    CCU2D sub_1765_add_2_13 (.A0(time_count_up[11]), .B0(time_count_r[11]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[12]), .B1(time_count_r[12]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18323), .COUT(n18324));
    defparam sub_1765_add_2_13.INIT0 = 16'h5999;
    defparam sub_1765_add_2_13.INIT1 = 16'h5999;
    defparam sub_1765_add_2_13.INJECT1_0 = "NO";
    defparam sub_1765_add_2_13.INJECT1_1 = "NO";
    CCU2D add_14_9 (.A0(time_count_down[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18227), .COUT(n18228), .S0(n118[7]), .S1(n118[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_9.INIT0 = 16'h5aaa;
    defparam add_14_9.INIT1 = 16'h5aaa;
    defparam add_14_9.INJECT1_0 = "NO";
    defparam add_14_9.INJECT1_1 = "NO";
    CCU2D sub_1765_add_2_11 (.A0(time_count_up[9]), .B0(time_count_r[9]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[10]), .B1(time_count_r[10]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18322), .COUT(n18323));
    defparam sub_1765_add_2_11.INIT0 = 16'h5999;
    defparam sub_1765_add_2_11.INIT1 = 16'h5999;
    defparam sub_1765_add_2_11.INJECT1_0 = "NO";
    defparam sub_1765_add_2_11.INJECT1_1 = "NO";
    CCU2D sub_1765_add_2_9 (.A0(time_count_up[7]), .B0(time_count_r[7]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[8]), .B1(time_count_r[8]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18321), .COUT(n18322));
    defparam sub_1765_add_2_9.INIT0 = 16'h5999;
    defparam sub_1765_add_2_9.INIT1 = 16'h5999;
    defparam sub_1765_add_2_9.INJECT1_0 = "NO";
    defparam sub_1765_add_2_9.INJECT1_1 = "NO";
    LUT4 i2_4_lut (.A(n1[5]), .B(n14426), .C(n1[4]), .D(n1[3]), .Z(n18596)) /* synthesis lut_function=(A (B (C)+!B (C (D)))) */ ;
    defparam i2_4_lut.init = 16'ha080;
    LUT4 i721_3_lut (.A(n536), .B(stop_flag_N_1026), .C(n21547), .Z(n1284)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;
    defparam i721_3_lut.init = 16'hcece;
    CCU2D add_14_7 (.A0(time_count_down[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18226), .COUT(n18227), .S0(n118[5]), .S1(n118[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_7.INIT0 = 16'h5aaa;
    defparam add_14_7.INIT1 = 16'h5aaa;
    defparam add_14_7.INJECT1_0 = "NO";
    defparam add_14_7.INJECT1_1 = "NO";
    LUT4 i12623_2_lut (.A(n1[1]), .B(n1[2]), .Z(n14426)) /* synthesis lut_function=(A (B)) */ ;
    defparam i12623_2_lut.init = 16'h8888;
    CCU2D sub_1765_add_2_7 (.A0(time_count_up[5]), .B0(time_count_r[5]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[6]), .B1(time_count_r[6]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18320), .COUT(n18321));
    defparam sub_1765_add_2_7.INIT0 = 16'h5999;
    defparam sub_1765_add_2_7.INIT1 = 16'h5999;
    defparam sub_1765_add_2_7.INJECT1_0 = "NO";
    defparam sub_1765_add_2_7.INJECT1_1 = "NO";
    CCU2D add_14_5 (.A0(time_count_down[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18225), .COUT(n18226), .S0(n118[3]), .S1(n118[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_5.INIT0 = 16'h5aaa;
    defparam add_14_5.INIT1 = 16'h5aaa;
    defparam add_14_5.INJECT1_0 = "NO";
    defparam add_14_5.INJECT1_1 = "NO";
    CCU2D sub_1765_add_2_5 (.A0(time_count_up[3]), .B0(time_count_r[3]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[4]), .B1(time_count_r[4]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18319), .COUT(n18320));
    defparam sub_1765_add_2_5.INIT0 = 16'h5999;
    defparam sub_1765_add_2_5.INIT1 = 16'h5999;
    defparam sub_1765_add_2_5.INJECT1_0 = "NO";
    defparam sub_1765_add_2_5.INJECT1_1 = "NO";
    CCU2D sub_1765_add_2_3 (.A0(time_count_up[1]), .B0(time_count_r[1]), 
          .C0(GND_net), .D0(GND_net), .A1(time_count_up[2]), .B1(time_count_r[2]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18318), .COUT(n18319));
    defparam sub_1765_add_2_3.INIT0 = 16'h5999;
    defparam sub_1765_add_2_3.INIT1 = 16'h5999;
    defparam sub_1765_add_2_3.INJECT1_0 = "NO";
    defparam sub_1765_add_2_3.INJECT1_1 = "NO";
    LUT4 mux_13_i4_3_lut (.A(init_velocity[3]), .B(\hand_velocity[4] ), 
         .C(n536), .Z(n105[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i4_3_lut.init = 16'hcaca;
    CCU2D sub_1765_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[0]), .B1(time_count_r[0]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18318));
    defparam sub_1765_add_2_1.INIT0 = 16'h0000;
    defparam sub_1765_add_2_1.INIT1 = 16'h5999;
    defparam sub_1765_add_2_1.INJECT1_0 = "NO";
    defparam sub_1765_add_2_1.INJECT1_1 = "NO";
    LUT4 i1_2_lut_rep_178 (.A(stop_flag_N_1026), .B(n536), .Z(n21524)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_178.init = 16'heeee;
    LUT4 i12282_2_lut (.A(n1205[7]), .B(n21537), .Z(position_8__N_925[7])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12282_2_lut.init = 16'h2222;
    LUT4 i12285_2_lut (.A(n1205[4]), .B(n21537), .Z(position_8__N_925[4])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12285_2_lut.init = 16'h2222;
    AND2 AND2_t15_adj_163 (.A(time_count_up[0]), .B(time_count_up[12]), 
         .Z(mult_15u_15u_0_pp_6_12)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(405[10:68])
    LUT4 i2543_2_lut_3_lut (.A(n21664), .B(n21678), .C(n21677), .Z(n8)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;
    defparam i2543_2_lut_3_lut.init = 16'hf8f8;
    LUT4 i2534_3_lut_4_lut (.A(n21664), .B(n21678), .C(n21677), .D(n21631), 
         .Z(n10)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (D)) */ ;
    defparam i2534_3_lut_4_lut.init = 16'hff80;
    CCU2D add_14_3 (.A0(time_count_down[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18224), .COUT(n18225), .S0(n118[1]), .S1(n118[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_3.INIT0 = 16'h5aaa;
    defparam add_14_3.INIT1 = 16'h5aaa;
    defparam add_14_3.INJECT1_0 = "NO";
    defparam add_14_3.INJECT1_1 = "NO";
    LUT4 i2_3_lut_rep_204_4_lut (.A(n21635), .B(n21637), .C(n19848), .D(n21638), 
         .Z(n21550)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i2_3_lut_rep_204_4_lut.init = 16'hfffe;
    LUT4 i1_3_lut_4_lut (.A(n21635), .B(n21637), .C(n21638), .D(n21630), 
         .Z(n6)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (D))) */ ;
    defparam i1_3_lut_4_lut.init = 16'hffe0;
    LUT4 i18706_2_lut_3_lut_4_lut (.A(n21630), .B(handline[5]), .C(n21590), 
         .D(n21589), .Z(n20419)) /* synthesis lut_function=(A ((C+(D))+!B)+!A (B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam i18706_2_lut_3_lut_4_lut.init = 16'hfff6;
    AND2 AND2_t17_adj_164 (.A(time_count_down[0]), .B(time_count_down[8]), 
         .Z(mult_15u_15u_0_pp_4_8_adj_2455)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(401[10:66])
    LUT4 LessThan_43_i10_3_lut_3_lut (.A(n21637), .B(handline[6]), .C(handline[5]), 
         .Z(n10_adj_2456)) /* synthesis lut_function=(A (B (C))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i10_3_lut_3_lut.init = 16'hd4d4;
    LUT4 i12247_2_lut (.A(init_velocity[9]), .B(n536), .Z(n105[9])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam i12247_2_lut.init = 16'h2222;
    LUT4 i12751_3_lut_4_lut (.A(stop_flag_N_1026), .B(n536), .C(n22446), 
         .D(n21547), .Z(n10093)) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i12751_3_lut_4_lut.init = 16'hf0e0;
    LUT4 LessThan_43_i12_3_lut_3_lut (.A(n21635), .B(handline[7]), .C(n10_adj_2456), 
         .Z(n12)) /* synthesis lut_function=(A (B (C))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i12_3_lut_3_lut.init = 16'hd4d4;
    LUT4 LessThan_43_i16_3_lut_3_lut (.A(n21638), .B(handline[8]), .C(n8_adj_2457), 
         .Z(n16)) /* synthesis lut_function=(A (B (C))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i16_3_lut_3_lut.init = 16'hd4d4;
    LUT4 i12246_2_lut (.A(init_velocity[10]), .B(n536), .Z(n105[10])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam i12246_2_lut.init = 16'h2222;
    LUT4 i9033_2_lut_3_lut_3_lut (.A(n536), .B(n22446), .C(n21537), .Z(clk_out_enable_46)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i9033_2_lut_3_lut_3_lut.init = 16'hcece;
    LUT4 i9097_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[4]), 
         .D(\hand_velocity[5] ), .Z(n10914)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9097_4_lut_4_lut.init = 16'h7340;
    LUT4 LessThan_43_i6_3_lut_3_lut (.A(n21677), .B(handline[3]), .C(handline[2]), 
         .Z(n6_adj_2458)) /* synthesis lut_function=(A (B (C))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i6_3_lut_3_lut.init = 16'hd4d4;
    LUT4 LessThan_43_i8_3_lut_3_lut (.A(n21631), .B(handline[4]), .C(n6_adj_2458), 
         .Z(n8_adj_2457)) /* synthesis lut_function=(A (B (C))+!A (B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i8_3_lut_3_lut.init = 16'hd4d4;
    LUT4 i9032_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[0]), 
         .D(\hand_velocity[1] ), .Z(n10849)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9032_4_lut_4_lut.init = 16'h7340;
    LUT4 i12295_2_lut_3_lut_3_lut (.A(n536), .B(init_velocity[8]), .C(n21537), 
         .Z(init_velocity_10__N_934[8])) /* synthesis lut_function=(A (B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12295_2_lut_3_lut_3_lut.init = 16'hc4c4;
    LUT4 i12292_2_lut_3_lut_3_lut (.A(n536), .B(init_velocity[7]), .C(n21537), 
         .Z(init_velocity_10__N_934[7])) /* synthesis lut_function=(A (B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12292_2_lut_3_lut_3_lut.init = 16'hc4c4;
    LUT4 i12249_2_lut (.A(init_velocity[7]), .B(n536), .Z(n105[7])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam i12249_2_lut.init = 16'h2222;
    LUT4 i12298_2_lut_3_lut_3_lut (.A(n536), .B(init_velocity[10]), .C(n21537), 
         .Z(init_velocity_10__N_934[10])) /* synthesis lut_function=(A (B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12298_2_lut_3_lut_3_lut.init = 16'hc4c4;
    LUT4 i12283_2_lut (.A(n1205[6]), .B(n21537), .Z(position_8__N_925[6])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12283_2_lut.init = 16'h2222;
    LUT4 i12296_2_lut_3_lut_3_lut (.A(n536), .B(init_velocity[9]), .C(n21537), 
         .Z(init_velocity_10__N_934[9])) /* synthesis lut_function=(A (B (C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12296_2_lut_3_lut_3_lut.init = 16'hc4c4;
    FD1S3BX init_position_i1_9008_9009_set (.D(n10252), .CK(clk_out), .PD(pic_y_8__N_791), 
            .Q(n10825)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i1_9008_9009_set.GSR = "DISABLED";
    LUT4 i12101_2_lut_2_lut (.A(n21537), .B(n1[1]), .Z(pic_y_8__N_907[1])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12101_2_lut_2_lut.init = 16'h4444;
    LUT4 i12306_2_lut_2_lut (.A(n21537), .B(n118[1]), .Z(time_count_down_14__N_956[1])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12306_2_lut_2_lut.init = 16'h4444;
    LUT4 i12310_2_lut_2_lut (.A(n21537), .B(n118[5]), .Z(time_count_down_14__N_956[5])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12310_2_lut_2_lut.init = 16'h4444;
    LUT4 i9099_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[3]), 
         .D(\hand_velocity[4] ), .Z(n10916)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9099_4_lut_4_lut.init = 16'h7340;
    PFUMX i18 (.BLUT(pic_y_8__N_907[0]), .ALUT(pic_y_8__N_916[0]), .C0(n22446), 
          .Z(pic_y_8__N_773[0]));
    AND2 AND2_t16_adj_165 (.A(time_count_up[0]), .B(time_count_up[10]), 
         .Z(mult_15u_15u_0_pp_5_10)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(403[10:68])
    FD1P3DX time_count_r_i0_i14 (.D(n3816), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i14.GSR = "DISABLED";
    LUT4 i12317_2_lut_2_lut (.A(n21537), .B(n118[12]), .Z(time_count_down_14__N_956[12])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12317_2_lut_2_lut.init = 16'h4444;
    CCU2D add_14_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(time_count_down[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18224), .S1(n118[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam add_14_1.INIT0 = 16'hF000;
    defparam add_14_1.INIT1 = 16'h5555;
    defparam add_14_1.INJECT1_0 = "NO";
    defparam add_14_1.INJECT1_1 = "NO";
    FD1P3DX time_count_r_i0_i13 (.D(n3814), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i13.GSR = "DISABLED";
    LUT4 i12308_2_lut_2_lut (.A(n21537), .B(n118[3]), .Z(time_count_down_14__N_956[3])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12308_2_lut_2_lut.init = 16'h4444;
    PFUMX i18_adj_166 (.BLUT(pic_y_8__N_907[2]), .ALUT(pic_y_8__N_916[2]), 
          .C0(n22446), .Z(pic_y_8__N_773[2]));
    FD1P3DX time_count_r_i0_i12 (.D(n3812), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i12.GSR = "DISABLED";
    CCU2D add_16192_10 (.A0(n2[8]), .B0(n13[8]), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18447), 
          .S0(n17998[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_16192_10.INIT0 = 16'h5666;
    defparam add_16192_10.INIT1 = 16'h0000;
    defparam add_16192_10.INJECT1_0 = "NO";
    defparam add_16192_10.INJECT1_1 = "NO";
    PFUMX i18_adj_167 (.BLUT(pic_y_8__N_907[1]), .ALUT(pic_y_8__N_916[1]), 
          .C0(n22446), .Z(pic_y_8__N_773[1]));
    FD1P3DX time_count_r_i0_i11 (.D(n3810), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i11.GSR = "DISABLED";
    LUT4 i12307_2_lut_2_lut (.A(n21537), .B(n118[2]), .Z(time_count_down_14__N_956[2])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12307_2_lut_2_lut.init = 16'h4444;
    FD1P3DX time_count_r_i0_i10 (.D(n3808), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i10.GSR = "DISABLED";
    FD1P3DX time_count_r_i0_i9 (.D(n3806), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i9.GSR = "DISABLED";
    FD1P3DX time_count_r_i0_i8 (.D(n3804), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i8.GSR = "DISABLED";
    PFUMX i18_adj_168 (.BLUT(pic_y_8__N_907[3]), .ALUT(pic_y_8__N_916[3]), 
          .C0(n22446), .Z(pic_y_8__N_773[3]));
    LUT4 i9101_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[2]), 
         .D(\hand_velocity[3] ), .Z(n10918)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9101_4_lut_4_lut.init = 16'h7340;
    FD1P3DX time_count_r_i0_i7 (.D(n3802), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i7.GSR = "DISABLED";
    LUT4 i12248_2_lut (.A(init_velocity[8]), .B(n536), .Z(n105[8])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam i12248_2_lut.init = 16'h2222;
    PFUMX i18_adj_169 (.BLUT(pic_y_8__N_907[4]), .ALUT(pic_y_8__N_916[4]), 
          .C0(n22446), .Z(pic_y_8__N_773[4]));
    PFUMX i18_adj_170 (.BLUT(pic_y_8__N_907[5]), .ALUT(pic_y_8__N_916[5]), 
          .C0(n22446), .Z(pic_y_8__N_773[5]));
    CCU2D add_8_9 (.A0(position[7]), .B0(n10779), .C0(n10783), .D0(n10784), 
          .A1(position[8]), .B1(n10772), .C1(n10776), .D1(n10777), .CIN(n18222), 
          .S0(n1[7]), .S1(pic_y_8__N_907[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(66[18:42])
    defparam add_8_9.INIT0 = 16'h596a;
    defparam add_8_9.INIT1 = 16'h596a;
    defparam add_8_9.INJECT1_0 = "NO";
    defparam add_8_9.INJECT1_1 = "NO";
    FD1S1D i8962 (.D(n22433), .CK(pic_y_8__N_785), .CD(pic_y_8__N_796), 
           .Q(n10779));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8962.GSR = "DISABLED";
    PFUMX i18_adj_171 (.BLUT(pic_y_8__N_907[6]), .ALUT(pic_y_8__N_916[6]), 
          .C0(n22446), .Z(pic_y_8__N_773[6]));
    CCU2D add_16192_8 (.A0(n2[6]), .B0(n13[6]), .C0(GND_net), .D0(GND_net), 
          .A1(n2[7]), .B1(n13[7]), .C1(GND_net), .D1(GND_net), .CIN(n18446), 
          .COUT(n18447), .S0(n17998[6]), .S1(n17998[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_16192_8.INIT0 = 16'h5666;
    defparam add_16192_8.INIT1 = 16'h5666;
    defparam add_16192_8.INJECT1_0 = "NO";
    defparam add_16192_8.INJECT1_1 = "NO";
    CCU2D add_16192_6 (.A0(n2[4]), .B0(n13[4]), .C0(GND_net), .D0(GND_net), 
          .A1(n2[5]), .B1(n13[5]), .C1(GND_net), .D1(GND_net), .CIN(n18445), 
          .COUT(n18446), .S0(n17998[4]), .S1(n17998[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_16192_6.INIT0 = 16'h5666;
    defparam add_16192_6.INIT1 = 16'h5666;
    defparam add_16192_6.INJECT1_0 = "NO";
    defparam add_16192_6.INJECT1_1 = "NO";
    CCU2D add_16192_4 (.A0(n2[2]), .B0(n13[2]), .C0(GND_net), .D0(GND_net), 
          .A1(n2[3]), .B1(n13[3]), .C1(GND_net), .D1(GND_net), .CIN(n18444), 
          .COUT(n18445), .S0(n17998[2]), .S1(n17998[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_16192_4.INIT0 = 16'h5666;
    defparam add_16192_4.INIT1 = 16'h5666;
    defparam add_16192_4.INJECT1_0 = "NO";
    defparam add_16192_4.INJECT1_1 = "NO";
    LUT4 i12319_2_lut_2_lut (.A(n21537), .B(n118[14]), .Z(time_count_down_14__N_956[14])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12319_2_lut_2_lut.init = 16'h4444;
    PFUMX i18_adj_172 (.BLUT(pic_y_8__N_907[7]), .ALUT(pic_y_8__N_916[7]), 
          .C0(n22446), .Z(pic_y_8__N_773[7]));
    FD1P3DX time_count_r_i0_i6 (.D(n3800), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i6.GSR = "DISABLED";
    LUT4 i12318_2_lut_2_lut (.A(n21537), .B(n118[13]), .Z(time_count_down_14__N_956[13])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12318_2_lut_2_lut.init = 16'h4444;
    PFUMX i8358 (.BLUT(init_position[8]), .ALUT(init_position_8__N_990[8]), 
          .C0(n10093), .Z(n10166));
    CCU2D add_16192_2 (.A0(n2[0]), .B0(n13[0]), .C0(GND_net), .D0(GND_net), 
          .A1(n2[1]), .B1(n13[1]), .C1(GND_net), .D1(GND_net), .COUT(n18444), 
          .S1(n17998[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_16192_2.INIT0 = 16'h7000;
    defparam add_16192_2.INIT1 = 16'h5666;
    defparam add_16192_2.INJECT1_0 = "NO";
    defparam add_16192_2.INJECT1_1 = "NO";
    CCU2D add_8_7 (.A0(position[5]), .B0(n10793), .C0(n10797), .D0(n10798), 
          .A1(position[6]), .B1(n10786), .C1(n10790), .D1(n10791), .CIN(n18221), 
          .COUT(n18222), .S0(n1[5]), .S1(n1[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(66[18:42])
    defparam add_8_7.INIT0 = 16'h596a;
    defparam add_8_7.INIT1 = 16'h596a;
    defparam add_8_7.INJECT1_0 = "NO";
    defparam add_8_7.INJECT1_1 = "NO";
    PFUMX i8362 (.BLUT(init_position[7]), .ALUT(init_position_8__N_990[7]), 
          .C0(n10093), .Z(n10170));
    LUT4 i12315_2_lut_2_lut (.A(n21537), .B(n118[10]), .Z(time_count_down_14__N_956[10])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12315_2_lut_2_lut.init = 16'h4444;
    LUT4 i9095_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[5]), 
         .D(\hand_velocity[6] ), .Z(n10912)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9095_4_lut_4_lut.init = 16'h7340;
    PFUMX i8366 (.BLUT(init_position[6]), .ALUT(init_position_8__N_990[6]), 
          .C0(n10093), .Z(n10174));
    PFUMX i8370 (.BLUT(init_position[5]), .ALUT(init_position_8__N_990[5]), 
          .C0(n10093), .Z(n10178));
    LUT4 i12314_2_lut_2_lut (.A(n21537), .B(n118[9]), .Z(time_count_down_14__N_956[9])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12314_2_lut_2_lut.init = 16'h4444;
    FD1S1D i8969 (.D(n22433), .CK(pic_y_8__N_786), .CD(pic_y_8__N_799), 
           .Q(n10786));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8969.GSR = "DISABLED";
    LUT4 i12313_2_lut_2_lut (.A(n21537), .B(n118[8]), .Z(time_count_down_14__N_956[8])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12313_2_lut_2_lut.init = 16'h4444;
    PFUMX i8374 (.BLUT(init_position[4]), .ALUT(init_position_8__N_990[4]), 
          .C0(n10093), .Z(n10182));
    PFUMX i8382 (.BLUT(init_position[3]), .ALUT(init_position_8__N_990[3]), 
          .C0(n10093), .Z(n10190));
    CCU2D add_8_5 (.A0(position[3]), .B0(n10807), .C0(n10811), .D0(n10812), 
          .A1(position[4]), .B1(n10800), .C1(n10804), .D1(n10805), .CIN(n18220), 
          .COUT(n18221), .S0(n1[3]), .S1(n1[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(66[18:42])
    defparam add_8_5.INIT0 = 16'h596a;
    defparam add_8_5.INIT1 = 16'h596a;
    defparam add_8_5.INJECT1_0 = "NO";
    defparam add_8_5.INJECT1_1 = "NO";
    PFUMX i8386 (.BLUT(init_position[2]), .ALUT(init_position_8__N_990[2]), 
          .C0(n10093), .Z(n10194));
    CCU2D add_8_3 (.A0(position[1]), .B0(n10821), .C0(n10825), .D0(n10826), 
          .A1(position[2]), .B1(n10814), .C1(n10818), .D1(n10819), .CIN(n18219), 
          .COUT(n18220), .S0(n1[1]), .S1(n1[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(66[18:42])
    defparam add_8_3.INIT0 = 16'h596a;
    defparam add_8_3.INIT1 = 16'h596a;
    defparam add_8_3.INJECT1_0 = "NO";
    defparam add_8_3.INJECT1_1 = "NO";
    LUT4 i12070_4_lut_4_lut (.A(stop_flag_N_1026), .B(n21547), .C(n3207[12]), 
         .D(n105[9]), .Z(init_velocity_10__N_945[9])) /* synthesis lut_function=(!(A+!(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i12070_4_lut_4_lut.init = 16'h5140;
    LUT4 i12312_2_lut_2_lut (.A(n21537), .B(n118[7]), .Z(time_count_down_14__N_956[7])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12312_2_lut_2_lut.init = 16'h4444;
    FADD2B mult_15u_15u_0_cin_lr_add_0_adj_173 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_0_adj_2375)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    LUT4 i9011_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[1]), 
         .D(\hand_velocity[2] ), .Z(n10828)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9011_4_lut_4_lut.init = 16'h7340;
    PFUMX i8444 (.BLUT(init_position[1]), .ALUT(init_position_8__N_990[1]), 
          .C0(n10093), .Z(n10252));
    LUT4 i12311_2_lut_2_lut (.A(n21537), .B(n118[6]), .Z(time_count_down_14__N_956[6])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12311_2_lut_2_lut.init = 16'h4444;
    FD1S1D i8976 (.D(n22433), .CK(pic_y_8__N_787), .CD(pic_y_8__N_802), 
           .Q(n10793));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8976.GSR = "DISABLED";
    LUT4 i12309_2_lut_2_lut (.A(n21537), .B(n118[4]), .Z(time_count_down_14__N_956[4])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12309_2_lut_2_lut.init = 16'h4444;
    LUT4 i12088_2_lut_2_lut (.A(n21537), .B(n1[3]), .Z(pic_y_8__N_907[3])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12088_2_lut_2_lut.init = 16'h4444;
    LUT4 i12316_2_lut_2_lut (.A(n21537), .B(n118[11]), .Z(time_count_down_14__N_956[11])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12316_2_lut_2_lut.init = 16'h4444;
    LUT4 i9093_4_lut_4_lut (.A(stop_flag_N_1026), .B(n22446), .C(n727[6]), 
         .D(\hand_velocity[7] ), .Z(n10910)) /* synthesis lut_function=(!(A (B+!(D))+!A !(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i9093_4_lut_4_lut.init = 16'h7340;
    PFUMX i18_adj_174 (.BLUT(init_velocity_10__N_934[9]), .ALUT(init_velocity_10__N_945[9]), 
          .C0(n22446), .Z(init_velocity_10__N_887[9]));
    AND2 AND2_t16_adj_175 (.A(time_count_r[0]), .B(time_count_up[10]), .Z(mult_15u_15u_0_pp_5_10_adj_2400)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(403[10:68])
    LUT4 i12071_4_lut_4_lut (.A(stop_flag_N_1026), .B(n21547), .C(n3207[11]), 
         .D(n105[8]), .Z(init_velocity_10__N_945[8])) /* synthesis lut_function=(!(A+!(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i12071_4_lut_4_lut.init = 16'h5140;
    FD1S1D i8983 (.D(n22433), .CK(pic_y_8__N_788), .CD(pic_y_8__N_805), 
           .Q(n10800));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8983.GSR = "DISABLED";
    CCU2D add_8_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(position[0]), .B1(n10765), .C1(n10769), .D1(n10770), .COUT(n18219), 
          .S1(n1[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(66[18:42])
    defparam add_8_1.INIT0 = 16'hF000;
    defparam add_8_1.INIT1 = 16'h596a;
    defparam add_8_1.INJECT1_0 = "NO";
    defparam add_8_1.INJECT1_1 = "NO";
    PFUMX i18_adj_176 (.BLUT(init_velocity_10__N_934[10]), .ALUT(init_velocity_10__N_945[10]), 
          .C0(n22446), .Z(init_velocity_10__N_887[10]));
    AND2 AND2_t15_adj_177 (.A(time_count_down[0]), .B(init_velocity[8]), 
         .Z(mult_11u_15u_0_pp_4_8)) /* synthesis syn_instantiated=1 */ ;   // mult_11u_15u.v(292[10:66])
    FD1S1D i8990 (.D(n22433), .CK(pic_y_8__N_789), .CD(pic_y_8__N_808), 
           .Q(n10807));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8990.GSR = "DISABLED";
    PFUMX i18_adj_178 (.BLUT(init_velocity_10__N_934[7]), .ALUT(init_velocity_10__N_945[7]), 
          .C0(n22446), .Z(init_velocity_10__N_887[7]));
    FD1S1D i8997 (.D(n22433), .CK(pic_y_8__N_790), .CD(pic_y_8__N_811), 
           .Q(n10814));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8997.GSR = "DISABLED";
    FD1P3DX time_count_r_i0_i5 (.D(n3798), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i5.GSR = "DISABLED";
    FD1P3DX time_count_r_i0_i4 (.D(n3796), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i4.GSR = "DISABLED";
    FD1S1D i9004 (.D(n22433), .CK(pic_y_8__N_791), .CD(pic_y_8__N_814), 
           .Q(n10821));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i9004.GSR = "DISABLED";
    PFUMX i8286 (.BLUT(init_position[0]), .ALUT(init_position_8__N_990[0]), 
          .C0(n10093), .Z(n10094));
    MULT2 mult_15u_15u_0_mult_8_0_adj_179 (.A0(time_count_r[0]), .A1(time_count_r[1]), 
          .A2(time_count_r[1]), .A3(time_count_r[2]), .B0(time_count_up[9]), 
          .B1(time_count_up[8]), .B2(time_count_up[9]), .B3(time_count_up[8]), 
          .CI(mult_15u_15u_0_cin_lr_8_adj_2410), .P0(mult_15u_15u_0_pp_4_9_adj_2382), 
          .P1(mult_15u_15u_0_pp_4_10_adj_2401)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[67:95])
    LUT4 i12629_3_lut (.A(n21666), .B(n21678), .C(n21664), .Z(n14432)) /* synthesis lut_function=(A (B)+!A (B (C))) */ ;
    defparam i12629_3_lut.init = 16'hc8c8;
    FD1P3DX time_count_r_i0_i3 (.D(n3794), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i3.GSR = "DISABLED";
    LUT4 i12069_4_lut_4_lut (.A(stop_flag_N_1026), .B(n21547), .C(n3207[13]), 
         .D(n105[10]), .Z(init_velocity_10__N_945[10])) /* synthesis lut_function=(!(A+!(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i12069_4_lut_4_lut.init = 16'h5140;
    FD1P3DX time_count_r_i0_i2 (.D(n3792), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i2.GSR = "DISABLED";
    FD1P3DX time_count_r_i0_i1 (.D(n3790), .SP(clk_out_enable_25), .CK(clk_out), 
            .CD(n21688), .Q(time_count_r[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_r_i0_i1.GSR = "DISABLED";
    LUT4 i12072_4_lut_4_lut (.A(stop_flag_N_1026), .B(n21547), .C(n3207[10]), 
         .D(n105[7]), .Z(init_velocity_10__N_945[7])) /* synthesis lut_function=(!(A+!(B (C)+!B (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i12072_4_lut_4_lut.init = 16'h5140;
    PFUMX i18_adj_180 (.BLUT(init_velocity_10__N_934[8]), .ALUT(init_velocity_10__N_945[8]), 
          .C0(n22446), .Z(init_velocity_10__N_887[8]));
    CCU2D sub_15_add_2_17 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18294), 
          .S0(n134[15]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_17.INIT0 = 16'hffff;
    defparam sub_15_add_2_17.INIT1 = 16'h0000;
    defparam sub_15_add_2_17.INJECT1_0 = "NO";
    defparam sub_15_add_2_17.INJECT1_1 = "NO";
    CCU2D sub_15_add_2_15 (.A0(time_count_down[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18293), .COUT(n18294), .S0(n134[13]), 
          .S1(n134[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_15.INIT0 = 16'h5555;
    defparam sub_15_add_2_15.INIT1 = 16'h5555;
    defparam sub_15_add_2_15.INJECT1_0 = "NO";
    defparam sub_15_add_2_15.INJECT1_1 = "NO";
    LUT4 i11995_3_lut (.A(n29[3]), .B(n21537), .C(n60[0]), .Z(position_8__N_925[0])) /* synthesis lut_function=(!(A (B+(C))+!A (B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i11995_3_lut.init = 16'h1212;
    LUT4 i15_4_lut (.A(n21537), .B(n19938), .C(n22446), .D(n21524), 
         .Z(current_state_1__N_822[0])) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i15_4_lut.init = 16'h0aca;
    CCU2D sub_15_add_2_13 (.A0(time_count_down[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18292), .COUT(n18293), .S0(n134[11]), 
          .S1(n134[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_13.INIT0 = 16'h5555;
    defparam sub_15_add_2_13.INIT1 = 16'h5555;
    defparam sub_15_add_2_13.INJECT1_0 = "NO";
    defparam sub_15_add_2_13.INJECT1_1 = "NO";
    LUT4 i18462_3_lut_4_lut_4_lut (.A(n21547), .B(n397[1]), .C(stop_flag_N_1026), 
         .D(handline[1]), .Z(init_position_8__N_990[1])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18462_3_lut_4_lut_4_lut.init = 16'hc5c0;
    AND2 AND2_t18_adj_181 (.A(time_count_down[0]), .B(time_count_down[6]), 
         .Z(mult_15u_15u_0_pp_3_6_adj_2467)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(399[10:66])
    AND2 AND2_t19_adj_182 (.A(time_count_down[0]), .B(time_count_down[4]), 
         .Z(mult_15u_15u_0_pp_2_4_adj_2468)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(397[10:66])
    AND2 AND2_t20_adj_183 (.A(time_count_down[0]), .B(time_count_down[2]), 
         .Z(mult_15u_15u_0_pp_1_2_adj_2469)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(395[10:66])
    FADD2B mult_15u_15u_0_cin_lr_add_2_adj_184 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_2_adj_2470)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_cin_lr_add_4_adj_185 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_4_adj_2471)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_cin_lr_add_6_adj_186 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_6_adj_2472)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_cin_lr_add_8_adj_187 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_8_adj_2473)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_cin_lr_add_10_adj_188 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_10_adj_2474)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B Cadd_mult_15u_15u_0_0_1_adj_189 (.A0(GND_net), .A1(mult_15u_15u_0_pp_0_2_adj_2476), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_1_2_adj_2469), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_0_1_adj_2475)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_0_2_adj_190 (.A0(mult_15u_15u_0_pp_0_3_adj_2480), 
           .A1(mult_15u_15u_0_pp_0_4_adj_2479), .B0(mult_15u_15u_0_pp_1_3_adj_2482), 
           .B1(mult_15u_15u_0_pp_1_4_adj_2481), .CI(co_mult_15u_15u_0_0_1_adj_2475), 
           .COUT(co_mult_15u_15u_0_0_2_adj_2477), .S0(n29[3]), .S1(s_mult_15u_15u_0_0_4_adj_2478)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_0_3_adj_191 (.A0(mult_15u_15u_0_pp_0_5_adj_2487), 
           .A1(mult_15u_15u_0_pp_0_6_adj_2486), .B0(mult_15u_15u_0_pp_1_5_adj_2489), 
           .B1(mult_15u_15u_0_pp_1_6_adj_2488), .CI(co_mult_15u_15u_0_0_2_adj_2477), 
           .COUT(co_mult_15u_15u_0_0_3_adj_2483), .S0(s_mult_15u_15u_0_0_5_adj_2484), 
           .S1(s_mult_15u_15u_0_0_6_adj_2485)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_0_4_adj_192 (.A0(mult_15u_15u_0_pp_0_7_adj_2494), 
           .A1(mult_15u_15u_0_pp_0_8_adj_2493), .B0(mult_15u_15u_0_pp_1_7_adj_2496), 
           .B1(mult_15u_15u_0_pp_1_8_adj_2495), .CI(co_mult_15u_15u_0_0_3_adj_2483), 
           .COUT(co_mult_15u_15u_0_0_4_adj_2490), .S0(s_mult_15u_15u_0_0_7_adj_2491), 
           .S1(s_mult_15u_15u_0_0_8_adj_2492)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_0_5_adj_193 (.A0(mult_15u_15u_0_pp_0_9_adj_2501), 
           .A1(mult_15u_15u_0_pp_0_10_adj_2500), .B0(mult_15u_15u_0_pp_1_9_adj_2503), 
           .B1(mult_15u_15u_0_pp_1_10_adj_2502), .CI(co_mult_15u_15u_0_0_4_adj_2490), 
           .COUT(co_mult_15u_15u_0_0_5_adj_2497), .S0(s_mult_15u_15u_0_0_9_adj_2498), 
           .S1(s_mult_15u_15u_0_0_10_adj_2499)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_0_6_adj_194 (.A0(mult_15u_15u_0_pp_0_11_adj_2507), 
           .A1(mult_15u_15u_0_pp_0_12_adj_2506), .B0(mult_15u_15u_0_pp_1_11_adj_2509), 
           .B1(mult_15u_15u_0_pp_1_12_adj_2508), .CI(co_mult_15u_15u_0_0_5_adj_2497), 
           .S0(s_mult_15u_15u_0_0_11_adj_2504), .S1(s_mult_15u_15u_0_0_12_adj_2505)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B Cadd_mult_15u_15u_0_1_1_adj_195 (.A0(GND_net), .A1(mult_15u_15u_0_pp_2_6_adj_2512), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_3_6_adj_2467), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_1_1_adj_2510), .S1(s_mult_15u_15u_0_1_6_adj_2511)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_1_2_adj_196 (.A0(mult_15u_15u_0_pp_2_7_adj_2517), 
           .A1(mult_15u_15u_0_pp_2_8_adj_2516), .B0(mult_15u_15u_0_pp_3_7_adj_2519), 
           .B1(mult_15u_15u_0_pp_3_8_adj_2518), .CI(co_mult_15u_15u_0_1_1_adj_2510), 
           .COUT(co_mult_15u_15u_0_1_2_adj_2513), .S0(s_mult_15u_15u_0_1_7_adj_2514), 
           .S1(s_mult_15u_15u_0_1_8_adj_2515)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_1_3_adj_197 (.A0(mult_15u_15u_0_pp_2_9_adj_2524), 
           .A1(mult_15u_15u_0_pp_2_10_adj_2523), .B0(mult_15u_15u_0_pp_3_9_adj_2526), 
           .B1(mult_15u_15u_0_pp_3_10_adj_2525), .CI(co_mult_15u_15u_0_1_2_adj_2513), 
           .COUT(co_mult_15u_15u_0_1_3_adj_2520), .S0(s_mult_15u_15u_0_1_9_adj_2521), 
           .S1(s_mult_15u_15u_0_1_10_adj_2522)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_1_4_adj_198 (.A0(mult_15u_15u_0_pp_2_11_adj_2530), 
           .A1(mult_15u_15u_0_pp_2_12_adj_2529), .B0(mult_15u_15u_0_pp_3_11_adj_2532), 
           .B1(mult_15u_15u_0_pp_3_12_adj_2531), .CI(co_mult_15u_15u_0_1_3_adj_2520), 
           .S0(s_mult_15u_15u_0_1_11_adj_2527), .S1(s_mult_15u_15u_0_1_12_adj_2528)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i14 (.D(time_count_down_14__N_956[14]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i14.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_2_1_adj_199 (.A0(GND_net), .A1(mult_15u_15u_0_pp_4_10_adj_2536), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_5_10_adj_2533), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_2_1_adj_2534), .S1(s_mult_15u_15u_0_2_10_adj_2535)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_2_2_adj_200 (.A0(mult_15u_15u_0_pp_4_11_adj_2540), 
           .A1(mult_15u_15u_0_pp_4_12_adj_2539), .B0(mult_15u_15u_0_pp_5_11_adj_2542), 
           .B1(mult_15u_15u_0_pp_5_12_adj_2541), .CI(co_mult_15u_15u_0_2_1_adj_2534), 
           .S0(s_mult_15u_15u_0_2_11_adj_2538), .S1(s_mult_15u_15u_0_2_12_adj_2537)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i13 (.D(time_count_down_14__N_956[13]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i13.GSR = "DISABLED";
    FD1P3DX time_count_down_i12 (.D(time_count_down_14__N_956[12]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i12.GSR = "DISABLED";
    FD1P3DX time_count_down_i11 (.D(time_count_down_14__N_956[11]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i11.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_4_1_adj_201 (.A0(GND_net), .A1(s_mult_15u_15u_0_0_4_adj_2478), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_2_4_adj_2468), .CI(GND_net), 
           .COUT(co_mult_15u_15u_0_4_1_adj_2543), .S1(n29[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_4_2_adj_202 (.A0(s_mult_15u_15u_0_0_5_adj_2484), 
           .A1(s_mult_15u_15u_0_0_6_adj_2485), .B0(mult_15u_15u_0_pp_2_5_adj_2545), 
           .B1(s_mult_15u_15u_0_1_6_adj_2511), .CI(co_mult_15u_15u_0_4_1_adj_2543), 
           .COUT(co_mult_15u_15u_0_4_2_adj_2544), .S0(n29[5]), .S1(n29[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_4_3_adj_203 (.A0(s_mult_15u_15u_0_0_7_adj_2491), 
           .A1(s_mult_15u_15u_0_0_8_adj_2492), .B0(s_mult_15u_15u_0_1_7_adj_2514), 
           .B1(s_mult_15u_15u_0_1_8_adj_2515), .CI(co_mult_15u_15u_0_4_2_adj_2544), 
           .COUT(co_mult_15u_15u_0_4_3_adj_2546), .S0(n29[7]), .S1(s_mult_15u_15u_0_4_8_adj_2547)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_4_4_adj_204 (.A0(s_mult_15u_15u_0_0_9_adj_2498), 
           .A1(s_mult_15u_15u_0_0_10_adj_2499), .B0(s_mult_15u_15u_0_1_9_adj_2521), 
           .B1(s_mult_15u_15u_0_1_10_adj_2522), .CI(co_mult_15u_15u_0_4_3_adj_2546), 
           .COUT(co_mult_15u_15u_0_4_4_adj_2548), .S0(s_mult_15u_15u_0_4_9_adj_2549), 
           .S1(s_mult_15u_15u_0_4_10_adj_2550)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B mult_15u_15u_0_add_4_5_adj_205 (.A0(s_mult_15u_15u_0_0_11_adj_2504), 
           .A1(s_mult_15u_15u_0_0_12_adj_2505), .B0(s_mult_15u_15u_0_1_11_adj_2527), 
           .B1(s_mult_15u_15u_0_1_12_adj_2528), .CI(co_mult_15u_15u_0_4_4_adj_2548), 
           .S0(s_mult_15u_15u_0_4_11_adj_2551), .S1(s_mult_15u_15u_0_4_12_adj_2552)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i10 (.D(time_count_down_14__N_956[10]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i10.GSR = "DISABLED";
    FADD2B Cadd_mult_15u_15u_0_5_1_adj_206 (.A0(GND_net), .A1(s_mult_15u_15u_0_2_12_adj_2537), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_6_12_adj_2553), .CI(GND_net), 
           .S1(s_mult_15u_15u_0_5_12_adj_2554)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i9 (.D(time_count_down_14__N_956[9]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i9.GSR = "DISABLED";
    FADD2B Cadd_t_mult_15u_15u_0_6_1_adj_207 (.A0(GND_net), .A1(s_mult_15u_15u_0_4_8_adj_2547), 
           .B0(GND_net), .B1(mult_15u_15u_0_pp_4_8_adj_2455), .CI(GND_net), 
           .COUT(co_t_mult_15u_15u_0_6_1_adj_2555), .S1(n29[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B t_mult_15u_15u_0_add_6_2_adj_208 (.A0(s_mult_15u_15u_0_4_9_adj_2549), 
           .A1(s_mult_15u_15u_0_4_10_adj_2550), .B0(mult_15u_15u_0_pp_4_9_adj_2557), 
           .B1(s_mult_15u_15u_0_2_10_adj_2535), .CI(co_t_mult_15u_15u_0_6_1_adj_2555), 
           .COUT(co_t_mult_15u_15u_0_6_2_adj_2556), .S0(n29[9]), .S1(n29[10])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FADD2B t_mult_15u_15u_0_add_6_3_adj_209 (.A0(s_mult_15u_15u_0_4_11_adj_2551), 
           .A1(s_mult_15u_15u_0_4_12_adj_2552), .B0(s_mult_15u_15u_0_2_11_adj_2538), 
           .B1(s_mult_15u_15u_0_5_12_adj_2554), .CI(co_t_mult_15u_15u_0_6_2_adj_2556), 
           .S0(n29[11])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_0_adj_210 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mult_15u_15u_0_cin_lr_0_adj_2558), .CO(mco_adj_2559), .P1(mult_15u_15u_0_pp_0_2_adj_2476)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_1_adj_211 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mco_adj_2559), .CO(mco_1_adj_2560), .P0(mult_15u_15u_0_pp_0_3_adj_2480), 
          .P1(mult_15u_15u_0_pp_0_4_adj_2479)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_2_adj_212 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mco_1_adj_2560), .CO(mco_2_adj_2561), .P0(mult_15u_15u_0_pp_0_5_adj_2487), 
          .P1(mult_15u_15u_0_pp_0_6_adj_2486)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_3_adj_213 (.A0(time_count_down[6]), .A1(time_count_down[7]), 
          .A2(time_count_down[7]), .A3(time_count_down[8]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mco_2_adj_2561), .CO(mco_3_adj_2562), .P0(mult_15u_15u_0_pp_0_7_adj_2494), 
          .P1(mult_15u_15u_0_pp_0_8_adj_2493)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_4_adj_214 (.A0(time_count_down[8]), .A1(time_count_down[9]), 
          .A2(time_count_down[9]), .A3(time_count_down[10]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mco_3_adj_2562), .CO(mco_4_adj_2563), .P0(mult_15u_15u_0_pp_0_9_adj_2501), 
          .P1(mult_15u_15u_0_pp_0_10_adj_2500)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_0_5_adj_215 (.A0(time_count_down[10]), .A1(time_count_down[11]), 
          .A2(time_count_down[11]), .A3(time_count_down[12]), .B0(time_count_down[1]), 
          .B1(time_count_down[0]), .B2(time_count_down[1]), .B3(time_count_down[0]), 
          .CI(mco_4_adj_2563), .P0(mult_15u_15u_0_pp_0_11_adj_2507), .P1(mult_15u_15u_0_pp_0_12_adj_2506)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_2_0_adj_216 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[3]), 
          .B1(time_count_down[2]), .B2(time_count_down[3]), .B3(time_count_down[2]), 
          .CI(mult_15u_15u_0_cin_lr_2_adj_2470), .CO(mco_7_adj_2564), .P0(mult_15u_15u_0_pp_1_3_adj_2482), 
          .P1(mult_15u_15u_0_pp_1_4_adj_2481)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_2_1_adj_217 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(time_count_down[3]), 
          .B1(time_count_down[2]), .B2(time_count_down[3]), .B3(time_count_down[2]), 
          .CI(mco_7_adj_2564), .CO(mco_8_adj_2565), .P0(mult_15u_15u_0_pp_1_5_adj_2489), 
          .P1(mult_15u_15u_0_pp_1_6_adj_2488)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_2_2_adj_218 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(time_count_down[3]), 
          .B1(time_count_down[2]), .B2(time_count_down[3]), .B3(time_count_down[2]), 
          .CI(mco_8_adj_2565), .CO(mco_9_adj_2566), .P0(mult_15u_15u_0_pp_1_7_adj_2496), 
          .P1(mult_15u_15u_0_pp_1_8_adj_2495)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_2_3_adj_219 (.A0(time_count_down[6]), .A1(time_count_down[7]), 
          .A2(time_count_down[7]), .A3(time_count_down[8]), .B0(time_count_down[3]), 
          .B1(time_count_down[2]), .B2(time_count_down[3]), .B3(time_count_down[2]), 
          .CI(mco_9_adj_2566), .CO(mco_10_adj_2567), .P0(mult_15u_15u_0_pp_1_9_adj_2503), 
          .P1(mult_15u_15u_0_pp_1_10_adj_2502)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_2_4_adj_220 (.A0(time_count_down[8]), .A1(time_count_down[9]), 
          .A2(time_count_down[9]), .A3(time_count_down[10]), .B0(time_count_down[3]), 
          .B1(time_count_down[2]), .B2(time_count_down[3]), .B3(time_count_down[2]), 
          .CI(mco_10_adj_2567), .P0(mult_15u_15u_0_pp_1_11_adj_2509), .P1(mult_15u_15u_0_pp_1_12_adj_2508)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_4_0_adj_221 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[5]), 
          .B1(time_count_down[4]), .B2(time_count_down[5]), .B3(time_count_down[4]), 
          .CI(mult_15u_15u_0_cin_lr_4_adj_2471), .CO(mco_14_adj_2568), .P0(mult_15u_15u_0_pp_2_5_adj_2545), 
          .P1(mult_15u_15u_0_pp_2_6_adj_2512)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_4_1_adj_222 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(time_count_down[5]), 
          .B1(time_count_down[4]), .B2(time_count_down[5]), .B3(time_count_down[4]), 
          .CI(mco_14_adj_2568), .CO(mco_15_adj_2569), .P0(mult_15u_15u_0_pp_2_7_adj_2517), 
          .P1(mult_15u_15u_0_pp_2_8_adj_2516)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_4_2_adj_223 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(time_count_down[5]), 
          .B1(time_count_down[4]), .B2(time_count_down[5]), .B3(time_count_down[4]), 
          .CI(mco_15_adj_2569), .CO(mco_16_adj_2570), .P0(mult_15u_15u_0_pp_2_9_adj_2524), 
          .P1(mult_15u_15u_0_pp_2_10_adj_2523)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_4_3_adj_224 (.A0(time_count_down[6]), .A1(time_count_down[7]), 
          .A2(time_count_down[7]), .A3(time_count_down[8]), .B0(time_count_down[5]), 
          .B1(time_count_down[4]), .B2(time_count_down[5]), .B3(time_count_down[4]), 
          .CI(mco_16_adj_2570), .P0(mult_15u_15u_0_pp_2_11_adj_2530), .P1(mult_15u_15u_0_pp_2_12_adj_2529)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_6_0_adj_225 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[7]), 
          .B1(time_count_down[6]), .B2(time_count_down[7]), .B3(time_count_down[6]), 
          .CI(mult_15u_15u_0_cin_lr_6_adj_2472), .CO(mco_21_adj_2571), .P0(mult_15u_15u_0_pp_3_7_adj_2519), 
          .P1(mult_15u_15u_0_pp_3_8_adj_2518)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_6_1_adj_226 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(time_count_down[7]), 
          .B1(time_count_down[6]), .B2(time_count_down[7]), .B3(time_count_down[6]), 
          .CI(mco_21_adj_2571), .CO(mco_22_adj_2572), .P0(mult_15u_15u_0_pp_3_9_adj_2526), 
          .P1(mult_15u_15u_0_pp_3_10_adj_2525)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_6_2_adj_227 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(time_count_down[7]), 
          .B1(time_count_down[6]), .B2(time_count_down[7]), .B3(time_count_down[6]), 
          .CI(mco_22_adj_2572), .P0(mult_15u_15u_0_pp_3_11_adj_2532), .P1(mult_15u_15u_0_pp_3_12_adj_2531)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i8 (.D(time_count_down_14__N_956[8]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i8.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_8_0_adj_228 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[9]), 
          .B1(time_count_down[8]), .B2(time_count_down[9]), .B3(time_count_down[8]), 
          .CI(mult_15u_15u_0_cin_lr_8_adj_2473), .CO(mco_28_adj_2573), .P0(mult_15u_15u_0_pp_4_9_adj_2557), 
          .P1(mult_15u_15u_0_pp_4_10_adj_2536)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    MULT2 mult_15u_15u_0_mult_8_1_adj_229 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(time_count_down[9]), 
          .B1(time_count_down[8]), .B2(time_count_down[9]), .B3(time_count_down[8]), 
          .CI(mco_28_adj_2573), .P0(mult_15u_15u_0_pp_4_11_adj_2540), .P1(mult_15u_15u_0_pp_4_12_adj_2539)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i7 (.D(time_count_down_14__N_956[7]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i7.GSR = "DISABLED";
    MULT2 mult_15u_15u_0_mult_10_0_adj_230 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(time_count_down[11]), 
          .B1(time_count_down[10]), .B2(time_count_down[11]), .B3(time_count_down[10]), 
          .CI(mult_15u_15u_0_cin_lr_10_adj_2474), .P0(mult_15u_15u_0_pp_5_11_adj_2542), 
          .P1(mult_15u_15u_0_pp_5_12_adj_2541)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    FD1P3DX time_count_down_i6 (.D(time_count_down_14__N_956[6]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i6.GSR = "DISABLED";
    FD1P3DX time_count_down_i5 (.D(time_count_down_14__N_956[5]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i5.GSR = "DISABLED";
    LUT4 i18466_3_lut_4_lut_4_lut (.A(n21547), .B(n397[3]), .C(stop_flag_N_1026), 
         .D(handline[3]), .Z(init_position_8__N_990[3])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18466_3_lut_4_lut_4_lut.init = 16'hc5c0;
    AND2 AND2_t16_adj_231 (.A(time_count_down[0]), .B(time_count_down[10]), 
         .Z(mult_15u_15u_0_pp_5_10_adj_2533)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(403[10:68])
    AND2 AND2_t15_adj_232 (.A(time_count_down[0]), .B(time_count_down[12]), 
         .Z(mult_15u_15u_0_pp_6_12_adj_2553)) /* synthesis syn_instantiated=1 */ ;   // mult_15u_15u.v(405[10:68])
    FD1P3DX time_count_down_i4 (.D(time_count_down_14__N_956[4]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i4.GSR = "DISABLED";
    FD1P3DX time_count_down_i3 (.D(time_count_down_14__N_956[3]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i3.GSR = "DISABLED";
    FADD2B mult_15u_15u_0_cin_lr_add_0_adj_233 (.A0(GND_net), .A1(GND_net), 
           .B0(GND_net), .B1(GND_net), .CI(GND_net), .COUT(mult_15u_15u_0_cin_lr_0_adj_2558)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[22:57])
    AND2 AND2_t16_adj_234 (.A(time_count_down[0]), .B(init_velocity[6]), 
         .Z(mult_11u_15u_0_pp_3_6)) /* synthesis syn_instantiated=1 */ ;   // mult_11u_15u.v(290[10:66])
    AND2 AND2_t17_adj_235 (.A(time_count_down[0]), .B(init_velocity[4]), 
         .Z(mult_11u_15u_0_pp_2_4)) /* synthesis syn_instantiated=1 */ ;   // mult_11u_15u.v(288[10:66])
    AND2 AND2_t18_adj_236 (.A(time_count_down[0]), .B(init_velocity[2]), 
         .Z(mult_11u_15u_0_pp_1_2)) /* synthesis syn_instantiated=1 */ ;   // mult_11u_15u.v(286[10:66])
    AND2 AND2_t19_adj_237 (.A(time_count_down[0]), .B(init_velocity[0]), 
         .Z(n60[0])) /* synthesis syn_instantiated=1 */ ;   // mult_11u_15u.v(284[10:66])
    FADD2B mult_11u_15u_0_cin_lr_add_2 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_11u_15u_0_cin_lr_2)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_cin_lr_add_4 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_11u_15u_0_cin_lr_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_cin_lr_add_6 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_11u_15u_0_cin_lr_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B Cadd_mult_11u_15u_0_0_1 (.A0(GND_net), .A1(mult_11u_15u_0_pp_0_2), 
           .B0(GND_net), .B1(mult_11u_15u_0_pp_1_2), .CI(GND_net), .COUT(co_mult_11u_15u_0_0_1), 
           .S1(n60[2])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_0_2 (.A0(mult_11u_15u_0_pp_0_3), .A1(mult_11u_15u_0_pp_0_4), 
           .B0(mult_11u_15u_0_pp_1_3), .B1(mult_11u_15u_0_pp_1_4), .CI(co_mult_11u_15u_0_0_1), 
           .COUT(co_mult_11u_15u_0_0_2), .S0(n60[3]), .S1(s_mult_11u_15u_0_0_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_0_3 (.A0(mult_11u_15u_0_pp_0_5), .A1(mult_11u_15u_0_pp_0_6), 
           .B0(mult_11u_15u_0_pp_1_5), .B1(mult_11u_15u_0_pp_1_6), .CI(co_mult_11u_15u_0_0_2), 
           .COUT(co_mult_11u_15u_0_0_3), .S0(s_mult_11u_15u_0_0_5), .S1(s_mult_11u_15u_0_0_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_0_4 (.A0(mult_11u_15u_0_pp_0_7), .A1(mult_11u_15u_0_pp_0_8), 
           .B0(mult_11u_15u_0_pp_1_7), .B1(mult_11u_15u_0_pp_1_8), .CI(co_mult_11u_15u_0_0_3), 
           .S0(s_mult_11u_15u_0_0_7), .S1(s_mult_11u_15u_0_0_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FD1P3DX time_count_down_i2 (.D(time_count_down_14__N_956[2]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i2.GSR = "DISABLED";
    FADD2B Cadd_mult_11u_15u_0_1_1 (.A0(GND_net), .A1(mult_11u_15u_0_pp_2_6), 
           .B0(GND_net), .B1(mult_11u_15u_0_pp_3_6), .CI(GND_net), .COUT(co_mult_11u_15u_0_1_1), 
           .S1(s_mult_11u_15u_0_1_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_1_2 (.A0(mult_11u_15u_0_pp_2_7), .A1(mult_11u_15u_0_pp_2_8), 
           .B0(mult_11u_15u_0_pp_3_7), .B1(mult_11u_15u_0_pp_3_8), .CI(co_mult_11u_15u_0_1_1), 
           .S0(s_mult_11u_15u_0_1_7), .S1(s_mult_11u_15u_0_1_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FD1P3DX time_count_down_i1 (.D(time_count_down_14__N_956[1]), .SP(clk_out_enable_39), 
            .CK(clk_out), .CD(n21688), .Q(time_count_down[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam time_count_down_i1.GSR = "DISABLED";
    FD1S3DX init_velocity_i10 (.D(init_velocity_10__N_887[10]), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i10.GSR = "DISABLED";
    FD1S3DX init_velocity_i9 (.D(init_velocity_10__N_887[9]), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i9.GSR = "DISABLED";
    FADD2B Cadd_mult_11u_15u_0_3_1 (.A0(GND_net), .A1(s_mult_11u_15u_0_0_4), 
           .B0(GND_net), .B1(mult_11u_15u_0_pp_2_4), .CI(GND_net), .COUT(co_mult_11u_15u_0_3_1), 
           .S1(n60[4])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_3_2 (.A0(s_mult_11u_15u_0_0_5), .A1(s_mult_11u_15u_0_0_6), 
           .B0(mult_11u_15u_0_pp_2_5), .B1(s_mult_11u_15u_0_1_6), .CI(co_mult_11u_15u_0_3_1), 
           .COUT(co_mult_11u_15u_0_3_2), .S0(n60[5]), .S1(n60[6])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FADD2B mult_11u_15u_0_add_3_3 (.A0(s_mult_11u_15u_0_0_7), .A1(s_mult_11u_15u_0_0_8), 
           .B0(s_mult_11u_15u_0_1_7), .B1(s_mult_11u_15u_0_1_8), .CI(co_mult_11u_15u_0_3_2), 
           .S0(n60[7]), .S1(s_mult_11u_15u_0_3_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    LUT4 i12058_2_lut (.A(n118[0]), .B(n21537), .Z(time_count_down_14__N_956[0])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(72[28:50])
    defparam i12058_2_lut.init = 16'h2222;
    FD1S3DX init_velocity_i8 (.D(init_velocity_10__N_887[8]), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i8.GSR = "DISABLED";
    FADD2B Cadd_t_mult_11u_15u_0_4_1 (.A0(GND_net), .A1(s_mult_11u_15u_0_3_8), 
           .B0(GND_net), .B1(mult_11u_15u_0_pp_4_8), .CI(GND_net), .S1(n60[8])) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    LUT4 i18472_3_lut_4_lut_4_lut (.A(n21547), .B(n397[6]), .C(stop_flag_N_1026), 
         .D(handline[6]), .Z(init_position_8__N_990[6])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18472_3_lut_4_lut_4_lut.init = 16'hc5c0;
    MULT2 mult_11u_15u_0_mult_0_0 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(init_velocity[1]), 
          .B1(init_velocity[0]), .B2(init_velocity[1]), .B3(init_velocity[0]), 
          .CI(mult_11u_15u_0_cin_lr_0), .CO(mco_adj_2574), .P0(n60[1]), 
          .P1(mult_11u_15u_0_pp_0_2)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_0_1 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(init_velocity[1]), 
          .B1(init_velocity[0]), .B2(init_velocity[1]), .B3(init_velocity[0]), 
          .CI(mco_adj_2574), .CO(mco_1_adj_2575), .P0(mult_11u_15u_0_pp_0_3), 
          .P1(mult_11u_15u_0_pp_0_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_0_2 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(init_velocity[1]), 
          .B1(init_velocity[0]), .B2(init_velocity[1]), .B3(init_velocity[0]), 
          .CI(mco_1_adj_2575), .CO(mco_2_adj_2576), .P0(mult_11u_15u_0_pp_0_5), 
          .P1(mult_11u_15u_0_pp_0_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_0_3 (.A0(time_count_down[6]), .A1(time_count_down[7]), 
          .A2(time_count_down[7]), .A3(time_count_down[8]), .B0(init_velocity[1]), 
          .B1(init_velocity[0]), .B2(init_velocity[1]), .B3(init_velocity[0]), 
          .CI(mco_2_adj_2576), .P0(mult_11u_15u_0_pp_0_7), .P1(mult_11u_15u_0_pp_0_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_2_0 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(init_velocity[3]), 
          .B1(init_velocity[2]), .B2(init_velocity[3]), .B3(init_velocity[2]), 
          .CI(mult_11u_15u_0_cin_lr_2), .CO(mco_7_adj_2577), .P0(mult_11u_15u_0_pp_1_3), 
          .P1(mult_11u_15u_0_pp_1_4)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_2_1 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(init_velocity[3]), 
          .B1(init_velocity[2]), .B2(init_velocity[3]), .B3(init_velocity[2]), 
          .CI(mco_7_adj_2577), .CO(mco_8_adj_2578), .P0(mult_11u_15u_0_pp_1_5), 
          .P1(mult_11u_15u_0_pp_1_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_2_2 (.A0(time_count_down[4]), .A1(time_count_down[5]), 
          .A2(time_count_down[5]), .A3(time_count_down[6]), .B0(init_velocity[3]), 
          .B1(init_velocity[2]), .B2(init_velocity[3]), .B3(init_velocity[2]), 
          .CI(mco_8_adj_2578), .P0(mult_11u_15u_0_pp_1_7), .P1(mult_11u_15u_0_pp_1_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FD1S3DX init_velocity_i7 (.D(init_velocity_10__N_887[7]), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i7.GSR = "DISABLED";
    LUT4 i18456_3_lut_4_lut_4_lut (.A(n21547), .B(n397[0]), .C(stop_flag_N_1026), 
         .D(handline[0]), .Z(init_position_8__N_990[0])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18456_3_lut_4_lut_4_lut.init = 16'hc5c0;
    MULT2 mult_11u_15u_0_mult_4_0 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(init_velocity[5]), 
          .B1(init_velocity[4]), .B2(init_velocity[5]), .B3(init_velocity[4]), 
          .CI(mult_11u_15u_0_cin_lr_4), .CO(mco_14_adj_2579), .P0(mult_11u_15u_0_pp_2_5), 
          .P1(mult_11u_15u_0_pp_2_6)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_4_1 (.A0(time_count_down[2]), .A1(time_count_down[3]), 
          .A2(time_count_down[3]), .A3(time_count_down[4]), .B0(init_velocity[5]), 
          .B1(init_velocity[4]), .B2(init_velocity[5]), .B3(init_velocity[4]), 
          .CI(mco_14_adj_2579), .P0(mult_11u_15u_0_pp_2_7), .P1(mult_11u_15u_0_pp_2_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    MULT2 mult_11u_15u_0_mult_6_0 (.A0(time_count_down[0]), .A1(time_count_down[1]), 
          .A2(time_count_down[1]), .A3(time_count_down[2]), .B0(init_velocity[7]), 
          .B1(init_velocity[6]), .B2(init_velocity[7]), .B3(init_velocity[6]), 
          .CI(mult_11u_15u_0_cin_lr_6), .P0(mult_11u_15u_0_pp_3_7), .P1(mult_11u_15u_0_pp_3_8)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    FD1S3DX pic_y_i2_8998_8999_reset (.D(pic_y_8__N_773[2]), .CK(clk_out), 
            .CD(pic_y_8__N_811), .Q(n10816)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i2_8998_8999_reset.GSR = "DISABLED";
    FADD2B mult_11u_15u_0_cin_lr_add_0 (.A0(GND_net), .A1(GND_net), .B0(GND_net), 
           .B1(GND_net), .CI(GND_net), .COUT(mult_11u_15u_0_cin_lr_0)) /* synthesis syn_instantiated=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[64:95])
    CCU2D sub_15_add_2_11 (.A0(time_count_down[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18291), .COUT(n18292), .S0(n134[9]), .S1(n134[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_11.INIT0 = 16'h5555;
    defparam sub_15_add_2_11.INIT1 = 16'h5555;
    defparam sub_15_add_2_11.INJECT1_0 = "NO";
    defparam sub_15_add_2_11.INJECT1_1 = "NO";
    FD1S3BX pic_y_i2_8998_8999_set (.D(pic_y_8__N_773[2]), .CK(clk_out), 
            .PD(pic_y_8__N_790), .Q(n10815)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i2_8998_8999_set.GSR = "DISABLED";
    LUT4 i12287_2_lut (.A(n1205[2]), .B(n21537), .Z(position_8__N_925[2])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12287_2_lut.init = 16'h2222;
    LUT4 mux_55_i1_3_lut (.A(n105[0]), .B(n3207[3]), .C(n21547), .Z(n727[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i1_3_lut.init = 16'hcaca;
    LUT4 i8979_3_lut_rep_284 (.A(n10795), .B(n10794), .C(n10793), .Z(n21630)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8979_3_lut_rep_284.init = 16'hcaca;
    LUT4 LessThan_43_i11_2_lut_rep_242_4_lut (.A(n10795), .B(n10794), .C(n10793), 
         .D(handline[5]), .Z(n21588)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i11_2_lut_rep_242_4_lut.init = 16'h35ca;
    FD1S3DX init_position_i3_8994_8995_reset (.D(n10190), .CK(clk_out), 
            .CD(pic_y_8__N_808), .Q(n10812)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i3_8994_8995_reset.GSR = "DISABLED";
    FD1S3DX pic_y_i3_8991_8992_reset (.D(pic_y_8__N_773[3]), .CK(clk_out), 
            .CD(pic_y_8__N_808), .Q(n10809)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i3_8991_8992_reset.GSR = "DISABLED";
    FD1S3BX pic_y_i3_8991_8992_set (.D(pic_y_8__N_773[3]), .CK(clk_out), 
            .PD(pic_y_8__N_789), .Q(n10808)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i3_8991_8992_set.GSR = "DISABLED";
    LUT4 i8986_3_lut_rep_285 (.A(n10802), .B(n10801), .C(n10800), .Z(n21631)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8986_3_lut_rep_285.init = 16'hcaca;
    LUT4 i11992_2_lut_4_lut (.A(n10802), .B(n10801), .C(n10800), .D(n21556), 
         .Z(n397[4])) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i11992_2_lut_4_lut.init = 16'hffca;
    LUT4 LessThan_43_i9_2_lut_rep_247_4_lut (.A(n10802), .B(n10801), .C(n10800), 
         .D(handline[4]), .Z(n21593)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i9_2_lut_rep_247_4_lut.init = 16'h35ca;
    LUT4 i18474_3_lut_4_lut_4_lut (.A(n21547), .B(n397[7]), .C(stop_flag_N_1026), 
         .D(handline[7]), .Z(init_position_8__N_990[7])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18474_3_lut_4_lut_4_lut.init = 16'hc5c0;
    LUT4 i18468_3_lut_4_lut_4_lut (.A(n21547), .B(n397[4]), .C(stop_flag_N_1026), 
         .D(handline[4]), .Z(init_position_8__N_990[4])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18468_3_lut_4_lut_4_lut.init = 16'hc5c0;
    LUT4 mux_13_i1_3_lut (.A(init_velocity[0]), .B(\hand_velocity[1] ), 
         .C(n536), .Z(n105[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i1_3_lut.init = 16'hcaca;
    FD1S3DX init_position_i4_8987_8988_reset (.D(n10182), .CK(clk_out), 
            .CD(pic_y_8__N_805), .Q(n10805)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i4_8987_8988_reset.GSR = "DISABLED";
    LUT4 i18470_3_lut_4_lut_4_lut (.A(n21547), .B(n6), .C(stop_flag_N_1026), 
         .D(handline[5]), .Z(init_position_8__N_990[5])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18470_3_lut_4_lut_4_lut.init = 16'hc5c0;
    LUT4 i18464_3_lut_4_lut_4_lut (.A(n21547), .B(n397[2]), .C(stop_flag_N_1026), 
         .D(handline[2]), .Z(init_position_8__N_990[2])) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam i18464_3_lut_4_lut_4_lut.init = 16'hc5c0;
    LUT4 i8965_3_lut_rep_289 (.A(n10781), .B(n10780), .C(n10779), .Z(n21635)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8965_3_lut_rep_289.init = 16'hcaca;
    LUT4 i11975_2_lut_2_lut_4_lut (.A(n10781), .B(n10780), .C(n10779), 
         .D(n21556), .Z(n397[7])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i11975_2_lut_2_lut_4_lut.init = 16'h00ca;
    LUT4 i12288_2_lut (.A(n1205[1]), .B(n21537), .Z(position_8__N_925[1])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12288_2_lut.init = 16'h2222;
    LUT4 i1_2_lut_rep_240_4_lut (.A(n10781), .B(n10780), .C(n10779), .D(n21637), 
         .Z(n21586)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i1_2_lut_rep_240_4_lut.init = 16'hffca;
    LUT4 LessThan_43_i15_2_lut_rep_244_4_lut (.A(n10781), .B(n10780), .C(n10779), 
         .D(handline[7]), .Z(n21590)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i15_2_lut_rep_244_4_lut.init = 16'h35ca;
    CCU2D sub_15_add_2_9 (.A0(time_count_down[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18290), .COUT(n18291), .S0(n134[7]), .S1(n134[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_9.INIT0 = 16'h5555;
    defparam sub_15_add_2_9.INIT1 = 16'h5555;
    defparam sub_15_add_2_9.INJECT1_0 = "NO";
    defparam sub_15_add_2_9.INJECT1_1 = "NO";
    LUT4 i8972_3_lut_rep_291 (.A(n10788), .B(n10787), .C(n10786), .Z(n21637)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8972_3_lut_rep_291.init = 16'hcaca;
    LUT4 mux_60_i9_4_lut_4_lut (.A(n21547), .B(stop_flag_N_1026), .C(n21638), 
         .D(handline[8]), .Z(init_position_8__N_990[8])) /* synthesis lut_function=(A (B (C))+!A (B (C)+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[15:39])
    defparam mux_60_i9_4_lut_4_lut.init = 16'hd1c0;
    CCU2D sub_15_add_2_7 (.A0(time_count_down[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18289), .COUT(n18290), .S0(n134[5]), .S1(n134[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_7.INIT0 = 16'h5555;
    defparam sub_15_add_2_7.INIT1 = 16'h5555;
    defparam sub_15_add_2_7.INJECT1_0 = "NO";
    defparam sub_15_add_2_7.INJECT1_1 = "NO";
    LUT4 i1_2_lut_4_lut (.A(n10788), .B(n10787), .C(n10786), .D(n19848), 
         .Z(n4_adj_2580)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i1_2_lut_4_lut.init = 16'hffca;
    LUT4 i11976_2_lut_2_lut_4_lut (.A(n10788), .B(n10787), .C(n10786), 
         .D(n21556), .Z(n397[6])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i11976_2_lut_2_lut_4_lut.init = 16'h00ca;
    LUT4 LessThan_43_i13_2_lut_rep_243_4_lut (.A(n10788), .B(n10787), .C(n10786), 
         .D(handline[6]), .Z(n21589)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i13_2_lut_rep_243_4_lut.init = 16'h35ca;
    LUT4 i8958_3_lut_rep_292 (.A(n10774), .B(n10773), .C(n10772), .Z(n21638)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8958_3_lut_rep_292.init = 16'hcaca;
    CCU2D sub_15_add_2_5 (.A0(time_count_down[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18288), .COUT(n18289), .S0(n134[3]), .S1(n134[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_5.INIT0 = 16'h5555;
    defparam sub_15_add_2_5.INIT1 = 16'h5555;
    defparam sub_15_add_2_5.INJECT1_0 = "NO";
    defparam sub_15_add_2_5.INJECT1_1 = "NO";
    LUT4 LessThan_43_i17_2_lut_rep_245_4_lut (.A(n10774), .B(n10773), .C(n10772), 
         .D(handline[8]), .Z(n21591)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i17_2_lut_rep_245_4_lut.init = 16'h35ca;
    CCU2D sub_15_add_2_3 (.A0(time_count_down[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_down[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18287), .COUT(n18288), .S0(n134[1]), .S1(n134[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_3.INIT0 = 16'h5555;
    defparam sub_15_add_2_3.INIT1 = 16'h5555;
    defparam sub_15_add_2_3.INJECT1_0 = "NO";
    defparam sub_15_add_2_3.INJECT1_1 = "NO";
    CCU2D sub_15_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(time_count_down[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18287), .S1(n134[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[28:48])
    defparam sub_15_add_2_1.INIT0 = 16'hF000;
    defparam sub_15_add_2_1.INIT1 = 16'h5555;
    defparam sub_15_add_2_1.INJECT1_0 = "NO";
    defparam sub_15_add_2_1.INJECT1_1 = "NO";
    FD1S3DX pic_y_i4_8984_8985_reset (.D(pic_y_8__N_773[4]), .CK(clk_out), 
            .CD(pic_y_8__N_805), .Q(n10802)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i4_8984_8985_reset.GSR = "DISABLED";
    FD1S3BX pic_y_i4_8984_8985_set (.D(pic_y_8__N_773[4]), .CK(clk_out), 
            .PD(pic_y_8__N_788), .Q(n10801)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i4_8984_8985_set.GSR = "DISABLED";
    FD1S3DX init_position_i5_8980_8981_reset (.D(n10178), .CK(clk_out), 
            .CD(pic_y_8__N_802), .Q(n10798)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i5_8980_8981_reset.GSR = "DISABLED";
    FD1S3DX pic_y_i5_8977_8978_reset (.D(pic_y_8__N_773[5]), .CK(clk_out), 
            .CD(pic_y_8__N_802), .Q(n10795)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i5_8977_8978_reset.GSR = "DISABLED";
    FD1S3BX pic_y_i5_8977_8978_set (.D(pic_y_8__N_773[5]), .CK(clk_out), 
            .PD(pic_y_8__N_787), .Q(n10794)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i5_8977_8978_set.GSR = "DISABLED";
    LUT4 i12091_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[8]), .Z(time_count_up_14__N_1005[8])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12091_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    CCU2D add_1233_16 (.A0(n3170[17]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18282), 
          .S0(n2231[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_16.INIT0 = 16'h5aaa;
    defparam add_1233_16.INIT1 = 16'h0000;
    defparam add_1233_16.INJECT1_0 = "NO";
    defparam add_1233_16.INJECT1_1 = "NO";
    CCU2D add_1233_14 (.A0(n3170[15]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n3170[16]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18281), .COUT(n18282), .S0(n2231[12]), .S1(n2231[13]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_14.INIT0 = 16'h5aaa;
    defparam add_1233_14.INIT1 = 16'h5aaa;
    defparam add_1233_14.INJECT1_0 = "NO";
    defparam add_1233_14.INJECT1_1 = "NO";
    CCU2D add_1233_12 (.A0(n3170[13]), .B0(init_velocity[10]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18280), .COUT(n18281), .S0(n2231[10]), 
          .S1(n2231[11]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_12.INIT0 = 16'h5666;
    defparam add_1233_12.INIT1 = 16'h5aaa;
    defparam add_1233_12.INJECT1_0 = "NO";
    defparam add_1233_12.INJECT1_1 = "NO";
    LUT4 i12082_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[11]), .Z(time_count_up_14__N_1005[11])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12082_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i12081_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[12]), .Z(time_count_up_14__N_1005[12])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12081_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i12784_4_lut_rep_191 (.A(n1[7]), .B(pic_y_8__N_907[8]), .C(n18596), 
         .D(n1[6]), .Z(n21537)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i12784_4_lut_rep_191.init = 16'hccc8;
    LUT4 i12051_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[14]), .Z(time_count_up_14__N_1005[14])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12051_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i12066_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[13]), .Z(time_count_up_14__N_1005[13])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12066_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i12084_2_lut_2_lut_2_lut (.A(n1[7]), .B(pic_y_8__N_907[8]), .Z(pic_y_8__N_907[7])) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i12084_2_lut_2_lut_2_lut.init = 16'h2222;
    FD1S3DX init_position_i6_8973_8974_reset (.D(n10174), .CK(clk_out), 
            .CD(pic_y_8__N_799), .Q(n10791)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i6_8973_8974_reset.GSR = "DISABLED";
    LUT4 i12085_2_lut_2_lut_2_lut (.A(pic_y_8__N_907[8]), .B(n1[6]), .Z(pic_y_8__N_907[6])) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i12085_2_lut_2_lut_2_lut.init = 16'h4444;
    FD1S3DX pic_y_i6_8970_8971_reset (.D(pic_y_8__N_773[6]), .CK(clk_out), 
            .CD(pic_y_8__N_799), .Q(n10788)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i6_8970_8971_reset.GSR = "DISABLED";
    CCU2D add_1233_10 (.A0(n3170[11]), .B0(init_velocity[8]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[12]), .B1(init_velocity[9]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18279), .COUT(n18280), .S0(n2231[8]), 
          .S1(n2231[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_10.INIT0 = 16'h5666;
    defparam add_1233_10.INIT1 = 16'h5666;
    defparam add_1233_10.INJECT1_0 = "NO";
    defparam add_1233_10.INJECT1_1 = "NO";
    CCU2D add_1233_8 (.A0(n3170[9]), .B0(init_velocity[6]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[10]), .B1(init_velocity[7]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18278), .COUT(n18279), .S0(n2231[6]), 
          .S1(n2231[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_8.INIT0 = 16'h5666;
    defparam add_1233_8.INIT1 = 16'h5666;
    defparam add_1233_8.INJECT1_0 = "NO";
    defparam add_1233_8.INJECT1_1 = "NO";
    CCU2D add_1233_6 (.A0(n3170[7]), .B0(init_velocity[4]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[8]), .B1(init_velocity[5]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18277), .COUT(n18278), .S0(n2231[4]), 
          .S1(n2231[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_6.INIT0 = 16'h5666;
    defparam add_1233_6.INIT1 = 16'h5666;
    defparam add_1233_6.INJECT1_0 = "NO";
    defparam add_1233_6.INJECT1_1 = "NO";
    LUT4 i12041_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[0]), .Z(time_count_up_14__N_1005[0])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12041_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i18522_2_lut_rep_180_3_lut (.A(n8889), .B(n21638), .C(n536), 
         .Z(n21526)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18522_2_lut_rep_180_3_lut.init = 16'h0707;
    CCU2D add_1233_4 (.A0(n3170[5]), .B0(init_velocity[2]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[6]), .B1(init_velocity[3]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18276), .COUT(n18277), .S0(n2231[2]), 
          .S1(n2231[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_4.INIT0 = 16'h5666;
    defparam add_1233_4.INIT1 = 16'h5666;
    defparam add_1233_4.INJECT1_0 = "NO";
    defparam add_1233_4.INJECT1_1 = "NO";
    LUT4 i18523_2_lut_rep_179_3_lut_4_lut (.A(n8889), .B(n21638), .C(n21550), 
         .D(n536), .Z(n21525)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A ((D)+!C))) */ ;
    defparam i18523_2_lut_rep_179_3_lut_4_lut.init = 16'h0070;
    LUT4 i8954_3_lut (.A(n10770), .B(n10769), .C(n10765), .Z(init_position[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8954_3_lut.init = 16'hcaca;
    FD1P3DX init_velocity_i2 (.D(n10918), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i2.GSR = "DISABLED";
    FD1S3BX pic_y_i6_8970_8971_set (.D(pic_y_8__N_773[6]), .CK(clk_out), 
            .PD(pic_y_8__N_786), .Q(n10787)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i6_8970_8971_set.GSR = "DISABLED";
    LUT4 i12089_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[10]), .Z(time_count_up_14__N_1005[10])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12089_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i9010_3_lut (.A(n10826), .B(n10825), .C(n10821), .Z(init_position[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i9010_3_lut.init = 16'hcaca;
    LUT4 i9003_3_lut (.A(n10819), .B(n10818), .C(n10814), .Z(init_position[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i9003_3_lut.init = 16'hcaca;
    CCU2D add_1233_2 (.A0(n3170[3]), .B0(init_velocity[0]), .C0(GND_net), 
          .D0(GND_net), .A1(n3170[4]), .B1(init_velocity[1]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18276), .S1(n2231[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(81[25:82])
    defparam add_1233_2.INIT0 = 16'h7000;
    defparam add_1233_2.INIT1 = 16'h5666;
    defparam add_1233_2.INJECT1_0 = "NO";
    defparam add_1233_2.INJECT1_1 = "NO";
    LUT4 i12090_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[9]), .Z(time_count_up_14__N_1005[9])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12090_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    FD1S3DX pic_y_i0_8949_8950_reset (.D(pic_y_8__N_773[0]), .CK(clk_out), 
            .CD(pic_y_8__N_817), .Q(n10767)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i0_8949_8950_reset.GSR = "DISABLED";
    LUT4 i8996_3_lut (.A(n10812), .B(n10811), .C(n10807), .Z(init_position[3])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8996_3_lut.init = 16'hcaca;
    FD1P3DX init_velocity_i3 (.D(n10916), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i3.GSR = "DISABLED";
    FD1S3DX init_position_i7_8966_8967_reset (.D(n10170), .CK(clk_out), 
            .CD(pic_y_8__N_796), .Q(n10784)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i7_8966_8967_reset.GSR = "DISABLED";
    LUT4 i8989_3_lut (.A(n10805), .B(n10804), .C(n10800), .Z(init_position[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8989_3_lut.init = 16'hcaca;
    LUT4 i9007_3_lut_rep_318 (.A(n10823), .B(n10822), .C(n10821), .Z(n21664)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i9007_3_lut_rep_318.init = 16'hcaca;
    LUT4 i12035_2_lut_2_lut_4_lut (.A(n10823), .B(n10822), .C(n10821), 
         .D(n21556), .Z(n397[1])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i12035_2_lut_2_lut_4_lut.init = 16'h00ca;
    LUT4 i8982_3_lut (.A(n10798), .B(n10797), .C(n10793), .Z(init_position[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8982_3_lut.init = 16'hcaca;
    LUT4 i8975_3_lut (.A(n10791), .B(n10790), .C(n10786), .Z(init_position[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8975_3_lut.init = 16'hcaca;
    LUT4 i12100_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[7]), .Z(time_count_up_14__N_1005[7])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12100_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i8968_3_lut (.A(n10784), .B(n10783), .C(n10779), .Z(init_position[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8968_3_lut.init = 16'hcaca;
    FD1P3DX init_velocity_i0 (.D(n10849), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i0.GSR = "DISABLED";
    LUT4 i8961_3_lut (.A(n10777), .B(n10776), .C(n10772), .Z(init_position[8])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8961_3_lut.init = 16'hcaca;
    LUT4 mux_67_i8_4_lut (.A(n17998[7]), .B(n21635), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[7])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i8_4_lut.init = 16'hcac0;
    LUT4 i12173_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[6]), .Z(time_count_up_14__N_1005[6])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12173_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    FD1S3DX pic_y_i7_8963_8964_reset (.D(pic_y_8__N_773[7]), .CK(clk_out), 
            .CD(pic_y_8__N_796), .Q(n10781)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i7_8963_8964_reset.GSR = "DISABLED";
    LUT4 mux_67_i7_4_lut (.A(n17998[6]), .B(n21637), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[6])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i7_4_lut.init = 16'hcac0;
    LUT4 mux_67_i6_4_lut (.A(n17998[5]), .B(n21630), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[5])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i6_4_lut.init = 16'hcac0;
    LUT4 i12208_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[5]), .Z(time_count_up_14__N_1005[5])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12208_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i12086_2_lut (.A(n1[5]), .B(n21537), .Z(pic_y_8__N_907[5])) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12086_2_lut.init = 16'heeee;
    LUT4 i8951_3_lut_rep_320 (.A(n10767), .B(n10766), .C(n10765), .Z(n21666)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8951_3_lut_rep_320.init = 16'hcaca;
    LUT4 i12002_2_lut_4_lut (.A(n10767), .B(n10766), .C(n10765), .D(n21556), 
         .Z(n397[0])) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i12002_2_lut_4_lut.init = 16'hffca;
    LUT4 mux_67_i5_4_lut (.A(n17998[4]), .B(n21631), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[4])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i5_4_lut.init = 16'hcac0;
    LUT4 i12087_2_lut (.A(n1[4]), .B(n21537), .Z(pic_y_8__N_907[4])) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12087_2_lut.init = 16'heeee;
    FD1S3BX pic_y_i7_8963_8964_set (.D(pic_y_8__N_773[7]), .CK(clk_out), 
            .PD(pic_y_8__N_785), .Q(n10780)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i7_8963_8964_set.GSR = "DISABLED";
    FD1S3DX init_position_i8_8959_8960_reset (.D(n10166), .CK(clk_out), 
            .CD(pic_y_8__N_793), .Q(n10777)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i8_8959_8960_reset.GSR = "DISABLED";
    LUT4 mux_67_i4_4_lut (.A(n17998[3]), .B(n21677), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[3])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i4_4_lut.init = 16'hcac0;
    LUT4 mux_67_i2_4_lut (.A(n17998[1]), .B(n21664), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[1])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i2_4_lut.init = 16'hcac0;
    LUT4 mux_67_i3_4_lut (.A(n17998[2]), .B(n21678), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[2])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i3_4_lut.init = 16'hcac0;
    FD1S3DX pic_y_i8_8956_8957_reset (.D(pic_y_8__N_773[8]), .CK(clk_out), 
            .CD(pic_y_8__N_793), .Q(n10774)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i8_8956_8957_reset.GSR = "DISABLED";
    LUT4 i12094_2_lut (.A(n1[2]), .B(n21537), .Z(pic_y_8__N_907[2])) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12094_2_lut.init = 16'heeee;
    LUT4 i12227_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[4]), .Z(time_count_up_14__N_1005[4])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12227_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i18680_2_lut (.A(n22446), .B(n21537), .Z(clk_out_enable_25)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i18680_2_lut.init = 16'h4444;
    LUT4 mux_67_i1_4_lut (.A(n17998[0]), .B(n21666), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[0])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i1_4_lut.init = 16'hcac0;
    FD1P3DX init_velocity_i4 (.D(n10914), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i4.GSR = "DISABLED";
    LUT4 i12011_2_lut (.A(n1[0]), .B(n21537), .Z(pic_y_8__N_907[0])) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(76[8] 88[11])
    defparam i12011_2_lut.init = 16'heeee;
    FD1P3DX init_velocity_i5 (.D(n10912), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i5.GSR = "DISABLED";
    FD1S3BX pic_y_i8_8956_8957_set (.D(pic_y_8__N_773[8]), .CK(clk_out), 
            .PD(pic_y_8__N_782), .Q(n10773)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i8_8956_8957_set.GSR = "DISABLED";
    FD1S3DX init_position_i0_8952_8953_reset (.D(n10094), .CK(clk_out), 
            .CD(pic_y_8__N_817), .Q(n10770)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i0_8952_8953_reset.GSR = "DISABLED";
    LUT4 i12228_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[3]), .Z(time_count_up_14__N_1005[3])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12228_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i42_4_lut_rep_201 (.A(n21635), .B(n8889), .C(n21638), .D(n4_adj_2580), 
         .Z(n21547)) /* synthesis lut_function=(A (B (C))+!A (B (C+!(D))+!B !(C+(D)))) */ ;
    defparam i42_4_lut_rep_201.init = 16'hc0c5;
    LUT4 mux_55_i3_3_lut (.A(n105[2]), .B(n3207[5]), .C(n21547), .Z(n727[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i3_3_lut.init = 16'hcaca;
    CCU2D add_3339_15 (.A0(time_count_r[13]), .B0(time_count_up[13]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[14]), .B1(time_count_up[14]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18259), .S0(n419[13]), .S1(n5057[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_15.INIT0 = 16'h5999;
    defparam add_3339_15.INIT1 = 16'h5999;
    defparam add_3339_15.INJECT1_0 = "NO";
    defparam add_3339_15.INJECT1_1 = "NO";
    LUT4 mux_13_i3_3_lut (.A(init_velocity[2]), .B(\hand_velocity[3] ), 
         .C(n536), .Z(n105[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i3_3_lut.init = 16'hcaca;
    LUT4 i12233_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[2]), .Z(time_count_up_14__N_1005[2])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12233_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    LUT4 i8993_3_lut_rep_331 (.A(n10809), .B(n10808), .C(n10807), .Z(n21677)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8993_3_lut_rep_331.init = 16'hcaca;
    LUT4 i12009_2_lut_2_lut_4_lut (.A(n10809), .B(n10808), .C(n10807), 
         .D(n21556), .Z(n397[3])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i12009_2_lut_2_lut_4_lut.init = 16'h00ca;
    LUT4 LessThan_43_i7_2_lut_rep_246_4_lut (.A(n10809), .B(n10808), .C(n10807), 
         .D(handline[3]), .Z(n21592)) /* synthesis lut_function=(!(A (B (D)+!B !(C (D)+!C !(D)))+!A (B (C (D)+!C !(D))+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam LessThan_43_i7_2_lut_rep_246_4_lut.init = 16'h35ca;
    CCU2D add_3339_13 (.A0(time_count_r[11]), .B0(time_count_up[11]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[12]), .B1(time_count_up[12]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18258), .COUT(n18259), .S0(n419[11]), 
          .S1(n419[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_13.INIT0 = 16'h5999;
    defparam add_3339_13.INIT1 = 16'h5999;
    defparam add_3339_13.INJECT1_0 = "NO";
    defparam add_3339_13.INJECT1_1 = "NO";
    CCU2D add_3339_11 (.A0(time_count_r[9]), .B0(time_count_up[9]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[10]), .B1(time_count_up[10]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18257), .COUT(n18258), .S0(n419[9]), 
          .S1(n419[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_11.INIT0 = 16'h5999;
    defparam add_3339_11.INIT1 = 16'h5999;
    defparam add_3339_11.INJECT1_0 = "NO";
    defparam add_3339_11.INJECT1_1 = "NO";
    LUT4 i12284_2_lut (.A(n1205[5]), .B(n21537), .Z(position_8__N_925[5])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam i12284_2_lut.init = 16'h2222;
    LUT4 i9000_3_lut_rep_332 (.A(n10816), .B(n10815), .C(n10814), .Z(n21678)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i9000_3_lut_rep_332.init = 16'hcaca;
    CCU2D add_3339_9 (.A0(time_count_r[7]), .B0(time_count_up[7]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[8]), .B1(time_count_up[8]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18256), .COUT(n18257), .S0(n419[7]), .S1(n419[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_9.INIT0 = 16'h5999;
    defparam add_3339_9.INIT1 = 16'h5999;
    defparam add_3339_9.INJECT1_0 = "NO";
    defparam add_3339_9.INJECT1_1 = "NO";
    CCU2D add_3339_7 (.A0(time_count_r[5]), .B0(time_count_up[5]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[6]), .B1(time_count_up[6]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18255), .COUT(n18256), .S0(n419[5]), .S1(n419[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_7.INIT0 = 16'h5999;
    defparam add_3339_7.INIT1 = 16'h5999;
    defparam add_3339_7.INJECT1_0 = "NO";
    defparam add_3339_7.INJECT1_1 = "NO";
    FD1P3DX init_velocity_i1 (.D(n10828), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i1.GSR = "DISABLED";
    FD1S3BX pic_y_i0_8949_8950_set (.D(pic_y_8__N_773[0]), .CK(clk_out), 
            .PD(pic_y_8__N_792), .Q(n10766)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam pic_y_i0_8949_8950_set.GSR = "DISABLED";
    LUT4 i12234_2_lut_3_lut_3_lut_4_lut (.A(n21550), .B(n21526), .C(stop_flag_N_1026), 
         .D(n1274[1]), .Z(time_count_up_14__N_1005[1])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam i12234_2_lut_3_lut_3_lut_4_lut.init = 16'h0800;
    FD1P3DX init_velocity_i6 (.D(n10910), .SP(clk_out_enable_46), .CK(clk_out), 
            .CD(n21688), .Q(init_velocity[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_velocity_i6.GSR = "DISABLED";
    LUT4 i12013_2_lut_4_lut (.A(n10816), .B(n10815), .C(n10814), .D(n21556), 
         .Z(n397[2])) /* synthesis lut_function=(A (B+((D)+!C))+!A (B (C+(D))+!B (D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i12013_2_lut_4_lut.init = 16'hffca;
    CCU2D add_1234_add_1_add_1_9 (.A0(n537[10]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n537[11]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18356), .S0(n2[7]), .S1(n2[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_1_9.INIT0 = 16'hfaaa;
    defparam add_1234_add_1_add_1_9.INIT1 = 16'h0555;
    defparam add_1234_add_1_add_1_9.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_1_9.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_1_7 (.A0(n537[8]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n537[9]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18355), .COUT(n18356), .S0(n2[5]), .S1(n2[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_1_7.INIT0 = 16'h0555;
    defparam add_1234_add_1_add_1_7.INIT1 = 16'hfaaa;
    defparam add_1234_add_1_add_1_7.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_1_7.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut (.A(n21638), .B(n21586), .C(n19848), .D(n8889), 
         .Z(n19938)) /* synthesis lut_function=(!(A (D)+!A !(B+(C)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h54fe;
    CCU2D add_1234_add_1_add_1_5 (.A0(n537[6]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n537[7]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18354), .COUT(n18355), .S0(n2[3]), .S1(n2[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_1_5.INIT0 = 16'hfaaa;
    defparam add_1234_add_1_add_1_5.INIT1 = 16'h0555;
    defparam add_1234_add_1_add_1_5.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_1_5.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_1_3 (.A0(n537[4]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n537[5]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18353), .COUT(n18354), .S0(n2[1]), .S1(n2[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_1_3.INIT0 = 16'hfaaa;
    defparam add_1234_add_1_add_1_3.INIT1 = 16'h0555;
    defparam add_1234_add_1_add_1_3.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_1_3.INJECT1_1 = "NO";
    LUT4 i3_4_lut (.A(n14432), .B(n21631), .C(n21630), .D(n21677), .Z(n19848)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam i3_4_lut.init = 16'hfffe;
    CCU2D add_3339_5 (.A0(time_count_r[3]), .B0(time_count_up[3]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[4]), .B1(time_count_up[4]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18254), .COUT(n18255), .S0(n419[3]), .S1(n419[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_5.INIT0 = 16'h5999;
    defparam add_3339_5.INIT1 = 16'h5999;
    defparam add_3339_5.INJECT1_0 = "NO";
    defparam add_3339_5.INJECT1_1 = "NO";
    LUT4 i18_3_lut (.A(pic_y_8__N_907[8]), .B(pic_y_8__N_916[8]), .C(n22446), 
         .Z(pic_y_8__N_773[8])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(61[4] 164[11])
    defparam i18_3_lut.init = 16'hcaca;
    LUT4 mux_67_i9_4_lut (.A(n17998[8]), .B(n21638), .C(n1284), .D(n21525), 
         .Z(pic_y_8__N_916[8])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(119[12] 147[11])
    defparam mux_67_i9_4_lut.init = 16'hcac0;
    FD1S3DX init_position_i1_9008_9009_reset (.D(n10252), .CK(clk_out), 
            .CD(pic_y_8__N_814), .Q(n10826)) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=13, LSE_LCOL=9, LSE_RCOL=2, LSE_LLINE=106, LSE_RLINE=123 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam init_position_i1_9008_9009_reset.GSR = "DISABLED";
    LUT4 mux_55_i5_3_lut (.A(n105[4]), .B(n3207[7]), .C(n21547), .Z(n727[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i5_3_lut.init = 16'hcaca;
    LUT4 mux_13_i5_3_lut (.A(init_velocity[4]), .B(\hand_velocity[5] ), 
         .C(n536), .Z(n105[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i5_3_lut.init = 16'hcaca;
    LUT4 LessThan_43_i4_4_lut (.A(handline[0]), .B(handline[1]), .C(n21664), 
         .D(n21666), .Z(n4)) /* synthesis lut_function=(!(A (B (C (D))+!B (C+(D)))+!A ((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i4_4_lut.init = 16'h0c8e;
    LUT4 mux_55_i6_3_lut (.A(n105[5]), .B(n3207[8]), .C(n21547), .Z(n727[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i6_3_lut.init = 16'hcaca;
    LUT4 mux_13_i6_3_lut (.A(init_velocity[5]), .B(\hand_velocity[6] ), 
         .C(n536), .Z(n105[5])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i6_3_lut.init = 16'hcaca;
    CCU2D add_3339_3 (.A0(time_count_r[1]), .B0(time_count_up[1]), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_r[2]), .B1(time_count_up[2]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18253), .COUT(n18254), .S0(n419[1]), .S1(n419[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_3.INIT0 = 16'h5999;
    defparam add_3339_3.INIT1 = 16'h5999;
    defparam add_3339_3.INJECT1_0 = "NO";
    defparam add_3339_3.INJECT1_1 = "NO";
    LUT4 i3200_1_lut_rep_345 (.A(n22446), .Z(clk_out_enable_39)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i3200_1_lut_rep_345.init = 16'h5555;
    CCU2D add_1234_add_1_add_1_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n537[3]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18353), .S1(n2[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_1_1.INIT0 = 16'hF000;
    defparam add_1234_add_1_add_1_1.INIT1 = 16'h0555;
    defparam add_1234_add_1_add_1_1.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_1_1.INJECT1_1 = "NO";
    LUT4 i2_3_lut_3_lut (.A(n22446), .B(init_velocity[0]), .C(n3170[3]), 
         .Z(n3664)) /* synthesis lut_function=(!(A+(B (C)+!B !(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_3_lut_3_lut.init = 16'h1414;
    CCU2D add_3339_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(time_count_r[0]), .B1(time_count_up[0]), .C1(GND_net), .D1(GND_net), 
          .COUT(n18253), .S1(n419[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(122[27:57])
    defparam add_3339_1.INIT0 = 16'h0000;
    defparam add_3339_1.INIT1 = 16'h5999;
    defparam add_3339_1.INJECT1_0 = "NO";
    defparam add_3339_1.INJECT1_1 = "NO";
    LUT4 mux_55_i2_3_lut (.A(n105[1]), .B(n3207[4]), .C(n21547), .Z(n727[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i2_3_lut.init = 16'hcaca;
    CCU2D add_191_10 (.A0(n29[11]), .B0(n60[8]), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18252), 
          .S0(n1205[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam add_191_10.INIT0 = 16'h5666;
    defparam add_191_10.INIT1 = 16'h0000;
    defparam add_191_10.INJECT1_0 = "NO";
    defparam add_191_10.INJECT1_1 = "NO";
    LUT4 i2_2_lut_2_lut (.A(n22446), .B(n2231[14]), .Z(n3816)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut.init = 16'h4444;
    LUT4 mux_13_i2_3_lut (.A(init_velocity[1]), .B(\hand_velocity[2] ), 
         .C(n536), .Z(n105[1])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i2_3_lut.init = 16'hcaca;
    LUT4 i2_2_lut_2_lut_adj_238 (.A(n22446), .B(n2231[13]), .Z(n3814)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_238.init = 16'h4444;
    LUT4 mux_55_i7_3_lut (.A(n105[6]), .B(n3207[9]), .C(n21547), .Z(n727[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(131[8] 147[11])
    defparam mux_55_i7_3_lut.init = 16'hcaca;
    LUT4 mux_13_i7_3_lut (.A(init_velocity[6]), .B(\hand_velocity[7] ), 
         .C(n536), .Z(n105[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(69[9] 70[44])
    defparam mux_13_i7_3_lut.init = 16'hcaca;
    LUT4 i2_2_lut_2_lut_adj_239 (.A(n22446), .B(n2231[12]), .Z(n3812)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_239.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_240 (.A(n22446), .B(n2231[11]), .Z(n3810)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_240.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_241 (.A(n22446), .B(n2231[10]), .Z(n3808)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_241.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_242 (.A(n22446), .B(n2231[9]), .Z(n3806)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_242.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_243 (.A(n22446), .B(n2231[8]), .Z(n3804)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_243.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_244 (.A(n22446), .B(n2231[7]), .Z(n3802)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_244.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_245 (.A(n22446), .B(n2231[6]), .Z(n3800)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_245.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_246 (.A(n22446), .B(n2231[5]), .Z(n3798)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_246.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_247 (.A(n22446), .B(n2231[4]), .Z(n3796)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_247.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_248 (.A(n22446), .B(n2231[3]), .Z(n3794)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_248.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_249 (.A(n22446), .B(n2231[2]), .Z(n3792)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_249.init = 16'h4444;
    LUT4 i2_2_lut_2_lut_adj_250 (.A(n22446), .B(n2231[1]), .Z(n3790)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(90[5:7])
    defparam i2_2_lut_2_lut_adj_250.init = 16'h4444;
    CCU2D add_191_8 (.A0(n29[9]), .B0(n60[6]), .C0(GND_net), .D0(GND_net), 
          .A1(n29[10]), .B1(n60[7]), .C1(GND_net), .D1(GND_net), .CIN(n18251), 
          .COUT(n18252), .S0(n1205[6]), .S1(n1205[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam add_191_8.INIT0 = 16'h5666;
    defparam add_191_8.INIT1 = 16'h5666;
    defparam add_191_8.INJECT1_0 = "NO";
    defparam add_191_8.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_2_9 (.A0(n585[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n585[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18346), .S0(n13[7]), .S1(n13[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_2_9.INIT0 = 16'ha555;
    defparam add_1234_add_1_add_2_9.INIT1 = 16'ha555;
    defparam add_1234_add_1_add_2_9.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_2_9.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_2_7 (.A0(n585[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n585[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18345), .COUT(n18346), .S0(n13[5]), .S1(n13[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_2_7.INIT0 = 16'ha555;
    defparam add_1234_add_1_add_2_7.INIT1 = 16'ha555;
    defparam add_1234_add_1_add_2_7.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_2_7.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_2_5 (.A0(n585[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n585[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18344), .COUT(n18345), .S0(n13[3]), .S1(n13[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_2_5.INIT0 = 16'ha555;
    defparam add_1234_add_1_add_2_5.INIT1 = 16'ha555;
    defparam add_1234_add_1_add_2_5.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_2_5.INJECT1_1 = "NO";
    CCU2D add_191_6 (.A0(n29[7]), .B0(n60[4]), .C0(GND_net), .D0(GND_net), 
          .A1(n29[8]), .B1(n60[5]), .C1(GND_net), .D1(GND_net), .CIN(n18250), 
          .COUT(n18251), .S0(n1205[4]), .S1(n1205[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam add_191_6.INIT0 = 16'h5666;
    defparam add_191_6.INIT1 = 16'h5666;
    defparam add_191_6.INJECT1_0 = "NO";
    defparam add_191_6.INJECT1_1 = "NO";
    FD1S1D i8948 (.D(n22433), .CK(pic_y_8__N_792), .CD(pic_y_8__N_817), 
           .Q(n10765));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(60[3] 165[6])
    defparam i8948.GSR = "DISABLED";
    LUT4 i2538_4_lut_rep_210 (.A(n10), .B(n21638), .C(n21586), .D(n21630), 
         .Z(n21556)) /* synthesis lut_function=(A (B (C+(D)))+!A (B (C))) */ ;
    defparam i2538_4_lut_rep_210.init = 16'hc8c0;
    CCU2D add_1234_add_1_add_2_3 (.A0(n585[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n585[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18343), .COUT(n18344), .S0(n13[1]), .S1(n13[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_2_3.INIT0 = 16'ha555;
    defparam add_1234_add_1_add_2_3.INIT1 = 16'ha555;
    defparam add_1234_add_1_add_2_3.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_2_3.INJECT1_1 = "NO";
    CCU2D add_1234_add_1_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n585[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18343), .S1(n13[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(144[19:63])
    defparam add_1234_add_1_add_2_1.INIT0 = 16'hF000;
    defparam add_1234_add_1_add_2_1.INIT1 = 16'haaaa;
    defparam add_1234_add_1_add_2_1.INJECT1_0 = "NO";
    defparam add_1234_add_1_add_2_1.INJECT1_1 = "NO";
    CCU2D add_191_4 (.A0(n29[5]), .B0(n60[2]), .C0(GND_net), .D0(GND_net), 
          .A1(n29[6]), .B1(n60[3]), .C1(GND_net), .D1(GND_net), .CIN(n18249), 
          .COUT(n18250), .S0(n1205[2]), .S1(n1205[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam add_191_4.INIT0 = 16'h5666;
    defparam add_191_4.INIT1 = 16'h5666;
    defparam add_191_4.INJECT1_0 = "NO";
    defparam add_191_4.INJECT1_1 = "NO";
    CCU2D add_191_2 (.A0(n29[3]), .B0(n60[0]), .C0(GND_net), .D0(GND_net), 
          .A1(n29[4]), .B1(n60[1]), .C1(GND_net), .D1(GND_net), .COUT(n18249), 
          .S1(n1205[1]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(67[21:95])
    defparam add_191_2.INIT0 = 16'h7000;
    defparam add_191_2.INIT1 = 16'h5666;
    defparam add_191_2.INJECT1_0 = "NO";
    defparam add_191_2.INJECT1_1 = "NO";
    LUT4 LessThan_43_i18_4_lut (.A(n14), .B(n16), .C(n21591), .D(n20417), 
         .Z(n536)) /* synthesis lut_function=(A (B+!(C+(D)))+!A (B (C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam LessThan_43_i18_4_lut.init = 16'hccca;
    LUT4 i18329_4_lut (.A(n21590), .B(n21589), .C(n21588), .D(n20406), 
         .Z(n20417)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam i18329_4_lut.init = 16'h0001;
    CCU2D add_196_15 (.A0(time_count_up[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18246), .S0(n1274[13]), .S1(n1274[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_15.INIT0 = 16'h5aaa;
    defparam add_196_15.INIT1 = 16'h5aaa;
    defparam add_196_15.INJECT1_0 = "NO";
    defparam add_196_15.INJECT1_1 = "NO";
    LUT4 i18318_4_lut (.A(n21593), .B(n21592), .C(n21678), .D(handline[2]), 
         .Z(n20406)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(133[11:27])
    defparam i18318_4_lut.init = 16'h1001;
    CCU2D add_196_13 (.A0(time_count_up[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18245), .COUT(n18246), .S0(n1274[11]), 
          .S1(n1274[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_13.INIT0 = 16'h5aaa;
    defparam add_196_13.INIT1 = 16'h5aaa;
    defparam add_196_13.INJECT1_0 = "NO";
    defparam add_196_13.INJECT1_1 = "NO";
    CCU2D add_196_11 (.A0(time_count_up[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18244), .COUT(n18245), .S0(n1274[9]), 
          .S1(n1274[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_11.INIT0 = 16'h5aaa;
    defparam add_196_11.INIT1 = 16'h5aaa;
    defparam add_196_11.INJECT1_0 = "NO";
    defparam add_196_11.INJECT1_1 = "NO";
    CCU2D add_196_9 (.A0(time_count_up[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18243), .COUT(n18244), .S0(n1274[7]), 
          .S1(n1274[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_9.INIT0 = 16'h5aaa;
    defparam add_196_9.INIT1 = 16'h5aaa;
    defparam add_196_9.INJECT1_0 = "NO";
    defparam add_196_9.INJECT1_1 = "NO";
    CCU2D add_196_7 (.A0(time_count_up[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18242), .COUT(n18243), .S0(n1274[5]), 
          .S1(n1274[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_7.INIT0 = 16'h5aaa;
    defparam add_196_7.INIT1 = 16'h5aaa;
    defparam add_196_7.INJECT1_0 = "NO";
    defparam add_196_7.INJECT1_1 = "NO";
    CCU2D add_196_5 (.A0(time_count_up[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18241), .COUT(n18242), .S0(n1274[3]), 
          .S1(n1274[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_5.INIT0 = 16'h5aaa;
    defparam add_196_5.INIT1 = 16'h5aaa;
    defparam add_196_5.INJECT1_0 = "NO";
    defparam add_196_5.INJECT1_1 = "NO";
    CCU2D add_196_3 (.A0(time_count_up[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(time_count_up[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18240), .COUT(n18241), .S0(n1274[1]), 
          .S1(n1274[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_3.INIT0 = 16'h5aaa;
    defparam add_196_3.INIT1 = 16'h5aaa;
    defparam add_196_3.INJECT1_0 = "NO";
    defparam add_196_3.INJECT1_1 = "NO";
    CCU2D add_196_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(time_count_up[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18240), .S1(n1274[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(145[27:44])
    defparam add_196_1.INIT0 = 16'hF000;
    defparam add_196_1.INIT1 = 16'h5555;
    defparam add_196_1.INJECT1_0 = "NO";
    defparam add_196_1.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(n21630), .B(n21586), .C(n21631), .D(n8), .Z(n8889)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut.init = 16'heccc;
    \fre_div(N=219089)  fre_500us (.clk_out(clk_out), .clk_c(clk_c), .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(25[32] 30[2])
    
endmodule
//
// Verilog Description of module \fre_div(N=219089) 
//

module \fre_div(N=219089)  (clk_out, clk_c, GND_net) /* synthesis syn_module_defined=1 */ ;
    output clk_out;
    input clk_c;
    input GND_net;
    
    wire clk_out /* synthesis is_clock=1, SET_AS_NETWORK=\jump/clk_out */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/jumping.v(22[6:13])
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire [23:0]count_up;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(11[17:25])
    
    wire n8, n19324, n191, n10, n8_adj_2333, n10_adj_2334, n19858, 
        n20349, n20351, n12, n10900, n15, n13, n14;
    wire [23:0]n152;
    
    wire n21613;
    wire [23:0]n77;
    
    wire n18416, n18415, n18414, n18413, n18412, n18411, n18410, 
        n18409, n18408, n18407, n18406, n18405;
    
    LUT4 i18714_4_lut (.A(count_up[14]), .B(count_up[16]), .C(n8), .D(count_up[15]), 
         .Z(n19324)) /* synthesis lut_function=(!(A (B (D))+!A (B (C (D))))) */ ;
    defparam i18714_4_lut.init = 16'h37ff;
    LUT4 i1_4_lut (.A(count_up[13]), .B(count_up[11]), .C(count_up[12]), 
         .D(n191), .Z(n8)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;
    defparam i1_4_lut.init = 16'ha8a0;
    LUT4 i1_4_lut_adj_91 (.A(count_up[10]), .B(count_up[9]), .C(n10), 
         .D(count_up[7]), .Z(n191)) /* synthesis lut_function=(A+(B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(11[17:25])
    defparam i1_4_lut_adj_91.init = 16'heaaa;
    LUT4 i4_4_lut (.A(count_up[3]), .B(n8_adj_2333), .C(count_up[5]), 
         .D(count_up[4]), .Z(n10)) /* synthesis lut_function=(A (B (C))+!A (B (C (D)))) */ ;
    defparam i4_4_lut.init = 16'hc080;
    LUT4 i2_2_lut (.A(count_up[8]), .B(count_up[6]), .Z(n8_adj_2333)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2_2_lut.init = 16'h8888;
    LUT4 i4_4_lut_adj_92 (.A(count_up[20]), .B(count_up[23]), .C(count_up[18]), 
         .D(count_up[19]), .Z(n10_adj_2334)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i4_4_lut_adj_92.init = 16'hfffe;
    FD1S3IX clk_out_13 (.D(n19324), .CK(clk_c), .CD(n19858), .Q(clk_out)) /* synthesis LSE_LINE_FILE_ID=20, LSE_LCOL=32, LSE_RCOL=2, LSE_LLINE=25, LSE_RLINE=30 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam clk_out_13.GSR = "ENABLED";
    LUT4 i18708_4_lut (.A(n20349), .B(count_up[7]), .C(n20351), .D(n12), 
         .Z(n10900)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;
    defparam i18708_4_lut.init = 16'h0080;
    LUT4 i18266_4_lut (.A(count_up[12]), .B(count_up[10]), .C(count_up[14]), 
         .D(count_up[9]), .Z(n20349)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i18266_4_lut.init = 16'h8000;
    LUT4 i18268_4_lut (.A(count_up[16]), .B(count_up[17]), .C(count_up[4]), 
         .D(count_up[6]), .Z(n20351)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i18268_4_lut.init = 16'h8000;
    LUT4 i1_4_lut_adj_93 (.A(n15), .B(count_up[8]), .C(n13), .D(n14), 
         .Z(n12)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;
    defparam i1_4_lut_adj_93.init = 16'hfffb;
    LUT4 i6_4_lut (.A(count_up[11]), .B(n152[2]), .C(n152[0]), .D(n152[1]), 
         .Z(n15)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i6_4_lut.init = 16'hfffe;
    LUT4 i4_2_lut (.A(count_up[3]), .B(count_up[15]), .Z(n13)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i4_2_lut.init = 16'heeee;
    LUT4 i5_3_lut (.A(n21613), .B(count_up[13]), .C(count_up[5]), .Z(n14)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i5_3_lut.init = 16'hfefe;
    LUT4 i5_3_lut_rep_267 (.A(count_up[21]), .B(n10_adj_2334), .C(count_up[22]), 
         .Z(n21613)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i5_3_lut_rep_267.init = 16'hfefe;
    LUT4 i1_2_lut_4_lut (.A(count_up[21]), .B(n10_adj_2334), .C(count_up[22]), 
         .D(count_up[17]), .Z(n19858)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(21[2] 32[5])
    defparam i1_2_lut_4_lut.init = 16'hfffe;
    FD1S3IX count_up_2096__i0 (.D(n77[0]), .CK(clk_c), .CD(n10900), .Q(n152[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i0.GSR = "ENABLED";
    CCU2D count_up_2096_add_4_25 (.A0(count_up[23]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18416), .S0(n77[23]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_25.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_25.INIT1 = 16'h0000;
    defparam count_up_2096_add_4_25.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_25.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_23 (.A0(count_up[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18415), .COUT(n18416), .S0(n77[21]), .S1(n77[22]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_23.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_23.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_23.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_23.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_21 (.A0(count_up[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18414), .COUT(n18415), .S0(n77[19]), .S1(n77[20]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_21.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_21.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_21.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_21.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_19 (.A0(count_up[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18413), .COUT(n18414), .S0(n77[17]), .S1(n77[18]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_19.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_19.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_19.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_19.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_17 (.A0(count_up[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18412), .COUT(n18413), .S0(n77[15]), .S1(n77[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_17.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_17.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_17.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_17.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_15 (.A0(count_up[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18411), .COUT(n18412), .S0(n77[13]), .S1(n77[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_15.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_15.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_15.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_15.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_13 (.A0(count_up[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18410), .COUT(n18411), .S0(n77[11]), .S1(n77[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_13.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_13.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_13.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_13.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_11 (.A0(count_up[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[10]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18409), .COUT(n18410), .S0(n77[9]), .S1(n77[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_11.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_11.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_11.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_11.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_9 (.A0(count_up[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18408), .COUT(n18409), .S0(n77[7]), .S1(n77[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_9.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_9.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_9.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_9.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_7 (.A0(count_up[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18407), .COUT(n18408), .S0(n77[5]), .S1(n77[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_7.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_7.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_7.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_7.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_5 (.A0(count_up[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(count_up[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18406), .COUT(n18407), .S0(n77[3]), .S1(n77[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_5.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_5.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_5.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_5.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_3 (.A0(n152[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n152[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18405), .COUT(n18406), .S0(n77[1]), .S1(n77[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_3.INIT0 = 16'hfaaa;
    defparam count_up_2096_add_4_3.INIT1 = 16'hfaaa;
    defparam count_up_2096_add_4_3.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_3.INJECT1_1 = "NO";
    CCU2D count_up_2096_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(n152[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18405), .S1(n77[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096_add_4_1.INIT0 = 16'hF000;
    defparam count_up_2096_add_4_1.INIT1 = 16'h0555;
    defparam count_up_2096_add_4_1.INJECT1_0 = "NO";
    defparam count_up_2096_add_4_1.INJECT1_1 = "NO";
    FD1S3IX count_up_2096__i1 (.D(n77[1]), .CK(clk_c), .CD(n10900), .Q(n152[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i1.GSR = "ENABLED";
    FD1S3IX count_up_2096__i2 (.D(n77[2]), .CK(clk_c), .CD(n10900), .Q(n152[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i2.GSR = "ENABLED";
    FD1S3IX count_up_2096__i3 (.D(n77[3]), .CK(clk_c), .CD(n10900), .Q(count_up[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i3.GSR = "ENABLED";
    FD1S3IX count_up_2096__i4 (.D(n77[4]), .CK(clk_c), .CD(n10900), .Q(count_up[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i4.GSR = "ENABLED";
    FD1S3IX count_up_2096__i5 (.D(n77[5]), .CK(clk_c), .CD(n10900), .Q(count_up[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i5.GSR = "ENABLED";
    FD1S3IX count_up_2096__i6 (.D(n77[6]), .CK(clk_c), .CD(n10900), .Q(count_up[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i6.GSR = "ENABLED";
    FD1S3IX count_up_2096__i7 (.D(n77[7]), .CK(clk_c), .CD(n10900), .Q(count_up[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i7.GSR = "ENABLED";
    FD1S3IX count_up_2096__i8 (.D(n77[8]), .CK(clk_c), .CD(n10900), .Q(count_up[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i8.GSR = "ENABLED";
    FD1S3IX count_up_2096__i9 (.D(n77[9]), .CK(clk_c), .CD(n10900), .Q(count_up[9])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i9.GSR = "ENABLED";
    FD1S3IX count_up_2096__i10 (.D(n77[10]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[10])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i10.GSR = "ENABLED";
    FD1S3IX count_up_2096__i11 (.D(n77[11]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[11])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i11.GSR = "ENABLED";
    FD1S3IX count_up_2096__i12 (.D(n77[12]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[12])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i12.GSR = "ENABLED";
    FD1S3IX count_up_2096__i13 (.D(n77[13]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[13])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i13.GSR = "ENABLED";
    FD1S3IX count_up_2096__i14 (.D(n77[14]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[14])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i14.GSR = "ENABLED";
    FD1S3IX count_up_2096__i15 (.D(n77[15]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[15])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i15.GSR = "ENABLED";
    FD1S3IX count_up_2096__i16 (.D(n77[16]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[16])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i16.GSR = "ENABLED";
    FD1S3IX count_up_2096__i17 (.D(n77[17]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[17])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i17.GSR = "ENABLED";
    FD1S3IX count_up_2096__i18 (.D(n77[18]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[18])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i18.GSR = "ENABLED";
    FD1S3IX count_up_2096__i19 (.D(n77[19]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[19])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i19.GSR = "ENABLED";
    FD1S3IX count_up_2096__i20 (.D(n77[20]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[20])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i20.GSR = "ENABLED";
    FD1S3IX count_up_2096__i21 (.D(n77[21]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[21])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i21.GSR = "ENABLED";
    FD1S3IX count_up_2096__i22 (.D(n77[22]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[22])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i22.GSR = "ENABLED";
    FD1S3IX count_up_2096__i23 (.D(n77[23]), .CK(clk_c), .CD(n10900), 
            .Q(count_up[23])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/fre_div.v(25[16:28])
    defparam count_up_2096__i23.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module adc081s101_driver
//

module adc081s101_driver (adc_clk_c, clk_24MHz, adc_cs_c, adc_data, 
            adc_dat_c, rst_c, n21653, n21659, n21450, clk_400khz_enable_5, 
            GND_net, ball_release_button_c, n21688, home, pic_y_8__N_805, 
            pic_y_8__N_786, pic_y_8__N_811, pic_y_8__N_799, pic_y_8__N_808, 
            pic_y_8__N_802, pic_y_8__N_814, pic_y_8__N_790, pic_y_8__N_789, 
            pic_y_8__N_796, pic_y_8__N_792, pic_y_8__N_785, pic_y_8__N_782, 
            pic_y_8__N_791, pic_y_8__N_817, pic_y_8__N_788, pic_y_8__N_787, 
            pic_y_8__N_793, n21576, \state[0] , n21542) /* synthesis syn_module_defined=1 */ ;
    output adc_clk_c;
    input clk_24MHz;
    output adc_cs_c;
    output [7:0]adc_data;
    input adc_dat_c;
    input rst_c;
    input n21653;
    input n21659;
    input n21450;
    output clk_400khz_enable_5;
    input GND_net;
    input ball_release_button_c;
    output n21688;
    input [8:0]home;
    output pic_y_8__N_805;
    output pic_y_8__N_786;
    output pic_y_8__N_811;
    output pic_y_8__N_799;
    output pic_y_8__N_808;
    output pic_y_8__N_802;
    output pic_y_8__N_814;
    output pic_y_8__N_790;
    output pic_y_8__N_789;
    output pic_y_8__N_796;
    output pic_y_8__N_792;
    output pic_y_8__N_785;
    output pic_y_8__N_782;
    output pic_y_8__N_791;
    output pic_y_8__N_817;
    output pic_y_8__N_788;
    output pic_y_8__N_787;
    output pic_y_8__N_793;
    input n21576;
    input \state[0] ;
    output n21542;
    
    wire clk_24MHz /* synthesis SET_AS_NETWORK=clk_24MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(30[6:15])
    
    wire adc_clk_N_102, adc_cs_N_65, clk_24MHz_enable_9;
    wire [7:0]data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(39[11:15])
    wire [7:0]cnt;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(33[11:14])
    
    wire n21679, n96, n20027, clk_24MHz_enable_4, n20274, clk_24MHz_enable_14, 
        n152, cnt_7__N_48, n21573, clk_24MHz_enable_12, clk_24MHz_enable_13, 
        n21667, clk_24MHz_enable_15, clk_24MHz_enable_11, clk_24MHz_enable_16, 
        clk_24MHz_enable_10, n18434;
    wire [7:0]n37;
    
    wire n18433, n18432, n18431;
    
    FD1S3AY adc_clk_68 (.D(adc_clk_N_102), .CK(clk_24MHz), .Q(adc_clk_c)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_clk_68.GSR = "ENABLED";
    FD1S3AY adc_cs_67 (.D(adc_cs_N_65), .CK(clk_24MHz), .Q(adc_cs_c)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_cs_67.GSR = "ENABLED";
    FD1P3AX adc_data_i0_i2 (.D(data[2]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i2.GSR = "DISABLED";
    FD1P3AX adc_data_i0_i3 (.D(data[3]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i3.GSR = "DISABLED";
    FD1P3AX adc_data_i0_i1 (.D(data[1]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i1.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_333 (.A(cnt[7]), .B(cnt[6]), .Z(n21679)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_rep_333.init = 16'heeee;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n96), .B(cnt[1]), .C(n20027), .D(cnt[4]), 
         .Z(clk_24MHz_enable_4)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_3_lut_4_lut_adj_85 (.A(n96), .B(cnt[1]), .C(n20274), 
         .D(cnt[4]), .Z(clk_24MHz_enable_14)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_3_lut_4_lut_adj_85.init = 16'h0800;
    LUT4 i1_3_lut_4_lut (.A(cnt[7]), .B(cnt[6]), .C(cnt[5]), .D(n152), 
         .Z(cnt_7__N_48)) /* synthesis lut_function=(A+(B+(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_3_lut_4_lut.init = 16'hfeee;
    LUT4 i1_3_lut_rep_227 (.A(n96), .B(cnt[4]), .C(cnt[1]), .Z(n21573)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_3_lut_rep_227.init = 16'h0808;
    LUT4 i1_2_lut_4_lut (.A(n96), .B(cnt[4]), .C(cnt[1]), .D(n20274), 
         .Z(clk_24MHz_enable_12)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_4_lut.init = 16'h0008;
    LUT4 i1_2_lut_4_lut_adj_86 (.A(n96), .B(cnt[4]), .C(cnt[1]), .D(n20027), 
         .Z(clk_24MHz_enable_13)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_4_lut_adj_86.init = 16'h0800;
    FD1P3AX data_i0_i0 (.D(adc_dat_c), .SP(clk_24MHz_enable_4), .CK(clk_24MHz), 
            .Q(data[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i0.GSR = "DISABLED";
    LUT4 i18719_4_lut (.A(n21679), .B(cnt[0]), .C(n152), .D(cnt[5]), 
         .Z(adc_clk_N_102)) /* synthesis lut_function=(A+(B+(C (D)+!C !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(33[11:14])
    defparam i18719_4_lut.init = 16'hfeef;
    LUT4 i3_4_lut (.A(cnt[3]), .B(cnt[2]), .C(cnt[1]), .D(cnt[4]), .Z(n152)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(33[11:14])
    defparam i3_4_lut.init = 16'hfffe;
    FD1P3AX adc_data_i0_i0 (.D(data[0]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i0.GSR = "DISABLED";
    LUT4 i2_3_lut (.A(n21573), .B(cnt[3]), .C(cnt[2]), .Z(clk_24MHz_enable_9)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i2_3_lut.init = 16'h0808;
    FD1P3AX adc_data_i0_i7 (.D(data[7]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i7.GSR = "DISABLED";
    LUT4 i2_2_lut_3_lut_4_lut (.A(cnt[2]), .B(n21667), .C(cnt[1]), .D(n96), 
         .Z(clk_24MHz_enable_15)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i2_2_lut_3_lut_4_lut.init = 16'h8000;
    LUT4 i1_2_lut_3_lut_4_lut_adj_87 (.A(cnt[2]), .B(n21667), .C(cnt[1]), 
         .D(n96), .Z(clk_24MHz_enable_11)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_3_lut_4_lut_adj_87.init = 16'h0800;
    LUT4 i3_4_lut_adj_88 (.A(rst_c), .B(cnt[0]), .C(cnt[5]), .D(n21679), 
         .Z(n96)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i3_4_lut_adj_88.init = 16'h0008;
    LUT4 i1_2_lut_3_lut_4_lut_adj_89 (.A(cnt[2]), .B(n21667), .C(cnt[1]), 
         .D(n96), .Z(clk_24MHz_enable_16)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_3_lut_4_lut_adj_89.init = 16'h4000;
    LUT4 i1_2_lut_3_lut_4_lut_adj_90 (.A(cnt[2]), .B(n21667), .C(cnt[1]), 
         .D(n96), .Z(clk_24MHz_enable_10)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_3_lut_4_lut_adj_90.init = 16'h0400;
    LUT4 seg_led_2_c_bdd_2_lut_18986_4_lut (.A(n21653), .B(n21659), .C(rst_c), 
         .D(n21450), .Z(clk_400khz_enable_5)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam seg_led_2_c_bdd_2_lut_18986_4_lut.init = 16'h2000;
    LUT4 i2_4_lut_4_lut (.A(cnt[5]), .B(cnt[0]), .C(n152), .D(n21679), 
         .Z(adc_cs_N_65)) /* synthesis lut_function=(A (C+(D))+!A (B (D)+!B ((D)+!C))) */ ;
    defparam i2_4_lut_4_lut.init = 16'hffa1;
    CCU2D cnt_2092_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18434), 
          .S0(n37[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_2092_add_4_9.INIT1 = 16'h0000;
    defparam cnt_2092_add_4_9.INJECT1_0 = "NO";
    defparam cnt_2092_add_4_9.INJECT1_1 = "NO";
    CCU2D cnt_2092_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18433), 
          .COUT(n18434), .S0(n37[5]), .S1(n37[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_2092_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_2092_add_4_7.INJECT1_0 = "NO";
    defparam cnt_2092_add_4_7.INJECT1_1 = "NO";
    CCU2D cnt_2092_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18432), 
          .COUT(n18433), .S0(n37[3]), .S1(n37[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_2092_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_2092_add_4_5.INJECT1_0 = "NO";
    defparam cnt_2092_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_2092_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18431), 
          .COUT(n18432), .S0(n37[1]), .S1(n37[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_2092_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_2092_add_4_3.INJECT1_0 = "NO";
    defparam cnt_2092_add_4_3.INJECT1_1 = "NO";
    CCU2D cnt_2092_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18431), .S1(n37[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092_add_4_1.INIT0 = 16'hF000;
    defparam cnt_2092_add_4_1.INIT1 = 16'h0555;
    defparam cnt_2092_add_4_1.INJECT1_0 = "NO";
    defparam cnt_2092_add_4_1.INJECT1_1 = "NO";
    FD1P3AX adc_data_i0_i6 (.D(data[6]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i6.GSR = "DISABLED";
    FD1P3AX adc_data_i0_i5 (.D(data[5]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i5.GSR = "DISABLED";
    FD1S3IX cnt_2092__i0 (.D(n37[0]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i0.GSR = "ENABLED";
    FD1P3AX adc_data_i0_i4 (.D(data[4]), .SP(clk_24MHz_enable_9), .CK(clk_24MHz), 
            .Q(adc_data[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam adc_data_i0_i4.GSR = "DISABLED";
    FD1P3AX data_i0_i7 (.D(adc_dat_c), .SP(clk_24MHz_enable_10), .CK(clk_24MHz), 
            .Q(data[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i7.GSR = "DISABLED";
    FD1P3AX data_i0_i5 (.D(adc_dat_c), .SP(clk_24MHz_enable_11), .CK(clk_24MHz), 
            .Q(data[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i5.GSR = "DISABLED";
    FD1P3AX data_i0_i3 (.D(adc_dat_c), .SP(clk_24MHz_enable_12), .CK(clk_24MHz), 
            .Q(data[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i3.GSR = "DISABLED";
    FD1P3AX data_i0_i1 (.D(adc_dat_c), .SP(clk_24MHz_enable_13), .CK(clk_24MHz), 
            .Q(data[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i1.GSR = "DISABLED";
    FD1P3AX data_i0_i2 (.D(adc_dat_c), .SP(clk_24MHz_enable_14), .CK(clk_24MHz), 
            .Q(data[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i2.GSR = "DISABLED";
    FD1P3AX data_i0_i4 (.D(adc_dat_c), .SP(clk_24MHz_enable_15), .CK(clk_24MHz), 
            .Q(data[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i4.GSR = "DISABLED";
    FD1P3AX data_i0_i6 (.D(adc_dat_c), .SP(clk_24MHz_enable_16), .CK(clk_24MHz), 
            .Q(data[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=19, LSE_RCOL=2, LSE_LLINE=41, LSE_RLINE=50 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(43[11] 67[9])
    defparam data_i0_i6.GSR = "DISABLED";
    LUT4 i18194_2_lut (.A(cnt[2]), .B(cnt[3]), .Z(n20274)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18194_2_lut.init = 16'heeee;
    LUT4 i1_2_lut_rep_321 (.A(cnt[3]), .B(cnt[4]), .Z(n21667)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut_rep_321.init = 16'h2222;
    LUT4 i18640_2_lut_rep_342 (.A(ball_release_button_c), .B(rst_c), .Z(n21688)) /* synthesis lut_function=(!(A (B))) */ ;
    defparam i18640_2_lut_rep_342.init = 16'h7777;
    LUT4 i18538_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[4]), .Z(pic_y_8__N_805)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18538_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 reset_N_784_I_0_163_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[6]), .Z(pic_y_8__N_786)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_163_2_lut_3_lut.init = 16'h7070;
    LUT4 i18544_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[2]), .Z(pic_y_8__N_811)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18544_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 i18532_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[6]), .Z(pic_y_8__N_799)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18532_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 i18541_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[3]), .Z(pic_y_8__N_808)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18541_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 i18535_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[5]), .Z(pic_y_8__N_802)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18535_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 i18547_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[1]), .Z(pic_y_8__N_814)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18547_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 reset_N_784_I_0_167_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[2]), .Z(pic_y_8__N_790)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_167_2_lut_3_lut.init = 16'h7070;
    LUT4 reset_N_784_I_0_166_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[3]), .Z(pic_y_8__N_789)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_166_2_lut_3_lut.init = 16'h7070;
    LUT4 i18529_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[7]), .Z(pic_y_8__N_796)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18529_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 reset_N_784_I_0_169_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[0]), .Z(pic_y_8__N_792)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_169_2_lut_3_lut.init = 16'h7070;
    LUT4 reset_N_784_I_0_162_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[7]), .Z(pic_y_8__N_785)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_162_2_lut_3_lut.init = 16'h7070;
    LUT4 pic_y_8__I_0_189_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[8]), .Z(pic_y_8__N_782)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam pic_y_8__I_0_189_2_lut_3_lut.init = 16'h7070;
    LUT4 reset_N_784_I_0_168_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[1]), .Z(pic_y_8__N_791)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_168_2_lut_3_lut.init = 16'h7070;
    LUT4 i18550_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[0]), .Z(pic_y_8__N_817)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18550_2_lut_2_lut_3_lut.init = 16'h0707;
    LUT4 reset_N_784_I_0_165_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[4]), .Z(pic_y_8__N_788)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_165_2_lut_3_lut.init = 16'h7070;
    LUT4 reset_N_784_I_0_164_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[5]), .Z(pic_y_8__N_787)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam reset_N_784_I_0_164_2_lut_3_lut.init = 16'h7070;
    LUT4 i18526_2_lut_2_lut_3_lut (.A(ball_release_button_c), .B(rst_c), 
         .C(home[8]), .Z(pic_y_8__N_793)) /* synthesis lut_function=(!(A (B+(C))+!A (C))) */ ;
    defparam i18526_2_lut_2_lut_3_lut.init = 16'h0707;
    FD1S3IX cnt_2092__i1 (.D(n37[1]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i1.GSR = "ENABLED";
    LUT4 i2_3_lut_rep_196_4_lut (.A(rst_c), .B(n21576), .C(\state[0] ), 
         .D(n21659), .Z(n21542)) /* synthesis lut_function=((B+((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(4[22:25])
    defparam i2_3_lut_rep_196_4_lut.init = 16'hffdf;
    FD1S3IX cnt_2092__i2 (.D(n37[2]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i2.GSR = "ENABLED";
    FD1S3IX cnt_2092__i3 (.D(n37[3]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i3.GSR = "ENABLED";
    FD1S3IX cnt_2092__i4 (.D(n37[4]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i4.GSR = "ENABLED";
    FD1S3IX cnt_2092__i5 (.D(n37[5]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i5.GSR = "ENABLED";
    FD1S3IX cnt_2092__i6 (.D(n37[6]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i6.GSR = "ENABLED";
    FD1S3IX cnt_2092__i7 (.D(n37[7]), .CK(clk_24MHz), .CD(cnt_7__N_48), 
            .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam cnt_2092__i7.GSR = "ENABLED";
    LUT4 i1_2_lut (.A(cnt[2]), .B(cnt[3]), .Z(n20027)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adc081s101_driver.v(37[14:24])
    defparam i1_2_lut.init = 16'h2222;
    
endmodule
//
// Verilog Description of module hand_control
//

module hand_control (clk_c_enable_20, prox_dat, dat_valid, handline, 
            GND_net, \hand_velocity[2] , \hand_velocity[3] , \hand_velocity[4] , 
            \hand_velocity[5] , \hand_velocity[6] , \hand_velocity[7] , 
            \hand_velocity[1] ) /* synthesis syn_module_defined=1 */ ;
    input clk_c_enable_20;
    input [15:0]prox_dat;
    input dat_valid;
    output [8:0]handline;
    input GND_net;
    output \hand_velocity[2] ;
    output \hand_velocity[3] ;
    output \hand_velocity[4] ;
    output \hand_velocity[5] ;
    output \hand_velocity[6] ;
    output \hand_velocity[7] ;
    output \hand_velocity[1] ;
    
    wire clk_c_enable_20 /* synthesis is_clock=1, SET_AS_NETWORK=clk_c_enable_20 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire dat_valid /* synthesis SET_AS_NETWORK=dat_valid, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(70[6:15])
    wire [15:0]prox_dat0;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(13[12:21])
    wire [8:0]handline_pre;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(11[11:23])
    wire [0:0]n16;
    
    wire n18233;
    wire [15:0]prox_dat1;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(13[23:32])
    wire [15:0]diff_15__N_728;
    
    wire n18234;
    wire [15:0]prox_dat2;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(13[34:43])
    
    wire clk_c_enable_20_enable_5;
    wire [8:0]velocity_temp;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(14[11:24])
    wire [8:0]n2789;
    
    wire n18232, n3945;
    wire [15:0]diff_15__N_712;
    
    wire n21128, n2806, n2807;
    wire [8:0]n97;
    
    wire n17972, n17970, n17976, n17974, n17980, n17978, n21142, 
        n21143, n17984, n17982, n10853, n18442, n2800, n18441, 
        n18440;
    wire [8:0]n1;
    
    wire n18439, n18438, n18437, n18436, n18435;
    wire [0:0]n11;
    wire [7:0]n12;
    
    wire n5001, n20339, n18203, n18204, n18286, n18285, n18284, 
        n18202, n18382, n18381, n18380, n18206, n18379, n2801, 
        n4_adj_2332, n22456, n18205, n21144, n18239, n18238, n18237, 
        n18236, n18235;
    
    FD1S3AX prox_dat0_i9 (.D(prox_dat[9]), .CK(clk_c_enable_20), .Q(prox_dat0[9])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i9.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i1 (.D(handline[1]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i1.GSR = "DISABLED";
    FD1S3AX prox_dat0_i8 (.D(prox_dat[8]), .CK(clk_c_enable_20), .Q(prox_dat0[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i8.GSR = "DISABLED";
    FD1S3AX prox_dat0_i7 (.D(prox_dat[7]), .CK(dat_valid), .Q(prox_dat0[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i7.GSR = "DISABLED";
    FD1S3AX prox_dat0_i6 (.D(prox_dat[6]), .CK(dat_valid), .Q(prox_dat0[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i6.GSR = "DISABLED";
    FD1S3AX prox_dat0_i5 (.D(prox_dat[5]), .CK(dat_valid), .Q(prox_dat0[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i5.GSR = "DISABLED";
    FD1S3AX prox_dat0_i4 (.D(prox_dat[4]), .CK(dat_valid), .Q(prox_dat0[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i4.GSR = "DISABLED";
    CCU2D prox_dat1_15__I_0_add_2_5 (.A0(prox_dat1[3]), .B0(prox_dat0[3]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[4]), .B1(prox_dat0[4]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18233), .COUT(n18234), .S0(diff_15__N_728[3]), 
          .S1(diff_15__N_728[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_5.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_5.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_5.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_5.INJECT1_1 = "NO";
    FD1S3AX prox_dat0_i3 (.D(prox_dat[3]), .CK(dat_valid), .Q(prox_dat0[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i3.GSR = "DISABLED";
    FD1S3AX prox_dat0_i2 (.D(prox_dat[2]), .CK(dat_valid), .Q(prox_dat0[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i2.GSR = "DISABLED";
    FD1S3AX prox_dat0_i1 (.D(prox_dat[1]), .CK(dat_valid), .Q(prox_dat0[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i1.GSR = "DISABLED";
    FD1P3AX prox_dat2__i1 (.D(prox_dat0[6]), .SP(clk_c_enable_20_enable_5), 
            .CK(dat_valid), .Q(prox_dat2[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i1.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i0 (.D(handline[0]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(handline_pre[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i0.GSR = "DISABLED";
    FD1S3AX prox_dat1_i0 (.D(prox_dat0[0]), .CK(clk_c_enable_20), .Q(prox_dat1[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i0.GSR = "DISABLED";
    FD1P3AX velocity_temp__i1 (.D(n2789[1]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i1.GSR = "DISABLED";
    FD1S3AX prox_dat0_i0 (.D(prox_dat[0]), .CK(clk_c_enable_20), .Q(prox_dat0[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i0.GSR = "DISABLED";
    CCU2D prox_dat1_15__I_0_add_2_3 (.A0(prox_dat1[1]), .B0(prox_dat0[1]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[2]), .B1(prox_dat0[2]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18232), .COUT(n18233), .S0(diff_15__N_728[1]), 
          .S1(diff_15__N_728[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_3.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_3.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_3.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_3.INJECT1_1 = "NO";
    FD1P3IX handline__i0 (.D(prox_dat2[6]), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i0.GSR = "DISABLED";
    FD1P3AX velocity_temp__i8 (.D(n2789[8]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i8.GSR = "DISABLED";
    FD1P3AX velocity_temp__i7 (.D(n2789[7]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i7.GSR = "DISABLED";
    FD1P3AX velocity_temp__i6 (.D(n2789[6]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i6.GSR = "DISABLED";
    FD1P3AX velocity_temp__i5 (.D(n2789[5]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i5.GSR = "DISABLED";
    FD1P3AX velocity_temp__i4 (.D(n2789[4]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i4.GSR = "DISABLED";
    FD1P3AX velocity_temp__i3 (.D(n2789[3]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i3.GSR = "DISABLED";
    FD1P3AX velocity_temp__i2 (.D(n2789[2]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(velocity_temp[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam velocity_temp__i2.GSR = "DISABLED";
    CCU2D prox_dat1_15__I_0_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(prox_dat1[0]), .B1(prox_dat0[0]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18232), .S1(diff_15__N_728[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_1.INIT0 = 16'h0000;
    defparam prox_dat1_15__I_0_add_2_1.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_1.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_1.INJECT1_1 = "NO";
    LUT4 diff_15__N_712_15__bdd_4_lut (.A(diff_15__N_712[13]), .B(diff_15__N_712[11]), 
         .C(diff_15__N_712[14]), .D(diff_15__N_712[12]), .Z(n21128)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam diff_15__N_712_15__bdd_4_lut.init = 16'hfffe;
    LUT4 i16414_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[7]), .Z(n17972)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16414_2_lut_3_lut.init = 16'h4040;
    LUT4 i16417_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[8]), .Z(n17970)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16417_2_lut_3_lut.init = 16'h4040;
    LUT4 i16408_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[5]), .Z(n17976)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16408_2_lut_3_lut.init = 16'h4040;
    LUT4 i16413_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[6]), .Z(n17974)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16413_2_lut_3_lut.init = 16'h4040;
    LUT4 i16404_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[3]), .Z(n17980)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16404_2_lut_3_lut.init = 16'h4040;
    LUT4 i16407_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[4]), .Z(n17978)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16407_2_lut_3_lut.init = 16'h4040;
    LUT4 n21142_bdd_2_lut (.A(n21142), .B(diff_15__N_728[15]), .Z(n21143)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam n21142_bdd_2_lut.init = 16'h2222;
    LUT4 diff_15__N_728_15__bdd_4_lut_18992 (.A(diff_15__N_728[14]), .B(diff_15__N_728[13]), 
         .C(diff_15__N_728[12]), .D(diff_15__N_728[11]), .Z(n21142)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam diff_15__N_728_15__bdd_4_lut_18992.init = 16'h0001;
    LUT4 i16183_3_lut_4_lut (.A(n2806), .B(n2807), .C(n97[1]), .D(n97[0]), 
         .Z(n17984)) /* synthesis lut_function=(!(A (D)+!A !(B (C)+!B !(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16183_3_lut_4_lut.init = 16'h40fb;
    LUT4 i16401_2_lut_3_lut (.A(n2806), .B(n2807), .C(n97[2]), .Z(n17982)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam i16401_2_lut_3_lut.init = 16'h4040;
    LUT4 i9042_2_lut (.A(n16[0]), .B(velocity_temp[8]), .Z(n10853)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam i9042_2_lut.init = 16'h8888;
    CCU2D add_16143_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18442), 
          .S0(n2800));
    defparam add_16143_cout.INIT0 = 16'h0000;
    defparam add_16143_cout.INIT1 = 16'h0000;
    defparam add_16143_cout.INJECT1_0 = "NO";
    defparam add_16143_cout.INJECT1_1 = "NO";
    CCU2D add_16143_15 (.A0(diff_15__N_728[14]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[15]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18441), .COUT(n18442), .S0(diff_15__N_712[14]), 
          .S1(diff_15__N_712[15]));
    defparam add_16143_15.INIT0 = 16'hf555;
    defparam add_16143_15.INIT1 = 16'hf555;
    defparam add_16143_15.INJECT1_0 = "NO";
    defparam add_16143_15.INJECT1_1 = "NO";
    CCU2D add_16143_13 (.A0(diff_15__N_728[12]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[13]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18440), .COUT(n18441), .S0(diff_15__N_712[12]), 
          .S1(diff_15__N_712[13]));
    defparam add_16143_13.INIT0 = 16'hf555;
    defparam add_16143_13.INIT1 = 16'hf555;
    defparam add_16143_13.INJECT1_0 = "NO";
    defparam add_16143_13.INJECT1_1 = "NO";
    LUT4 unary_minus_1629_inv_0_i8_1_lut (.A(n97[7]), .Z(n1[7])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i8_1_lut.init = 16'h5555;
    CCU2D add_16143_11 (.A0(diff_15__N_728[10]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[11]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18439), .COUT(n18440), .S1(diff_15__N_712[11]));
    defparam add_16143_11.INIT0 = 16'hf555;
    defparam add_16143_11.INIT1 = 16'hf555;
    defparam add_16143_11.INJECT1_0 = "NO";
    defparam add_16143_11.INJECT1_1 = "NO";
    CCU2D add_16143_9 (.A0(diff_15__N_728[8]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[9]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18438), .COUT(n18439));
    defparam add_16143_9.INIT0 = 16'hf555;
    defparam add_16143_9.INIT1 = 16'hf555;
    defparam add_16143_9.INJECT1_0 = "NO";
    defparam add_16143_9.INJECT1_1 = "NO";
    CCU2D add_16143_7 (.A0(diff_15__N_728[6]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[7]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18437), .COUT(n18438));
    defparam add_16143_7.INIT0 = 16'hf555;
    defparam add_16143_7.INIT1 = 16'hf555;
    defparam add_16143_7.INJECT1_0 = "NO";
    defparam add_16143_7.INJECT1_1 = "NO";
    CCU2D add_16143_5 (.A0(diff_15__N_728[4]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[5]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18436), .COUT(n18437));
    defparam add_16143_5.INIT0 = 16'hf555;
    defparam add_16143_5.INIT1 = 16'hf555;
    defparam add_16143_5.INJECT1_0 = "NO";
    defparam add_16143_5.INJECT1_1 = "NO";
    CCU2D add_16143_3 (.A0(diff_15__N_728[2]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(diff_15__N_728[3]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18435), .COUT(n18436));
    defparam add_16143_3.INIT0 = 16'hf555;
    defparam add_16143_3.INIT1 = 16'hf555;
    defparam add_16143_3.INJECT1_0 = "NO";
    defparam add_16143_3.INJECT1_1 = "NO";
    CCU2D add_16143_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(diff_15__N_728[0]), .B1(diff_15__N_728[1]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18435));
    defparam add_16143_1.INIT0 = 16'hF000;
    defparam add_16143_1.INIT1 = 16'ha666;
    defparam add_16143_1.INJECT1_0 = "NO";
    defparam add_16143_1.INJECT1_1 = "NO";
    LUT4 unary_minus_1629_inv_0_i9_1_lut (.A(n97[8]), .Z(n1[8])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i9_1_lut.init = 16'h5555;
    FD1S3AX prox_dat1_i15 (.D(prox_dat0[15]), .CK(clk_c_enable_20), .Q(prox_dat1[15])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i15.GSR = "DISABLED";
    FD1P3AX prox_dat2__i6 (.D(prox_dat0[11]), .SP(clk_c_enable_20_enable_5), 
            .CK(clk_c_enable_20), .Q(prox_dat2[11])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i6.GSR = "DISABLED";
    FD1P3AX prox_dat2__i5 (.D(prox_dat0[10]), .SP(clk_c_enable_20_enable_5), 
            .CK(clk_c_enable_20), .Q(prox_dat2[10])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i5.GSR = "DISABLED";
    FD1P3AX prox_dat2__i4 (.D(prox_dat0[9]), .SP(clk_c_enable_20_enable_5), 
            .CK(clk_c_enable_20), .Q(prox_dat2[9])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i4.GSR = "DISABLED";
    FD1P3AX prox_dat2__i3 (.D(prox_dat0[8]), .SP(clk_c_enable_20_enable_5), 
            .CK(clk_c_enable_20), .Q(prox_dat2[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i3.GSR = "DISABLED";
    FD1P3AX prox_dat2__i2 (.D(prox_dat0[7]), .SP(clk_c_enable_20_enable_5), 
            .CK(clk_c_enable_20), .Q(prox_dat2[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat2__i2.GSR = "DISABLED";
    LUT4 i16381_1_lut (.A(n16[0]), .Z(n11[0])) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(29[18:30])
    defparam i16381_1_lut.init = 16'h5555;
    FD1S3AX count_35_2094__i0 (.D(n11[0]), .CK(clk_c_enable_20), .Q(n16[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(29[18:30])
    defparam count_35_2094__i0.GSR = "DISABLED";
    LUT4 i16384_2_lut (.A(prox_dat2[6]), .B(prox_dat2[8]), .Z(n12[2])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i16384_2_lut.init = 16'h6666;
    FD1S3AX prox_dat1_i14 (.D(prox_dat0[14]), .CK(clk_c_enable_20), .Q(prox_dat1[14])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i14.GSR = "DISABLED";
    FD1S3AX prox_dat1_i13 (.D(prox_dat0[13]), .CK(clk_c_enable_20), .Q(prox_dat1[13])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i13.GSR = "DISABLED";
    FD1S3AX prox_dat1_i12 (.D(prox_dat0[12]), .CK(clk_c_enable_20), .Q(prox_dat1[12])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i12.GSR = "DISABLED";
    FD1S3AX prox_dat1_i11 (.D(prox_dat0[11]), .CK(clk_c_enable_20), .Q(prox_dat1[11])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i11.GSR = "DISABLED";
    FD1S3AX prox_dat1_i10 (.D(prox_dat0[10]), .CK(clk_c_enable_20), .Q(prox_dat1[10])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i10.GSR = "DISABLED";
    FD1S3AX prox_dat1_i9 (.D(prox_dat0[9]), .CK(clk_c_enable_20), .Q(prox_dat1[9])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i9.GSR = "DISABLED";
    FD1S3AX prox_dat1_i8 (.D(prox_dat0[8]), .CK(clk_c_enable_20), .Q(prox_dat1[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i8.GSR = "DISABLED";
    FD1S3AX prox_dat1_i7 (.D(prox_dat0[7]), .CK(clk_c_enable_20), .Q(prox_dat1[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i7.GSR = "DISABLED";
    FD1S3AX prox_dat1_i6 (.D(prox_dat0[6]), .CK(clk_c_enable_20), .Q(prox_dat1[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i6.GSR = "DISABLED";
    FD1S3AX prox_dat1_i5 (.D(prox_dat0[5]), .CK(clk_c_enable_20), .Q(prox_dat1[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i5.GSR = "DISABLED";
    FD1P3IX handline__i8 (.D(n5001), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i8.GSR = "DISABLED";
    FD1S3AX prox_dat1_i4 (.D(prox_dat0[4]), .CK(dat_valid), .Q(prox_dat1[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i4.GSR = "DISABLED";
    FD1P3IX handline__i7 (.D(n12[7]), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i7.GSR = "DISABLED";
    FD1S3AX prox_dat1_i3 (.D(prox_dat0[3]), .CK(dat_valid), .Q(prox_dat1[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i3.GSR = "DISABLED";
    FD1S3AX prox_dat1_i2 (.D(prox_dat0[2]), .CK(clk_c_enable_20), .Q(prox_dat1[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i2.GSR = "DISABLED";
    FD1P3IX handline__i6 (.D(n12[6]), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i6.GSR = "DISABLED";
    FD1P3IX handline__i5 (.D(n12[5]), .SP(n16[0]), .CD(n3945), .CK(dat_valid), 
            .Q(handline[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i5.GSR = "DISABLED";
    FD1S3AX prox_dat1_i1 (.D(prox_dat0[1]), .CK(dat_valid), .Q(prox_dat1[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat1_i1.GSR = "DISABLED";
    FD1P3IX handline__i4 (.D(n12[4]), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i4.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i8 (.D(handline[8]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i8.GSR = "DISABLED";
    FD1P3IX handline__i3 (.D(n12[3]), .SP(n16[0]), .CD(n3945), .CK(clk_c_enable_20), 
            .Q(handline[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i3.GSR = "DISABLED";
    FD1P3IX handline__i2 (.D(n12[2]), .SP(n16[0]), .CD(n3945), .CK(dat_valid), 
            .Q(handline[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i2.GSR = "DISABLED";
    FD1P3IX handline__i1 (.D(prox_dat2[7]), .SP(n16[0]), .CD(n3945), .CK(dat_valid), 
            .Q(handline[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline__i1.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i7 (.D(handline[7]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i7.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i6 (.D(handline[6]), .SP(n16[0]), .CK(clk_c_enable_20), 
            .Q(handline_pre[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i6.GSR = "DISABLED";
    FD1S3AX prox_dat0_i15 (.D(prox_dat[15]), .CK(clk_c_enable_20), .Q(prox_dat0[15])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i15.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i5 (.D(handline[5]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i5.GSR = "DISABLED";
    FD1S3AX prox_dat0_i14 (.D(prox_dat[14]), .CK(clk_c_enable_20), .Q(prox_dat0[14])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i14.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i4 (.D(handline[4]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i4.GSR = "DISABLED";
    FD1S3AX prox_dat0_i13 (.D(prox_dat[13]), .CK(clk_c_enable_20), .Q(prox_dat0[13])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i13.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i3 (.D(handline[3]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i3.GSR = "DISABLED";
    FD1S3AX prox_dat0_i12 (.D(prox_dat[12]), .CK(clk_c_enable_20), .Q(prox_dat0[12])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i12.GSR = "DISABLED";
    FD1P3AX handline_pre_i0_i2 (.D(handline[2]), .SP(n16[0]), .CK(dat_valid), 
            .Q(handline_pre[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam handline_pre_i0_i2.GSR = "DISABLED";
    FD1S3AX prox_dat0_i11 (.D(prox_dat[11]), .CK(clk_c_enable_20), .Q(prox_dat0[11])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i11.GSR = "DISABLED";
    FD1S3AX prox_dat0_i10 (.D(prox_dat[10]), .CK(dat_valid), .Q(prox_dat0[10])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam prox_dat0_i10.GSR = "DISABLED";
    LUT4 i1_4_lut (.A(n16[0]), .B(prox_dat2[9]), .C(n20339), .D(prox_dat2[10]), 
         .Z(n3945)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam i1_4_lut.init = 16'h0002;
    LUT4 i18256_4_lut (.A(prox_dat2[8]), .B(prox_dat2[11]), .C(prox_dat2[6]), 
         .D(prox_dat2[7]), .Z(n20339)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i18256_4_lut.init = 16'hfffe;
    CCU2D sub_14_add_2_5 (.A0(handline[3]), .B0(handline_pre[3]), .C0(GND_net), 
          .D0(GND_net), .A1(handline[4]), .B1(handline_pre[4]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18203), .COUT(n18204), .S0(n97[3]), .S1(n97[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_5.INIT0 = 16'h5999;
    defparam sub_14_add_2_5.INIT1 = 16'h5999;
    defparam sub_14_add_2_5.INJECT1_0 = "NO";
    defparam sub_14_add_2_5.INJECT1_1 = "NO";
    CCU2D mult_11_add_1_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18286), .S0(n5001));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(33[29:50])
    defparam mult_11_add_1_cout.INIT0 = 16'h0000;
    defparam mult_11_add_1_cout.INIT1 = 16'h0000;
    defparam mult_11_add_1_cout.INJECT1_0 = "NO";
    defparam mult_11_add_1_cout.INJECT1_1 = "NO";
    CCU2D mult_11_add_1_6 (.A0(prox_dat2[10]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(prox_dat2[11]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18285), .COUT(n18286), .S0(n12[6]), .S1(n12[7]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(33[29:50])
    defparam mult_11_add_1_6.INIT0 = 16'h5aaa;
    defparam mult_11_add_1_6.INIT1 = 16'h5aaa;
    defparam mult_11_add_1_6.INJECT1_0 = "NO";
    defparam mult_11_add_1_6.INJECT1_1 = "NO";
    CCU2D mult_11_add_1_4 (.A0(prox_dat2[8]), .B0(prox_dat2[10]), .C0(GND_net), 
          .D0(GND_net), .A1(prox_dat2[9]), .B1(prox_dat2[11]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18284), .COUT(n18285), .S0(n12[4]), .S1(n12[5]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(33[29:50])
    defparam mult_11_add_1_4.INIT0 = 16'h5666;
    defparam mult_11_add_1_4.INIT1 = 16'h5666;
    defparam mult_11_add_1_4.INJECT1_0 = "NO";
    defparam mult_11_add_1_4.INJECT1_1 = "NO";
    CCU2D mult_11_add_1_2 (.A0(prox_dat2[6]), .B0(prox_dat2[8]), .C0(GND_net), 
          .D0(GND_net), .A1(prox_dat2[7]), .B1(prox_dat2[9]), .C1(GND_net), 
          .D1(GND_net), .COUT(n18284), .S1(n12[3]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(33[29:50])
    defparam mult_11_add_1_2.INIT0 = 16'h7000;
    defparam mult_11_add_1_2.INIT1 = 16'h5666;
    defparam mult_11_add_1_2.INJECT1_0 = "NO";
    defparam mult_11_add_1_2.INJECT1_1 = "NO";
    CCU2D sub_14_add_2_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(handline[0]), .B1(handline_pre[0]), .C1(GND_net), .D1(GND_net), 
          .COUT(n18202), .S1(n97[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_1.INIT0 = 16'h0000;
    defparam sub_14_add_2_1.INIT1 = 16'h5999;
    defparam sub_14_add_2_1.INJECT1_0 = "NO";
    defparam sub_14_add_2_1.INJECT1_1 = "NO";
    CCU2D add_16144_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18382), 
          .S0(n2806));
    defparam add_16144_cout.INIT0 = 16'h0000;
    defparam add_16144_cout.INIT1 = 16'h0000;
    defparam add_16144_cout.INJECT1_0 = "NO";
    defparam add_16144_cout.INJECT1_1 = "NO";
    FD1P3JX hand_velocity__i2 (.D(velocity_temp[2]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[2] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i2.GSR = "DISABLED";
    FD1P3JX hand_velocity__i3 (.D(velocity_temp[3]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[3] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i3.GSR = "DISABLED";
    FD1P3JX hand_velocity__i4 (.D(velocity_temp[4]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[4] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i4.GSR = "DISABLED";
    CCU2D add_16144_9 (.A0(n17972), .B0(n2807), .C0(n1[7]), .D0(n2806), 
          .A1(n17970), .B1(n2807), .C1(n1[8]), .D1(n2806), .CIN(n18381), 
          .COUT(n18382), .S0(n2789[7]), .S1(n2789[8]));
    defparam add_16144_9.INIT0 = 16'h5a9a;
    defparam add_16144_9.INIT1 = 16'h5a9a;
    defparam add_16144_9.INJECT1_0 = "NO";
    defparam add_16144_9.INJECT1_1 = "NO";
    FD1P3JX hand_velocity__i5 (.D(velocity_temp[5]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[5] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i5.GSR = "DISABLED";
    FD1P3JX hand_velocity__i6 (.D(velocity_temp[6]), .SP(n16[0]), .PD(n10853), 
            .CK(dat_valid), .Q(\hand_velocity[6] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i6.GSR = "DISABLED";
    FD1P3JX hand_velocity__i7 (.D(velocity_temp[7]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[7] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i7.GSR = "DISABLED";
    FD1P3JX hand_velocity__i1 (.D(velocity_temp[1]), .SP(n16[0]), .PD(n10853), 
            .CK(clk_c_enable_20), .Q(\hand_velocity[1] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=14, LSE_RCOL=2, LSE_LLINE=86, LSE_RLINE=92 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(17[8] 42[4])
    defparam hand_velocity__i1.GSR = "DISABLED";
    CCU2D add_16144_7 (.A0(n17976), .B0(n2807), .C0(n1[5]), .D0(n2806), 
          .A1(n17974), .B1(n2807), .C1(n1[6]), .D1(n2806), .CIN(n18380), 
          .COUT(n18381), .S0(n2789[5]), .S1(n2789[6]));
    defparam add_16144_7.INIT0 = 16'h5a9a;
    defparam add_16144_7.INIT1 = 16'h5a9a;
    defparam add_16144_7.INJECT1_0 = "NO";
    defparam add_16144_7.INJECT1_1 = "NO";
    CCU2D sub_14_add_2_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18206), .S0(n2807));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_cout.INIT0 = 16'h0000;
    defparam sub_14_add_2_cout.INIT1 = 16'h0000;
    defparam sub_14_add_2_cout.INJECT1_0 = "NO";
    defparam sub_14_add_2_cout.INJECT1_1 = "NO";
    CCU2D add_16144_5 (.A0(n17980), .B0(n2807), .C0(n1[3]), .D0(n2806), 
          .A1(n17978), .B1(n2807), .C1(n1[4]), .D1(n2806), .CIN(n18379), 
          .COUT(n18380), .S0(n2789[3]), .S1(n2789[4]));
    defparam add_16144_5.INIT0 = 16'h5a9a;
    defparam add_16144_5.INIT1 = 16'h5a9a;
    defparam add_16144_5.INJECT1_0 = "NO";
    defparam add_16144_5.INJECT1_1 = "NO";
    LUT4 i1_2_lut (.A(n2800), .B(n2801), .Z(n4_adj_2332)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut.init = 16'h4444;
    CCU2D add_16144_3 (.A0(n17984), .B0(n2807), .C0(n1[1]), .D0(n2806), 
          .A1(n17982), .B1(n2807), .C1(n1[2]), .D1(n2806), .CIN(n22456), 
          .COUT(n18379), .S0(n2789[1]), .S1(n2789[2]));
    defparam add_16144_3.INIT0 = 16'h5a9a;
    defparam add_16144_3.INIT1 = 16'h5a9a;
    defparam add_16144_3.INJECT1_0 = "NO";
    defparam add_16144_3.INJECT1_1 = "NO";
    CCU2D add_16144_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(n2807), .B1(n2806), .C1(GND_net), .D1(GND_net), .COUT(n22456));
    defparam add_16144_1.INIT0 = 16'hF000;
    defparam add_16144_1.INIT1 = 16'hffff;
    defparam add_16144_1.INJECT1_0 = "NO";
    defparam add_16144_1.INJECT1_1 = "NO";
    CCU2D sub_14_add_2_9 (.A0(handline[7]), .B0(handline_pre[7]), .C0(GND_net), 
          .D0(GND_net), .A1(handline[8]), .B1(handline_pre[8]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18205), .COUT(n18206), .S0(n97[7]), .S1(n97[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_9.INIT0 = 16'h5999;
    defparam sub_14_add_2_9.INIT1 = 16'h5999;
    defparam sub_14_add_2_9.INJECT1_0 = "NO";
    defparam sub_14_add_2_9.INJECT1_1 = "NO";
    CCU2D sub_14_add_2_7 (.A0(handline[5]), .B0(handline_pre[5]), .C0(GND_net), 
          .D0(GND_net), .A1(handline[6]), .B1(handline_pre[6]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18204), .COUT(n18205), .S0(n97[5]), .S1(n97[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_7.INIT0 = 16'h5999;
    defparam sub_14_add_2_7.INIT1 = 16'h5999;
    defparam sub_14_add_2_7.INJECT1_0 = "NO";
    defparam sub_14_add_2_7.INJECT1_1 = "NO";
    LUT4 unary_minus_1629_inv_0_i6_1_lut (.A(n97[5]), .Z(n1[5])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i6_1_lut.init = 16'h5555;
    LUT4 unary_minus_1629_inv_0_i7_1_lut (.A(n97[6]), .Z(n1[6])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i7_1_lut.init = 16'h5555;
    LUT4 diff_15__N_728_15__bdd_1_lut_2_lut (.A(n21128), .B(diff_15__N_712[15]), 
         .Z(n21144)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam diff_15__N_728_15__bdd_1_lut_2_lut.init = 16'h1111;
    LUT4 unary_minus_1629_inv_0_i4_1_lut (.A(n97[3]), .Z(n1[3])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i4_1_lut.init = 16'h5555;
    PFUMX i18835 (.BLUT(n21144), .ALUT(n21143), .C0(n4_adj_2332), .Z(clk_c_enable_20_enable_5));
    LUT4 unary_minus_1629_inv_0_i5_1_lut (.A(n97[4]), .Z(n1[4])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i5_1_lut.init = 16'h5555;
    LUT4 unary_minus_1629_inv_0_i2_1_lut (.A(n97[1]), .Z(n1[1])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i2_1_lut.init = 16'h5555;
    LUT4 unary_minus_1629_inv_0_i3_1_lut (.A(n97[2]), .Z(n1[2])) /* synthesis lut_function=(!(A)) */ ;
    defparam unary_minus_1629_inv_0_i3_1_lut.init = 16'h5555;
    CCU2D prox_dat1_15__I_0_add_2_17 (.A0(prox_dat1[15]), .B0(prox_dat0[15]), 
          .C0(GND_net), .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18239), .S0(diff_15__N_728[15]), .S1(n2801));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_17.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_17.INIT1 = 16'h0000;
    defparam prox_dat1_15__I_0_add_2_17.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_17.INJECT1_1 = "NO";
    CCU2D prox_dat1_15__I_0_add_2_15 (.A0(prox_dat1[13]), .B0(prox_dat0[13]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[14]), .B1(prox_dat0[14]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18238), .COUT(n18239), .S0(diff_15__N_728[13]), 
          .S1(diff_15__N_728[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_15.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_15.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_15.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_15.INJECT1_1 = "NO";
    CCU2D prox_dat1_15__I_0_add_2_13 (.A0(prox_dat1[11]), .B0(prox_dat0[11]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[12]), .B1(prox_dat0[12]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18237), .COUT(n18238), .S0(diff_15__N_728[11]), 
          .S1(diff_15__N_728[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_13.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_13.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_13.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_13.INJECT1_1 = "NO";
    CCU2D sub_14_add_2_3 (.A0(handline[1]), .B0(handline_pre[1]), .C0(GND_net), 
          .D0(GND_net), .A1(handline[2]), .B1(handline_pre[2]), .C1(GND_net), 
          .D1(GND_net), .CIN(n18202), .COUT(n18203), .S0(n97[1]), .S1(n97[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(39[58:83])
    defparam sub_14_add_2_3.INIT0 = 16'h5999;
    defparam sub_14_add_2_3.INIT1 = 16'h5999;
    defparam sub_14_add_2_3.INJECT1_0 = "NO";
    defparam sub_14_add_2_3.INJECT1_1 = "NO";
    CCU2D prox_dat1_15__I_0_add_2_11 (.A0(prox_dat1[9]), .B0(prox_dat0[9]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[10]), .B1(prox_dat0[10]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18236), .COUT(n18237), .S0(diff_15__N_728[9]), 
          .S1(diff_15__N_728[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_11.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_11.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_11.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_11.INJECT1_1 = "NO";
    CCU2D prox_dat1_15__I_0_add_2_9 (.A0(prox_dat1[7]), .B0(prox_dat0[7]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[8]), .B1(prox_dat0[8]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18235), .COUT(n18236), .S0(diff_15__N_728[7]), 
          .S1(diff_15__N_728[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_9.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_9.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_9.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_9.INJECT1_1 = "NO";
    CCU2D prox_dat1_15__I_0_add_2_7 (.A0(prox_dat1[5]), .B0(prox_dat0[5]), 
          .C0(GND_net), .D0(GND_net), .A1(prox_dat1[6]), .B1(prox_dat0[6]), 
          .C1(GND_net), .D1(GND_net), .CIN(n18234), .COUT(n18235), .S0(diff_15__N_728[5]), 
          .S1(diff_15__N_728[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/hand_control.v(16[46:69])
    defparam prox_dat1_15__I_0_add_2_7.INIT0 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_7.INIT1 = 16'h5999;
    defparam prox_dat1_15__I_0_add_2_7.INJECT1_0 = "NO";
    defparam prox_dat1_15__I_0_add_2_7.INJECT1_1 = "NO";
    
endmodule
//
// Verilog Description of module adjuster
//

module adjuster (k, clk_c, seg_led_2_0_3, key_up_c_1, key_down_c_0, 
            GND_net) /* synthesis syn_module_defined=1 */ ;
    output [1:0]k;
    input clk_c;
    output seg_led_2_0_3;
    input key_up_c_1;
    input key_down_c_0;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    
    wire n20495;
    wire [1:0]key_sec;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(61[27:34])
    wire [1:0]key_sec_pre;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(60[27:38])
    
    wire n9095, clk_c_enable_84, n21600, n42;
    
    FD1S3AX k_i0_i0 (.D(n20495), .CK(clk_c), .Q(k[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=60, LSE_RLINE=68 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(20[4] 26[7])
    defparam k_i0_i0.GSR = "ENABLED";
    LUT4 i2_2_lut_2_lut_4_lut_4_lut (.A(k[1]), .B(k[0]), .C(key_sec[1]), 
         .D(key_sec_pre[1]), .Z(n9095)) /* synthesis lut_function=(A (B+!(C+!(D)))+!A !(B (C+!(D))+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(21[8:27])
    defparam i2_2_lut_2_lut_4_lut_4_lut.init = 16'h9e99;
    LUT4 i18488_2_lut (.A(k[0]), .B(clk_c_enable_84), .Z(n20495)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(20[4] 26[7])
    defparam i18488_2_lut.init = 16'h6666;
    LUT4 i12152_4_lut (.A(n21600), .B(key_sec[0]), .C(n42), .D(key_sec_pre[0]), 
         .Z(clk_c_enable_84)) /* synthesis lut_function=(A+!(B+!(C (D)))) */ ;
    defparam i12152_4_lut.init = 16'hbaaa;
    LUT4 i1_3_lut_rep_254_4_lut (.A(k[1]), .B(k[0]), .C(key_sec_pre[1]), 
         .D(key_sec[1]), .Z(n21600)) /* synthesis lut_function=(!(A (B+((D)+!C))+!A ((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(28[15:18])
    defparam i1_3_lut_rep_254_4_lut.init = 16'h0070;
    LUT4 i2472_2_lut (.A(k[0]), .B(k[1]), .Z(n42)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2472_2_lut.init = 16'heeee;
    FD1P3AX k_i0_i1 (.D(n9095), .SP(clk_c_enable_84), .CK(clk_c), .Q(k[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=10, LSE_RCOL=2, LSE_LLINE=60, LSE_RLINE=68 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(20[4] 26[7])
    defparam k_i0_i1.GSR = "ENABLED";
    segment seg (.k({k}), .seg_led_2_0_3(seg_led_2_0_3)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(28[9:39])
    \debounce(N=2)  deb (.key_sec({key_sec}), .clk_c(clk_c), .key_up_c_1(key_up_c_1), 
            .key_down_c_0(key_down_c_0), .key_sec_pre({key_sec_pre}), .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/adjuster.v(12[19:79])
    
endmodule
//
// Verilog Description of module segment
//

module segment (k, seg_led_2_0_3) /* synthesis syn_module_defined=1 */ ;
    input [1:0]k;
    output seg_led_2_0_3;
    
    
    LUT4 k_1__bdd_2_lut (.A(k[1]), .B(k[0]), .Z(seg_led_2_0_3)) /* synthesis lut_function=((B)+!A) */ ;
    defparam k_1__bdd_2_lut.init = 16'hdddd;
    
endmodule
//
// Verilog Description of module \debounce(N=2) 
//

module \debounce(N=2)  (key_sec, clk_c, key_up_c_1, key_down_c_0, key_sec_pre, 
            GND_net) /* synthesis syn_module_defined=1 */ ;
    output [1:0]key_sec;
    input clk_c;
    input key_up_c_1;
    input key_down_c_0;
    output [1:0]key_sec_pre;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    
    wire clk_c_enable_8;
    wire [1:0]key_rst_pre;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(27[22:33])
    wire [1:0]key_rst;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(28[22:29])
    
    wire n18425;
    wire [17:0]cnt;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(47[22:25])
    wire [17:0]n77;
    
    wire n18424, n18423, cnt_17__N_165, n18422, n18421, n21, n34, 
        n30, n22, n18420, n31, n28, n18419, n18418, n18417;
    
    FD1P3AY key_sec_i0_i1 (.D(key_up_c_1), .SP(clk_c_enable_8), .CK(clk_c), 
            .Q(key_sec[1])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(69[19] 70[33])
    defparam key_sec_i0_i1.GSR = "ENABLED";
    FD1P3AY key_sec_i0_i0 (.D(key_down_c_0), .SP(clk_c_enable_8), .CK(clk_c), 
            .Q(key_sec[0])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(69[19] 70[33])
    defparam key_sec_i0_i0.GSR = "ENABLED";
    FD1S3AY key_rst_pre_i0 (.D(key_rst[0]), .CK(clk_c), .Q(key_rst_pre[0])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(39[15] 42[16])
    defparam key_rst_pre_i0.GSR = "ENABLED";
    FD1S3AY key_sec_pre_i0 (.D(key_sec[0]), .CK(clk_c), .Q(key_sec_pre[0])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(77[18:41])
    defparam key_sec_pre_i0.GSR = "ENABLED";
    FD1S3AY key_rst_i0 (.D(key_down_c_0), .CK(clk_c), .Q(key_rst[0])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(39[15] 42[16])
    defparam key_rst_i0.GSR = "ENABLED";
    FD1S3AY key_rst_i1 (.D(key_up_c_1), .CK(clk_c), .Q(key_rst[1])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(39[15] 42[16])
    defparam key_rst_i1.GSR = "ENABLED";
    FD1S3AY key_sec_pre_i1 (.D(key_sec[1]), .CK(clk_c), .Q(key_sec_pre[1])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(77[18:41])
    defparam key_sec_pre_i1.GSR = "ENABLED";
    FD1S3AY key_rst_pre_i1 (.D(key_rst[1]), .CK(clk_c), .Q(key_rst_pre[1])) /* synthesis LSE_LINE_FILE_ID=9, LSE_LCOL=19, LSE_RCOL=79, LSE_LLINE=12, LSE_RLINE=12 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(39[15] 42[16])
    defparam key_rst_pre_i1.GSR = "ENABLED";
    CCU2D cnt_2095_add_4_19 (.A0(cnt[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18425), .S0(n77[17]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_19.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_19.INIT1 = 16'h0000;
    defparam cnt_2095_add_4_19.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_19.INJECT1_1 = "NO";
    CCU2D cnt_2095_add_4_17 (.A0(cnt[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[16]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18424), .COUT(n18425), .S0(n77[15]), .S1(n77[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_17.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_17.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_17.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_17.INJECT1_1 = "NO";
    CCU2D cnt_2095_add_4_15 (.A0(cnt[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[14]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18423), .COUT(n18424), .S0(n77[13]), .S1(n77[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_15.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_15.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_15.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_15.INJECT1_1 = "NO";
    LUT4 key_edge_1__I_0_i1_4_lut (.A(key_rst_pre[0]), .B(key_rst_pre[1]), 
         .C(key_rst[0]), .D(key_rst[1]), .Z(cnt_17__N_165)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A ((D)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(54[22:30])
    defparam key_edge_1__I_0_i1_4_lut.init = 16'h0ace;
    CCU2D cnt_2095_add_4_13 (.A0(cnt[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[12]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18422), .COUT(n18423), .S0(n77[11]), .S1(n77[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_13.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_13.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_13.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_13.INJECT1_1 = "NO";
    CCU2D cnt_2095_add_4_11 (.A0(cnt[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18421), .COUT(n18422), .S0(n77[9]), .S1(n77[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_11.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_11.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_11.INJECT1_1 = "NO";
    LUT4 i17_4_lut (.A(n21), .B(n34), .C(n30), .D(n22), .Z(clk_c_enable_8)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i17_4_lut.init = 16'h8000;
    CCU2D cnt_2095_add_4_9 (.A0(cnt[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18420), 
          .COUT(n18421), .S0(n77[7]), .S1(n77[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_9.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_9.INJECT1_1 = "NO";
    LUT4 i3_2_lut (.A(cnt[13]), .B(cnt[8]), .Z(n21)) /* synthesis lut_function=(A (B)) */ ;
    defparam i3_2_lut.init = 16'h8888;
    FD1S3IX cnt_2095__i0 (.D(n77[0]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i0.GSR = "ENABLED";
    LUT4 i16_4_lut (.A(n31), .B(cnt[9]), .C(n28), .D(cnt[2]), .Z(n34)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i16_4_lut.init = 16'h8000;
    LUT4 i12_4_lut (.A(cnt[3]), .B(cnt[10]), .C(cnt[5]), .D(cnt[0]), 
         .Z(n30)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i12_4_lut.init = 16'h8000;
    LUT4 i4_2_lut (.A(cnt[7]), .B(cnt[12]), .Z(n22)) /* synthesis lut_function=(A (B)) */ ;
    defparam i4_2_lut.init = 16'h8888;
    CCU2D cnt_2095_add_4_7 (.A0(cnt[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18419), 
          .COUT(n18420), .S0(n77[5]), .S1(n77[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_7.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_7.INJECT1_1 = "NO";
    LUT4 i13_4_lut (.A(cnt[17]), .B(cnt[15]), .C(cnt[16]), .D(cnt[4]), 
         .Z(n31)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i13_4_lut.init = 16'h8000;
    CCU2D cnt_2095_add_4_5 (.A0(cnt[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18418), 
          .COUT(n18419), .S0(n77[3]), .S1(n77[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_5.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_5.INJECT1_1 = "NO";
    CCU2D cnt_2095_add_4_3 (.A0(cnt[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n18417), 
          .COUT(n18418), .S0(n77[1]), .S1(n77[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_2095_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_2095_add_4_3.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_3.INJECT1_1 = "NO";
    LUT4 i10_4_lut (.A(cnt[1]), .B(cnt[6]), .C(cnt[14]), .D(cnt[11]), 
         .Z(n28)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i10_4_lut.init = 16'h8000;
    CCU2D cnt_2095_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18417), .S1(n77[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095_add_4_1.INIT0 = 16'hF000;
    defparam cnt_2095_add_4_1.INIT1 = 16'h0555;
    defparam cnt_2095_add_4_1.INJECT1_0 = "NO";
    defparam cnt_2095_add_4_1.INJECT1_1 = "NO";
    FD1S3IX cnt_2095__i1 (.D(n77[1]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i1.GSR = "ENABLED";
    FD1S3IX cnt_2095__i2 (.D(n77[2]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i2.GSR = "ENABLED";
    FD1S3IX cnt_2095__i3 (.D(n77[3]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i3.GSR = "ENABLED";
    FD1S3IX cnt_2095__i4 (.D(n77[4]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i4.GSR = "ENABLED";
    FD1S3IX cnt_2095__i5 (.D(n77[5]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i5.GSR = "ENABLED";
    FD1S3IX cnt_2095__i6 (.D(n77[6]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i6.GSR = "ENABLED";
    FD1S3IX cnt_2095__i7 (.D(n77[7]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i7.GSR = "ENABLED";
    FD1S3IX cnt_2095__i8 (.D(n77[8]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i8.GSR = "ENABLED";
    FD1S3IX cnt_2095__i9 (.D(n77[9]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[9])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i9.GSR = "ENABLED";
    FD1S3IX cnt_2095__i10 (.D(n77[10]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[10])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i10.GSR = "ENABLED";
    FD1S3IX cnt_2095__i11 (.D(n77[11]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[11])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i11.GSR = "ENABLED";
    FD1S3IX cnt_2095__i12 (.D(n77[12]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[12])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i12.GSR = "ENABLED";
    FD1S3IX cnt_2095__i13 (.D(n77[13]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[13])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i13.GSR = "ENABLED";
    FD1S3IX cnt_2095__i14 (.D(n77[14]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[14])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i14.GSR = "ENABLED";
    FD1S3IX cnt_2095__i15 (.D(n77[15]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[15])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i15.GSR = "ENABLED";
    FD1S3IX cnt_2095__i16 (.D(n77[16]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[16])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i16.GSR = "ENABLED";
    FD1S3IX cnt_2095__i17 (.D(n77[17]), .CK(clk_c), .CD(cnt_17__N_165), 
            .Q(cnt[17])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/debounce.v(57[24:34])
    defparam cnt_2095__i17.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module PLL24M
//

module PLL24M (clk_c, clk_24MHz, GND_net) /* synthesis NGD_DRC_MASK=1, syn_module_defined=1 */ ;
    input clk_c;
    output clk_24MHz;
    input GND_net;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire clk_24MHz /* synthesis SET_AS_NETWORK=clk_24MHz, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(30[6:15])
    
    EHXPLLJ PLLInst_0 (.CLKI(clk_c), .CLKFB(clk_24MHz), .PHASESEL0(GND_net), 
            .PHASESEL1(GND_net), .PHASEDIR(GND_net), .PHASESTEP(GND_net), 
            .LOADREG(GND_net), .STDBY(GND_net), .PLLWAKESYNC(GND_net), 
            .RST(GND_net), .RESETC(GND_net), .RESETD(GND_net), .RESETM(GND_net), 
            .ENCLKOP(GND_net), .ENCLKOS(GND_net), .ENCLKOS2(GND_net), 
            .ENCLKOS3(GND_net), .PLLCLK(GND_net), .PLLRST(GND_net), .PLLSTB(GND_net), 
            .PLLWE(GND_net), .PLLDATI0(GND_net), .PLLDATI1(GND_net), .PLLDATI2(GND_net), 
            .PLLDATI3(GND_net), .PLLDATI4(GND_net), .PLLDATI5(GND_net), 
            .PLLDATI6(GND_net), .PLLDATI7(GND_net), .PLLADDR0(GND_net), 
            .PLLADDR1(GND_net), .PLLADDR2(GND_net), .PLLADDR3(GND_net), 
            .PLLADDR4(GND_net), .CLKOP(clk_24MHz)) /* synthesis FREQUENCY_PIN_CLKOP="24.000000", FREQUENCY_PIN_CLKI="12.000000", ICP_CURRENT="8", LPF_RESISTOR="8", syn_instantiated=1, LSE_LINE_FILE_ID=13, LSE_LCOL=8, LSE_RCOL=2, LSE_LLINE=31, LSE_RLINE=35 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(31[8] 35[2])
    defparam PLLInst_0.CLKI_DIV = 1;
    defparam PLLInst_0.CLKFB_DIV = 2;
    defparam PLLInst_0.CLKOP_DIV = 22;
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
    defparam PLLInst_0.CLKOP_CPHASE = 21;
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
//
// Verilog Description of module rpr0521rs_driver
//

module rpr0521rs_driver (clk_c, i2c_sda_N_620, state, cnt_write, i2c_sda_out, 
            \cnt_main[0] , \cnt_main[2] , dat_valid_N_624, n21551, \cnt_mode2[3] , 
            n14616, n21386, \cnt_main[1] , cnt, n21576, \state_back[0] , 
            rst_c, n21540, n30, n21529, n13675, \cnt[1] , n67, 
            n21659, n33, n24, n24_adj_1, n2615, cnt_read, cnt_mode1, 
            \cnt_mode1[3] , GND_net, n21668, \cnt_mode1[2] , i2c_sda_N_643, 
            dat_valid, clk_400khz_enable_5, n11417, n21450, n21542, 
            n9625, n9567, prox_dat, \data_wr[6] , \data_wr[5] , \data_wr[3] , 
            \data_wr[2] , \data_wr[1] , n22428, n21, n54, n5039, 
            \data_wr[7] , n18598, n4442, n21564, n19972, n22432, 
            n21644, n11822, n21653, n2323, n4, n20134, n9389, 
            n7, n27, n21555, n20449, n20450, n6, i2c_scl_c, \data_wr[0] , 
            n18508, n6_adj_2, i2c_sda_N_637, n2619, n2278, n2325, 
            n57, n324, n72, n2295, n19914, n4_adj_3, n20424, n5, 
            n16, clk_c_enable_20) /* synthesis syn_module_defined=1 */ ;
    input clk_c;
    output i2c_sda_N_620;
    output [3:0]state;
    output [3:0]cnt_write;
    input i2c_sda_out;
    output \cnt_main[0] ;
    output \cnt_main[2] ;
    output dat_valid_N_624;
    output n21551;
    output \cnt_mode2[3] ;
    output n14616;
    output n21386;
    output \cnt_main[1] ;
    output [3:0]cnt;
    output n21576;
    output \state_back[0] ;
    input rst_c;
    output n21540;
    input n30;
    output n21529;
    input n13675;
    output \cnt[1] ;
    input n67;
    output n21659;
    output n33;
    input n24;
    input n24_adj_1;
    output n2615;
    output [3:0]cnt_read;
    output [3:0]cnt_mode1;
    output \cnt_mode1[3] ;
    input GND_net;
    input n21668;
    output \cnt_mode1[2] ;
    input i2c_sda_N_643;
    output dat_valid;
    input clk_400khz_enable_5;
    output n11417;
    output n21450;
    input n21542;
    output n9625;
    output n9567;
    output [15:0]prox_dat;
    output \data_wr[6] ;
    output \data_wr[5] ;
    output \data_wr[3] ;
    output \data_wr[2] ;
    output \data_wr[1] ;
    output n22428;
    output n21;
    output n54;
    output n5039;
    output \data_wr[7] ;
    input n18598;
    output n4442;
    output n21564;
    output n19972;
    input n22432;
    output n21644;
    output n11822;
    output n21653;
    input n2323;
    output n4;
    output n20134;
    output n9389;
    input n7;
    input n27;
    output n21555;
    input n20449;
    input n20450;
    output n6;
    output i2c_scl_c;
    output \data_wr[0] ;
    input n18508;
    output n6_adj_2;
    output i2c_sda_N_637;
    input n2619;
    output n2278;
    input n2325;
    output n57;
    output n324;
    output n72;
    output n2295;
    input n19914;
    input n4_adj_3;
    output n20424;
    input n5;
    output n16;
    output clk_c_enable_20;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire clk_400khz /* synthesis is_clock=1, SET_AS_NETWORK=\u7/clk_400khz */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(47[10:20])
    wire dat_valid /* synthesis SET_AS_NETWORK=dat_valid, is_clock=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(70[6:15])
    wire clk_c_enable_20 /* synthesis is_clock=1, SET_AS_NETWORK=clk_c_enable_20 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/template.v(3[22:25])
    wire [23:0]cnt_delay;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(67[13:22])
    
    wire clk_c_enable_121, n10930;
    wire [23:0]n483;
    
    wire clk_400khz_N_625, i2c_sda_N_630;
    wire [7:0]dat_h;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[66:71])
    
    wire clk_c_enable_61;
    wire [7:0]data_r;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[51:57])
    wire [7:0]dat_l;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[59:64])
    
    wire clk_c_enable_63, n4_c, n18609, n6_c, clk_c_enable_13, n14526, 
        clk_c_enable_14, n20042;
    wire [3:0]cnt_start;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[49:58])
    
    wire i2c_scl_N_609, clk_c_enable_15, n21220, clk_c_enable_74, clk_c_enable_77;
    wire [3:0]cnt_mode2;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    
    wire n9419, n21210, n21515;
    wire [3:0]cnt_stop;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[81:89])
    
    wire n21587, n96, n21723, n21722, clk_c_enable_90, n7_c, n11835, 
        n21567, n20009, n10901, clk_c_enable_78, n21646, n21554, 
        n21651, clk_c_enable_91, n20497;
    wire [3:0]cnt_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[12:15])
    
    wire clk_c_enable_81, n21528, clk_c_enable_41, n21479, n21612, 
        clk_c_enable_105, n20698, n21680, n21645, clk_c_enable_92, 
        n19851, n21541, n13;
    wire [9:0]cnt_400khz;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(48[14:24])
    
    wire n12, n21533, n10876, n74, clk_c_enable_85, clk_c_enable_21, 
        clk_c_enable_19, clk_c_enable_114, n21610, n21411, n21413, 
        n21705, clk_c_enable_18, n21212;
    wire [3:0]state_3__N_426;
    wire [3:0]state_back;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[20:30])
    
    wire n21216, n21217, n21534, n21724, n21218;
    wire [3:0]cnt_mode1_c;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    
    wire n18670, n21255, n53, n18308, n481, n3, n21254;
    wire [3:0]n8;
    
    wire n21634, n20434, n18307, n21707, n21708, n27_c, clk_c_enable_98, 
        n7041, n10854, n21675, n19883;
    wire [3:0]n145;
    
    wire n21669, n18306, n21655, n20452, n8273;
    wire [7:0]n91;
    
    wire n21698, n21699, n18305, n20454, n7_adj_2309, n18304;
    wire [7:0]reg_data;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[41:49])
    
    wire n21704, n21676, n1, n18303, n15738, n18302, n18301, n18218, 
        n18217, n18216, n15815, n32, clk_c_enable_106, n18300, n18430;
    wire [9:0]n45;
    
    wire n18429, n18215, n18428, n18214, n20433, n20435, n18427, 
        n18426, n18213, n9938, n18212, n10927, n18211, clk_c_enable_103, 
        clk_c_enable_39, n16979;
    wire [7:0]reg_addr;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(66[31:39])
    
    wire clk_c_enable_64, n21706, n21256, n21512, n21511, n21510, 
        n21585;
    wire [3:0]n178;
    
    wire n21544, i2c_sda_N_621, n18208, n18209;
    wire [3:0]n2693;
    
    wire n19986;
    wire [7:0]n2865;
    
    wire i2c_sda_N_658, n21030, n21029, n21296, n21295, n21297, 
        n7_adj_2314, n2, n18592, clk_c_enable_65, n5_c, n6_adj_2315, 
        n20453, i2c_sda_N_652, n18210, n21632, n18615, n6_adj_2316, 
        n6_adj_2317, n4001, n3999, n6_adj_2318, n20010, n19964, 
        n19965, n19963;
    wire [3:0]n232;
    
    wire clk_c_enable_83, n10921;
    wire [3:0]n288;
    
    wire n78, clk_400khz_enable_4, n18549, n18207, n14018, clk_c_enable_110, 
        n7_adj_2319, n21552, clk_c_enable_86, n21605, clk_c_enable_89, 
        n19887, n1_adj_2322, ack, n21711, n21710, n21611, n11817, 
        clk_400khz_enable_2, n7_adj_2325, clk_c_enable_104, ack_flag, 
        clk_400khz_enable_3, n21702, n21701, n21219, n35, n21068, 
        n19969, n21213, n21214, n18539, clk_c_enable_111, n10, n4_adj_2327, 
        n18656, n37, n32_adj_2328, n22, n36, n24_adj_2330;
    
    FD1P3IX cnt_delay_i0_i8 (.D(n483[8]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i8.GSR = "ENABLED";
    FD1S3AX clk_400khz_254 (.D(clk_400khz_N_625), .CK(clk_c), .Q(clk_400khz)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam clk_400khz_254.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i7 (.D(n483[7]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i7.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i6 (.D(n483[6]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i6.GSR = "ENABLED";
    FD1S3AY sda_257 (.D(i2c_sda_N_630), .CK(clk_400khz), .Q(i2c_sda_N_620)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam sda_257.GSR = "ENABLED";
    FD1P3AX dat_h_i0_i0 (.D(data_r[0]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i0.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i0 (.D(data_r[0]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i0.GSR = "DISABLED";
    FD1P3IX cnt_delay_i0_i5 (.D(n483[5]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i5.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i4 (.D(n483[4]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i4.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i3 (.D(n483[3]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i3.GSR = "ENABLED";
    PFUMX state_3__I_0_i6 (.BLUT(n4_c), .ALUT(n18609), .C0(state[1]), 
          .Z(n6_c)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;
    FD1P3IX cnt_delay_i0_i2 (.D(n483[2]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i2.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i1 (.D(n483[1]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i1.GSR = "ENABLED";
    FD1P3AX cnt_write_i0_i0 (.D(n14526), .SP(clk_c_enable_13), .CK(clk_c), 
            .Q(cnt_write[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_write_i0_i0.GSR = "ENABLED";
    FD1P3AX data_r_i0_i3 (.D(i2c_sda_out), .SP(clk_c_enable_14), .CK(clk_c), 
            .Q(data_r[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i3.GSR = "DISABLED";
    LUT4 i1_2_lut_3_lut (.A(\cnt_main[0] ), .B(\cnt_main[2] ), .C(dat_valid_N_624), 
         .Z(n20042)) /* synthesis lut_function=(!((B+(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut.init = 16'h0202;
    LUT4 i12452_2_lut (.A(cnt_start[1]), .B(cnt_start[2]), .Z(i2c_scl_N_609)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i12452_2_lut.init = 16'h1111;
    FD1P3AX state_i0_i1 (.D(n21220), .SP(clk_c_enable_15), .CK(clk_c), 
            .Q(state[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_i0_i1.GSR = "ENABLED";
    LUT4 i1_4_lut_4_lut (.A(n21551), .B(state[0]), .C(state[1]), .D(state[2]), 
         .Z(clk_c_enable_74)) /* synthesis lut_function=(!(A+!(B (C (D))+!B !(C+(D))))) */ ;
    defparam i1_4_lut_4_lut.init = 16'h4001;
    LUT4 i1_4_lut_4_lut_adj_26 (.A(n21551), .B(state[0]), .C(state[1]), 
         .D(state[2]), .Z(clk_c_enable_77)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;
    defparam i1_4_lut_4_lut_adj_26.init = 16'h1001;
    LUT4 i9631_4_lut_4_lut (.A(cnt_mode2[0]), .B(cnt_mode2[1]), .C(\cnt_mode2[3] ), 
         .D(cnt_mode2[2]), .Z(n14616)) /* synthesis lut_function=(A+(B (D)+!B (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    defparam i9631_4_lut_4_lut.init = 16'hfebb;
    LUT4 n9419_bdd_3_lut_19068 (.A(n9419), .B(n21210), .C(state[0]), .Z(n21515)) /* synthesis lut_function=(!(A ((C)+!B)+!A !(B+(C)))) */ ;
    defparam n9419_bdd_3_lut_19068.init = 16'h5c5c;
    LUT4 n4652_bdd_3_lut_4_lut (.A(cnt_stop[0]), .B(n21587), .C(state[1]), 
         .D(state[2]), .Z(n21386)) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C))+!A ((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(204[8:12])
    defparam n4652_bdd_3_lut_4_lut.init = 16'h20f0;
    LUT4 i103_3_lut_4_lut_4_lut (.A(\cnt_main[1] ), .B(\cnt_main[2] ), .C(\cnt_main[0] ), 
         .D(dat_valid_N_624), .Z(n96)) /* synthesis lut_function=(A (B ((D)+!C)+!B (D))+!A (B (D)+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i103_3_lut_4_lut_4_lut.init = 16'hef08;
    LUT4 i1_4_lut_then_3_lut (.A(state[0]), .B(dat_valid_N_624), .C(\cnt_main[0] ), 
         .Z(n21723)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i1_4_lut_then_3_lut.init = 16'hdfdf;
    LUT4 i1_4_lut_else_3_lut (.A(state[0]), .B(\cnt_main[1] ), .C(dat_valid_N_624), 
         .D(\cnt_main[0] ), .Z(n21722)) /* synthesis lut_function=((B (C)+!B !((D)+!C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i1_4_lut_else_3_lut.init = 16'hd5f5;
    FD1P3AX cnt_i0_i0 (.D(n7_c), .SP(clk_c_enable_90), .CK(clk_c), .Q(cnt[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_i0_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_221 (.A(state[2]), .B(n11835), .Z(n21567)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_rep_221.init = 16'h2222;
    LUT4 i1_3_lut_4_lut (.A(state[2]), .B(n11835), .C(cnt_stop[0]), .D(cnt_stop[1]), 
         .Z(n20009)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i1_3_lut_4_lut.init = 16'h0220;
    LUT4 i1_2_lut_rep_230 (.A(clk_400khz), .B(n10901), .Z(n21576)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_2_lut_rep_230.init = 16'hbbbb;
    FD1P3AX state_back_i0_i0 (.D(n21646), .SP(clk_c_enable_78), .CK(clk_c), 
            .Q(\state_back[0] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_back_i0_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_194_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(state[1]), 
         .D(rst_c), .Z(n21540)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_2_lut_rep_194_3_lut_4_lut.init = 16'h4000;
    LUT4 i1_2_lut_rep_208_3_lut (.A(clk_400khz), .B(n10901), .C(rst_c), 
         .Z(n21554)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_2_lut_rep_208_3_lut.init = 16'h4040;
    LUT4 i18675_2_lut_rep_197_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(state[2]), 
         .D(n21651), .Z(clk_c_enable_91)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i18675_2_lut_rep_197_3_lut_4_lut.init = 16'h0004;
    LUT4 i2_2_lut_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(n20497), 
         .D(n21651), .Z(clk_c_enable_13)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i2_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i2_2_lut_rep_183_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(n30), 
         .D(state[3]), .Z(n21529)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i2_2_lut_rep_183_3_lut_4_lut.init = 16'h0040;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n13675), .B(cnt_c[2]), .C(\cnt[1] ), 
         .D(cnt[0]), .Z(clk_c_enable_14)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0008;
    LUT4 i1_2_lut_3_lut_4_lut_adj_27 (.A(n13675), .B(cnt_c[2]), .C(\cnt[1] ), 
         .D(cnt[0]), .Z(clk_c_enable_81)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut_adj_27.init = 16'h0080;
    LUT4 i93_2_lut_rep_205_3_lut (.A(clk_400khz), .B(n10901), .C(state[3]), 
         .Z(n21551)) /* synthesis lut_function=(A+((C)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i93_2_lut_rep_205_3_lut.init = 16'hfbfb;
    LUT4 i2_2_lut_rep_182_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(n67), 
         .D(state[3]), .Z(n21528)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i2_2_lut_rep_182_3_lut_4_lut.init = 16'h0040;
    LUT4 i1_2_lut_3_lut_4_lut_adj_28 (.A(cnt[0]), .B(cnt_c[2]), .C(\cnt[1] ), 
         .D(n13675), .Z(clk_c_enable_41)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_28.init = 16'h0100;
    LUT4 i2_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(n21479), .D(n21612), 
         .Z(clk_c_enable_105)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i2_3_lut_4_lut.init = 16'h4000;
    LUT4 i18688_2_lut_3_lut (.A(clk_400khz), .B(n10901), .C(n20698), .Z(clk_c_enable_15)) /* synthesis lut_function=(!(A+!(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i18688_2_lut_3_lut.init = 16'h4040;
    LUT4 i18694_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(state[2]), 
         .D(n21680), .Z(clk_c_enable_121)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i18694_3_lut_4_lut.init = 16'h0004;
    LUT4 i1_2_lut_3_lut_4_lut_adj_29 (.A(clk_400khz), .B(n10901), .C(n21645), 
         .D(n21659), .Z(clk_c_enable_78)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_2_lut_3_lut_4_lut_adj_29.init = 16'h0040;
    LUT4 i18672_2_lut_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(state[0]), 
         .D(n21659), .Z(clk_c_enable_92)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i18672_2_lut_3_lut_4_lut.init = 16'h0004;
    LUT4 i1_3_lut_2_lut (.A(clk_400khz), .B(n10901), .Z(clk_400khz_N_625)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_3_lut_2_lut.init = 16'h6666;
    LUT4 i1_3_lut_4_lut_adj_30 (.A(clk_400khz), .B(n10901), .C(n33), .D(n24), 
         .Z(n19851)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_3_lut_4_lut_adj_30.init = 16'hfffb;
    LUT4 i18226_2_lut_rep_195_3_lut_4_lut (.A(clk_400khz), .B(n10901), .C(state[1]), 
         .D(state[3]), .Z(n21541)) /* synthesis lut_function=(A+((C+(D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i18226_2_lut_rep_195_3_lut_4_lut.init = 16'hfffb;
    LUT4 i2_2_lut_3_lut_4_lut_adj_31 (.A(clk_400khz), .B(n10901), .C(n24_adj_1), 
         .D(state[3]), .Z(n2615)) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i2_2_lut_3_lut_4_lut_adj_31.init = 16'h0040;
    LUT4 i18669_4_lut (.A(n13), .B(cnt_400khz[9]), .C(n12), .D(cnt_400khz[4]), 
         .Z(n10901)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[11:34])
    defparam i18669_4_lut.init = 16'h0001;
    LUT4 i5_4_lut (.A(cnt_400khz[0]), .B(cnt_400khz[7]), .C(cnt_400khz[8]), 
         .D(cnt_400khz[5]), .Z(n13)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i5_4_lut.init = 16'hfffe;
    LUT4 i4_4_lut (.A(cnt_400khz[6]), .B(cnt_400khz[1]), .C(cnt_400khz[3]), 
         .D(cnt_400khz[2]), .Z(n12)) /* synthesis lut_function=(A+!(B (C (D)))) */ ;
    defparam i4_4_lut.init = 16'hbfff;
    LUT4 i1_2_lut_3_lut_adj_32 (.A(\cnt_main[2] ), .B(n21533), .C(\cnt_main[1] ), 
         .Z(n10876)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_3_lut_adj_32.init = 16'h1010;
    LUT4 i18566_2_lut_3_lut (.A(\cnt_main[2] ), .B(n21533), .C(\cnt_main[1] ), 
         .Z(n74)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i18566_2_lut_3_lut.init = 16'h0101;
    LUT4 i1_2_lut_3_lut_4_lut_adj_33 (.A(n13675), .B(\cnt[1] ), .C(cnt_c[2]), 
         .D(cnt[0]), .Z(clk_c_enable_85)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut_adj_33.init = 16'h2000;
    LUT4 i1_2_lut_3_lut_4_lut_adj_34 (.A(n13675), .B(\cnt[1] ), .C(cnt_c[2]), 
         .D(cnt[0]), .Z(clk_c_enable_21)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut_adj_34.init = 16'h0200;
    LUT4 i2_3_lut_4_lut_adj_35 (.A(cnt[0]), .B(cnt_c[2]), .C(\cnt[1] ), 
         .D(n13675), .Z(clk_c_enable_19)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2_3_lut_4_lut_adj_35.init = 16'h1000;
    LUT4 i18508_2_lut_3_lut_4_lut_4_lut (.A(n21680), .B(state[3]), .C(n10901), 
         .D(clk_400khz), .Z(clk_c_enable_114)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;
    defparam i18508_2_lut_3_lut_4_lut_4_lut.init = 16'h0010;
    PFUMX i18967 (.BLUT(n21610), .ALUT(n21411), .C0(state[0]), .Z(n21413));
    LUT4 i1_4_lut_4_lut_then_4_lut (.A(cnt_mode2[2]), .B(cnt_mode2[1]), 
         .C(cnt_mode2[0]), .D(\cnt_mode2[3] ), .Z(n21705)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A (B (C+(D))+!B ((D)+!C)))) */ ;
    defparam i1_4_lut_4_lut_then_4_lut.init = 16'h0016;
    FD1P3AX data_r_i0_i4 (.D(i2c_sda_out), .SP(clk_c_enable_18), .CK(clk_c), 
            .Q(data_r[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i4.GSR = "DISABLED";
    LUT4 n9419_bdd_3_lut_18975 (.A(cnt_read[0]), .B(cnt_read[2]), .C(cnt_read[1]), 
         .Z(n21210)) /* synthesis lut_function=(!(A (C)+!A !(B))) */ ;
    defparam n9419_bdd_3_lut_18975.init = 16'h4e4e;
    FD1P3AX data_r_i0_i5 (.D(i2c_sda_out), .SP(clk_c_enable_19), .CK(clk_c), 
            .Q(data_r[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i5.GSR = "DISABLED";
    LUT4 i2c_scl_N_609_bdd_3_lut_18978 (.A(cnt_write[1]), .B(cnt_write[2]), 
         .C(cnt_write[0]), .Z(n21212)) /* synthesis lut_function=(!(A (B+(C))+!A !(B+(C)))) */ ;
    defparam i2c_scl_N_609_bdd_3_lut_18978.init = 16'h5656;
    LUT4 n24_bdd_4_lut_18870 (.A(n21551), .B(state_3__N_426[1]), .C(state_back[1]), 
         .D(state[2]), .Z(n21216)) /* synthesis lut_function=(!(A+!(B (C+!(D))+!B (C (D))))) */ ;
    defparam n24_bdd_4_lut_18870.init = 16'h5044;
    LUT4 seg_led_2_c_bdd_2_lut_18873 (.A(n21216), .B(n24_adj_1), .Z(n21217)) /* synthesis lut_function=(A (B)) */ ;
    defparam seg_led_2_c_bdd_2_lut_18873.init = 16'h8888;
    LUT4 i2_3_lut (.A(cnt_stop[1]), .B(cnt_stop[3]), .C(cnt_stop[2]), 
         .Z(n9419)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(204[8:12])
    defparam i2_3_lut.init = 16'hfdfd;
    LUT4 n24_bdd_4_lut_18973 (.A(n21551), .B(n67), .C(n21534), .D(n21724), 
         .Z(n21218)) /* synthesis lut_function=(!(A (D)+!A !(B (C)+!B !(D)))) */ ;
    defparam n24_bdd_4_lut_18973.init = 16'h40fb;
    LUT4 i3_4_lut (.A(state[2]), .B(cnt_mode1[0]), .C(cnt_mode1_c[1]), 
         .D(\cnt_mode1[3] ), .Z(n18670)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i3_4_lut.init = 16'hfffe;
    LUT4 cnt_mode2_2__bdd_2_lut (.A(cnt_mode1[0]), .B(cnt_mode1_c[1]), .Z(n21255)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam cnt_mode2_2__bdd_2_lut.init = 16'h2222;
    LUT4 i1_4_lut (.A(\cnt_main[0] ), .B(\cnt_main[2] ), .C(\cnt_main[1] ), 
         .D(dat_valid_N_624), .Z(n53)) /* synthesis lut_function=(!((B (D)+!B (C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(25[17:26])
    defparam i1_4_lut.init = 16'h0288;
    CCU2D sub_1764_add_2_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18308), .S0(n481));
    defparam sub_1764_add_2_cout.INIT0 = 16'h0000;
    defparam sub_1764_add_2_cout.INIT1 = 16'h0000;
    defparam sub_1764_add_2_cout.INJECT1_0 = "NO";
    defparam sub_1764_add_2_cout.INJECT1_1 = "NO";
    LUT4 i12458_2_lut (.A(\cnt_main[0] ), .B(\cnt_main[1] ), .Z(n3)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(89[7] 103[14])
    defparam i12458_2_lut.init = 16'h2222;
    LUT4 i12299_2_lut_rep_334 (.A(state[0]), .B(state[1]), .Z(n21680)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i12299_2_lut_rep_334.init = 16'heeee;
    LUT4 cnt_mode2_2__bdd_2_lut_18890 (.A(cnt_mode2[2]), .B(cnt_mode2[1]), 
         .Z(n21254)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam cnt_mode2_2__bdd_2_lut_18890.init = 16'hbbbb;
    LUT4 i2684_2_lut (.A(\cnt_main[1] ), .B(\cnt_main[0] ), .Z(n8[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(88[24:39])
    defparam i2684_2_lut.init = 16'h6666;
    LUT4 i18346_3_lut_4_lut (.A(cnt_read[1]), .B(n21668), .C(state[0]), 
         .D(n21634), .Z(n20434)) /* synthesis lut_function=(A ((D)+!C)+!A (B ((D)+!C)+!B (C (D)))) */ ;
    defparam i18346_3_lut_4_lut.init = 16'hfe0e;
    CCU2D sub_1764_add_2_18 (.A0(cnt_delay[22]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[23]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18307), .COUT(n18308));
    defparam sub_1764_add_2_18.INIT0 = 16'h5555;
    defparam sub_1764_add_2_18.INIT1 = 16'h5555;
    defparam sub_1764_add_2_18.INJECT1_0 = "NO";
    defparam sub_1764_add_2_18.INJECT1_1 = "NO";
    PFUMX i19015 (.BLUT(n21707), .ALUT(n21708), .C0(\cnt_main[2] ), .Z(n27_c));
    LUT4 i9039_4_lut (.A(clk_c_enable_98), .B(state[1]), .C(n7041), .D(\cnt_mode2[3] ), 
         .Z(n10854)) /* synthesis lut_function=(A ((C (D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i9039_4_lut.init = 16'ha222;
    LUT4 i2_3_lut_4_lut_adj_36 (.A(cnt_read[1]), .B(n21668), .C(state[0]), 
         .D(cnt_read[2]), .Z(n18609)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i2_3_lut_4_lut_adj_36.init = 16'hfffe;
    LUT4 i2_4_lut (.A(\cnt_mode1[2] ), .B(state[1]), .C(n21675), .D(\cnt_mode1[3] ), 
         .Z(n19883)) /* synthesis lut_function=(A ((C+(D))+!B)+!A ((D)+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    defparam i2_4_lut.init = 16'hffb3;
    LUT4 i16416_4_lut (.A(\cnt_mode1[3] ), .B(\cnt_mode1[2] ), .C(cnt_mode1_c[1]), 
         .D(cnt_mode1[0]), .Z(n145[3])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;
    defparam i16416_4_lut.init = 16'h6aaa;
    LUT4 i12603_3_lut_4_lut (.A(cnt_write[1]), .B(n21669), .C(state[0]), 
         .D(cnt_write[2]), .Z(n4_c)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i12603_3_lut_4_lut.init = 16'hefff;
    CCU2D sub_1764_add_2_16 (.A0(cnt_delay[20]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[21]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18306), .COUT(n18307));
    defparam sub_1764_add_2_16.INIT0 = 16'h5555;
    defparam sub_1764_add_2_16.INIT1 = 16'h5555;
    defparam sub_1764_add_2_16.INJECT1_0 = "NO";
    defparam sub_1764_add_2_16.INJECT1_1 = "NO";
    LUT4 i18429_3_lut_4_lut (.A(cnt_start[2]), .B(n21655), .C(state[0]), 
         .D(i2c_sda_N_643), .Z(n20452)) /* synthesis lut_function=(A (C (D))+!A (B (C (D))+!B ((D)+!C))) */ ;
    defparam i18429_3_lut_4_lut.init = 16'hf101;
    LUT4 i36_2_lut (.A(cnt_mode2[1]), .B(cnt_mode2[0]), .Z(n8273)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    defparam i36_2_lut.init = 16'h6666;
    LUT4 i12495_2_lut (.A(\cnt_main[2] ), .B(dat_valid_N_624), .Z(n91[2])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(89[7] 103[14])
    defparam i12495_2_lut.init = 16'h2222;
    LUT4 i12496_2_lut (.A(\cnt_main[1] ), .B(dat_valid_N_624), .Z(n91[1])) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(89[7] 103[14])
    defparam i12496_2_lut.init = 16'h2222;
    PFUMX i19009 (.BLUT(n21698), .ALUT(n21699), .C0(state[1]), .Z(clk_c_enable_90));
    CCU2D sub_1764_add_2_14 (.A0(cnt_delay[18]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[19]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18305), .COUT(n18306));
    defparam sub_1764_add_2_14.INIT0 = 16'h5555;
    defparam sub_1764_add_2_14.INIT1 = 16'h5555;
    defparam sub_1764_add_2_14.INJECT1_0 = "NO";
    defparam sub_1764_add_2_14.INJECT1_1 = "NO";
    LUT4 state_3__I_0_330_i7_3_lut_4_lut (.A(state[0]), .B(state[1]), .C(state[2]), 
         .D(n20454), .Z(n7_adj_2309)) /* synthesis lut_function=(A (C (D))+!A (B (C (D))+!B ((D)+!C))) */ ;
    defparam state_3__I_0_330_i7_3_lut_4_lut.init = 16'hf101;
    CCU2D sub_1764_add_2_12 (.A0(cnt_delay[16]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[17]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18304), .COUT(n18305));
    defparam sub_1764_add_2_12.INIT0 = 16'h5555;
    defparam sub_1764_add_2_12.INIT1 = 16'h5555;
    defparam sub_1764_add_2_12.INJECT1_0 = "NO";
    defparam sub_1764_add_2_12.INJECT1_1 = "NO";
    LUT4 i1_4_lut_4_lut_else_4_lut (.A(cnt_mode1[0]), .B(reg_data[2]), .C(cnt_mode1_c[1]), 
         .Z(n21704)) /* synthesis lut_function=((B+!(C))+!A) */ ;
    defparam i1_4_lut_4_lut_else_4_lut.init = 16'hdfdf;
    LUT4 i12151_4_lut_4_lut (.A(n21676), .B(dat_valid_N_624), .C(\cnt_main[2] ), 
         .D(state[0]), .Z(n1)) /* synthesis lut_function=(A (B (D)+!B !(C+!(D)))+!A (C (D))) */ ;
    defparam i12151_4_lut_4_lut.init = 16'hda00;
    CCU2D sub_1764_add_2_10 (.A0(cnt_delay[14]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[15]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18303), .COUT(n18304));
    defparam sub_1764_add_2_10.INIT0 = 16'h5555;
    defparam sub_1764_add_2_10.INIT1 = 16'h5555;
    defparam sub_1764_add_2_10.INJECT1_0 = "NO";
    defparam sub_1764_add_2_10.INJECT1_1 = "NO";
    LUT4 i1_2_lut (.A(state[0]), .B(n21411), .Z(n15738)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut.init = 16'h8888;
    CCU2D sub_1764_add_2_8 (.A0(cnt_delay[12]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[13]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18302), .COUT(n18303));
    defparam sub_1764_add_2_8.INIT0 = 16'h5aaa;
    defparam sub_1764_add_2_8.INIT1 = 16'h5555;
    defparam sub_1764_add_2_8.INJECT1_0 = "NO";
    defparam sub_1764_add_2_8.INJECT1_1 = "NO";
    CCU2D sub_1764_add_2_6 (.A0(cnt_delay[10]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[11]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18301), .COUT(n18302));
    defparam sub_1764_add_2_6.INIT0 = 16'h5555;
    defparam sub_1764_add_2_6.INIT1 = 16'h5555;
    defparam sub_1764_add_2_6.INJECT1_0 = "NO";
    defparam sub_1764_add_2_6.INJECT1_1 = "NO";
    CCU2D add_159_25 (.A0(cnt_delay[23]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18218), .S0(n483[23]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_25.INIT0 = 16'h5aaa;
    defparam add_159_25.INIT1 = 16'h0000;
    defparam add_159_25.INJECT1_0 = "NO";
    defparam add_159_25.INJECT1_1 = "NO";
    CCU2D add_159_23 (.A0(cnt_delay[21]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[22]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18217), .COUT(n18218), .S0(n483[21]), 
          .S1(n483[22]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_23.INIT0 = 16'h5aaa;
    defparam add_159_23.INIT1 = 16'h5aaa;
    defparam add_159_23.INJECT1_0 = "NO";
    defparam add_159_23.INJECT1_1 = "NO";
    CCU2D add_159_21 (.A0(cnt_delay[19]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[20]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18216), .COUT(n18217), .S0(n483[19]), 
          .S1(n483[20]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_21.INIT0 = 16'h5aaa;
    defparam add_159_21.INIT1 = 16'h5aaa;
    defparam add_159_21.INJECT1_0 = "NO";
    defparam add_159_21.INJECT1_1 = "NO";
    LUT4 i14009_3_lut (.A(cnt_mode2[2]), .B(cnt_mode2[1]), .C(cnt_mode2[0]), 
         .Z(n15815)) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    defparam i14009_3_lut.init = 16'h6a6a;
    LUT4 i2_4_lut_adj_37 (.A(n21540), .B(n21659), .C(n32), .D(n15738), 
         .Z(clk_c_enable_106)) /* synthesis lut_function=(!((B+!(C+(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i2_4_lut_adj_37.init = 16'h2220;
    FD1P3AX dat_valid_276 (.D(dat_valid_N_624), .SP(clk_400khz_enable_5), 
            .CK(clk_400khz), .Q(dat_valid)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_valid_276.GSR = "DISABLED";
    CCU2D sub_1764_add_2_4 (.A0(cnt_delay[8]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[9]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18300), .COUT(n18301));
    defparam sub_1764_add_2_4.INIT0 = 16'h5555;
    defparam sub_1764_add_2_4.INIT1 = 16'h5aaa;
    defparam sub_1764_add_2_4.INJECT1_0 = "NO";
    defparam sub_1764_add_2_4.INJECT1_1 = "NO";
    FD1P3AX data_r_i0_i6 (.D(i2c_sda_out), .SP(clk_c_enable_21), .CK(clk_c), 
            .Q(data_r[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i6.GSR = "DISABLED";
    CCU2D sub_1764_add_2_2 (.A0(cnt_delay[6]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[7]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18300));
    defparam sub_1764_add_2_2.INIT0 = 16'h5000;
    defparam sub_1764_add_2_2.INIT1 = 16'h5aaa;
    defparam sub_1764_add_2_2.INJECT1_0 = "NO";
    defparam sub_1764_add_2_2.INJECT1_1 = "NO";
    CCU2D cnt_400khz_2093_add_4_11 (.A0(cnt_400khz[9]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18430), .S0(n45[9]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_11.INIT0 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_11.INIT1 = 16'h0000;
    defparam cnt_400khz_2093_add_4_11.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_11.INJECT1_1 = "NO";
    CCU2D cnt_400khz_2093_add_4_9 (.A0(cnt_400khz[7]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_400khz[8]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18429), .COUT(n18430), .S0(n45[7]), .S1(n45[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_9.INIT0 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_9.INIT1 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_9.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_9.INJECT1_1 = "NO";
    CCU2D add_159_19 (.A0(cnt_delay[17]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[18]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18215), .COUT(n18216), .S0(n483[17]), 
          .S1(n483[18]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_19.INIT0 = 16'h5aaa;
    defparam add_159_19.INIT1 = 16'h5aaa;
    defparam add_159_19.INJECT1_0 = "NO";
    defparam add_159_19.INJECT1_1 = "NO";
    CCU2D cnt_400khz_2093_add_4_7 (.A0(cnt_400khz[5]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_400khz[6]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18428), .COUT(n18429), .S0(n45[5]), .S1(n45[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_7.INIT0 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_7.INIT1 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_7.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_7.INJECT1_1 = "NO";
    CCU2D add_159_17 (.A0(cnt_delay[15]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[16]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18214), .COUT(n18215), .S0(n483[15]), 
          .S1(n483[16]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_17.INIT0 = 16'h5aaa;
    defparam add_159_17.INIT1 = 16'h5aaa;
    defparam add_159_17.INJECT1_0 = "NO";
    defparam add_159_17.INJECT1_1 = "NO";
    PFUMX i18347 (.BLUT(n20433), .ALUT(n20434), .C0(state[1]), .Z(n20435));
    LUT4 i1_3_lut_4_lut_adj_38 (.A(state[0]), .B(state[1]), .C(n481), 
         .D(state[3]), .Z(n33)) /* synthesis lut_function=(A (D)+!A (B (D)+!B !(C+!(D)))) */ ;
    defparam i1_3_lut_4_lut_adj_38.init = 16'hef00;
    LUT4 i2_3_lut_adj_39 (.A(cnt_mode2[2]), .B(cnt_mode2[1]), .C(cnt_mode2[0]), 
         .Z(n11417)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_adj_39.init = 16'h1010;
    LUT4 n19869_bdd_4_lut (.A(dat_valid_N_624), .B(\cnt_main[1] ), .C(\cnt_main[2] ), 
         .D(\cnt_main[0] ), .Z(n21450)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A (B+((D)+!C)))) */ ;
    defparam n19869_bdd_4_lut.init = 16'h0810;
    LUT4 i2_3_lut_4_lut_adj_40 (.A(state[1]), .B(n21542), .C(\cnt_mode2[3] ), 
         .D(n9625), .Z(clk_c_enable_61)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;
    defparam i2_3_lut_4_lut_adj_40.init = 16'h0020;
    CCU2D cnt_400khz_2093_add_4_5 (.A0(cnt_400khz[3]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_400khz[4]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18427), .COUT(n18428), .S0(n45[3]), .S1(n45[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_5.INIT0 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_5.INIT1 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_5.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_5.INJECT1_1 = "NO";
    FD1S3IX cnt_400khz_2093__i0 (.D(n45[0]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[0])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i0.GSR = "ENABLED";
    CCU2D cnt_400khz_2093_add_4_3 (.A0(cnt_400khz[1]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_400khz[2]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18426), .COUT(n18427), .S0(n45[1]), .S1(n45[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_3.INIT0 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_3.INIT1 = 16'hfaaa;
    defparam cnt_400khz_2093_add_4_3.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_3.INJECT1_1 = "NO";
    CCU2D add_159_15 (.A0(cnt_delay[13]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[14]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18213), .COUT(n18214), .S0(n483[13]), 
          .S1(n483[14]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_15.INIT0 = 16'h5aaa;
    defparam add_159_15.INIT1 = 16'h5aaa;
    defparam add_159_15.INJECT1_0 = "NO";
    defparam add_159_15.INJECT1_1 = "NO";
    LUT4 i12224_2_lut_3_lut (.A(state[3]), .B(n481), .C(n483[0]), .Z(n9938)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;
    defparam i12224_2_lut_3_lut.init = 16'h2020;
    LUT4 i14020_3_lut (.A(\cnt_mode1[2] ), .B(cnt_mode1_c[1]), .C(cnt_mode1[0]), 
         .Z(n145[2])) /* synthesis lut_function=(!(A (B (C))+!A !(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    defparam i14020_3_lut.init = 16'h6a6a;
    CCU2D add_159_13 (.A0(cnt_delay[11]), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_delay[12]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .CIN(n18212), .COUT(n18213), .S0(n483[11]), 
          .S1(n483[12]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_13.INIT0 = 16'h5aaa;
    defparam add_159_13.INIT1 = 16'h5aaa;
    defparam add_159_13.INJECT1_0 = "NO";
    defparam add_159_13.INJECT1_1 = "NO";
    LUT4 i2_3_lut_4_lut_adj_41 (.A(state[1]), .B(n21542), .C(n9567), .D(\cnt_mode2[3] ), 
         .Z(clk_c_enable_63)) /* synthesis lut_function=(!((B+(C+(D)))+!A)) */ ;
    defparam i2_3_lut_4_lut_adj_41.init = 16'h0002;
    FD1P3IX cnt_main_i0_i3 (.D(n8[3]), .SP(clk_c_enable_91), .CD(n10927), 
            .CK(clk_c), .Q(dat_valid_N_624)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_main_i0_i3.GSR = "ENABLED";
    CCU2D add_159_11 (.A0(cnt_delay[9]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[10]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18211), .COUT(n18212), .S0(n483[9]), .S1(n483[10]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_11.INIT0 = 16'h5aaa;
    defparam add_159_11.INIT1 = 16'h5aaa;
    defparam add_159_11.INJECT1_0 = "NO";
    defparam add_159_11.INJECT1_1 = "NO";
    CCU2D cnt_400khz_2093_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(cnt_400khz[0]), .B1(GND_net), .C1(GND_net), 
          .D1(GND_net), .COUT(n18426), .S1(n45[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093_add_4_1.INIT0 = 16'hF000;
    defparam cnt_400khz_2093_add_4_1.INIT1 = 16'h0555;
    defparam cnt_400khz_2093_add_4_1.INJECT1_0 = "NO";
    defparam cnt_400khz_2093_add_4_1.INJECT1_1 = "NO";
    FD1P3AX reg_data_i0_i2 (.D(n3), .SP(clk_c_enable_103), .CK(clk_c), 
            .Q(reg_data[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_data_i0_i2.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i15 (.D(dat_h[7]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[15])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i15.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i14 (.D(dat_h[6]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[14])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i14.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i13 (.D(dat_h[5]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[13])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i13.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i12 (.D(dat_h[4]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[12])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i12.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i11 (.D(dat_h[3]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[11])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i11.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i10 (.D(dat_h[2]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[10])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i10.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i9 (.D(dat_h[1]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[9])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i9.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i8 (.D(dat_h[0]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[8])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i8.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i6 (.D(dat_l[6]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i6.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i5 (.D(dat_l[5]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i5.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i4 (.D(dat_l[4]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i4.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i3 (.D(dat_l[3]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i3.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i2 (.D(dat_l[2]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i2.GSR = "DISABLED";
    FD1P3IX cnt_main_i0_i1 (.D(n8[1]), .SP(clk_c_enable_91), .CD(n10927), 
            .CK(clk_c), .Q(\cnt_main[1] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_main_i0_i1.GSR = "ENABLED";
    FD1P3IX cnt_mode1_i0_i3 (.D(n145[3]), .SP(clk_c_enable_92), .CD(n16979), 
            .CK(clk_c), .Q(\cnt_mode1[3] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode1_i0_i3.GSR = "ENABLED";
    FD1P3AX prox_dat_i0_i1 (.D(dat_l[1]), .SP(clk_c_enable_39), .CK(clk_c), 
            .Q(prox_dat[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i1.GSR = "DISABLED";
    FD1P3AX reg_addr_i0_i3 (.D(dat_valid_N_624), .SP(clk_c_enable_105), 
            .CK(clk_c), .Q(reg_addr[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_addr_i0_i3.GSR = "DISABLED";
    FD1P3AX data_r_i0_i7 (.D(i2c_sda_out), .SP(clk_c_enable_41), .CK(clk_c), 
            .Q(data_r[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i7.GSR = "DISABLED";
    FD1P3AX reg_addr_i0_i2 (.D(n91[2]), .SP(clk_c_enable_105), .CK(clk_c), 
            .Q(reg_addr[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_addr_i0_i2.GSR = "DISABLED";
    FD1P3AX reg_addr_i0_i1 (.D(n91[1]), .SP(clk_c_enable_105), .CK(clk_c), 
            .Q(reg_addr[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_addr_i0_i1.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i6 (.D(n21706), .SP(clk_c_enable_64), .CK(clk_c), 
            .Q(\data_wr[6] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i6.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i5 (.D(n21256), .SP(clk_c_enable_106), .CK(clk_c), 
            .Q(\data_wr[5] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i5.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i3 (.D(n21512), .SP(clk_c_enable_64), .CK(clk_c), 
            .Q(\data_wr[3] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i3.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i2 (.D(n21511), .SP(clk_c_enable_64), .CK(clk_c), 
            .Q(\data_wr[2] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i2.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i1 (.D(n21510), .SP(clk_c_enable_64), .CK(clk_c), 
            .Q(\data_wr[1] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i1.GSR = "DISABLED";
    LUT4 i2_3_lut_rep_187 (.A(n21542), .B(state[1]), .C(dat_valid_N_624), 
         .Z(n21533)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_rep_187.init = 16'hfefe;
    FD1P3AX dat_l_i0_i6 (.D(data_r[6]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i6.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i5 (.D(data_r[5]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i5.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i4 (.D(data_r[4]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i4.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i3 (.D(data_r[3]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i3.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i2 (.D(data_r[2]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i2.GSR = "DISABLED";
    FD1P3AX dat_l_i0_i1 (.D(data_r[1]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i1.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i7 (.D(data_r[7]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i7.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i6 (.D(data_r[6]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[6])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i6.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i5 (.D(data_r[5]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[5])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i5.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i4 (.D(data_r[4]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[4])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i4.GSR = "DISABLED";
    LUT4 i1_2_lut_4_lut (.A(n21542), .B(state[1]), .C(dat_valid_N_624), 
         .D(n21585), .Z(clk_c_enable_39)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_4_lut.init = 16'h0100;
    FD1P3AX dat_h_i0_i3 (.D(data_r[3]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i3.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i2 (.D(data_r[2]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i2.GSR = "DISABLED";
    FD1P3AX dat_h_i0_i1 (.D(data_r[1]), .SP(clk_c_enable_61), .CK(clk_c), 
            .Q(dat_h[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_h_i0_i1.GSR = "DISABLED";
    LUT4 i18564_2_lut_rep_181_4_lut (.A(n21542), .B(state[1]), .C(dat_valid_N_624), 
         .D(\cnt_main[2] ), .Z(clk_c_enable_103)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i18564_2_lut_rep_181_4_lut.init = 16'h0001;
    LUT4 i3_4_lut_rep_349 (.A(cnt_start[2]), .B(cnt_start[0]), .C(cnt_start[1]), 
         .D(cnt_start[3]), .Z(n22428)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;
    defparam i3_4_lut_rep_349.init = 16'hfff7;
    FD1P3IX cnt_mode1_i0_i2 (.D(n145[2]), .SP(clk_c_enable_92), .CD(n16979), 
            .CK(clk_c), .Q(\cnt_mode1[2] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode1_i0_i2.GSR = "ENABLED";
    LUT4 i12321_4_lut (.A(\cnt_mode2[3] ), .B(cnt_mode2[1]), .C(cnt_mode2[0]), 
         .D(cnt_mode2[2]), .Z(n178[3])) /* synthesis lut_function=(!(A (B (C (D)))+!A !(B (C (D))))) */ ;
    defparam i12321_4_lut.init = 16'h6aaa;
    LUT4 i1_2_lut_4_lut_4_lut (.A(cnt_start[2]), .B(cnt_start[0]), .C(cnt_start[1]), 
         .D(cnt_start[3]), .Z(n21)) /* synthesis lut_function=(!(A (B+(C+(D)))+!A (D))) */ ;
    defparam i1_2_lut_4_lut_4_lut.init = 16'h0057;
    LUT4 i1_2_lut_3_lut_4_lut_adj_42 (.A(\cnt_mode1[2] ), .B(n21544), .C(n21551), 
         .D(n67), .Z(n54)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut_adj_42.init = 16'h0800;
    LUT4 i3324_1_lut (.A(i2c_sda_N_621), .Z(n5039)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(70[2] 217[5])
    defparam i3324_1_lut.init = 16'h5555;
    CCU2D add_159_5 (.A0(cnt_delay[3]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[4]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18208), .COUT(n18209), .S0(n483[3]), .S1(n483[4]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_5.INIT0 = 16'h5aaa;
    defparam add_159_5.INIT1 = 16'h5aaa;
    defparam add_159_5.INJECT1_0 = "NO";
    defparam add_159_5.INJECT1_1 = "NO";
    LUT4 i3449_1_lut (.A(\cnt_main[0] ), .Z(n2693[3])) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(89[7] 103[14])
    defparam i3449_1_lut.init = 16'h5555;
    LUT4 i9113_2_lut_3_lut (.A(state[3]), .B(n481), .C(clk_c_enable_121), 
         .Z(n10930)) /* synthesis lut_function=(A (B (C))+!A (C)) */ ;
    defparam i9113_2_lut_3_lut.init = 16'hd0d0;
    LUT4 reg_addr_1__bdd_4_lut (.A(reg_addr[1]), .B(n19986), .C(n2865[1]), 
         .D(state[0]), .Z(n21510)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)) */ ;
    defparam reg_addr_1__bdd_4_lut.init = 16'h88f0;
    LUT4 i2_3_lut_adj_43 (.A(state[3]), .B(n6_c), .C(state[2]), .Z(i2c_sda_N_658)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i2_3_lut_adj_43.init = 16'hefef;
    PFUMX i18786 (.BLUT(n21030), .ALUT(n21029), .C0(cnt_mode2[0]), .Z(state_3__N_426[1]));
    FD1P3AX dat_l_i0_i7 (.D(data_r[7]), .SP(clk_c_enable_63), .CK(clk_c), 
            .Q(dat_l[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_l_i0_i7.GSR = "DISABLED";
    PFUMX i18913 (.BLUT(n21296), .ALUT(n21295), .C0(state[1]), .Z(n21297));
    PFUMX mux_178_Mux_0_i2 (.BLUT(n2865[0]), .ALUT(n7_adj_2314), .C0(state[0]), 
          .Z(n2)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;
    FD1P3AX data_wr_i0_i7 (.D(n18592), .SP(clk_c_enable_64), .CK(clk_c), 
            .Q(\data_wr[7] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i7.GSR = "DISABLED";
    FD1P3AX prox_dat_i0_i7 (.D(dat_l[7]), .SP(clk_c_enable_65), .CK(clk_c), 
            .Q(prox_dat[7])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i7.GSR = "DISABLED";
    LUT4 i18365_4_lut (.A(n5_c), .B(n21587), .C(state[0]), .D(n6_adj_2315), 
         .Z(n20453)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C+(D)))+!A (B+!(C)))) */ ;
    defparam i18365_4_lut.init = 16'h3a30;
    FD1P3JX reg_data_i0_i1 (.D(n2693[3]), .SP(clk_c_enable_103), .PD(n74), 
            .CK(clk_c), .Q(reg_data[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_data_i0_i1.GSR = "DISABLED";
    FD1P3IX reg_data_i0_i3 (.D(n2693[3]), .SP(clk_c_enable_103), .CD(n10876), 
            .CK(clk_c), .Q(reg_data[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_data_i0_i3.GSR = "DISABLED";
    FD1P3AY i249_283 (.D(i2c_sda_N_658), .SP(i2c_sda_N_652), .CK(clk_400khz), 
            .Q(i2c_sda_N_621)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i249_283.GSR = "ENABLED";
    FD1P3AX cnt_read_i0_i0 (.D(n18598), .SP(clk_c_enable_77), .CK(clk_c), 
            .Q(cnt_read[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_read_i0_i0.GSR = "ENABLED";
    FD1P3IX cnt_mode1_i0_i1 (.D(n145[1]), .SP(clk_c_enable_92), .CD(n16979), 
            .CK(clk_c), .Q(cnt_mode1_c[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode1_i0_i1.GSR = "ENABLED";
    CCU2D add_159_9 (.A0(cnt_delay[7]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[8]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18210), .COUT(n18211), .S0(n483[7]), .S1(n483[8]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_9.INIT0 = 16'h5aaa;
    defparam add_159_9.INIT1 = 16'h5aaa;
    defparam add_159_9.INJECT1_0 = "NO";
    defparam add_159_9.INJECT1_1 = "NO";
    LUT4 i2860_2_lut_rep_286 (.A(cnt_read[1]), .B(cnt_read[0]), .Z(n21632)) /* synthesis lut_function=(A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(179[31:46])
    defparam i2860_2_lut_rep_286.init = 16'h8888;
    FD1P3AX cnt_stop_i0_i0 (.D(n18615), .SP(clk_c_enable_74), .CK(clk_c), 
            .Q(cnt_stop[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_stop_i0_i0.GSR = "ENABLED";
    LUT4 i2867_2_lut_3_lut (.A(cnt_read[1]), .B(cnt_read[0]), .C(cnt_read[2]), 
         .Z(n4442)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(179[31:46])
    defparam i2867_2_lut_3_lut.init = 16'h8080;
    LUT4 i2495_2_lut_3_lut (.A(cnt_read[1]), .B(cnt_read[0]), .C(cnt_read[2]), 
         .Z(n6_adj_2316)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(179[31:46])
    defparam i2495_2_lut_3_lut.init = 16'hf8f8;
    CCU2D add_159_7 (.A0(cnt_delay[5]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[6]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18209), .COUT(n18210), .S0(n483[5]), .S1(n483[6]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_7.INIT0 = 16'h5aaa;
    defparam add_159_7.INIT1 = 16'h5aaa;
    defparam add_159_7.INJECT1_0 = "NO";
    defparam add_159_7.INJECT1_1 = "NO";
    LUT4 i2713_2_lut (.A(cnt_mode1_c[1]), .B(cnt_mode1[0]), .Z(n145[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(107[25:41])
    defparam i2713_2_lut.init = 16'h6666;
    LUT4 i12127_2_lut_rep_288 (.A(cnt_stop[3]), .B(cnt_stop[1]), .Z(n21634)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i12127_2_lut_rep_288.init = 16'heeee;
    LUT4 i2_2_lut_rep_241_3_lut (.A(cnt_stop[3]), .B(cnt_stop[1]), .C(cnt_stop[2]), 
         .Z(n21587)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i2_2_lut_rep_241_3_lut.init = 16'hefef;
    LUT4 i1_2_lut_rep_218_3_lut_4_lut (.A(cnt_stop[3]), .B(cnt_stop[1]), 
         .C(cnt_stop[0]), .D(cnt_stop[2]), .Z(n21564)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i1_2_lut_rep_218_3_lut_4_lut.init = 16'hefff;
    LUT4 i1_4_lut_then_4_lut (.A(n19972), .B(dat_valid_N_624), .C(\cnt_main[0] ), 
         .D(\cnt_main[1] ), .Z(n21708)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_4_lut_then_4_lut.init = 16'h0200;
    LUT4 i18593_3_lut (.A(n11835), .B(cnt_stop[0]), .C(state[2]), .Z(n18615)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i18593_3_lut.init = 16'h1010;
    LUT4 i2616_3_lut (.A(cnt_stop[0]), .B(cnt_stop[2]), .C(cnt_stop[1]), 
         .Z(n6_adj_2317)) /* synthesis lut_function=(A (B)+!A (B (C))) */ ;
    defparam i2616_3_lut.init = 16'hc8c8;
    LUT4 n3999_bdd_4_lut_18912 (.A(n6_adj_2316), .B(cnt_read[3]), .C(state[0]), 
         .D(n4001), .Z(n21295)) /* synthesis lut_function=(!(A (C+!(D))+!A ((C+!(D))+!B))) */ ;
    defparam n3999_bdd_4_lut_18912.init = 16'h0e00;
    LUT4 n3999_bdd_4_lut_19210 (.A(n3999), .B(n6_adj_2318), .C(cnt_write[3]), 
         .D(state[0]), .Z(n21296)) /* synthesis lut_function=(A (B (D)+!B (C (D)))) */ ;
    defparam n3999_bdd_4_lut_19210.init = 16'ha800;
    FD1P3AX cnt_main_i0_i2 (.D(n1), .SP(clk_c_enable_91), .CK(clk_c), 
            .Q(\cnt_main[2] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_main_i0_i2.GSR = "ENABLED";
    LUT4 i2c_sda_I_0_4_lut (.A(i2c_sda_out), .B(n7_adj_2309), .C(i2c_sda_N_652), 
         .D(state[3]), .Z(i2c_sda_N_630)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2c_sda_I_0_4_lut.init = 16'h0aca;
    PFUMX i18366 (.BLUT(n20452), .ALUT(n20453), .C0(state[1]), .Z(n20454));
    LUT4 mux_1649_i1_4_lut (.A(reg_addr[0]), .B(reg_data[0]), .C(cnt_mode1[0]), 
         .D(cnt_mode1_c[1]), .Z(n2865[0])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;
    defparam mux_1649_i1_4_lut.init = 16'hca0a;
    FD1P3AX cnt_stop_i0_i1 (.D(n20009), .SP(clk_c_enable_74), .CK(clk_c), 
            .Q(cnt_stop[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_stop_i0_i1.GSR = "ENABLED";
    LUT4 i18711_4_lut (.A(n21680), .B(state[3]), .C(n20435), .D(state[2]), 
         .Z(i2c_sda_N_652)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A (B+(C (D))))) */ ;
    defparam i18711_4_lut.init = 16'h0311;
    FD1P3AX cnt_stop_i0_i2 (.D(n20010), .SP(clk_c_enable_74), .CK(clk_c), 
            .Q(cnt_stop[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_stop_i0_i2.GSR = "ENABLED";
    FD1P3AX cnt_stop_i0_i3 (.D(n22432), .SP(clk_c_enable_74), .CK(clk_c), 
            .Q(cnt_stop[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_stop_i0_i3.GSR = "ENABLED";
    FD1P3AX cnt_read_i0_i1 (.D(n19964), .SP(clk_c_enable_77), .CK(clk_c), 
            .Q(cnt_read[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_read_i0_i1.GSR = "ENABLED";
    FD1P3AX cnt_read_i0_i2 (.D(n19965), .SP(clk_c_enable_77), .CK(clk_c), 
            .Q(cnt_read[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_read_i0_i2.GSR = "ENABLED";
    FD1P3AX cnt_read_i0_i3 (.D(n19963), .SP(clk_c_enable_77), .CK(clk_c), 
            .Q(cnt_read[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_read_i0_i3.GSR = "ENABLED";
    FD1P3AX state_back_i0_i1 (.D(state[1]), .SP(clk_c_enable_78), .CK(clk_c), 
            .Q(state_back[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_back_i0_i1.GSR = "ENABLED";
    PFUMX i19013 (.BLUT(n21704), .ALUT(n21705), .C0(state[0]), .Z(n21706));
    LUT4 i2778_2_lut_3_lut (.A(cnt_start[1]), .B(cnt_start[0]), .C(cnt_start[2]), 
         .Z(n232[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(140[25:41])
    defparam i2778_2_lut_3_lut.init = 16'h7878;
    LUT4 i2785_3_lut_4_lut (.A(cnt_start[1]), .B(cnt_start[0]), .C(cnt_start[2]), 
         .D(cnt_start[3]), .Z(n232[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(140[25:41])
    defparam i2785_3_lut_4_lut.init = 16'h7f80;
    FD1P3IX cnt_write_i0_i3 (.D(n288[3]), .SP(clk_c_enable_83), .CD(n10921), 
            .CK(clk_c), .Q(cnt_write[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_write_i0_i3.GSR = "ENABLED";
    FD1P3AX cnt_delay_i0_i0 (.D(n9938), .SP(clk_c_enable_121), .CK(clk_c), 
            .Q(cnt_delay[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i0.GSR = "ENABLED";
    FD1P3AX data_r_i0_i1 (.D(i2c_sda_out), .SP(clk_c_enable_81), .CK(clk_c), 
            .Q(data_r[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i1.GSR = "DISABLED";
    LUT4 i1_3_lut_rep_298 (.A(cnt_start[3]), .B(cnt_start[2]), .C(cnt_start[1]), 
         .Z(n21644)) /* synthesis lut_function=(A+(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(141[7] 149[14])
    defparam i1_3_lut_rep_298.init = 16'heaea;
    FD1P3IX cnt_write_i0_i2 (.D(n288[2]), .SP(clk_c_enable_83), .CD(n10921), 
            .CK(clk_c), .Q(cnt_write[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_write_i0_i2.GSR = "ENABLED";
    FD1P3IX cnt_write_i0_i1 (.D(n288[1]), .SP(clk_c_enable_83), .CD(n10921), 
            .CK(clk_c), .Q(cnt_write[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_write_i0_i1.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_299 (.A(state[0]), .B(state[1]), .Z(n21645)) /* synthesis lut_function=((B)+!A) */ ;
    defparam i1_2_lut_rep_299.init = 16'hdddd;
    LUT4 i2_4_lut_4_lut (.A(state[0]), .B(state[1]), .C(n78), .D(n21659), 
         .Z(clk_400khz_enable_4)) /* synthesis lut_function=(!(A (((D)+!C)+!B)+!A (B ((D)+!C)+!B (D)))) */ ;
    defparam i2_4_lut_4_lut.init = 16'h00d1;
    LUT4 i1_2_lut_rep_300 (.A(state[0]), .B(state[1]), .Z(n21646)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_300.init = 16'h8888;
    LUT4 i2_3_lut_4_lut_adj_44 (.A(state[0]), .B(state[1]), .C(state[2]), 
         .D(n9419), .Z(n18549)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i2_3_lut_4_lut_adj_44.init = 16'h8000;
    FD1P3AX data_r_i0_i2 (.D(i2c_sda_out), .SP(clk_c_enable_85), .CK(clk_c), 
            .Q(data_r[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i2.GSR = "DISABLED";
    CCU2D add_159_3 (.A0(cnt_delay[1]), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[2]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n18207), .COUT(n18208), .S0(n483[1]), .S1(n483[2]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_3.INIT0 = 16'h5aaa;
    defparam add_159_3.INIT1 = 16'h5aaa;
    defparam add_159_3.INJECT1_0 = "NO";
    defparam add_159_3.INJECT1_1 = "NO";
    LUT4 i2814_2_lut_3_lut_4_lut (.A(cnt_write[1]), .B(cnt_write[0]), .C(cnt_write[3]), 
         .D(cnt_write[2]), .Z(n288[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(157[32:48])
    defparam i2814_2_lut_3_lut_4_lut.init = 16'h78f0;
    LUT4 i2487_2_lut_3_lut (.A(cnt_write[1]), .B(cnt_write[0]), .C(cnt_write[2]), 
         .Z(n6_adj_2318)) /* synthesis lut_function=(A (B+(C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(157[32:48])
    defparam i2487_2_lut_3_lut.init = 16'hf8f8;
    LUT4 i2807_2_lut_3_lut (.A(cnt_write[1]), .B(cnt_write[0]), .C(cnt_write[2]), 
         .Z(n288[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(157[32:48])
    defparam i2807_2_lut_3_lut.init = 16'h7878;
    LUT4 i12225_3_lut_4_lut (.A(cnt[0]), .B(\cnt[1] ), .C(cnt_c[3]), .D(cnt_c[2]), 
         .Z(n14018)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i12225_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_45 (.A(cnt[0]), .B(\cnt[1] ), .C(cnt_c[2]), 
         .D(n13675), .Z(clk_c_enable_110)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_4_lut_adj_45.init = 16'h8000;
    LUT4 i2_3_lut_4_lut_adj_46 (.A(cnt[0]), .B(\cnt[1] ), .C(n13675), 
         .D(cnt_c[2]), .Z(clk_c_enable_18)) /* synthesis lut_function=(!((((D)+!C)+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_4_lut_adj_46.init = 16'h0080;
    LUT4 i1_3_lut_4_lut_adj_47 (.A(cnt[0]), .B(\cnt[1] ), .C(cnt_c[2]), 
         .D(n11822), .Z(n7_adj_2319)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A !(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_3_lut_4_lut_adj_47.init = 16'h7800;
    LUT4 i1_2_lut_rep_305 (.A(state[1]), .B(state[3]), .Z(n21651)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_305.init = 16'heeee;
    LUT4 i1_2_lut_rep_206_3_lut_4_lut (.A(state[1]), .B(state[3]), .C(n10901), 
         .D(clk_400khz), .Z(n21552)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;
    defparam i1_2_lut_rep_206_3_lut_4_lut.init = 16'hffef;
    LUT4 i1_2_lut_rep_307 (.A(state[0]), .B(state[1]), .Z(n21653)) /* synthesis lut_function=(!((B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_rep_307.init = 16'h2222;
    FD1P3AX state_i0_i2 (.D(n2323), .SP(clk_c_enable_86), .CK(clk_c), 
            .Q(state[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_i0_i2.GSR = "ENABLED";
    LUT4 i2_3_lut_rep_266_4_lut (.A(state[0]), .B(state[1]), .C(rst_c), 
         .D(n21659), .Z(n21612)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_rep_266_4_lut.init = 16'h0020;
    FD1P3AX cnt_i0_i3 (.D(n22432), .SP(clk_c_enable_90), .CK(clk_c), .Q(cnt_c[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_i0_i3.GSR = "ENABLED";
    LUT4 i18243_2_lut_3_lut_4_lut (.A(cnt_write[2]), .B(cnt_write[1]), .C(cnt_write[3]), 
         .D(cnt_write[0]), .Z(n4)) /* synthesis lut_function=(!(A (B (C+(D))+!B (C))+!A (C))) */ ;
    defparam i18243_2_lut_3_lut_4_lut.init = 16'h070f;
    LUT4 i1_2_lut_3_lut_4_lut_adj_48 (.A(cnt_write[2]), .B(cnt_write[1]), 
         .C(cnt_write[3]), .D(cnt_write[0]), .Z(n20134)) /* synthesis lut_function=(((C+!(D))+!B)+!A) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_48.init = 16'hf7ff;
    LUT4 i2_3_lut_4_lut_adj_49 (.A(cnt_write[2]), .B(cnt_write[1]), .C(state[0]), 
         .D(n21669), .Z(n9389)) /* synthesis lut_function=((((D)+!C)+!B)+!A) */ ;
    defparam i2_3_lut_4_lut_adj_49.init = 16'hff7f;
    LUT4 i18345_4_lut (.A(cnt_start[3]), .B(n21605), .C(state[0]), .D(cnt_start[2]), 
         .Z(n20433)) /* synthesis lut_function=(A (B+!(C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;
    defparam i18345_4_lut.init = 16'hcfca;
    LUT4 i1_2_lut_rep_239_3_lut (.A(\cnt_main[2] ), .B(\cnt_main[0] ), .C(\cnt_main[1] ), 
         .Z(n21585)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_rep_239_3_lut.init = 16'h2020;
    LUT4 i18200_2_lut_rep_309 (.A(cnt_start[3]), .B(cnt_start[1]), .Z(n21655)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i18200_2_lut_rep_309.init = 16'heeee;
    LUT4 i1_4_lut_else_4_lut (.A(n19972), .B(dat_valid_N_624), .C(\cnt_main[0] ), 
         .D(\cnt_main[1] ), .Z(n21707)) /* synthesis lut_function=(A (B ((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_4_lut_else_4_lut.init = 16'h8808;
    FD1P3AX cnt_i0_i2 (.D(n7_adj_2319), .SP(clk_c_enable_90), .CK(clk_c), 
            .Q(cnt_c[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_i0_i2.GSR = "ENABLED";
    FD1P3AX state_i0_i3 (.D(n19887), .SP(clk_c_enable_89), .CK(clk_c), 
            .Q(state[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_i0_i3.GSR = "ENABLED";
    FD1P3AX cnt_i0_i1 (.D(n7), .SP(clk_c_enable_90), .CK(clk_c), .Q(\cnt[1] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_i0_i1.GSR = "ENABLED";
    LUT4 i1_4_lut_then_4_lut_adj_50 (.A(n21551), .B(state[0]), .C(state[2]), 
         .D(n4001), .Z(n21699)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i1_4_lut_then_4_lut_adj_50.init = 16'h1000;
    LUT4 i12290_3_lut_4_lut (.A(cnt_mode2[0]), .B(cnt_mode2[1]), .C(cnt_mode2[2]), 
         .D(reg_addr[0]), .Z(n7_adj_2314)) /* synthesis lut_function=(A (C)+!A (B (C+(D))+!B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i12290_3_lut_4_lut.init = 16'hf4f0;
    FD1P3IX cnt_main_i0_i0 (.D(n2693[3]), .SP(clk_c_enable_91), .CD(n10927), 
            .CK(clk_c), .Q(\cnt_main[0] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_main_i0_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_3_lut_adj_51 (.A(cnt_mode2[0]), .B(cnt_mode2[1]), .C(cnt_mode2[2]), 
         .Z(n9567)) /* synthesis lut_function=(A+!(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_3_lut_adj_51.init = 16'hbfbf;
    LUT4 i1_4_lut_else_4_lut_adj_52 (.A(n21551), .B(state[0]), .C(n3999), 
         .D(state[2]), .Z(n21698)) /* synthesis lut_function=(!(A+!(B (C (D))+!B !(D)))) */ ;
    defparam i1_4_lut_else_4_lut_adj_52.init = 16'h4011;
    LUT4 i18691_2_lut_3_lut (.A(cnt_mode2[0]), .B(cnt_mode2[1]), .C(cnt_mode2[2]), 
         .Z(n19986)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i18691_2_lut_3_lut.init = 16'h0404;
    LUT4 i3458_1_lut (.A(cnt_mode2[0]), .Z(n1_adj_2322)) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(123[7] 136[14])
    defparam i3458_1_lut.init = 16'h5555;
    LUT4 i1_2_lut_adj_53 (.A(cnt_read[2]), .B(cnt_read[1]), .Z(n5_c)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_adj_53.init = 16'h2222;
    LUT4 i3_3_lut_4_lut (.A(state[1]), .B(n21554), .C(n21659), .D(n21413), 
         .Z(clk_c_enable_64)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i3_3_lut_4_lut.init = 16'h0800;
    LUT4 i2_3_lut_adj_54 (.A(cnt_read[3]), .B(ack), .C(cnt_read[0]), .Z(n6_adj_2315)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;
    defparam i2_3_lut_adj_54.init = 16'h0404;
    PFUMX i18891 (.BLUT(n21255), .ALUT(n21254), .C0(state[0]), .Z(n21256));
    FD1P3IX cnt_mode1_i0_i0 (.D(n27), .SP(clk_c_enable_92), .CD(n16979), 
            .CK(clk_c), .Q(cnt_mode1[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode1_i0_i0.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_313 (.A(state[3]), .B(state[2]), .Z(n21659)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_313.init = 16'heeee;
    LUT4 i1_2_lut_3_lut_adj_55 (.A(cnt_mode2[1]), .B(cnt_mode2[0]), .C(cnt_mode2[2]), 
         .Z(n9625)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(123[7] 136[14])
    defparam i1_2_lut_3_lut_adj_55.init = 16'hfefe;
    FD1P3IX cnt_delay_i0_i23 (.D(n483[23]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[23])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i23.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i22 (.D(n483[22]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[22])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i22.GSR = "ENABLED";
    LUT4 i1_3_lut_4_lut_adj_56 (.A(state[2]), .B(n21555), .C(cnt_read[0]), 
         .D(cnt_read[1]), .Z(n19964)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i1_3_lut_4_lut_adj_56.init = 16'h0220;
    LUT4 i1_3_lut_4_lut_adj_57 (.A(state[2]), .B(n21555), .C(n21632), 
         .D(cnt_read[2]), .Z(n19965)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i1_3_lut_4_lut_adj_57.init = 16'h0220;
    LUT4 i1_3_lut_4_lut_adj_58 (.A(state[2]), .B(n21555), .C(n4442), .D(cnt_read[3]), 
         .Z(n19963)) /* synthesis lut_function=(!((B+(C (D)+!C !(D)))+!A)) */ ;
    defparam i1_3_lut_4_lut_adj_58.init = 16'h0220;
    LUT4 i1_4_lut_adj_59 (.A(cnt_stop[2]), .B(n21567), .C(cnt_stop[1]), 
         .D(cnt_stop[0]), .Z(n20010)) /* synthesis lut_function=(!(A ((C (D))+!B)+!A !(B (C (D))))) */ ;
    defparam i1_4_lut_adj_59.init = 16'h4888;
    FD1P3IX cnt_mode2_i0_i1 (.D(n8273), .SP(clk_c_enable_98), .CD(n10854), 
            .CK(clk_c), .Q(cnt_mode2[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode2_i0_i1.GSR = "ENABLED";
    LUT4 reg_addr_2__bdd_4_lut (.A(reg_addr[2]), .B(n19986), .C(n2865[2]), 
         .D(state[0]), .Z(n21511)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)) */ ;
    defparam reg_addr_2__bdd_4_lut.init = 16'h88f0;
    FD1P3IX cnt_mode2_i0_i2 (.D(n15815), .SP(clk_c_enable_98), .CD(n10854), 
            .CK(clk_c), .Q(cnt_mode2[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode2_i0_i2.GSR = "ENABLED";
    FD1P3IX cnt_mode2_i0_i3 (.D(n178[3]), .SP(clk_c_enable_98), .CD(n10854), 
            .CK(clk_c), .Q(\cnt_mode2[3] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode2_i0_i3.GSR = "ENABLED";
    LUT4 i9104_2_lut_3_lut_4_lut_then_4_lut (.A(n21551), .B(state[1]), .C(n3999), 
         .D(state[0]), .Z(n21711)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i9104_2_lut_3_lut_4_lut_then_4_lut.init = 16'h1000;
    FD1P3IX cnt_mode2_i0_i0 (.D(n1_adj_2322), .SP(clk_c_enable_98), .CD(n10854), 
            .CK(clk_c), .Q(cnt_mode2[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_mode2_i0_i0.GSR = "ENABLED";
    LUT4 i9104_2_lut_3_lut_4_lut_else_4_lut (.A(n21551), .B(state[1]), .C(state[0]), 
         .Z(n21710)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;
    defparam i9104_2_lut_3_lut_4_lut_else_4_lut.init = 16'h0101;
    LUT4 i9110_3_lut_4_lut (.A(state[2]), .B(n21552), .C(state[0]), .D(n21611), 
         .Z(n10927)) /* synthesis lut_function=(!(A+(B+!((D)+!C)))) */ ;
    defparam i9110_3_lut_4_lut.init = 16'h1101;
    FD1P3IX cnt_delay_i0_i21 (.D(n483[21]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[21])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i21.GSR = "ENABLED";
    LUT4 mux_1649_i4_4_lut (.A(reg_addr[3]), .B(reg_data[3]), .C(cnt_mode1[0]), 
         .D(cnt_mode1_c[1]), .Z(n2865[3])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;
    defparam mux_1649_i4_4_lut.init = 16'hca0a;
    LUT4 i1_4_lut_adj_60 (.A(n20449), .B(cnt_write[0]), .C(n20450), .D(cnt_c[2]), 
         .Z(n6)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;
    defparam i1_4_lut_adj_60.init = 16'h3022;
    FD1P3IX cnt_delay_i0_i20 (.D(n483[20]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[20])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i20.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i19 (.D(n483[19]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[19])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i19.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_323 (.A(cnt_write[3]), .B(cnt_write[0]), .Z(n21669)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(159[7] 171[14])
    defparam i1_2_lut_rep_323.init = 16'heeee;
    FD1P3IX cnt_start_i0_i0 (.D(n232[0]), .SP(clk_c_enable_114), .CD(n11817), 
            .CK(clk_c), .Q(cnt_start[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_start_i0_i0.GSR = "ENABLED";
    FD1P3AY scl_256 (.D(n7_adj_2325), .SP(clk_400khz_enable_2), .CK(clk_400khz), 
            .Q(i2c_scl_c)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam scl_256.GSR = "ENABLED";
    FD1P3IX reg_data_i0_i0 (.D(\cnt_main[0] ), .SP(clk_c_enable_103), .CD(n74), 
            .CK(clk_c), .Q(reg_data[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_data_i0_i0.GSR = "DISABLED";
    LUT4 i2800_2_lut (.A(cnt_write[1]), .B(cnt_write[0]), .Z(n288[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(157[32:48])
    defparam i2800_2_lut.init = 16'h6666;
    FD1P3AX prox_dat_i0_i0 (.D(dat_l[0]), .SP(clk_c_enable_104), .CK(clk_c), 
            .Q(prox_dat[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam prox_dat_i0_i0.GSR = "DISABLED";
    FD1P3AX reg_addr_i0_i0 (.D(n20042), .SP(clk_c_enable_105), .CK(clk_c), 
            .Q(reg_addr[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam reg_addr_i0_i0.GSR = "DISABLED";
    FD1P3AX data_wr_i0_i0 (.D(n2), .SP(clk_c_enable_106), .CK(clk_c), 
            .Q(\data_wr[0] )) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_wr_i0_i0.GSR = "DISABLED";
    FD1P3AX ack_flag_259 (.D(n18508), .SP(clk_400khz_enable_3), .CK(clk_400khz), 
            .Q(ack_flag)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam ack_flag_259.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_259_3_lut (.A(cnt_write[3]), .B(cnt_write[0]), .C(cnt_write[1]), 
         .Z(n21605)) /* synthesis lut_function=(A+(B+(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(159[7] 171[14])
    defparam i1_2_lut_rep_259_3_lut.init = 16'hfefe;
    LUT4 i2_3_lut_4_lut_adj_61 (.A(\cnt_main[1] ), .B(\cnt_main[2] ), .C(n21533), 
         .D(\cnt_main[0] ), .Z(clk_c_enable_65)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i2_3_lut_4_lut_adj_61.init = 16'h0008;
    LUT4 i18517_3_lut_4_lut (.A(\cnt_main[1] ), .B(\cnt_main[2] ), .C(\cnt_main[0] ), 
         .D(n21533), .Z(clk_c_enable_104)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i18517_3_lut_4_lut.init = 16'h0008;
    FD1P3IX cnt_delay_i0_i18 (.D(n483[18]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[18])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i18.GSR = "ENABLED";
    LUT4 cnt_mode2_1__bdd_3_lut_19289 (.A(cnt_mode2[1]), .B(\cnt_mode2[3] ), 
         .C(cnt_mode2[2]), .Z(n21029)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)+!B !(C)))) */ ;
    defparam cnt_mode2_1__bdd_3_lut_19289.init = 16'h3434;
    LUT4 i1_2_lut_rep_188_4_lut (.A(n6_adj_2), .B(n21551), .C(n18670), 
         .D(\cnt_mode1[2] ), .Z(n21534)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_rep_188_4_lut.init = 16'h0200;
    LUT4 mux_1649_i3_4_lut (.A(reg_addr[2]), .B(reg_data[2]), .C(cnt_mode1[0]), 
         .D(cnt_mode1_c[1]), .Z(n2865[2])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;
    defparam mux_1649_i3_4_lut.init = 16'hca0a;
    LUT4 i3585_4_lut_then_4_lut (.A(cnt_write[3]), .B(cnt_write[1]), .C(n14018), 
         .D(cnt_write[2]), .Z(n21702)) /* synthesis lut_function=(A+(B ((D)+!C)+!B !(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(155[16] 158[10])
    defparam i3585_4_lut_then_4_lut.init = 16'hefae;
    FD1P3IX cnt_delay_i0_i17 (.D(n483[17]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[17])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i17.GSR = "ENABLED";
    LUT4 i3585_4_lut_else_4_lut (.A(cnt_write[3]), .B(n14018), .C(cnt_write[2]), 
         .Z(n21701)) /* synthesis lut_function=(A+!(B+!(C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(155[16] 158[10])
    defparam i3585_4_lut_else_4_lut.init = 16'hbaba;
    LUT4 i1_3_lut (.A(cnt_stop[3]), .B(cnt_stop[2]), .C(cnt_stop[1]), 
         .Z(i2c_sda_N_637)) /* synthesis lut_function=(A+(B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(198[7] 206[14])
    defparam i1_3_lut.init = 16'heaea;
    PFUMX i18871 (.BLUT(n21218), .ALUT(n21217), .C0(n21529), .Z(n21219));
    LUT4 i18560_4_lut (.A(n19851), .B(n35), .C(ack_flag), .D(n2619), 
         .Z(clk_c_enable_86)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B (C (D))))) */ ;
    defparam i18560_4_lut.init = 16'h0511;
    FD1P3IX cnt_delay_i0_i16 (.D(n483[16]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[16])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i16.GSR = "ENABLED";
    LUT4 i1_3_lut_adj_62 (.A(n21068), .B(n27_c), .C(n19969), .Z(n35)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_3_lut_adj_62.init = 16'hecec;
    L6MUX21 i18868 (.D0(n21213), .D1(n21515), .SD(state[1]), .Z(n21214));
    PFUMX i18866 (.BLUT(i2c_scl_N_609), .ALUT(n21212), .C0(state[0]), 
          .Z(n21213));
    LUT4 i1811_2_lut_4_lut_4_lut (.A(\cnt_mode1[2] ), .B(n18670), .C(n21551), 
         .D(n6_adj_2), .Z(n2278)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1811_2_lut_4_lut_4_lut.init = 16'hfeff;
    FD1P3AX ack_258 (.D(n18539), .SP(clk_400khz_enable_4), .CK(clk_400khz), 
            .Q(ack)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam ack_258.GSR = "ENABLED";
    FD1P3AX data_r_i0_i0 (.D(i2c_sda_out), .SP(clk_c_enable_110), .CK(clk_c), 
            .Q(data_r[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam data_r_i0_i0.GSR = "DISABLED";
    FD1P3AX state_i0_i0 (.D(n2325), .SP(clk_c_enable_111), .CK(clk_c), 
            .Q(state[0])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam state_i0_i0.GSR = "ENABLED";
    FD1P3IX cnt_start_i0_i1 (.D(n232[1]), .SP(clk_c_enable_114), .CD(n11817), 
            .CK(clk_c), .Q(cnt_start[1])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_start_i0_i1.GSR = "ENABLED";
    LUT4 i1_4_lut_adj_63 (.A(cnt_mode2[0]), .B(\cnt_mode2[3] ), .C(cnt_mode2[1]), 
         .D(cnt_mode2[2]), .Z(n57)) /* synthesis lut_function=(A (B)+!A (B+(C (D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    defparam i1_4_lut_adj_63.init = 16'hdccc;
    FD1P3IX cnt_start_i0_i2 (.D(n232[2]), .SP(clk_c_enable_114), .CD(n11817), 
            .CK(clk_c), .Q(cnt_start[2])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_start_i0_i2.GSR = "ENABLED";
    LUT4 i3_4_lut_adj_64 (.A(state[2]), .B(n21529), .C(cnt_mode2[0]), 
         .D(n24_adj_1), .Z(n19969)) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i3_4_lut_adj_64.init = 16'h0400;
    LUT4 cnt_mode2_3__bdd_4_lut (.A(\cnt_mode2[3] ), .B(cnt_mode2[0]), .C(cnt_mode2[1]), 
         .D(cnt_mode2[2]), .Z(n21411)) /* synthesis lut_function=(!(A+(B (C+(D))+!B (C (D)+!C !(D))))) */ ;
    defparam cnt_mode2_3__bdd_4_lut.init = 16'h0114;
    LUT4 i2_3_lut_4_lut_adj_65 (.A(\cnt_mode2[3] ), .B(cnt_mode2[2]), .C(cnt_mode2[0]), 
         .D(state[0]), .Z(n78)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_4_lut_adj_65.init = 16'h4000;
    LUT4 reg_addr_3__bdd_4_lut (.A(reg_addr[3]), .B(n19986), .C(n2865[3]), 
         .D(state[0]), .Z(n21512)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)) */ ;
    defparam reg_addr_3__bdd_4_lut.init = 16'h88f0;
    LUT4 cnt_mode2_1__bdd_4_lut_19288 (.A(cnt_mode2[1]), .B(\cnt_mode2[3] ), 
         .C(state[1]), .D(cnt_mode2[2]), .Z(n21030)) /* synthesis lut_function=(!(A (B+!(C (D)))+!A (((D)+!C)+!B))) */ ;
    defparam cnt_mode2_1__bdd_4_lut_19288.init = 16'h2040;
    LUT4 mux_1649_i2_4_lut (.A(reg_addr[1]), .B(reg_data[1]), .C(cnt_mode1[0]), 
         .D(cnt_mode1_c[1]), .Z(n2865[1])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (C (D)))) */ ;
    defparam mux_1649_i2_4_lut.init = 16'hca0a;
    FD1P3IX cnt_start_i0_i3 (.D(n232[3]), .SP(clk_c_enable_114), .CD(n11817), 
            .CK(clk_c), .Q(cnt_start[3])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_start_i0_i3.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_329 (.A(cnt_mode1[0]), .B(cnt_mode1_c[1]), .Z(n21675)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    defparam i1_2_lut_rep_329.init = 16'heeee;
    LUT4 i1_2_lut_rep_264_3_lut_4_lut (.A(cnt_mode1[0]), .B(cnt_mode1_c[1]), 
         .C(\cnt_mode1[3] ), .D(\cnt_mode1[2] ), .Z(n21610)) /* synthesis lut_function=(!(A (C+(D))+!A ((C+(D))+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    defparam i1_2_lut_rep_264_3_lut_4_lut.init = 16'h000e;
    LUT4 i11991_2_lut_2_lut (.A(ack_flag), .B(\state_back[0] ), .Z(n324)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i11991_2_lut_2_lut.init = 16'h4444;
    FD1P3IX cnt_delay_i0_i15 (.D(n483[15]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[15])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i15.GSR = "ENABLED";
    LUT4 i18651_4_lut_4_lut (.A(state[0]), .B(n96), .C(n72), .D(n10), 
         .Z(n19887)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;
    defparam i18651_4_lut_4_lut.init = 16'h0020;
    LUT4 i3_3_lut_4_lut_4_lut (.A(state[0]), .B(n19883), .C(n21659), .D(n21576), 
         .Z(n16979)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i3_3_lut_4_lut_4_lut.init = 16'h0004;
    LUT4 mux_1249_i1_4_lut_4_lut (.A(state[0]), .B(n53), .C(n21528), .D(n21534), 
         .Z(n2295)) /* synthesis lut_function=(A (B ((D)+!C)+!B (C (D)))+!A ((D)+!C)) */ ;
    defparam mux_1249_i1_4_lut_4_lut.init = 16'hfd0d;
    LUT4 i1_2_lut_3_lut_4_lut_4_lut (.A(state[0]), .B(n21675), .C(\cnt_mode1[3] ), 
         .D(\cnt_mode1[2] ), .Z(n32)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i1_2_lut_3_lut_4_lut_4_lut.init = 16'h0004;
    LUT4 i3_4_lut_4_lut (.A(state[0]), .B(reg_data[2]), .C(cnt_mode1_c[1]), 
         .D(cnt_mode1[0]), .Z(n18592)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i3_4_lut_4_lut.init = 16'h4000;
    LUT4 i3_4_lut_4_lut_adj_66 (.A(state[0]), .B(state[1]), .C(cnt_stop[3]), 
         .D(n6_adj_2317), .Z(n11835)) /* synthesis lut_function=(((C+(D))+!B)+!A) */ ;
    defparam i3_4_lut_4_lut_adj_66.init = 16'hfff7;
    LUT4 i2_4_lut_4_lut_adj_67 (.A(state[0]), .B(n4_adj_2327), .C(cnt_start[3]), 
         .D(n21541), .Z(n11817)) /* synthesis lut_function=(!(A+(B (D)+!B ((D)+!C)))) */ ;
    defparam i2_4_lut_4_lut_adj_67.init = 16'h0054;
    LUT4 i2601_2_lut_rep_330 (.A(\cnt_main[0] ), .B(\cnt_main[1] ), .Z(n21676)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2601_2_lut_rep_330.init = 16'h8888;
    LUT4 i1_4_lut_adj_68 (.A(n19914), .B(clk_c_enable_15), .C(state[2]), 
         .D(n2615), .Z(clk_c_enable_89)) /* synthesis lut_function=(A (B)+!A (B (C+!(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i1_4_lut_adj_68.init = 16'hc8cc;
    LUT4 i2602_3_lut_rep_265_4_lut (.A(\cnt_main[0] ), .B(\cnt_main[1] ), 
         .C(\cnt_main[2] ), .D(dat_valid_N_624), .Z(n21611)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A (C (D))) */ ;
    defparam i2602_3_lut_rep_265_4_lut.init = 16'hf800;
    LUT4 i4_4_lut_adj_69 (.A(\cnt_main[0] ), .B(n21529), .C(n21528), .D(n2619), 
         .Z(n10)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i4_4_lut_adj_69.init = 16'hfffe;
    LUT4 i2698_3_lut_4_lut (.A(\cnt_main[0] ), .B(\cnt_main[1] ), .C(\cnt_main[2] ), 
         .D(dat_valid_N_624), .Z(n8[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;
    defparam i2698_3_lut_4_lut.init = 16'h7f80;
    LUT4 n21219_bdd_3_lut_4_lut (.A(ack_flag), .B(state_back[1]), .C(n2619), 
         .D(n21219), .Z(n21220)) /* synthesis lut_function=(!(A (C+!(D))+!A !(B (C+(D))+!B !(C+!(D))))) */ ;
    defparam n21219_bdd_3_lut_4_lut.init = 16'h4f40;
    LUT4 i18490_2_lut (.A(state[2]), .B(state[0]), .Z(n20497)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i18490_2_lut.init = 16'h6666;
    LUT4 i1_4_lut_adj_70 (.A(cnt_start[0]), .B(state[2]), .C(cnt_start[2]), 
         .D(cnt_start[1]), .Z(n4_adj_2327)) /* synthesis lut_function=(A ((C)+!B)+!A ((C (D))+!B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(78[4] 215[11])
    defparam i1_4_lut_adj_70.init = 16'hf3b3;
    LUT4 i2769_1_lut (.A(cnt_start[0]), .Z(n232[0])) /* synthesis lut_function=(!(A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(140[25:41])
    defparam i2769_1_lut.init = 16'h5555;
    FD1P3IX cnt_delay_i0_i14 (.D(n483[14]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[14])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i14.GSR = "ENABLED";
    LUT4 i18520_4_lut (.A(state[3]), .B(n18549), .C(n18656), .D(n37), 
         .Z(clk_400khz_enable_2)) /* synthesis lut_function=(!(A+(B+!((D)+!C)))) */ ;
    defparam i18520_4_lut.init = 16'h1101;
    PFUMX i19011 (.BLUT(n21701), .ALUT(n21702), .C0(cnt_write[0]), .Z(n3999));
    LUT4 i1_2_lut_adj_71 (.A(cnt[0]), .B(n11822), .Z(n7_c)) /* synthesis lut_function=(!(A+!(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i1_2_lut_adj_71.init = 16'h4444;
    LUT4 i2_4_lut_adj_72 (.A(state[1]), .B(n21655), .C(state[0]), .D(state[2]), 
         .Z(n18656)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;
    defparam i2_4_lut_adj_72.init = 16'hfefa;
    LUT4 i1_4_lut_adj_73 (.A(state[2]), .B(state[0]), .C(n32_adj_2328), 
         .D(n4_adj_3), .Z(n37)) /* synthesis lut_function=(A (B (C+(D))+!B (C))) */ ;
    defparam i1_4_lut_adj_73.init = 16'ha8a0;
    LUT4 cnt_main_0__bdd_4_lut_19335 (.A(\cnt_main[0] ), .B(dat_valid_N_624), 
         .C(\cnt_main[1] ), .D(\cnt_main[2] ), .Z(n21479)) /* synthesis lut_function=(!(A (B (C+(D)))+!A (B+(D)))) */ ;
    defparam cnt_main_0__bdd_4_lut_19335.init = 16'h223b;
    LUT4 i1_4_lut_adj_74 (.A(state[1]), .B(state[0]), .C(cnt_read[3]), 
         .D(n22), .Z(n32_adj_2328)) /* synthesis lut_function=(A (B+!(C+!(D)))) */ ;
    defparam i1_4_lut_adj_74.init = 16'h8a88;
    LUT4 i1_3_lut_adj_75 (.A(cnt_read[0]), .B(cnt_read[2]), .C(cnt_read[1]), 
         .Z(n22)) /* synthesis lut_function=(A+(B (C)+!B !(C))) */ ;
    defparam i1_3_lut_adj_75.init = 16'hebeb;
    LUT4 i12278_2_lut (.A(n21214), .B(state[2]), .Z(n7_adj_2325)) /* synthesis lut_function=(A+!(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(78[4] 215[11])
    defparam i12278_2_lut.init = 16'hbbbb;
    LUT4 i1_3_lut_adj_76 (.A(state[2]), .B(n14018), .C(n21297), .Z(n11822)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(68[13:18])
    defparam i1_3_lut_adj_76.init = 16'h2020;
    LUT4 i18645_4_lut (.A(state[0]), .B(n21651), .C(n9389), .D(state[2]), 
         .Z(clk_400khz_enable_3)) /* synthesis lut_function=(!(A (B+(C+!(D)))+!A (B+(C (D))))) */ ;
    defparam i18645_4_lut.init = 16'h0311;
    LUT4 i3597_4_lut (.A(cnt_read[3]), .B(n4442), .C(n6_adj_2316), .D(n14018), 
         .Z(n4001)) /* synthesis lut_function=(A+(B (C+(D))+!B !((D)+!C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(177[16] 180[10])
    defparam i3597_4_lut.init = 16'heefa;
    FD1P3IX cnt_delay_i0_i13 (.D(n483[13]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[13])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i13.GSR = "ENABLED";
    CCU2D add_159_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(cnt_delay[0]), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .COUT(n18207), .S1(n483[0]));   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(212[29:45])
    defparam add_159_1.INIT0 = 16'hF000;
    defparam add_159_1.INIT1 = 16'h5555;
    defparam add_159_1.INJECT1_0 = "NO";
    defparam add_159_1.INJECT1_1 = "NO";
    FD1P3IX cnt_delay_i0_i12 (.D(n483[12]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[12])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i12.GSR = "ENABLED";
    LUT4 i1_2_lut_rep_186_3_lut_4_lut (.A(state[3]), .B(n21576), .C(n20497), 
         .D(state[1]), .Z(clk_c_enable_83)) /* synthesis lut_function=(!(A+(B+(C+(D))))) */ ;
    defparam i1_2_lut_rep_186_3_lut_4_lut.init = 16'h0001;
    LUT4 i2_3_lut_4_lut_adj_77 (.A(n21576), .B(n21659), .C(state[0]), 
         .D(state[1]), .Z(clk_c_enable_98)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;
    defparam i2_3_lut_4_lut_adj_77.init = 16'h1001;
    LUT4 i2_3_lut_adj_78 (.A(cnt_mode2[1]), .B(n78), .C(state[1]), .Z(n18539)) /* synthesis lut_function=(A (B (C))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_adj_78.init = 16'h8080;
    LUT4 i18511_4_lut (.A(n19851), .B(n36), .C(ack_flag), .D(n2619), 
         .Z(clk_c_enable_111)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B (C (D))))) */ ;
    defparam i18511_4_lut.init = 16'h0511;
    LUT4 cnt_mode2_3__bdd_3_lut (.A(\cnt_mode2[3] ), .B(cnt_mode2[1]), .C(cnt_mode2[2]), 
         .Z(n21068)) /* synthesis lut_function=(!(A (B+(C))+!A !(B (C)))) */ ;
    defparam cnt_mode2_3__bdd_3_lut.init = 16'h4242;
    LUT4 i1_3_lut_adj_79 (.A(n24_adj_2330), .B(n27_c), .C(n19969), .Z(n36)) /* synthesis lut_function=(A (B+(C))+!A (B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_3_lut_adj_79.init = 16'hecec;
    LUT4 i56_3_lut (.A(\cnt_mode2[3] ), .B(cnt_mode2[2]), .C(cnt_mode2[1]), 
         .Z(n24_adj_2330)) /* synthesis lut_function=(!(A (B+(C))+!A !(B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i56_3_lut.init = 16'h4242;
    LUT4 i2771_2_lut (.A(cnt_start[1]), .B(cnt_start[0]), .Z(n232[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(140[25:41])
    defparam i2771_2_lut.init = 16'h6666;
    LUT4 i18703_2_lut_2_lut_3_lut_4_lut (.A(state[3]), .B(n21576), .C(n2619), 
         .D(n30), .Z(n20424)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;
    defparam i18703_2_lut_2_lut_3_lut_4_lut.init = 16'hfeff;
    LUT4 i18699_2_lut_3_lut (.A(n3999), .B(state[2]), .C(cnt_write[0]), 
         .Z(n14526)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(78[4] 215[11])
    defparam i18699_2_lut_3_lut.init = 16'h0404;
    FD1P3IX cnt_delay_i0_i11 (.D(n483[11]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[11])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i11.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i1 (.D(n45[1]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[1])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i1.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i2 (.D(n45[2]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[2])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i2.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i3 (.D(n45[3]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[3])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i3.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i4 (.D(n45[4]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[4])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i4.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i5 (.D(n45[5]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[5])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i5.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i6 (.D(n45[6]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[6])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i6.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i7 (.D(n45[7]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[7])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i7.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i8 (.D(n45[8]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[8])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i8.GSR = "ENABLED";
    FD1S3IX cnt_400khz_2093__i9 (.D(n45[9]), .CK(clk_c), .CD(n10901), 
            .Q(cnt_400khz[9])) /* synthesis syn_use_carry_chain=1 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(55[18:35])
    defparam cnt_400khz_2093__i9.GSR = "ENABLED";
    LUT4 i2_3_lut_rep_209 (.A(state[1]), .B(n4001), .C(state[0]), .Z(n21555)) /* synthesis lut_function=((B+(C))+!A) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam i2_3_lut_rep_209.init = 16'hfdfd;
    FD1P3IX cnt_delay_i0_i10 (.D(n483[10]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[10])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i10.GSR = "ENABLED";
    FD1P3IX cnt_delay_i0_i9 (.D(n483[9]), .SP(clk_c_enable_121), .CD(n10930), 
            .CK(clk_c), .Q(cnt_delay[9])) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam cnt_delay_i0_i9.GSR = "ENABLED";
    LUT4 i18687_4_lut (.A(n5), .B(ack_flag), .C(n24), .D(n2619), .Z(n20698)) /* synthesis lut_function=(!(A+(B (C+(D))+!B (C)))) */ ;
    defparam i18687_4_lut.init = 16'h0105;
    LUT4 i1_2_lut_adj_80 (.A(dat_valid_N_624), .B(\cnt_main[2] ), .Z(n72)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(25[17:26])
    defparam i1_2_lut_adj_80.init = 16'heeee;
    LUT4 i1_4_lut_adj_81 (.A(state[0]), .B(n21551), .C(n30), .D(n67), 
         .Z(n19972)) /* synthesis lut_function=(A (B+!(C+(D)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(60[8] 61[30])
    defparam i1_4_lut_adj_81.init = 16'h888a;
    LUT4 i2_3_lut_rep_198_4_lut (.A(state[3]), .B(n21576), .C(n18670), 
         .D(n6_adj_2), .Z(n21544)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;
    defparam i2_3_lut_rep_198_4_lut.init = 16'h0100;
    LUT4 i1_4_lut_adj_82 (.A(\cnt_mode1[3] ), .B(cnt_mode1[0]), .C(\cnt_mode1[2] ), 
         .D(cnt_mode1_c[1]), .Z(n16)) /* synthesis lut_function=(!(A+(B (C (D))+!B (C)))) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[27:36])
    defparam i1_4_lut_adj_82.init = 16'h0545;
    LUT4 i1_2_lut_adj_83 (.A(state[0]), .B(state[1]), .Z(n6_adj_2)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut_adj_83.init = 16'h4444;
    FD1P3AX dat_valid_276_rep_352 (.D(dat_valid_N_624), .SP(clk_400khz_enable_5), 
            .CK(clk_400khz), .Q(clk_c_enable_20)) /* synthesis LSE_LINE_FILE_ID=13, LSE_LCOL=18, LSE_RCOL=2, LSE_LLINE=72, LSE_RLINE=83 */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(77[12] 216[6])
    defparam dat_valid_276_rep_352.GSR = "DISABLED";
    PFUMX i19025 (.BLUT(n21722), .ALUT(n21723), .C0(\cnt_main[2] ), .Z(n21724));
    LUT4 i1_2_lut_adj_84 (.A(cnt_mode2[2]), .B(cnt_mode2[1]), .Z(n7041)) /* synthesis lut_function=(A+(B)) */ ;   // e:/code/fpga/ballplayer/ballplayer_impl/source/rpr0521rs_driver.v(65[38:47])
    defparam i1_2_lut_adj_84.init = 16'heeee;
    PFUMX i19017 (.BLUT(n21710), .ALUT(n21711), .C0(state[2]), .Z(n10921));
    
endmodule
