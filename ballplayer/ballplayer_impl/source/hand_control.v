module hand_control
(
    input wire         dat_valid,    // ������Ч����
    input wire [15:0]  prox_dat,     // λ�ô���������
    output reg [8:0]   handline,     // ������ֶ�Ӧλ��
    output reg [7:0]   hand_velocity // �ֵ��ٶ�
);

parameter LCD_H = 9'd309; // ͼƬ���ظ߶�

reg [8:0] handline_pre;    // ��Ϊ 9 λ
reg       count;
reg [15:0] prox_dat0, prox_dat1, prox_dat2;
reg [8:0] velocity_temp;
// �˲��߼��������Բ�ֵ���㣩
wire [15:0] diff = (prox_dat1 > prox_dat0) ? (prox_dat1 - prox_dat0) : (prox_dat0 - prox_dat1);
always @(posedge dat_valid) begin
        // �����˲��Ĵ���
        prox_dat0 <= prox_dat;
        prox_dat1 <= prox_dat0;

        // �˲��߼�
        if (diff >= 16'h800) 
            prox_dat2 <= prox_dat2;
        else 
            prox_dat2 <= prox_dat0;

        // �ֵ�λ�ú��ٶȼ���
        count <= count + 1'b1;
        if (count) begin
            // ���� handline ���޷�
            if (prox_dat2[11:6] > 6'b000000) 
                handline <= (prox_dat2[11:6] * 5);
            else 
                handline <= 9'd0;

            // �����ٶȲ��޷�
            handline_pre <= handline;
            velocity_temp <= (handline > handline_pre) ? (handline - handline_pre) : (handline_pre - handline);
            hand_velocity <= (velocity_temp > 8'hFF) ? 8'hFF : velocity_temp[7:0];
        end
end

endmodule