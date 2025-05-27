module audio_spectrum_analyzer(
    // 系统时钟和复位
    input           clk,        // 12MHz时钟
    input           rst_n,      // 复位信号，低有效
    
    // ADC接口（暂时不用）
    output          adc_cs,     // ADC片选
    output          adc_clk,    // ADC时钟
    input           adc_dat,    // ADC数据
    
    // 矩阵键盘
    output [3:0]    key_row,    // 键盘行
    input  [3:0]    key_col,    // 键盘列
    
    // 数码管（74HC595）
    output          seg_rck,    // 锁存时钟
    output          seg_sck,    // 移位时钟
    output          seg_din,    // 串行数据
    
    // LCD显示接口
    output          lcd_sel,    // LCD选择信号
    output          lcd_rst,    // LCD复位
    output          lcd_dc,     // 数据/命令选择
    output          lcd_sda,    // SPI数据
    output          lcd_sck,    // SPI时钟
    
    // LED和蜂鸣器
    output [7:0]    led,        // 8个LED显示
    output          beep        // 蜂鸣器输出
);

// 内部信号
wire [15:0] key_out;
wire [15:0] key_pulse;
wire [3:0] key_value;
wire key_valid;

wire [2:0] mode;
wire [7:0] gain;
wire mode_changed;

// 频谱数据（8个频段，每个12位）
wire [95:0] spectrum_data_packed;  // 8 * 12 = 96 bits
wire spectrum_valid;

// 测试信号生成
reg [15:0] test_counter;
reg [7:0] simulated_adc_data;

// PLL产生所需时钟 - 简化版本，不使用真实PLL
wire clk_24mhz = clk;  // 直接使用12MHz
wire clk_50mhz = clk;  // 直接使用12MHz
wire pll_locked = rst_n;  // 简化处理

// 生成测试信号计数器
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        test_counter <= 16'd0;
    end else begin
        test_counter <= test_counter + 1'b1;
    end
end

// 生成模拟音频信号（正弦波叠加）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        simulated_adc_data <= 8'd128;
    end else begin
        // 简单的测试信号：多个频率叠加
        case(mode)
            3'd0: // 正弦波测试
                simulated_adc_data <= 8'd128 + 
                    (test_counter[7:0] < 8'd128 ? 8'd40 : -8'd40) +
                    (test_counter[5:0] < 6'd32 ? 8'd20 : -8'd20);
            3'd1: // 方波测试
                simulated_adc_data <= test_counter[8] ? 8'd200 : 8'd56;
            3'd2: // 锯齿波测试
                simulated_adc_data <= test_counter[7:0];
            3'd3: // 随机噪声
                simulated_adc_data <= {test_counter[7:0] ^ test_counter[15:8]};
            default:
                simulated_adc_data <= 8'd128;
        endcase
    end
end

// 矩阵键盘驱动
matrix_keypad u_keypad(
    .clk(clk),
    .rst_n(rst_n),
    .row(key_row),
    .col(key_col),
    .key_value(key_value),
    .key_valid(key_valid),
    .key_out(key_out),
    .key_pulse(key_pulse)
);

// 模式控制 - 修正输入连接
mode_control u_mode(
    .clk(clk),
    .rst_n(rst_n),
    .key_value(key_value),    // 直接使用4位键值
    .key_valid(key_valid),    // 直接使用有效信号
    .mode(mode),
    .gain(gain),
    .mode_changed(mode_changed)
);

// 简化的FFT模块（使用测试数据）
simple_fft u_fft(
    .clk(clk),  // 使用原始时钟
    .rst_n(rst_n),
    .adc_data(simulated_adc_data),
    .trigger(test_counter[9:0] == 10'd0),  // 每1024个时钟触发一次
    .mode(mode),
    .gain(gain),
    .spectrum_data_packed(spectrum_data_packed),
    .spectrum_valid(spectrum_valid)
);

// 数码管显示
seg7_driver u_seg7(
    .clk(clk),
    .rst_n(rst_n),
    .spectrum_data_packed(spectrum_data_packed),
    .spectrum_valid(spectrum_valid),
    .seg_rck(seg_rck),
    .seg_sck(seg_sck),
    .seg_din(seg_din)
);

// LCD显示控制
lcd_controller u_lcd(
    .clk(clk),  // 使用原始时钟
    .rst_n(rst_n),
    .spectrum_data_packed(spectrum_data_packed),
    .mode(mode),
    .lcd_sel(lcd_sel),
    .lcd_rst(lcd_rst),
    .lcd_dc(lcd_dc),
    .lcd_sda(lcd_sda),
    .lcd_sck(lcd_sck)
);

// LED条形显示
led_bar_display u_led(
    .clk(clk),
    .rst_n(rst_n),
    .spectrum_data_packed(spectrum_data_packed),
    .mode(mode),
    .led(led)
);

// 蜂鸣器控制
beeper_ctrl u_beep(
    .clk(clk),
    .rst_n(rst_n),
    .key_pulse(key_pulse),
    .beep(beep)
);

// ADC接口暂时禁用
assign adc_cs = 1'b1;
assign adc_clk = 1'b0;

endmodule