module matrix_keypad(
    input           clk,
    input           rst_n,
    
    // 矩阵键盘接口
    output reg [3:0] row,       // 行输出
    input      [3:0] col,       // 列输入
    
    // 键值输出
    output reg [3:0] key_value, // 按键值0-15
    output reg       key_valid, // 按键有效脉冲
    
    // 额外的输出（为了兼容性）
    output reg [15:0] key_out,  // 16位键状态输出
    output reg [15:0] key_pulse // 16位键脉冲输出
);

// 状态机
localparam IDLE = 3'd0;
localparam SCAN_ROW = 3'd1;
localparam WAIT_STABLE = 3'd2;
localparam CHECK_COL = 3'd3;
localparam KEY_PRESS = 3'd4;
localparam WAIT_RELEASE = 3'd5;

reg [2:0] state;
reg [1:0] scan_row;     // 当前扫描行
reg [15:0] scan_cnt;    // 扫描计数器
reg [15:0] debounce_cnt;// 消抖计数器
reg [3:0] col_reg;      // 列寄存器

// 键盘扫描状态机
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        row <= 4'b1111;
        scan_row <= 2'd0;
        scan_cnt <= 16'd0;
        debounce_cnt <= 16'd0;
        key_value <= 4'd0;
        key_valid <= 1'b0;
        key_out <= 16'd0;
        key_pulse <= 16'd0;
        col_reg <= 4'b1111;
    end else begin
        key_valid <= 1'b0;  // 默认无效
        key_pulse <= 16'd0; // 默认清零脉冲
        
        case (state)
            IDLE: begin
                scan_cnt <= scan_cnt + 1'b1;
                if (scan_cnt >= 16'd12000) begin  // 1ms扫描间隔
                    scan_cnt <= 16'd0;
                    scan_row <= 2'd0;
                    state <= SCAN_ROW;
                end
            end
            
            SCAN_ROW: begin
                // 设置当前行为低电平，其他行为高电平
                case (scan_row)
                    2'd0: row <= 4'b1110;
                    2'd1: row <= 4'b1101;
                    2'd2: row <= 4'b1011;
                    2'd3: row <= 4'b0111;
                endcase
                state <= WAIT_STABLE;
                debounce_cnt <= 16'd0;
            end
            
            WAIT_STABLE: begin
                debounce_cnt <= debounce_cnt + 1'b1;
                if (debounce_cnt >= 16'd120) begin  // 10us等待稳定
                    col_reg <= col;  // 采样列输入
                    state <= CHECK_COL;
                end
            end
            
            CHECK_COL: begin
                if (col_reg != 4'b1111) begin  // 有按键按下
                    // 计算按键值
                    case ({scan_row, col_reg})
                        // 第一行
                        6'b00_1110: begin
                            key_value <= 4'd1;
                            key_out[1] <= 1'b1;
                            key_pulse[1] <= 1'b1;
                        end
                        6'b00_1101: begin
                            key_value <= 4'd2;
                            key_out[2] <= 1'b1;
                            key_pulse[2] <= 1'b1;
                        end
                        6'b00_1011: begin
                            key_value <= 4'd3;
                            key_out[3] <= 1'b1;
                            key_pulse[3] <= 1'b1;
                        end
                        6'b00_0111: begin
                            key_value <= 4'd12; // A
                            key_out[12] <= 1'b1;
                            key_pulse[12] <= 1'b1;
                        end
                        // 第二行
                        6'b01_1110: begin
                            key_value <= 4'd4;
                            key_out[4] <= 1'b1;
                            key_pulse[4] <= 1'b1;
                        end
                        6'b01_1101: begin
                            key_value <= 4'd5;
                            key_out[5] <= 1'b1;
                            key_pulse[5] <= 1'b1;
                        end
                        6'b01_1011: begin
                            key_value <= 4'd6;
                            key_out[6] <= 1'b1;
                            key_pulse[6] <= 1'b1;
                        end
                        6'b01_0111: begin
                            key_value <= 4'd13; // B
                            key_out[13] <= 1'b1;
                            key_pulse[13] <= 1'b1;
                        end
                        // 第三行
                        6'b10_1110: begin
                            key_value <= 4'd7;
                            key_out[7] <= 1'b1;
                            key_pulse[7] <= 1'b1;
                        end
                        6'b10_1101: begin
                            key_value <= 4'd8;
                            key_out[8] <= 1'b1;
                            key_pulse[8] <= 1'b1;
                        end
                        6'b10_1011: begin
                            key_value <= 4'd9;
                            key_out[9] <= 1'b1;
                            key_pulse[9] <= 1'b1;
                        end
                        6'b10_0111: begin
                            key_value <= 4'd14; // C
                            key_out[14] <= 1'b1;
                            key_pulse[14] <= 1'b1;
                        end
                        // 第四行
                        6'b11_1110: begin
                            key_value <= 4'd10; // *
                            key_out[10] <= 1'b1;
                            key_pulse[10] <= 1'b1;
                        end
                        6'b11_1101: begin
                            key_value <= 4'd0;
                            key_out[0] <= 1'b1;
                            key_pulse[0] <= 1'b1;
                        end
                        6'b11_1011: begin
                            key_value <= 4'd11; // #
                            key_out[11] <= 1'b1;
                            key_pulse[11] <= 1'b1;
                        end
                        6'b11_0111: begin
                            key_value <= 4'd15; // D
                            key_out[15] <= 1'b1;
                            key_pulse[15] <= 1'b1;
                        end
                        default: begin
                            key_value <= 4'd0;
                            key_out[0] <= 1'b1;
                            key_pulse[0] <= 1'b1;
                        end
                    endcase
                    key_valid <= 1'b1;  // 产生有效脉冲
                    state <= WAIT_RELEASE;
                end else begin
                    // 检查下一行
                    if (scan_row >= 2'd3) begin
                        state <= IDLE;
                    end else begin
                        scan_row <= scan_row + 1'b1;
                        state <= SCAN_ROW;
                    end
                end
            end
            
            WAIT_RELEASE: begin
                // 等待按键释放
                if (col == 4'b1111) begin
                    state <= IDLE;
                    key_out <= 16'd0;  // 清除按键状态
                end
            end
            
            default: state <= IDLE;
        endcase
    end
end

endmodule