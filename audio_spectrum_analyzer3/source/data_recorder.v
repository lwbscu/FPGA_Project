// --------------------------------------------------------------------
// Module: data_recorder
// Description: 噪声数据记录到EEPROM
// --------------------------------------------------------------------
module data_recorder(
    input           clk,
    input           rst_n,
    input   [15:0]  db_value,       // 分贝值
    input           record_enable,   // 记录使能
    output          i2c_scl,
    inout           i2c_sda
);

// 参数定义
parameter RECORD_INTERVAL = 24'd12000000;  // 1秒记录一次 (12MHz)
parameter MAX_RECORDS = 256;                // 最大记录数

// 内部信号
reg [23:0] interval_counter;    // 间隔计数器
reg [7:0]  record_index;        // 记录索引
reg        write_trigger;       // 写触发信号
reg [7:0]  write_data;          // 写入数据
reg [7:0]  write_addr;          // 写入地址
wire       data_valid;          // 数据有效信号

// 记录控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        interval_counter <= 24'd0;
        record_index <= 8'd0;
        write_trigger <= 1'b0;
        write_data <= 8'd0;
        write_addr <= 8'd0;
    end else if (record_enable) begin
        if (interval_counter >= RECORD_INTERVAL - 1) begin
            interval_counter <= 24'd0;
            write_trigger <= 1'b1;
            // 简化：只记录分贝值的高8位
            write_data <= db_value[15:8];
            write_addr <= record_index;
            
            if (record_index >= MAX_RECORDS - 1) begin
                record_index <= 8'd0;  // 循环覆盖
            end else begin
                record_index <= record_index + 1'b1;
            end
        end else begin
            interval_counter <= interval_counter + 1'b1;
            write_trigger <= 1'b0;
        end
    end else begin
        interval_counter <= 24'd0;
        write_trigger <= 1'b0;
    end
end

// 修改的AT24驱动实例（支持写操作）
at24_driver_rw at24_inst(
    .clk(clk),
    .rst_n(rst_n),
    .i2c_scl(i2c_scl),
    .i2c_sda(i2c_sda),
    .write_enable(write_trigger),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_enable(1'b0),
    .read_addr(8'd0),
    .data_valid(data_valid),
    .data_out()
);

endmodule