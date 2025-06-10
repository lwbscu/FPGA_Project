// Module: second_pulse_generator.v
// Function: Generates a single clock cycle pulse every second from a 12MHz clock.

module second_pulse_generator (
    input               clk,      // System clock (12MHz)
    input               rst_n,    // Asynchronous active-low reset
    output reg          sec_pulse // Output one-second pulse
);

    // ******************** MODIFIED ********************
    // Parameter for clock frequency, changed to 12MHz.
    parameter CLK_FREQ = 12_000_000;
    // **************************************************

    // ******************** MODIFIED ********************
    // Counter to divide the clock
    // Needs to count up to CLK_FREQ - 1. log2(12,000,000) approx 23.5, so 24 bits needed.
    reg [23:0] counter;
    // **************************************************

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter   <= 24'd0;
            sec_pulse <= 1'b0;
        end else begin
            if (counter == CLK_FREQ - 1) begin
                counter   <= 24'd0;
                sec_pulse <= 1'b1; // Generate pulse
            end else begin
                counter   <= counter + 1;
                sec_pulse <= 1'b0; // Pulse is only high for one clock cycle
            end
        end
    end

endmodule