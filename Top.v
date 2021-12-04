`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:15:14 AM
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Verilog code for top module of whack-a-mole
module Top(
    input           clock_i,
    input           reset_i,
    input   [3:0]   buttons_i,
    input   [15:0]  switches_i,
    output  [15:0]  LEDs_o,
    output  [3:0]   display_select_o,
    output  [6:0]   display_out_o
    );
    
    wire        clock_1Hz_int;
    wire        clock_5Hz_int;
    wire        clock_10Hz_int;
    wire        clock_14MHz_int;
    wire [1:0]  mode_int;
    wire        whacked_int;
    //wire [3:0]  thousands_int;
    //wire [3:0]  hundreds_int;
    //wire [3:0]  tens_int;
    //wire [3:0]  ones_int;
    //wire [3:0]  display_int;
    //wire [3:0] display_out_int;
    
    reg         active_clock_int;

    ClockDivider clkdivide(clock_i, ~reset_i, clock_1Hz_int, clock_5Hz_int, clock_10Hz_int, clock_14MHz_int);
    ModeSelection modeselect(buttons_i, mode_int);
    
    always @ (*) begin
        case(mode_int)
            2'b01: active_clock_int = clock_1Hz_int;
            2'b10: active_clock_int = clock_5Hz_int;
            2'b11: active_clock_int = clock_10Hz_int;
            default: active_clock_int = 1'b0;
        endcase
    end //always
    
    MoleHandler molesetup(active_clock_int, clock_14MHz_int, ~reset_i, whacked_int, LEDs_o);
    WhackHandler whacking(~reset_i, LEDs_o, switches_i, whacked_int);
    
    //CountDownHandler countdown();
    //ScoreHandler scoring();
        
    //if (~off)
    //
    //  if (in_game or post_game) display_int = score;
    //  else if (in_count_down) display_int = count;
    //
    //  B2BCD b2bcd(display_int, thousands_int, hundreds_int, tens_int, ones_int);
    //  SSDControl ssdctrl(clock_i, reset_i, thousands_int, hundreds_int, tens_int, ones_int, display_select_o, display_out_int);
    //  BCD2SSD bcd2ssd(display_out_int, display_out_o);
    //
    // else
    //
    //  display_select = 4'b1111;
    //  display_out = 7'b1111111;
    //
    // end
    
endmodule
