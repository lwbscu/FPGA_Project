module ball (
    input wire clk, // 12MHz????
    input wire rst, // ????
    input wire button, // ????
    //input wire over_flag, // ???
    //output reg [1:0] BEEP_flag = 0, // ???
    //output wire stop_flag, // ???
    input wire [1:0] k, // ????
    input wire [8:0] home, // ????
	input wire [8:0] handline,//????????
	output reg led = 0,
    output reg [16:0] position // ??
);

    parameter DOWN = 2'b00, UP = 2'b11, STOP = 2'b01;
	parameter DIV = 4, IDE =8;
	parameter TOP = 20;
	parameter BOTTOM = 310;
	parameter GRAVITY = 750;
	parameter FREQUENCY = 250;
	wire reset = button&rst;
    reg [1:0] state = STOP;
	reg [16:0] initpos = BOTTOM;//????
    reg [7:0] cnt = 0;
    reg [10:0] initvelo = 0;
    wire clkdivide;
	//assign stop_flag=(~state[1])&state[0];
    // ???????
    fre_div #(.WIDTH(24), .N(48_000)) div(.clk(clk), .rst(rst), .clk_out(clkdivide));
    // ?????
    always @(posedge clkdivide or negedge reset) begin
        if (!reset) begin
			if(button) state <= STOP;
            else begin
				state <= DOWN;
				initvelo <= 0;
				cnt <= 0;
				position <= home;
				initpos <= home;
				//BEEP_flag <= 2'b00;
			end
        end 
		  else begin
			 led <= ~led;
            case (state)
				STOP: begin
							state <= STOP;
							initvelo <= 0;
							position <= BOTTOM;
							initpos <= BOTTOM;
							//if((BEEP_flag[0])&&(cnt <= 100)) begin
							//	cnt <= cnt + 1;
							//	BEEP_flag[0]<=1;
							//end
							//else begin
								cnt<=0;
							//	BEEP_flag[0]<=0;
							//end
					 end
                DOWN: begin
						  if (position < BOTTOM) begin
								//BEEP_flag <= 2'b00;
								//if((handline > position)) begin//????
								//	initpos <= handline;
								//	initvelo <= initvelo + 3*cnt + ((handline - position) << (2 + k) ); 
								//	position <= initpos + (3*cnt*cnt)>>DIV+ (initvelo * cnt) >>IDE;
								//	cnt <= 0;
								//end
								//else begin
									position <= initpos + (3*cnt*cnt)>>DIV+ (initvelo * cnt) >>IDE;
									cnt <= cnt + 1;
								//end
						  end
						else begin//???????
								state <= UP;
								initpos <= BOTTOM;
								position <= BOTTOM;
								initvelo <= ( (initvelo + 3*cnt) * (8 - k ) ) >> 3 ;
								cnt <= 0;
								//BEEP_flag<=2'b10;
                    end
                end
                UP: begin
						  if (initvelo <= (3*cnt + 1)) begin
								if(position < (BOTTOM-3)) begin
									state <= DOWN;
									initpos <= position;
									position <= position;///////////////////////////////////////////////////
									initvelo <= 0;
									//BEEP_flag <= 2'b00;
									cnt <= 0;
								end
								else begin
										state <= STOP;
										initvelo <= 0;
										cnt <= 0;
										initpos <= BOTTOM;
										position <= BOTTOM;
										//BEEP_flag<=2'b01;
								end
                    end
						//  else if((handline >= position)) begin //????
                        //		state <= DOWN;
						//		initpos <= handline;
						//		initvelo <= initvelo - 3*cnt + ((handline - position) << (3 + k) ) ; 
						//		position <= handline;
						//		//BEEP_flag <= 2'b00;
						//		cnt <= 0;
						//  end 
						  else if (position <= TOP) begin//????
								state <= DOWN;
								initpos <= TOP;
								initvelo <= ( (initvelo - 3*cnt) * (8 - k)) >> 3 ;
								position <= TOP;
								cnt <= 0;
								//BEEP_flag<=2'b10;
                    end
						  else begin
							   position <= initpos + (3*cnt*cnt)>>DIV- (initvelo * cnt) >>IDE;
								cnt <= cnt + 1;
								//BEEP_flag <= 2'b00;
						  end
                end
					 default://???????
						begin
							cnt <= 0;
							position <= 0;
							initpos <= home;
							state <= DOWN; 
							initvelo <= 0;
							//BEEP_flag <= 0;
						end
            endcase
        end
    end

endmodule