// Mode_Controller.v - 模式控制器
// 功能：控制电子琴的不同工作模式
// 模式说明：
// 0: 手动演奏模式 - LED1亮，16个按键用于手动演奏
// 1: 自动播放模式 - LED2亮，16个按键各自触发不同的20秒音乐片段

module Mode_Controller(
    input           clk,
    input           rst_n,
    input           key1,           // 独立的模式切换按键（PIN_J9）
    input   [15:0]  key_pulse,      // 键盘脉冲信号
    output reg      current_mode,   // 当前模式（0=手动，1=自动）
    output          mode_switch,    // 模式切换信号
    output reg [7:0] led_display,   // LED显示
    output reg [3:0] mode_indicator // 模式指示灯
);

// 模式切换按键定义（矩阵键盘4x4布局）
// 按键编码：key_pulse信号中，按下的按键对应位为1，其他位为0
// 4x4矩阵键盘布局：
// 第1行（row[0]=0）：bit[3:0]   - 1,2,3,A
// 第2行（row[1]=0）：bit[7:4]   - 4,5,6,B  
// 第3行（row[2]=0）：bit[11:8]  - 7,8,9,C
// 第4行（row[3]=0）：bit[15:12] - *,0,#,D

parameter MODE_TOGGLE_KEY = 16'h0001;  // 1键(key1) - 模式切换

// 内部信号
reg mode_change_flag;
reg key1_r, key1_rr;  // key1信号的寄存器，用于边沿检测

// key1按键边沿检测寄存器
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        key1_r <= 1'b0;
        key1_rr <= 1'b0;
    end else begin
        key1_r <= key1;
        key1_rr <= key1_r;
    end
end

// 模式切换逻辑 - 检测key1按键的下降沿（按键按下）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_mode <= 1'b0;  // 默认手动模式
        mode_change_flag <= 1'b0;
    end else begin
        mode_change_flag <= 1'b0;  // 默认清除标志
        // 检测key1的下降沿进行模式切换（按键按下时触发）
        if (key1_rr && !key1_r) begin
            current_mode <= ~current_mode;  // 切换模式
            mode_change_flag <= 1'b1;
        end
    end
end

// LED显示更新（低电平点亮）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        led_display <= 8'b11111110;      // 显示手动模式（LED1亮，其他灭）
        mode_indicator <= 4'b1110;       // 指示灯1亮
    end else begin
        case (current_mode)
            1'b0: begin
                led_display <= 8'b11111110;      // 手动模式（LED1亮，其他灭）
                mode_indicator <= 4'b1110;       // 指示灯1亮，其他灭
            end
            1'b1: begin
                led_display <= 8'b11111101;      // 自动模式（LED2亮，其他灭）
                mode_indicator <= 4'b1101;       // 指示灯2亮，其他灭
            end
            default: begin
                led_display <= 8'b11111110;      // 默认手动模式
                mode_indicator <= 4'b1110;
            end
        endcase
    end
end

assign mode_switch = mode_change_flag;

endmodule