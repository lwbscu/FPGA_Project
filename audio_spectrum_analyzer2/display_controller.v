module display_controller(
    input           clk,
    input           rst_n,
    input   [2:0]   current_mode,
    input   [15:0]  db_value,
    input   [7:0]   sensitivity,
    output          seg_rck,
    output          seg_sck,
    output          seg_din
);

// 显示数据准备
wire [3:0] dat_1, dat_2, dat_3, dat_4, dat_5, dat_6, dat_7, dat_8;
wire [7:0] dat_en;
wire [7:0] dot_en;

// BCD转换
wire [19:0] db_bcd;
bin_to_bcd u_bcd(
    .rst_n      (rst_n),
    .bin_code   (db_value),
    .bcd_code   (db_bcd)
);

// 根据模式选择显示内容
assign dat_1 = 4'd0;  // 空
assign dat_2 = current_mode + 4'd1;  // 显示模式号(1-6)
assign dat_3 = 4'd0;  // 空
assign dat_4 = 4'd0;  // 空
assign dat_5 = db_bcd[15:12];  // 分贝值十位
assign dat_6 = db_bcd[11:8];   // 分贝值个位
assign dat_7 = 4'hd;  // 显示'd'
assign dat_8 = 4'hb;  // 显示'b'

// 显示使能控制
assign dat_en = 8'b11110111;  // 除了第4位都显示
assign dot_en = 8'b00000000;  // 不显示小数点

// 数码管扫描模块
segment_scan u_seg_scan(
    .clk        (clk),
    .rst_n      (rst_n),
    .dat_1      (dat_1),
    .dat_2      (dat_2),
    .dat_3      (dat_3),
    .dat_4      (dat_4),
    .dat_5      (dat_5),
    .dat_6      (dat_6),
    .dat_7      (dat_7),
    .dat_8      (dat_8),
    .dat_en     (dat_en),
    .dot_en     (dot_en),
    .seg_rck    (seg_rck),
    .seg_sck    (seg_sck),
    .seg_din    (seg_din)
);

endmodule