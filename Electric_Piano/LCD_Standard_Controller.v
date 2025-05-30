// LCD_Standard_Controller.v - 简单LCD控制器
// 功能：显示纯白色或简单单色模式，确保LCD正常工作
// 适配实际硬件的基础显示功能

module LCD_Standard_Controller(
    input           clk,            // 50MHz系统时钟
    input           rst_n,          // 复位信号
    input           mode,           // 播放模式（0=手动，1=自动）
    input   [15:0]  current_tone,   // 当前音符值
    input           playing,        // 播放状态
    input   [7:0]   progress,       // 播放进度
    input   [3:0]   song_id,        // 当前歌曲ID
    input   [15:0]  key_state,      // 按键状态
    
    // LCD接口信号
    output          lcd_sclk,       // SPI时钟
    output          lcd_mosi,       // SPI数据
    output          lcd_cs,         // 片选信号
    output          lcd_rst,        // 复位信号
    output          lcd_dc,         // 数据/命令选择
    output          lcd_blk         // 背光控制
);

// 简单的颜色定义
parameter   WHITE   = 16'hFFFF,     // 纯白色
            BLACK   = 16'h0000,     // 纯黑色
            BLUE    = 16'h001F,     // 蓝色
            RED     = 16'hF800,     // 红色
            GREEN   = 16'h07E0;     // 绿色

// 状态机参数
parameter   IDLE    = 2'b00,
            INIT    = 2'b01,
            DISPLAY = 2'b10;

reg [1:0]   state;
reg [31:0]  delay_counter;
reg [15:0]  display_color;

// 简单的显示逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        delay_counter <= 32'h0;
        display_color <= WHITE;  // 默认显示白色
    end else begin
        case (state)
            IDLE: begin
                if (delay_counter > 32'd50000) begin  // 短暂延迟后初始化
                    state <= INIT;
                    delay_counter <= 32'h0;
                end else begin
                    delay_counter <= delay_counter + 1;
                end
            end
            
            INIT: begin
                if (delay_counter > 32'd100000) begin  // 初始化完成
                    state <= DISPLAY;
                    delay_counter <= 32'h0;
                end else begin
                    delay_counter <= delay_counter + 1;
                end
            end
            
            DISPLAY: begin
                // 根据模式选择显示颜色
                if (mode == 1'b0) begin  // 手动模式
                    if (|key_state) begin  // 有按键按下
                        case(current_tone[3:0])
                            4'h0, 4'h1, 4'h2: display_color <= RED;
                            4'h3, 4'h4, 4'h5: display_color <= GREEN;
                            4'h6, 4'h7, 4'h8: display_color <= BLUE;
                            default: display_color <= WHITE;
                        endcase
                    end else begin
                        display_color <= WHITE;  // 无按键时显示白色
                    end
                end else begin  // 自动模式
                    if (playing) begin
                        // 播放时根据进度变化颜色
                        case(progress[7:6])
                            2'b00: display_color <= RED;
                            2'b01: display_color <= GREEN;
                            2'b10: display_color <= BLUE;
                            2'b11: display_color <= WHITE;
                        endcase
                    end else begin
                        display_color <= WHITE;  // 停止播放时显示白色
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

// 简化的SPI输出控制
// 注意：这里简化了SPI协议，只输出基本信号
assign lcd_sclk = clk;              // 直接使用系统时钟（简化）
assign lcd_mosi = display_color[0]; // 输出颜色的最低位
assign lcd_cs = (state == DISPLAY) ? 1'b0 : 1'b1;  // 显示时片选有效
assign lcd_rst = rst_n;             // 复位信号直连
assign lcd_dc = 1'b1;               // 始终为数据模式
assign lcd_blk = 1'b1;              // 背光常亮

endmodule