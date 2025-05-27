// --------------------------------------------------------------------
// Module: at24_driver_rw
// Description: AT24 EEPROM读写驱动
// --------------------------------------------------------------------
module at24_driver_rw(
    input           clk,
    input           rst_n,
    output          i2c_scl,
    inout           i2c_sda,
    
    input           write_enable,
    input   [7:0]   write_addr,
    input   [7:0]   write_data,
    
    input           read_enable,
    input   [7:0]   read_addr,
    output          data_valid,
    output  [7:0]   data_out
);

// 状态机定义
localparam IDLE     = 4'd0;
localparam WRITE_OP = 4'd1;
localparam READ_OP  = 4'd2;

reg [3:0] state;
reg [7:0] addr_reg;
reg [7:0] data_reg;
reg       op_type;  // 0: write, 1: read

// 操作控制
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        addr_reg <= 8'd0;
        data_reg <= 8'd0;
        op_type <= 1'b0;
    end else begin
        case (state)
            IDLE: begin
                if (write_enable) begin
                    state <= WRITE_OP;
                    addr_reg <= write_addr;
                    data_reg <= write_data;
                    op_type <= 1'b0;
                end else if (read_enable) begin
                    state <= READ_OP;
                    addr_reg <= read_addr;
                    op_type <= 1'b1;
                end
            end
            
            WRITE_OP: begin
                // 写操作完成后返回IDLE
                if (data_valid) begin
                    state <= IDLE;
                end
            end
            
            READ_OP: begin
                // 读操作完成后返回IDLE
                if (data_valid) begin
                    state <= IDLE;
                end
            end
        endcase
    end
end

// 实例化原始AT24驱动（需要修改以支持写操作）
// 这里简化处理，实际需要修改原驱动
at24_driver at24_core(
    .clk(clk),
    .rst_n(rst_n & (state != IDLE)),  // 只在操作时使能
    .i2c_scl(i2c_scl),
    .i2c_sda(i2c_sda),
    .data_valid(data_valid),
    .data_out(data_out)
);

endmodule