// =============================================================================
// File: segment_display.v
// Description: Dual 7-segment display module for ballplayer project
// Author: Migrated to Quartus Prime + MAX10
// Date: 2025-05-28
// =============================================================================

module segment_display(
    input wire clk,
    input wire rst_n,
    input wire [7:0] display_value,  // 8-bit value to display (0-99)
    output reg [6:0] seg,            // 7-segment display (a-g)
    output reg [1:0] dig             // Digit select (active low)
);

    // Parameters
    parameter REFRESH_RATE = 16'd50000; // Refresh rate for multiplexing (1ms at 50MHz)
    
    // Internal signals
    reg [15:0] refresh_counter;
    reg digit_select;
reg [3:0] current_digit;
reg [3:0] tens_digit;
reg [3:0] ones_digit;

// BCD conversion
always @(*) begin
    tens_digit = display_value / 8'd10;
    ones_digit = display_value % 8'd10;
end
    
    // Refresh counter for digit multiplexing
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            refresh_counter <= 16'd0;
            digit_select <= 1'b0;
        end else begin
            if (refresh_counter >= REFRESH_RATE) begin
                refresh_counter <= 16'd0;
                digit_select <= ~digit_select;
            end else begin
                refresh_counter <= refresh_counter + 1'b1;
            end
        end
    end
    
    // Digit selection
    always @(*) begin
        if (digit_select) begin
            current_digit = tens_digit;
            dig = 2'b10; // Select tens digit (active low)
        end else begin
            current_digit = ones_digit;
            dig = 2'b01; // Select ones digit (active low)
        end
    end
    
    // 7-segment decoder (common anode, active low)
    always @(*) begin
        case (current_digit)
            4'h0: seg = 7'b1000000; // 0
            4'h1: seg = 7'b1111001; // 1
            4'h2: seg = 7'b0100100; // 2
            4'h3: seg = 7'b0110000; // 3
            4'h4: seg = 7'b0011001; // 4
            4'h5: seg = 7'b0010010; // 5
            4'h6: seg = 7'b0000010; // 6
            4'h7: seg = 7'b1111000; // 7
            4'h8: seg = 7'b0000000; // 8
            4'h9: seg = 7'b0010000; // 9
            4'hA: seg = 7'b0001000; // A
            4'hB: seg = 7'b0000011; // b
            4'hC: seg = 7'b1000110; // C
            4'hD: seg = 7'b0100001; // d
            4'hE: seg = 7'b0000110; // E
            4'hF: seg = 7'b0001110; // F
            default: seg = 7'b1111111; // All off
        endcase
    end

endmodule
