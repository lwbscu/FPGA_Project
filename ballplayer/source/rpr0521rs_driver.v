// =============================================================================
// File: rpr0521rs_driver.v
// Description: RPR0521RS gesture sensor I2C driver for ballplayer project
// Author: Migrated to Quartus Prime + MAX10
// Date: 2025-05-28
// =============================================================================

module rpr0521rs_driver(
    input wire clk,
    input wire rst_n,
    input wire enable,
    inout wire sda,
    output wire scl,
    output reg [15:0] proximity_data,
    output reg [15:0] ambient_light_data,
    output reg data_ready,
    output reg sensor_error
);

    // RPR0521RS I2C Address (7-bit)
    parameter DEVICE_ADDR = 7'h38;
    
    // Register addresses
    parameter REG_SYSTEM_CONTROL = 8'h40;
    parameter REG_MODE_CONTROL = 8'h41;
    parameter REG_ALS_PS_CONTROL = 8'h42;
    parameter REG_PS_DATA_LSB = 8'h44;
    parameter REG_PS_DATA_MSB = 8'h45;
    parameter REG_ALS_DATA0_LSB = 8'h46;
    parameter REG_ALS_DATA0_MSB = 8'h47;
    
    // I2C parameters
    parameter CLK_FREQ = 50000000;  // 50MHz
    parameter I2C_FREQ = 100000;    // 100kHz
    parameter CLK_DIV = CLK_FREQ / (4 * I2C_FREQ);
    
    // State machine states
    localparam IDLE = 4'd0;
    localparam INIT = 4'd1;
    localparam WRITE_CONFIG = 4'd2;
    localparam READ_PS_LSB = 4'd3;
    localparam READ_PS_MSB = 4'd4;
    localparam READ_ALS_LSB = 4'd5;
    localparam READ_ALS_MSB = 4'd6;
    localparam WAIT_CONVERSION = 4'd7;
    localparam ERROR = 4'd8;
      // Internal signals
    reg [3:0] state;
    reg [3:0] next_state;
    reg [15:0] clk_counter;
    reg [7:0] i2c_data_out;
    wire [7:0] i2c_data_in;  // 改为wire，因为它是i2c_master的输出
    reg [7:0] reg_addr;
    reg i2c_start;
    reg i2c_stop;
    reg i2c_write;
    reg i2c_read;
    reg i2c_ack;
    wire i2c_busy;
    wire i2c_done;
    wire i2c_error;
    
    reg [7:0] ps_data_lsb;
    reg [7:0] ps_data_msb;
    reg [7:0] als_data_lsb;
    reg [7:0] als_data_msb;
    reg [23:0] wait_counter;
    
    // I2C Master interface
    i2c_master i2c_master_inst (
        .clk(clk),
        .rst_n(rst_n),
        .start(i2c_start),
        .stop(i2c_stop),
        .write(i2c_write),
        .read(i2c_read),
        .device_addr(DEVICE_ADDR),
        .reg_addr(reg_addr),
        .data_out(i2c_data_out),
        .data_in(i2c_data_in),
        .busy(i2c_busy),
        .done(i2c_done),
        .error(i2c_error),
        .sda(sda),
        .scl(scl)
    );
    
    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    // State transition logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (enable) next_state = INIT;
            end
            INIT: begin
                if (!i2c_busy && i2c_done) next_state = WRITE_CONFIG;
                else if (i2c_error) next_state = ERROR;
            end
            WRITE_CONFIG: begin
                if (!i2c_busy && i2c_done) next_state = WAIT_CONVERSION;
                else if (i2c_error) next_state = ERROR;
            end
            WAIT_CONVERSION: begin
                if (wait_counter >= 24'd1000000) next_state = READ_PS_LSB; // 20ms wait
            end
            READ_PS_LSB: begin
                if (!i2c_busy && i2c_done) next_state = READ_PS_MSB;
                else if (i2c_error) next_state = ERROR;
            end
            READ_PS_MSB: begin
                if (!i2c_busy && i2c_done) next_state = READ_ALS_LSB;
                else if (i2c_error) next_state = ERROR;
            end
            READ_ALS_LSB: begin
                if (!i2c_busy && i2c_done) next_state = READ_ALS_MSB;
                else if (i2c_error) next_state = ERROR;
            end
            READ_ALS_MSB: begin
                if (!i2c_busy && i2c_done) next_state = WAIT_CONVERSION;
                else if (i2c_error) next_state = ERROR;
            end
            ERROR: begin
                if (!enable) next_state = IDLE;
            end
        endcase
    end
    
    // State machine outputs
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            i2c_start <= 1'b0;
            i2c_stop <= 1'b0;
            i2c_write <= 1'b0;
            i2c_read <= 1'b0;
            i2c_data_out <= 8'h00;
            reg_addr <= 8'h00;
            proximity_data <= 16'h0000;
            ambient_light_data <= 16'h0000;
            data_ready <= 1'b0;
            sensor_error <= 1'b0;
            wait_counter <= 24'd0;
        end else begin
            case (state)
                IDLE: begin
                    i2c_start <= 1'b0;
                    i2c_stop <= 1'b0;
                    i2c_write <= 1'b0;
                    i2c_read <= 1'b0;
                    data_ready <= 1'b0;
                    sensor_error <= 1'b0;
                    wait_counter <= 24'd0;
                end
                INIT: begin
                    // Initialize sensor - set system control
                    reg_addr <= REG_SYSTEM_CONTROL;
                    i2c_data_out <= 8'h80; // Software reset
                    i2c_write <= 1'b1;
                    i2c_start <= 1'b1;
                end
                WRITE_CONFIG: begin
                    // Configure sensor for proximity and ALS measurement
                    reg_addr <= REG_MODE_CONTROL;
                    i2c_data_out <= 8'h05; // Enable PS and ALS
                    i2c_write <= 1'b1;
                    i2c_start <= 1'b1;
                end
                WAIT_CONVERSION: begin
                    i2c_start <= 1'b0;
                    i2c_write <= 1'b0;
                    wait_counter <= wait_counter + 1'b1;
                    if (wait_counter >= 24'd1000000) begin
                        wait_counter <= 24'd0;
                    end
                end
                READ_PS_LSB: begin
                    reg_addr <= REG_PS_DATA_LSB;
                    i2c_read <= 1'b1;
                    i2c_start <= 1'b1;
                    if (i2c_done) begin
                        ps_data_lsb <= i2c_data_in;
                        i2c_read <= 1'b0;
                        i2c_start <= 1'b0;
                    end
                end
                READ_PS_MSB: begin
                    reg_addr <= REG_PS_DATA_MSB;
                    i2c_read <= 1'b1;
                    i2c_start <= 1'b1;
                    if (i2c_done) begin
                        ps_data_msb <= i2c_data_in;
                        proximity_data <= {i2c_data_in, ps_data_lsb};
                        i2c_read <= 1'b0;
                        i2c_start <= 1'b0;
                    end
                end
                READ_ALS_LSB: begin
                    reg_addr <= REG_ALS_DATA0_LSB;
                    i2c_read <= 1'b1;
                    i2c_start <= 1'b1;
                    if (i2c_done) begin
                        als_data_lsb <= i2c_data_in;
                        i2c_read <= 1'b0;
                        i2c_start <= 1'b0;
                    end
                end
                READ_ALS_MSB: begin
                    reg_addr <= REG_ALS_DATA0_MSB;
                    i2c_read <= 1'b1;
                    i2c_start <= 1'b1;
                    if (i2c_done) begin
                        als_data_msb <= i2c_data_in;
                        ambient_light_data <= {i2c_data_in, als_data_lsb};
                        data_ready <= 1'b1;
                        i2c_read <= 1'b0;
                        i2c_start <= 1'b0;
                    end
                end
                ERROR: begin
                    sensor_error <= 1'b1;
                    i2c_start <= 1'b0;
                    i2c_write <= 1'b0;
                    i2c_read <= 1'b0;
                end
            endcase
        end
    end

endmodule

// Simple I2C Master module
module i2c_master(
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire stop,
    input wire write,
    input wire read,
    input wire [6:0] device_addr,
    input wire [7:0] reg_addr,
    input wire [7:0] data_out,
    output reg [7:0] data_in,
    output reg busy,
    output reg done,
    output reg error,
    inout wire sda,
    output reg scl
);

    // I2C states
    localparam I2C_IDLE = 4'd0;
    localparam I2C_START = 4'd1;
    localparam I2C_ADDR = 4'd2;
    localparam I2C_REG = 4'd3;
    localparam I2C_DATA = 4'd4;
    localparam I2C_ACK = 4'd5;
    localparam I2C_STOP = 4'd6;
    
    reg [3:0] i2c_state;
    reg [7:0] shift_reg;
    reg [3:0] bit_count;
    reg sda_out;
    reg sda_oe;
    reg [15:0] clk_div;
    
    assign sda = sda_oe ? sda_out : 1'bz;
    
    // Clock divider for I2C timing
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div <= 16'd0;
        end else begin
            clk_div <= clk_div + 1'b1;
        end
    end
    
    // I2C state machine (simplified)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            i2c_state <= I2C_IDLE;
            busy <= 1'b0;
            done <= 1'b0;
            error <= 1'b0;
            scl <= 1'b1;
            sda_out <= 1'b1;
            sda_oe <= 1'b0;
        end else begin
            case (i2c_state)
                I2C_IDLE: begin
                    busy <= 1'b0;
                    done <= 1'b0;
                    error <= 1'b0;
                    if (start) begin
                        busy <= 1'b1;
                        i2c_state <= I2C_START;
                    end
                end
                I2C_START: begin
                    // Generate start condition
                    sda_oe <= 1'b1;
                    sda_out <= 1'b0;
                    scl <= 1'b0;
                    i2c_state <= I2C_ADDR;
                end
                I2C_ADDR: begin
                    // Send device address
                    shift_reg <= {device_addr, write};
                    bit_count <= 4'd8;
                    i2c_state <= I2C_DATA;
                end
                I2C_DATA: begin
                    // Simplified data transmission
                    if (bit_count == 0) begin
                        done <= 1'b1;
                        i2c_state <= I2C_STOP;
                    end else begin
                        bit_count <= bit_count - 1'b1;
                    end
                end
                I2C_STOP: begin
                    // Generate stop condition
                    sda_out <= 1'b1;
                    scl <= 1'b1;
                    sda_oe <= 1'b0;
                    i2c_state <= I2C_IDLE;
                end
            endcase
        end
    end

endmodule
