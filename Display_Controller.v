// Display_Controller.v - 显示控制模块
module Display_Controller(
    input           clk,
    input           rst_n,
    input           enable,
    input  [2:0]    display_mode,
    input  [15:0]   fft_mag[0:7],
    input  [15:0]   spl_db,
    input  [7:0]    bpm_value,
    output          seg_rck,
    output          seg_sck,
    output          seg_din
);

// 显示模式定义
localparam DISP_SPECTRUM = 0;  // 频谱显示
localparam DISP_SPL     = 1;   // 声压级显示
localparam DISP_BPM     = 2;   // BPM显示
localparam DISP_MIXED   = 3;   // 混合显示

// 数码管数据
reg [7:0] seg_data[0:7];
wire [7:0] seg_dot;

// 频谱数据映射到数码管高度
always @(posedge clk) begin
    if(enable) begin
        case(display_mode)
            DISP_SPECTRUM: begin
                // 将频谱幅值映射到0-9的高度
                integer i;
                for(i = 0; i < 8; i = i + 1) begin
                    seg_data[i] <= fft_mag[i][15:12]; // 简化映射
                end
            end
            
            DISP_SPL: begin
                // 显示dB值 (例如: 85.3 dB)
                seg_data[0] <= spl_db[11:8];      // 十位
                seg_data[1] <= spl_db[7:4];       // 个位
                seg_data[2] <= spl_db[3:0];       // 小数位
                seg_data[3] <= 4'hF;              // 空
                seg_data[4] <= 4'hD;              // 'd'
                seg_data[5] <= 4'hB;              // 'B'
                seg_data[6] <= 4'hF;              // 空
                seg_data[7] <= 4'hF;              // 空
            end
            
            DISP_BPM: begin
                // 显示BPM值 (例如: 120 BPM)
                seg_data[0] <= bpm_value / 100;           // 百位
                seg_data[1] <= (bpm_value / 10) % 10;     // 十位
                seg_data[2] <= bpm_value % 10;            // 个位
                seg_data[3] <= 4'hF;                      // 空
                seg_data[4] <= 4'hB;                      // 'b'
                seg_data[5] <= 4'hA;                      // 'P'
                seg_data[6] <= 4'hC;                      // 'n'
                seg_data[7] <= 4'hF;                      // 空
            end
            
            DISP_MIXED: begin
                // 混合显示：前4位频谱，后4位dB值
                seg_data[0] <= fft_mag[0][15:12];
                seg_data[1] <= fft_mag[1][15:12];
                seg_data[2] <= fft_mag[2][15:12];
                seg_data[3] <= fft_mag[3][15:12];
                seg_data[4] <= spl_db[11:8];
                seg_data[5] <= spl_db[7:4];
                seg_data[6] <= 4'hD;
                seg_data[7] <= 4'hB;
            end
        endcase
    end
end

// 小数点控制
assign seg_dot = (display_mode == DISP_SPL) ? 8'b00000100 : 8'b00000000;

// 实例化数码管驱动
Segment_scan u_seg_scan(
    .clk(clk),
    .rst_n(rst_n),
    .dat_1(seg_data[0]),
    .dat_2(seg_data[1]),
    .dat_3(seg_data[2]),
    .dat_4(seg_data[3]),
    .dat_5(seg_data[4]),
    .dat_6(seg_data[5]),
    .dat_7(seg_data[6]),
    .dat_8(seg_data[7]),
    .dat_en(8'hFF),
    .dot_en(seg_dot),
    .seg_rck(seg_rck),
    .seg_sck(seg_sck),
    .seg_din(seg_din)
);

endmodule