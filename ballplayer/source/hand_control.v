// ============================================================================
// Module: hand_control
// Description: 手势控制模块 - 基于传感器数据计算手的位置和速度
// Author: GitHub Copilot
// Date: 2025-05-28
// ============================================================================

module hand_control(
    input wire          dat_valid,      // 传感器数据有效信号
    input wire [15:0]   prox_dat,       // 位置传感器数据
    output reg [8:0]    handline,       // 接球手对应位置
    output reg [7:0]    hand_velocity   // 手的速度
);

parameter LCD_H = 9'd309;               // 图片最大高度

reg [8:0] handline_pre;                 // 改为9位
reg       count;
reg [15:0] prox_dat0, prox_dat1, prox_dat2;
reg [8:0] velocity_temp;
reg [9:0] temp_mult;                    // 临时乘法结果

// 滤波逻辑（简单差值运算）
wire [15:0] diff = (prox_dat1 > prox_dat0) ? (prox_dat1 - prox_dat0) : (prox_dat0 - prox_dat1);

always @(posedge dat_valid) begin
    // 数据滤波寄存器
    prox_dat0 <= prox_dat;
    prox_dat1 <= prox_dat0;

    // 滤波逻辑
    if (diff >= 16'h800) 
        prox_dat2 <= prox_dat2;
    else 
        prox_dat2 <= prox_dat0;

    // 手的位置和速度计算
    count <= count + 1'b1;    if (count) begin        // 计算handline并限制范围
        if (prox_dat2[11:6] > 6'b000000) begin
            temp_mult <= prox_dat2[11:6] * 4'd5;
            handline <= temp_mult[8:0];
        end else 
            handline <= 9'd0;

        // 计算速度并限制范围
        handline_pre <= handline;
        velocity_temp <= (handline > handline_pre) ? (handline - handline_pre) : (handline_pre - handline);
        hand_velocity <= (velocity_temp > 8'hFF) ? 8'hFF : velocity_temp[7:0];
    end
end

endmodule
