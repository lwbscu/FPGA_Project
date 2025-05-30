`timescale 1 ns / 100 ps
module pic_ram (address, q, offset);

    input wire [8:0] address;
    output reg [239:0] q;
	input wire [8:0] offset;
    
    always @ (*) begin
        case(address - offset)
            9'd1: q = 24'h060;
            9'd2: q = 24'h1F8;
            9'd3: q = 24'h3FC;
            9'd4: q = 24'h3FC;
            9'd5: q = 24'h7FE;
            9'd6: q = 24'h7FE;
            9'd7: q = 24'h3FC;
            9'd8: q = 24'h3FC;
            9'd9: q = 24'h1F8;
            9'd10: q = 24'h060;
            default: q = 0;
        endcase
    end
endmodule