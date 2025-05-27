module seg7_driver(
    input           clk,
    input           rst_n,
    input [95:0]    spectrum_data_packed,  // 8个频段打包数据
    input           spectrum_valid,
    
    // 74HC595接口
    output reg      seg_rck,    // 锁存时钟
    output reg      seg_sck,    // 移位时钟
    output reg      seg_din     // 串行数据
);

// 解包频谱数据
wire [11:0] spectrum_0 = spectrum_data_packed[11:0];
wire [11:0] spectrum_1 = spectrum_data_packed[23:12];
wire [11:0] spectrum_2 = spectrum_data_packed[35:24];
wire [11:0] spectrum_3 = spectrum_data_packed[47:36];
wire [11:0] spectrum_4 = spectrum_data_packed[59:48];
wire [11:0] spectrum_5 = spectrum_data_packed[71:60];
wire [11:0] spectrum_6 = spectrum_data_packed[83:72];
wire [11:0] spectrum_7 = spectrum_data_packed[95:84];

// 7段数码管编码 - 使用参数定义
parameter SEG_0 = 8'h3F;
parameter SEG_1 = 8'h06;
parameter SEG_2 = 8'h5B;
parameter SEG_3 = 8'h4F;
parameter SEG_4 = 8'h66;
parameter SEG_5 = 8'h6D;
parameter SEG_6 = 8'h7D;
parameter SEG_7 = 8'h07;
parameter SEG_8 = 8'h7F;
parameter SEG_9 = 8'h6F;
parameter SEG_A = 8'h77;
parameter SEG_B = 8'h7C;
parameter SEG_C = 8'h39;
parameter SEG_D = 8'h5E;
parameter SEG_E = 8'h79;
parameter SEG_F = 8'h71;

// 状态机
reg [1:0] state;
reg [4:0] bit_cnt;
reg [2:0] digit_cnt;
reg [15:0] shift_data;
reg [15:0] refresh_cnt;

// 频谱数据缓存
reg [11:0] spectrum_buf [0:7];

// 用于显示值计算的临时变量
reg [3:0] display_val;
reg [7:0] seg_data;

// 整数变量用于循环
integer i;

// 更新频谱缓存
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 8; i = i + 1) begin
            spectrum_buf[i] <= 12'd0;
        end
    end else if (spectrum_valid) begin
        spectrum_buf[0] <= spectrum_0;
        spectrum_buf[1] <= spectrum_1;
        spectrum_buf[2] <= spectrum_2;
        spectrum_buf[3] <= spectrum_3;
        spectrum_buf[4] <= spectrum_4;
        spectrum_buf[5] <= spectrum_5;
        spectrum_buf[6] <= spectrum_6;
        spectrum_buf[7] <= spectrum_7;
    end
end

// 数码管段码查找函数
function [7:0] get_seg_code;
    input [3:0] val;
    begin
        case(val)
            4'd0: get_seg_code = SEG_0;
            4'd1: get_seg_code = SEG_1;
            4'd2: get_seg_code = SEG_2;
            4'd3: get_seg_code = SEG_3;
            4'd4: get_seg_code = SEG_4;
            4'd5: get_seg_code = SEG_5;
            4'd6: get_seg_code = SEG_6;
            4'd7: get_seg_code = SEG_7;
            4'd8: get_seg_code = SEG_8;
            4'd9: get_seg_code = SEG_9;
            4'd10: get_seg_code = SEG_A;
            4'd11: get_seg_code = SEG_B;
            4'd12: get_seg_code = SEG_C;
            4'd13: get_seg_code = SEG_D;
            4'd14: get_seg_code = SEG_E;
            4'd15: get_seg_code = SEG_F;
            default: get_seg_code = SEG_0;
        endcase
    end
endfunction

// 数码管扫描控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 2'd0;
        bit_cnt <= 5'd0;
        digit_cnt <= 3'd0;
        seg_rck <= 1'b0;
        seg_sck <= 1'b0;
        seg_din <= 1'b0;
        shift_data <= 16'd0;
        refresh_cnt <= 16'd0;
        display_val <= 4'd0;
        seg_data <= 8'd0;
    end else begin
        case (state)
            2'd0: begin  // IDLE
                refresh_cnt <= refresh_cnt + 1'b1;
                if (refresh_cnt >= 16'd1200) begin
                    refresh_cnt <= 16'd0;
                    
                    // 准备显示数据
                    display_val = spectrum_buf[digit_cnt][11:8];
                    if (display_val > 4'd9) display_val = 4'd9;
                    
                    seg_data = get_seg_code(display_val);
                    shift_data[7:0] = seg_data;
                    shift_data[15:8] = ~(8'd1 << digit_cnt);
                    
                    state <= 2'd1;
                    bit_cnt <= 5'd0;
                end
            end
            
            2'd1: begin  // SHIFT
                if (seg_sck == 1'b0) begin
                    seg_sck <= 1'b1;
                    seg_din <= shift_data[15-bit_cnt];
                end else begin
                    seg_sck <= 1'b0;
                    if (bit_cnt >= 5'd15) begin
                        state <= 2'd2;
                    end else begin
                        bit_cnt <= bit_cnt + 1'b1;
                    end
                end
            end
            
            2'd2: begin  // LATCH
                seg_rck <= 1'b1;
                if (seg_rck == 1'b1) begin
                    seg_rck <= 1'b0;
                    state <= 2'd0;
                    
                    if (digit_cnt >= 3'd7)
                        digit_cnt <= 3'd0;
                    else
                        digit_cnt <= digit_cnt + 1'b1;
                end
            end
            
            default: state <= 2'd0;
        endcase
    end
end

endmodule