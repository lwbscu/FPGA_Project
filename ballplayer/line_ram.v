`timescale 1 ns / 100 ps
module line_ram (address, q);

    input wire [8:0] address;
    output reg [239:0] q;
    
    always @ (*) begin
        case(address)
            9'd15:q = ~240'b0;
            default: q = 0;
        endcase
    end
endmodule