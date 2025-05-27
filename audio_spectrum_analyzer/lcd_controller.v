module lcd_controller(
    input           clk,        // 12MHz时钟
    input           rst_n,
    input [95:0]    spectrum_data_packed,
    input [2:0]     mode,
    output reg      lcd_sel,
    output reg      lcd_rst,
    output reg      lcd_dc,
    output reg      lcd_sda,
    output reg      lcd_sck
);

// 解包频谱数据
wire [11:0] spectrum [0:7];
assign spectrum[0] = spectrum_data_packed[11:0];
assign spectrum[1] = spectrum_data_packed[23:12];
assign spectrum[2] = spectrum_data_packed[35:24];
assign spectrum[3] = spectrum_data_packed[47:36];
assign spectrum[4] = spectrum_data_packed[59:48];
assign spectrum[5] = spectrum_data_packed[71:60];
assign spectrum[6] = spectrum_data_packed[83:72];
assign spectrum[7] = spectrum_data_packed[95:84];

// LCD参数
parameter LCD_WIDTH = 240;
parameter LCD_HEIGHT = 320;

// 状态机
reg [2:0] state;
reg [19:0] pixel_cnt;
reg [8:0] init_cnt;
reg [4:0] bit_cnt;
reg [15:0] color_data;

// 计算变量
reg [7:0] bar_height;
reg [7:0] x_pos;
reg [2:0] bar_idx;
reg [11:0] y_pos;

// 初始化命令
reg [8:0] init_cmd;
reg cmd_flag;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 3'd0;
        lcd_sel <= 1'b1;
        lcd_rst <= 1'b0;
        lcd_dc <= 1'b0;
        lcd_sda <= 1'b0;
        lcd_sck <= 1'b0;
        pixel_cnt <= 20'd0;
        init_cnt <= 9'd0;
        bit_cnt <= 5'd0;
        color_data <= 16'd0;
        bar_height <= 8'd0;
        x_pos <= 8'd0;
        bar_idx <= 3'd0;
        y_pos <= 12'd0;
    end else begin
        lcd_sel <= 1'b0;  // 始终选中
        
        case (state)
            3'd0: begin  // 复位
                if (init_cnt < 9'd100) begin
                    lcd_rst <= 1'b0;
                    init_cnt <= init_cnt + 1'b1;
                end else if (init_cnt < 9'd200) begin
                    lcd_rst <= 1'b1;
                    init_cnt <= init_cnt + 1'b1;
                end else begin
                    state <= 3'd1;
                    init_cnt <= 9'd0;
                end
            end
            
            3'd1: begin  // 初始化
                // 发送初始化命令
                lcd_dc <= 1'b0;  // 命令模式
                
                case (init_cnt)
                    9'd0: begin
                        // Sleep out命令
                        init_cmd <= 9'h011;
                        state <= 3'd3;  // 发送命令
                    end
                    9'd1: begin
                        // 等待120ms
                        if (init_cnt < 9'd200) begin
                            init_cnt <= init_cnt + 1'b1;
                        end else begin
                            init_cnt <= init_cnt + 1'b1;
                        end
                    end
                    9'd202: begin
                        // Display on命令
                        init_cmd <= 9'h029;
                        state <= 3'd3;  // 发送命令
                    end
                    9'd203: begin
                        state <= 3'd2;
                        pixel_cnt <= 20'd0;
                    end
                    default: init_cnt <= init_cnt + 1'b1;
                endcase
            end
            
            3'd2: begin  // 绘制频谱
                lcd_dc <= 1'b1;  // 数据模式
                
                if (pixel_cnt < LCD_WIDTH * 200) begin
                    // 计算当前像素位置
                    x_pos = pixel_cnt % LCD_WIDTH;
                    y_pos = pixel_cnt / LCD_WIDTH;
                    
                    // 根据x位置确定对应的频谱条
                    bar_idx = x_pos >> 5;  // 将240像素分成8个区域(240/8=30)
                    
                    // 计算条形高度(将12位数据映射到200像素高度)
                    bar_height = spectrum[bar_idx][11:4];
                    
                    // 根据y位置和条形高度决定颜色
                    if ((200 - y_pos) < bar_height) begin
                        // 频谱条内部 - 使用渐变色
                        if ((200 - y_pos) > 150) 
                            color_data <= 16'hF800;  // 红色（高频部分）
                        else if ((200 - y_pos) > 100)
                            color_data <= 16'hFFE0;  // 黄色（中频部分）
                        else
                            color_data <= 16'h07E0;  // 绿色（低频部分）
                    end else begin
                        color_data <= 16'h0000;  // 黑色背景
                    end
                    
                    // SPI发送颜色数据
                    if (bit_cnt < 5'd16) begin
                        lcd_sck <= ~lcd_sck;
                        if (!lcd_sck) begin
                            lcd_sda <= color_data[15-bit_cnt];
                            bit_cnt <= bit_cnt + 1'b1;
                        end
                    end else begin
                        bit_cnt <= 5'd0;
                        pixel_cnt <= pixel_cnt + 1'b1;
                    end
                end else begin
                    pixel_cnt <= 20'd0;
                    state <= 3'd2;  // 循环绘制
                end
            end
            
            3'd3: begin  // 发送命令
                if (bit_cnt < 5'd8) begin
                    lcd_sck <= ~lcd_sck;
                    if (!lcd_sck) begin
                        lcd_sda <= init_cmd[7-bit_cnt];
                        bit_cnt <= bit_cnt + 1'b1;
                    end
                end else begin
                    bit_cnt <= 5'd0;
                    state <= 3'd1;
                end
            end
            
            default: state <= 3'd0;
        endcase
    end
end

endmodule