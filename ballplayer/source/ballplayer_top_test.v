// ============================================================================
// Module: ballplayer_top_test
// Description: 临时测试顶层模块 - 用于验证LCD对比度显示
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module ballplayer_top_test (
    // 时钟和复位
    input wire         clk,            // 12MHz时钟输入
    input wire         rst_n,          // 复位信号

    // LCD接口
    output wire        lcd_rst,        // LCD复位
    output wire        lcd_blk,        // LCD背光控制
    output wire        lcd_dc,         // LCD数据/命令选择
    output wire        lcd_sclk,       // LCD SPI时钟
    output wire        lcd_mosi,       // LCD SPI数据
    output wire        lcd_cs,         // LCD片选

    // LED指示
    output wire [7:0]  led,            // LED状态指示

    // 按键输入
    input wire         key_up,         // 向上按键
    input wire         key_down,       // 向下按键
    input wire         ball_release_button, // 球释放按键

    // 其他接口（保持兼容性，但不使用）
    output wire        beeper,         // 蜂鸣器
    output wire [1:0]  seg_led_1,      // 数码管1
    output wire [1:0]  seg_led_2,      // 数码管2
    output wire        adc_cs,         // ADC接口
    output wire        adc_clk,
    input wire         adc_dat,
    inout wire         i2c_sda,        // I2C接口
    output wire        i2c_scl
);

// 内部信号
wire clk_50mhz;
wire switch_to_game;

// PLL时钟生成
ballplayer_pll pll_inst(
    .inclk0(clk),
    .c0(),              // 24MHz（不使用）
    .c1(clk_50mhz)     // 50MHz用于LCD
);

// 切换信号生成（按键1持续按下3秒后切换到游戏模式）
reg [24:0] key_counter;
reg key_pressed_prev;
wire key_pressed = ~key_up;  // 假设按键是低电平有效

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        key_counter <= 25'd0;
        key_pressed_prev <= 1'b0;
    end
    else begin
        key_pressed_prev <= key_pressed;
          if (key_pressed && !key_pressed_prev) begin
            // 按键按下，开始计数
            key_counter <= 25'd1;
        end
        else if (key_pressed && key_counter > 25'd0 && key_counter < 25'd36000000) begin
            // 继续计数（3秒 @ 12MHz = 36,000,000）
            key_counter <= key_counter + 25'd1;
        end
        else if (!key_pressed) begin
            // 按键释放，重置计数
            key_counter <= 25'd0;
        end
    end
end

assign switch_to_game = (key_counter >= 25'd36000000);

// LCD模块选择：显示简单颜文字表情
generate
    if (1) begin : lcd_emoji_mode  
        lcd_emoji_display lcd_emoji_inst(
            .clk_50MHz(clk_50mhz),
            .rst_n(rst_n),
            .lcd_rst(lcd_rst),
            .lcd_blk(lcd_blk),
            .lcd_dc(lcd_dc),
            .lcd_sclk(lcd_sclk),
            .lcd_mosi(lcd_mosi),
            .lcd_cs(lcd_cs),
            .pattern_id_inv(pattern_id_inv)
        );
        
        // LED指示（适配低电平点亮）
        assign led[0] = ~rst_n;                   // 系统状态（反向）
        assign led[1] = 1'b0;                     // 颜文字模式指示（点亮）
        assign led[2] = pattern_id_inv[0];        // 图案ID位0（反向）
        assign led[3] = pattern_id_inv[1];        // 图案ID位1（反向）
        assign led[4] = pattern_id_inv[2];        // 图案ID位2（反向）
        assign led[5] = ~key_pressed;             // 按键状态（反向）
        assign led[6] = ~switch_to_game;          // 切换指示（反向）
        assign led[7] = 1'b1;                     // 保留（熄灭）
    end
endgenerate

// 图案ID信号（反向逻辑）
wire [2:0] pattern_id_inv;

// 未使用的输出赋值
assign beeper = 1'b0;
assign seg_led_1 = 2'b00;
assign seg_led_2 = 2'b00;
assign adc_cs = 1'b1;
assign adc_clk = 1'b0;
assign i2c_scl = 1'b1;

// I2C SDA为高阻态
assign i2c_sda = 1'bz;

endmodule
