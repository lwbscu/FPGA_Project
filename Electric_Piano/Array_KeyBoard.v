// Array_KeyBoard.v - 4x4矩阵键盘驱动模块
// 扫描矩阵键盘，输出按键状态和脉冲信号

module Array_KeyBoard(
    input           clk,        // 系统时钟
    input           rst_n,      // 复位信号
    input   [3:0]   col,        // 列输入
    output  [3:0]   row,        // 行输出
    output  [15:0]  key_out,    // 按键状态输出，低电平有效
    output  [15:0]  key_pulse   // 按键脉冲输出
);

// 参数定义
parameter CLK_FREQ = 12_000_000;  // 系统时钟频率 12MHz
parameter SCAN_FREQ = 1000;       // 扫描频率 1kHz
parameter SCAN_CNT = CLK_FREQ / SCAN_FREQ / 4 - 1;  // 每行扫描计数值

// 内部信号
reg [1:0] state;                  // 扫描状态机
reg [15:0] key_scan;              // 扫描得到的按键值
reg [15:0] key_scan_r;            // 按键值寄存器
reg [15:0] key_scan_rr;           // 按键值寄存器（消抖用）
reg [3:0] row_r;                  // 行输出寄存器
reg [19:0] scan_cnt;              // 扫描计数器

// 行输出
assign row = row_r;

// 扫描状态机和计数器
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 2'b00;
        scan_cnt <= 20'd0;
        row_r <= 4'b1110;         // 初始扫描第一行
    end
    else if (scan_cnt == SCAN_CNT) begin
        scan_cnt <= 20'd0;
        state <= state + 1'b1;
        case (state)
            2'b00: row_r <= 4'b1110;  // 扫描第1行
            2'b01: row_r <= 4'b1101;  // 扫描第2行
            2'b10: row_r <= 4'b1011;  // 扫描第3行
            2'b11: row_r <= 4'b0111;  // 扫描第4行
        endcase
    end
    else begin
        scan_cnt <= scan_cnt + 1'b1;
    end
end

// 键盘扫描
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        key_scan <= 16'hffff;
    end
    else begin
        case (state)
            2'b00: key_scan[3:0]   <= col;  // 第1行按键状态
            2'b01: key_scan[7:4]   <= col;  // 第2行按键状态
            2'b10: key_scan[11:8]  <= col;  // 第3行按键状态
            2'b11: key_scan[15:12] <= col;  // 第4行按键状态
        endcase
    end
end

// 按键消抖
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        key_scan_r <= 16'hffff;
        key_scan_rr <= 16'hffff;
    end
    else begin
        key_scan_r <= key_scan;
        key_scan_rr <= key_scan_r;
    end
end

// 按键输出（消抖后的稳定值）
assign key_out = key_scan_rr;

// 按键脉冲输出（检测按键按下的边沿）
// 当按键从高电平（未按下）变为低电平（按下）时产生脉冲
assign key_pulse = (~key_scan_r) & key_scan_rr;

endmodule