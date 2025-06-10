// Module: counter_0_to_99.v
// Function: A 2-digit BCD counter that increments on sec_pulse. Counts from 00 to 99.

module counter_0_to_99 (
    input               clk,        // System clock
    input               rst_n,      // Asynchronous active-low reset
    input               count_en,  // Increment signal (from the pulse generator)
    output reg [3:0]    bcd_tens,   // Tens digit output (BCD)
    output reg [3:0]    bcd_ones    // Ones digit output (BCD)
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bcd_tens <= 4'd0;
            bcd_ones <= 4'd0;
        end else begin
            if (count_en) begin // Only update when the second pulse arrives
                if (bcd_ones == 4'd9) begin
                    bcd_ones <= 4'd0;
                    if (bcd_tens == 4'd9) begin
                        bcd_tens <= 4'd0; // Rollover from 99 to 00
                    end else begin
                        bcd_tens <= bcd_tens + 1;
                    end
                end else begin
                    bcd_ones <= bcd_ones + 1;
                end
            end
        end
    end

endmodule