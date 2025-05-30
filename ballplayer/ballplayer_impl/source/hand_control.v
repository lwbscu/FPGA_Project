module hand_control
(
    input wire         dat_valid,    // 数据有效脉冲
    input wire [15:0]  prox_dat,     // 位置传感器数据
    output reg [8:0]   handline,     // 拍球的手对应位置
    output reg [7:0]   hand_velocity // 手的速度
);

parameter LCD_H = 9'd309; // 图片像素高度

reg [8:0] handline_pre;    // 改为 9 位
reg       count;
reg [15:0] prox_dat0, prox_dat1, prox_dat2;
reg [8:0] velocity_temp;
// 滤波逻辑（含绝对差值计算）
wire [15:0] diff = (prox_dat1 > prox_dat0) ? (prox_dat1 - prox_dat0) : (prox_dat0 - prox_dat1);
always @(posedge dat_valid) begin
        // 更新滤波寄存器
        prox_dat0 <= prox_dat;
        prox_dat1 <= prox_dat0;

        // 滤波逻辑
        if (diff >= 16'h800) 
            prox_dat2 <= prox_dat2;
        else 
            prox_dat2 <= prox_dat0;

        // 手的位置和速度计算
        count <= count + 1'b1;
        if (count) begin
            // 计算 handline 并限幅
            if (prox_dat2[11:6] > 6'b000000) 
                handline <= (prox_dat2[11:6] * 5);
            else 
                handline <= 9'd0;

            // 计算速度并限幅
            handline_pre <= handline;
            velocity_temp <= (handline > handline_pre) ? (handline - handline_pre) : (handline_pre - handline);
            hand_velocity <= (velocity_temp > 8'hFF) ? 8'hFF : velocity_temp[7:0];
        end
end

endmodule