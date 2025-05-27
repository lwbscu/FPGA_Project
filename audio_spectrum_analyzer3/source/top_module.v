// --------------------------------------------------------------------
// Module: top_module
// Author: Assistant
// Description: 智能音频频谱分析仪顶层模块
// --------------------------------------------------------------------
module top_module(
    // 时钟和复位
    input           clk,            // 12MHz系统时钟 PIN_J5
    input           rst_n,          // 系统复位 PIN_J14
    
    // ADC接口 - 音频输入
    output          adc_cs,         // PIN_B7
    output          adc_clk,        // PIN_B8
    input           adc_dat,        // PIN_C8
    
    // DAC接口 - 音频输出
    output          dac_sync,       // PIN_D10
    output          dac_clk,        // PIN_A9
    output          dac_dat,        // PIN_A11
    
    // LED显示 - 频谱显示
    output  [7:0]   led,            // LED0-7: PIN_K11,L11,K12,L12,M12,L15,M14,N14
    
    // 数码管显示 - 分贝值和模式显示
    output          seg_rck,        // PIN_A14
    output          seg_sck,        // PIN_B13
    output          seg_din,        // PIN_B15
    
    // LCD接口 - 详细频谱显示
    output          lcd_rst,        // PIN_P15
    output          lcd_blk,        // PIN_D7
    output          lcd_dc,         // PIN_R14
    output          lcd_sclk,       // PIN_R11
    output          lcd_mosi,       // PIN_P12
    output          lcd_cs,         // PIN_R9
    
    // HDMI接口 - 高分辨率显示
    output  [2:0]   TMDSp,          // PIN_K15,J11,J14
    output  [2:0]   TMDSn,          // PIN_K14,J11,J14
    output          TMDSp_clock,    // PIN_B11
    output          TMDSn_clock,    // PIN_A13
    
    // 矩阵键盘 - 模式选择
    input   [3:0]   col,            // PIN_P6,R5,L7,P4
    output  [3:0]   row,            // PIN_R7,P7,P8,P9
    
    // 旋转编码器 - 参数调节
    input           key_a,          // PIN_M5
    input           key_b,          // PIN_R3
    input           key_o,          // PIN_L6
    
    // EEPROM接口 - 数据存储
    output          i2c_scl,        // PIN_M4
    inout           i2c_sda,        // PIN_P3
    
    // 蜂鸣器 - 音乐播放
    output          beeper          // PIN_B14
);

// 内部信号定义
wire            clk_50mhz;          // PLL生成的50MHz时钟
wire            clk_24mhz;          // PLL生成的24MHz时钟
wire    [7:0]   adc_data;           // ADC采样数据
wire            adc_done;           // ADC采样完成信号
wire    [7:0]   audio_data;         // 音频数据(来自ADC或模拟器)
wire            audio_valid;        // 音频数据有效信号
wire    [511:0] fft_real;          // FFT实部结果
wire    [511:0] fft_imag;          // FFT虚部结果
wire            fft_done;           // FFT计算完成
wire    [63:0]  spectrum_data_flat; // 平坦化的频谱数据
wire    [15:0]  db_value;
wire    [3:0]   current_mode;
wire    [15:0]  key_out;           // 键盘输出
wire    [15:0]  key_pulse;         // 键盘脉冲
wire            mode_change;        // 模式切换信号
wire    [7:0]   light_pattern;     // 灯光模式
wire    [31:0]  seg_data;          // 数码管显示数据
wire    [7:0]   seg_en;            // 数码管使能

// PLL时钟生成
pll pll_inst(
    .inclk0(clk),
    .c0(clk_12mhz)
    
);

// ADC音频采集
adc081s101_driver adc_inst(
    .clk(clk_24mhz),
    .rst_n(rst_n),
    .adc_cs(adc_cs),
    .adc_clk(adc_clk),
    .adc_dat(adc_dat),
    .adc_done(adc_done),
    .adc_data(adc_data)
);

// 音频数据选择（实际ADC或模拟器）
wire use_simulator = 1'b1; // 暂时使用模拟器，后期改为0使用实际ADC
wire [7:0] simulated_audio;
wire sim_audio_valid;

audio_simulator sim_inst(
    .clk(clk),
    .rst_n(rst_n),
    .mode(current_mode[1:0]),
    .audio_data(simulated_audio),
    .audio_valid(sim_audio_valid)
);

assign audio_data = use_simulator ? simulated_audio : adc_data;
assign audio_valid = use_simulator ? sim_audio_valid : adc_done;

// FFT处理模块
fft_512 fft_inst(
    .clk(clk_50mhz),
    .rst_n(rst_n),
    .audio_in(audio_data),
    .audio_valid(audio_valid),
    .fft_real(fft_real),
    .fft_imag(fft_imag),
    .fft_done(fft_done)
);

// 频谱显示控制（修改）
spectrum_display spectrum_inst(
    .clk(clk),
    .rst_n(rst_n),
    .fft_real(fft_real),
    .fft_imag(fft_imag),
    .fft_done(fft_done),
    .spectrum_data_flat(spectrum_data_flat),  // 使用平坦化接口
    .led_out(led)
);

// 分贝计算
db_calculator db_inst(
    .clk(clk),
    .rst_n(rst_n),
    .audio_data(audio_data),
    .audio_valid(audio_valid),
    .db_value(db_value)
);

// 矩阵键盘
array_keyboard keyboard_inst(
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .key_out(key_out),
    .key_pulse(key_pulse)
);

// 模式控制器
mode_controller mode_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_pulse(key_pulse),
    .encoder_a(key_a),
    .encoder_b(key_b),
    .encoder_o(key_o),
    .current_mode(current_mode),
    .mode_change(mode_change)
);

// 灯光效果控制（修改）
light_effects light_inst(
    .clk(clk),
    .rst_n(rst_n),
    .spectrum_data_flat(spectrum_data_flat),  // 使用平坦化接口
    .current_mode(current_mode),
    .light_pattern(light_pattern)
);

// LCD显示控制也需要修改
lcd_spectrum_display lcd_display_inst(
    .clk(clk),
    .rst_n(rst_n),
    .spectrum_data_flat(spectrum_data_flat),  // 使用平坦化接口
    .db_value(db_value),
    .current_mode(current_mode),
    .lcd_rst(lcd_rst),
    .lcd_blk(lcd_blk),
    .lcd_dc(lcd_dc),
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs)
);

// 数据记录
data_recorder recorder_inst(
    .clk(clk),
    .rst_n(rst_n),
    .db_value(db_value),
    .record_enable(current_mode[2]),
    .i2c_scl(i2c_scl),
    .i2c_sda(i2c_sda)
);

// 数码管显示控制
wire [19:0] db_bcd;
bin_to_bcd bcd_inst(
    .rst_n(rst_n),
    .bin_code(db_value),
    .bcd_code(db_bcd)
);

// 准备数码管显示数据
assign seg_data = {
    4'hA,           // 显示"A"表示音频模式
    current_mode,   // 显示当前模式号
    4'h0,           // 空格
    db_bcd[15:12],  // 分贝值百位
    db_bcd[11:8],   // 分贝值十位
    db_bcd[7:4],    // 分贝值个位
    4'hd,           // 显示"d"
    4'hb            // 显示"b"
};

assign seg_en = 8'b11111111; // 全部显示

segment_scan seg_inst(
    .clk(clk),
    .rst_n(rst_n),
    .dat_1(seg_data[31:28]),
    .dat_2(seg_data[27:24]),
    .dat_3(seg_data[23:20]),
    .dat_4(seg_data[19:16]),
    .dat_5(seg_data[15:12]),
    .dat_6(seg_data[11:8]),
    .dat_7(seg_data[7:4]),
    .dat_8(seg_data[3:0]),
    .dat_en(seg_en),
    .dot_en(8'b00100000), // 在分贝值前显示小数点
    .seg_rck(seg_rck),
    .seg_sck(seg_sck),
    .seg_din(seg_din)
);

// 蜂鸣器音乐播放（根据模式选择）
wire beeper_music;
beeper beeper_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_out(key_out),
    .beeper(beeper_music)
);

assign beeper = (current_mode == 4'h5) ? beeper_music : 1'b1; // 模式5为音乐播放模式



endmodule