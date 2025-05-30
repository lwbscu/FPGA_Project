// =============================================================================
// File: debounce.v
// Description: Button debounce module for ballplayer project
// Author: Migrated to Quartus Prime + MAX10
// Date: 2025-05-28
// =============================================================================

module debounce(
    input wire clk,
    input wire rst_n,
    input wire button_in,
    output reg button_out
);

    // Parameters
    parameter DEBOUNCE_TIME = 20'd500000; // 500,000 clock cycles for 50MHz clock (10ms)
    
    // Internal signals
    reg [19:0] counter;
    reg button_sync1, button_sync2;
    reg button_state;
    
    // Synchronize input button to clock domain
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            button_sync1 <= 1'b0;
            button_sync2 <= 1'b0;
        end else begin
            button_sync1 <= button_in;
            button_sync2 <= button_sync1;
        end
    end
    
    // Debounce logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 20'd0;
            button_state <= 1'b0;
            button_out <= 1'b0;
        end else begin
            if (button_sync2 != button_state) begin
                // Button state changed, start debounce timer
                counter <= 20'd0;
            end else if (counter < DEBOUNCE_TIME) begin
                // Still debouncing
                counter <= counter + 1'b1;
            end else begin
                // Debounce time elapsed, update output
                button_state <= button_sync2;
                button_out <= button_sync2;
            end
        end
    end

endmodule
