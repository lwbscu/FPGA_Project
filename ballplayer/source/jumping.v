// ============================================================================
// Module: jumping  
// Description: 球运动控制模块 - 移植到MAX10开发板
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module jumping(
    input wire          clk,                // 12MHz时钟信号
    input wire          rst_n,              // 复位信号
    output reg [8:0]    pic_y,              // 小球纵坐标
    
    input wire [8:0]    handline,           // 接球手对应位置
    input wire [7:0]    hand_velocity,      // 手的速度
    
    input wire [1:0]    k,                  // 弹性系数
    input wire          ball_release_button,// 发球键
    input wire [8:0]    home,               // 起始位置
    
    output reg [1:0]    beep_flag,          // 蜂鸣器信号和游戏音效
    output reg          stop_flag = 0,      // 停止标志位
    output reg          over_flag           // 游戏结束时停止标志位
);

wire reset = ball_release_button && rst_n;  // 复合复位信号

// 分频器时钟，18.2ms
wire clk_out;
parameter N = 219089;                       // 分频系数
parameter WIDTH = 24;                       // 计数器位宽

frequency_divider #(.WIDTH(WIDTH), .N(N)) fre_500us(
    .clk(clk),              // 输入12M时钟信号
    .rst_n(rst_n),          // 复位
    .clk_out(clk_out)       // 输出分频后时钟
);

// 状态机参数定义，下降，上升
parameter DOWN = 2'b00, UP = 2'b01;

// 当前状态，下一状态
reg [1:0] current_state = DOWN;

parameter MAX_Y = 9'd309;                   // 液晶屏最大高度
reg [14:0] time_count_down = 0, time_count_up = 0, time_count_r = 0; // 时间计数器，上一时间寄存器
reg [8:0] init_position = 0, position = 0;  // 初始位置寄存器，位置寄存器
reg [10:0] init_velocity = 0;
reg [5:0] beep_count;                       // 蜂鸣器计数器和计时

always @(posedge clk_out or negedge reset) begin
    if (!reset) begin
        time_count_down <= 0;
        time_count_up <= 0;
        time_count_r <= 0;
        position <= 0;
        init_position <= home;
        pic_y <= home;
        current_state <= DOWN; 
        
        init_velocity <= 0;
        beep_count <= 0;
        stop_flag <= 0;
        over_flag <= 0;
    end
    else begin
        case (current_state)            DOWN: begin
                if (position + init_position <= MAX_Y) begin
                    pic_y <= position + init_position;
                    position <= ((time_count_down * time_count_down) >> 3) + (init_velocity * time_count_down); // s=g*t*t/2
                    
                    if (pic_y < handline)
                        init_velocity <= (hand_velocity >> 1);
                    
                    time_count_down <= time_count_down + 1'b1; // 下降时间计数
                    beep_flag[1] <= 0;
                end
                else begin
                    pic_y <= MAX_Y;                     // 到底
                    position <= 15'd0;                      // 位置寄存器清零

                    time_count_r <= (((time_count_down - 15'd1) * ({9'd0, k} + 15'd4)) >> 3) + {4'd0, init_velocity}; // 反弹后速度变为原来的0.7倍

                    current_state <= UP;                    // 状态转换
                    
                    time_count_down <= 0;
                    beep_flag[1] <= ~stop_flag;
                end
            end
            
            UP: begin
                if (time_count_up >= time_count_r) begin   // 速度减为零
                    if (pic_y >= MAX_Y - 7) begin          // 弹跳微小距离
                        init_position <= MAX_Y;
                        stop_flag <= 1;
                        over_flag <= 1;
                        if (beep_count <= 1) begin
                            beep_flag[0] <= 1;
                            beep_count <= beep_count + 1;
                        end
                        else begin
                            beep_flag[0] <= 0;
                            beep_count <= beep_count;
                        end
                    end
                    else
                        init_position <= pic_y;             // 保存当前位置
                    
                    init_velocity <= 0;
                    current_state <= DOWN;                  // 状态转换

                    time_count_up <= 0;
                    beep_flag[1] <= 0;
                end                else if ((pic_y < 9'd5) || (pic_y > MAX_Y)) begin
                    pic_y <= 9'd0;
                    init_velocity <= (({4'd0, time_count_r} - {4'd0, time_count_up}) * ({13'd0, k} + 15'd4)) >> 3;
                    init_position <= 9'd0;
                    current_state <= DOWN;                  // 状态转换

                    time_count_up <= 0;
                    beep_flag[1] <= ~stop_flag;
                end
                else begin
                    beep_flag[1] <= 0;
                    if (pic_y < handline) begin
                        init_position <= handline;
                        init_velocity <= hand_velocity >> 1;
                        current_state <= DOWN;              // 状态转换

                        time_count_up <= 0;
                    end
                    else begin
                        pic_y <= MAX_Y + (({6'd0, time_count_up} * {6'd0, time_count_up}) >> 3) - (({6'd0, time_count_r} * {6'd0, time_count_up}) >> 2);
                        time_count_up <= time_count_up + 1; // 上升时间计数
                    end
                end
            end
            
            default: begin  // 其他情况，复位
                pic_y <= 0;
                time_count_down <= 0;
                time_count_up <= 0;
                time_count_r <= 0;
                position <= 0;
                init_position <= home;
                current_state <= DOWN; 
                
                init_velocity <= 0;
                beep_count <= 0;
                stop_flag <= 0;
                over_flag <= 0;
            end
        endcase	
    end
end

endmodule
