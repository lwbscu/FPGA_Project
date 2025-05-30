// =============================================================================
// File: lcd_display.v
// Description: LCD display controller for ballplayer project
// Author: Migrated to Quartus Prime + MAX10
// Date: 2025-05-28
// =============================================================================

module lcd_display(
    input wire clk,
    input wire rst_n,
    input wire [9:0] ball_x,
    input wire [9:0] ball_y,
    input wire [9:0] paddle_x,
    input wire [7:0] score,
    input wire game_over,
    output wire lcd_en,
    output wire lcd_rs,
    output wire lcd_rw,
    output wire [7:0] lcd_data
);

    // LCD parameters
    parameter LCD_WIDTH = 16;   // 16 characters per line
    parameter LCD_HEIGHT = 2;   // 2 lines
    
    // Character codes
    parameter CHAR_SPACE = 8'h20;
    parameter CHAR_BALL = 8'h4F;    // 'O'
    parameter CHAR_PADDLE = 8'h5F;  // '_'
    parameter CHAR_WALL = 8'h7C;    // '|'
    parameter CHAR_0 = 8'h30;
    parameter CHAR_G = 8'h47;
    parameter CHAR_A = 8'h41;
    parameter CHAR_M = 8'h4D;
    parameter CHAR_E = 8'h45;
    parameter CHAR_O = 8'h4F;
    parameter CHAR_V = 8'h56;
    parameter CHAR_R = 8'h52;
    
    // State machine states
    localparam INIT = 4'd0;
    localparam CLEAR_SCREEN = 4'd1;
    localparam DRAW_WALLS = 4'd2;
    localparam DRAW_PADDLE = 4'd3;
    localparam DRAW_BALL = 4'd4;
    localparam DRAW_SCORE = 4'd5;
    localparam DRAW_GAME_OVER = 4'd6;
    localparam UPDATE_DISPLAY = 4'd7;
    localparam WAIT_REFRESH = 4'd8;
    
    // Internal signals
    reg [3:0] state;
    reg [3:0] next_state;
    reg [31:0] refresh_counter;
    reg [4:0] char_index;
    reg [4:0] line_index;
    reg [7:0] current_char;
    reg [6:0] cursor_pos;
    
    // LCD interface signals
    reg init_start;
    wire init_done;
    reg write_enable;
    reg [7:0] write_data;
    reg data_type;  // 0: command, 1: data
    wire write_done;
    
    // LCD submodules
    wire init_lcd_en, init_lcd_rs, init_lcd_rw;
    wire [7:0] init_lcd_data;
    wire write_lcd_en, write_lcd_rs, write_lcd_rw;
    wire [7:0] write_lcd_data;
    
    // Display buffer
    reg [7:0] display_buffer [0:31];  // 16 chars x 2 lines
    
    // LCD initialization module
    lcd_init lcd_init_inst (
        .clk(clk),
        .rst_n(rst_n),
        .start_init(init_start),
        .init_done(init_done),
        .lcd_en(init_lcd_en),
        .lcd_rs(init_lcd_rs),
        .lcd_rw(init_lcd_rw),
        .lcd_data(init_lcd_data)
    );
    
    // LCD write module
    lcd_write lcd_write_inst (
        .clk(clk),
        .rst_n(rst_n),
        .write_enable(write_enable),
        .write_data(write_data),
        .data_type(data_type),
        .write_done(write_done),
        .lcd_en(write_lcd_en),
        .lcd_rs(write_lcd_rs),
        .lcd_rw(write_lcd_rw),
        .lcd_data(write_lcd_data)
    );
    
    // Output multiplexing
    assign lcd_en = init_done ? write_lcd_en : init_lcd_en;
    assign lcd_rs = init_done ? write_lcd_rs : init_lcd_rs;
    assign lcd_rw = init_done ? write_lcd_rw : init_lcd_rw;
assign lcd_data = init_done ? write_lcd_data : init_lcd_data;

// Convert coordinates to LCD positions
wire [3:0] ball_lcd_x = (ball_x >> 6);      // Scale down from 1024 to 16
wire [0:0] ball_lcd_y = (ball_y >> 9);      // Scale down from 512 to 2
wire [3:0] paddle_lcd_x = (paddle_x >> 6);  // Scale down from 1024 to 16
    
    // Initialize display buffer
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1) begin
                display_buffer[i] <= CHAR_SPACE;
            end
        end else begin
            case (state)
                CLEAR_SCREEN: begin
                    for (i = 0; i < 32; i = i + 1) begin
                        display_buffer[i] <= CHAR_SPACE;
                    end
                end
                DRAW_WALLS: begin
                    // Draw side walls
                    display_buffer[0] <= CHAR_WALL;   // Left wall, line 1
                    display_buffer[15] <= CHAR_WALL;  // Right wall, line 1
                    display_buffer[16] <= CHAR_WALL;  // Left wall, line 2
                    display_buffer[31] <= CHAR_WALL;  // Right wall, line 2
                end
                DRAW_PADDLE: begin
                    // Clear previous paddle position
                    for (i = 1; i < 15; i = i + 1) begin
                        if (display_buffer[16 + i] == CHAR_PADDLE) begin
                            display_buffer[16 + i] <= CHAR_SPACE;
                        end
                    end
                    // Draw paddle at new position
                    if (paddle_lcd_x >= 1 && paddle_lcd_x <= 14) begin
                        display_buffer[16 + paddle_lcd_x] <= CHAR_PADDLE;
                    end
                end
                DRAW_BALL: begin
                    // Clear previous ball position
                    for (i = 1; i < 15; i = i + 1) begin
                        if (display_buffer[i] == CHAR_BALL) begin
                            display_buffer[i] <= CHAR_SPACE;
                        end
                        if (display_buffer[16 + i] == CHAR_BALL) begin
                            display_buffer[16 + i] <= CHAR_SPACE;
                        end
                    end                    // Draw ball at new position
                    if (ball_lcd_x >= 1 && ball_lcd_x <= 14) begin
                        if (ball_lcd_y == 0) begin
                            display_buffer[ball_lcd_x] <= CHAR_BALL;
                        end else begin
                            display_buffer[16 + ball_lcd_x] <= CHAR_BALL;
                        end
                    end
                end
                DRAW_SCORE: begin
                    // Display score in top-right corner (simplified)
                    display_buffer[13] <= CHAR_0 + (score / 8'd10);
                    display_buffer[14] <= CHAR_0 + (score % 8'd10);
                end
                DRAW_GAME_OVER: begin
                    if (game_over) begin
                        // Display "GAME OVER" message
                        display_buffer[4] <= CHAR_G;
                        display_buffer[5] <= CHAR_A;
                        display_buffer[6] <= CHAR_M;
                        display_buffer[7] <= CHAR_E;
                        display_buffer[8] <= CHAR_SPACE;
                        display_buffer[9] <= CHAR_O;
                        display_buffer[10] <= CHAR_V;
                        display_buffer[11] <= CHAR_E;
                        display_buffer[12] <= CHAR_R;
                    end
                end
            endcase
        end
    end
    
    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= INIT;
        end else begin
            state <= next_state;
        end
    end
    
    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            INIT: begin
                if (init_done) next_state = CLEAR_SCREEN;
            end
            CLEAR_SCREEN: begin
                next_state = DRAW_WALLS;
            end
            DRAW_WALLS: begin
                next_state = DRAW_PADDLE;
            end
            DRAW_PADDLE: begin
                next_state = DRAW_BALL;
            end
            DRAW_BALL: begin
                next_state = DRAW_SCORE;
            end
            DRAW_SCORE: begin
                if (game_over) begin
                    next_state = DRAW_GAME_OVER;
                end else begin
                    next_state = UPDATE_DISPLAY;
                end
            end
            DRAW_GAME_OVER: begin
                next_state = UPDATE_DISPLAY;
            end
            UPDATE_DISPLAY: begin
                if (char_index >= 32) next_state = WAIT_REFRESH;
            end
            WAIT_REFRESH: begin
                if (refresh_counter >= 32'd2500000) next_state = CLEAR_SCREEN; // 50ms refresh
            end
        endcase
    end
    
    // Control logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            init_start <= 1'b0;
            write_enable <= 1'b0;
            write_data <= 8'h00;
            data_type <= 1'b0;
            char_index <= 5'd0;
            cursor_pos <= 7'd0;
            refresh_counter <= 32'd0;
        end else begin
            case (state)
                INIT: begin
                    if (!init_done) begin
                        init_start <= 1'b1;
                    end else begin
                        init_start <= 1'b0;
                    end
                end
                UPDATE_DISPLAY: begin
                    if (!write_enable && write_done) begin
                        if (char_index < 32) begin
                            // Set cursor position
                            if (char_index == 0) begin
                                write_data <= 8'h80; // Line 1, position 0
                                data_type <= 1'b0;   // Command
                            end else if (char_index == 16) begin
                                write_data <= 8'hC0; // Line 2, position 0
                                data_type <= 1'b0;   // Command
                            end else begin
                                write_data <= display_buffer[char_index];
                                data_type <= 1'b1;   // Data
                            end
                            write_enable <= 1'b1;
                            char_index <= char_index + 1'b1;
                        end
                    end else if (write_enable && write_done) begin
                        write_enable <= 1'b0;
                    end
                end
                WAIT_REFRESH: begin
                    char_index <= 5'd0;
                    if (refresh_counter < 32'd2500000) begin
                        refresh_counter <= refresh_counter + 1'b1;
                    end else begin
                        refresh_counter <= 32'd0;
                    end
                end
                default: begin
                    write_enable <= 1'b0;
                end
            endcase
        end
    end

endmodule
