// ============================================================================
// Module: ballplayer_top
// Description: ballplayer项目顶层模块 - 移植到MAX10 FPGA开发板
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module ballplayer_top(
    // 系统时钟和复位
    input           clk,            // 12MHz系统时钟 PIN_J5
    input           rst_n,          // 低电平复位信号 PIN_J14
    
    // ADC接口 - 用于手势位置检测
    output          adc_cs,         // ADC片选 PIN_B7
    output          adc_clk,        // ADC时钟 PIN_B8
    input           adc_dat,        // ADC数据 PIN_C8
    
    // 按键输入
    input           key_up,         // 向上调节按键 PIN_J9
    input           key_down,       // 向下调节按键 PIN_K14
    input           ball_release_button, // 球释放按键 PIN_J11
    
    // I2C接口 - 手势传感器RPR0521RS
    output          i2c_scl,        // I2C时钟线 PIN_M4
    inout           i2c_sda,        // I2C数据线 PIN_P3
    
    // LCD显示接口 - SPI协议
    output          lcd_rst,        // LCD复位 PIN_P15
    output          lcd_blk,        // LCD背光控制 PIN_D7
    output          lcd_dc,         // 数据/命令选择 PIN_R14
    output          lcd_sclk,       // SPI时钟 PIN_R11
    output          lcd_mosi,       // SPI数据输出 PIN_P12
    output          lcd_cs,         // LCD片选 PIN_R9
    
    // 双七段数码管显示
    output  [8:0]   seg_led_1,      // 第一个数码管 PIN_E1,D2,K2,J2,G2,F5,G5,L1,E2
    output  [8:0]   seg_led_2,      // 第二个数码管 PIN_A3,A2,P2,P1,N1,C1,C2,R2,B1
    
    // LED指示灯
    output          led             // 状态指示LED PIN_N15
);

// 内部信号定义
wire            clk_24mhz;          // PLL生成的24MHz时钟
wire            clk_50mhz;          // PLL生成的50MHz时钟
wire    [7:0]   adc_data;           // ADC采样数据
wire            adc_done;           // ADC采样完成信号
wire    [8:0]   handline;           // 手的位置坐标
wire    [7:0]   hand_velocity;      // 手的速度
wire    [1:0]   k;                  // 弹性系数
wire    [8:0]   pic_y;              // 球的Y坐标
wire    [8:0]   home_pos;           // 球的初始位置
wire    [17:0]  temp_calc;          // 临时计算变量
wire    [1:0]   beep_flag;          // 蜂鸣器标志
wire            stop_flag;          // 停止标志
wire            over_flag;          // 游戏结束标志

// 传感器信号
wire            dat_valid;          // 传感器数据有效
wire    [15:0]  ch1_dat;            // 环境光数据 (ambient_light_data)
wire    [15:0]  prox_dat;           // 接近传感器数据 (proximity_data)

// PLL时钟生成 - 为LCD和ADC提供时钟
ballplayer_pll pll_inst(
    .inclk0(clk),           // 12MHz输入时钟
    .c0(clk_24mhz),        // 24MHz输出时钟
    .c1(clk_50mhz)         // 50MHz输出时钟（LCD使用）
);

// ADC驱动模块 - 用于手势位置检测
adc081s101_driver adc_driver_inst(
    .clk(clk_24mhz),
    .rst_n(rst_n),
    .adc_cs(adc_cs),
    .adc_clk(adc_clk),
    .adc_dat(adc_dat),
    .adc_done(adc_done),
    .adc_data(adc_data)
);

// RPR0521RS手势传感器驱动
rpr0521rs_driver sensor_inst(
    .clk(clk),
    .rst_n(rst_n),
    .enable(1'b1),
    .sda(i2c_sda),
    .scl(i2c_scl),
    .proximity_data(prox_dat),
    .ambient_light_data(ch1_dat),
    .data_ready(dat_valid),
    .error_flag()  // 未连接
);

// 手势控制模块
hand_control hand_ctrl_inst(
    .dat_valid(dat_valid),
    .prox_dat(prox_dat),
    .handline(handline),
    .hand_velocity(hand_velocity)
);

// 参数调节模块
adjuster adj_inst(
    .clk(clk),
    .rst_n(rst_n),
    .key_up(key_up),
    .key_down(key_down),
    .k(k),
    .seg_led_1(seg_led_1),
    .seg_led_2(seg_led_2)
);

// 球运动控制模块
jumping jump_inst(
    .clk(clk),
    .rst_n(rst_n),
    .pic_y(pic_y),
    .handline(handline),
    .hand_velocity(hand_velocity),
    .k(k),
    .ball_release_button(ball_release_button),
    .home(home_pos),
    .beep_flag(beep_flag),
    .stop_flag(stop_flag),
    .over_flag(over_flag)
);

// LCD显示控制模块 - 使用正确的TFT LCD架构
lcd lcd_inst(
    .clk_50mhz(clk_50mhz),    // 使用50MHz时钟
    .rst_n(rst_n),
    .y(pic_y),          // 球的Y坐标
    .x(handline),       // 手的X坐标
    .lcd_rst(lcd_rst),
    .lcd_blk(lcd_blk),
    .lcd_dc(lcd_dc),
    .lcd_sclk(lcd_sclk),
    .lcd_mosi(lcd_mosi),
    .lcd_cs(lcd_cs),
    .led1(),            // 未连接
    .led2()             // 未连接
);

// 球的初始位置计算 - 基于ADC输入
wire [17:0] adc_extended;
assign adc_extended = {10'b0, adc_data};
assign temp_calc = 310 * adc_extended;
assign home_pos = temp_calc[16:8] + 9'd7;

// LED状态指示
reg led_reg;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led_reg <= 1'b0;
    end else if (dat_valid) begin
        if (handline > 16'd10) begin
            led_reg <= 1'b1; 
        end else begin
            led_reg <= 1'b0;
        end
    end
end

assign led = led_reg;

endmodule
