// Mode_Controller.v - 模式控制器
// 功能：控制电子琴的不同工作模式
// 模式说明：
// 000: 手动演奏模式
// 001: 自动播放《稻香》
// 010: 自动播放《青花瓷》  
// 011: 自动播放《告白气球》
// 100: 自动播放《简单爱》

module Mode_Controller(
    input           clk,
    input           rst_n,
    input   [15:0]  key_pulse,      // 键盘脉冲信号
    output reg [2:0] current_mode,  // 当前模式
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

parameter MODE_KEY_MANUAL = 16'h0001;  // 1键 - 手动模式
parameter MODE_KEY_DAOXIANG = 16'h0008;  // A键 - 《稻香》
parameter MODE_KEY_QINGHUACI = 16'h0080;  // B键 - 《青花瓷》  
parameter MODE_KEY_GAOBAIQIQIU = 16'h0800;  // C键 - 《告白气球》
parameter MODE_KEY_JIANDANAI = 16'h8000;  // D键 - 《简单爱》

// 内部信号
reg mode_change_flag;
reg [15:0] key_pulse_r;

// 按键脉冲寄存，用于边沿检测
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        key_pulse_r <= 16'h0000;
    end else begin
        key_pulse_r <= key_pulse;
    end
end

// 模式切换逻辑 - 检测按键脉冲的上升沿
always @(posedge clk or negedge rst_n) begin    if (!rst_n) begin
        current_mode <= 3'b000;  // 默认手动模式
        mode_change_flag <= 1'b0;
    end else begin
        mode_change_flag <= 1'b0;  // 默认清除标志
        // 检测按键脉冲的上升沿
        if ((|key_pulse) && (!(|key_pulse_r))) begin
            case (key_pulse)
                MODE_KEY_MANUAL: begin
                    current_mode <= 3'b000;  // 手动模式
                    mode_change_flag <= 1'b1;
                end
                MODE_KEY_DAOXIANG: begin
                    current_mode <= 3'b001;  // 稻香
                    mode_change_flag <= 1'b1;
                end
                MODE_KEY_QINGHUACI: begin
                    current_mode <= 3'b010;  // 青花瓷
                    mode_change_flag <= 1'b1;
                end
                MODE_KEY_GAOBAIQIQIU: begin
                    current_mode <= 3'b011;  // 告白气球
                    mode_change_flag <= 1'b1;
                end
                MODE_KEY_JIANDANAI: begin
                    current_mode <= 3'b100;  // 简单爱
                    mode_change_flag <= 1'b1;
                end
                default: begin
                    mode_change_flag <= 1'b0;
                end
            endcase
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
            3'b000: begin
                led_display <= 8'b11111110;      // 手动模式（LED1亮）
                mode_indicator <= 4'b1110;
            end
            3'b001: begin
                led_display <= 8'b11111101;      // 稻香（LED2亮）
                mode_indicator <= 4'b1101;
            end
            3'b010: begin
                led_display <= 8'b11111011;      // 青花瓷（LED3亮）
                mode_indicator <= 4'b1011;
            end
            3'b011: begin
                led_display <= 8'b11110111;      // 告白气球（LED4亮）
                mode_indicator <= 4'b0111;
            end
            3'b100: begin
                led_display <= 8'b11101111;      // 简单爱（LED5亮）
                mode_indicator <= 4'b1111;       // 所有指示灯灭（表示第5个模式）
            end
            default: begin
                led_display <= 8'b11111110;
                mode_indicator <= 4'b1110;
            end
        endcase
    end
end

assign mode_switch = mode_change_flag;

endmodule