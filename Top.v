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
    output  [6:0]   display_out_o,
    output reset_int
    );
    
    wire        clock_1Hz_int;
    wire        clock_2Hz_int;
    wire        clock_5Hz_int;
    wire        clock_14MHz_int;
    wire [1:0]  mode_int;
    //wire        mode_change;
    wire        whacked_int;
    wire [1:0]  mode_selected;
    wire [3:0]  thousands_int;
    wire [3:0]  hundreds_int;
    wire [3:0]  tens_int;
    wire [3:0]  ones_int;
    wire [3:0]  display_out_int;
    wire [15:0]  counttime_int;
    wire [15:0]  counttime_int2;
    wire [15:0] gamescore_int;
    //wire        reset_int;
    wire [1:0]  game_state;
    reg         active_clock_int;
    reg  [1:0]  mode_selected_int;
    reg  [15:0] display_int;
    wire [3:0]  display_select_int;
    wire [6:0]  display_out_int2;
    reg  [3:0]  display_select_int2;
    reg  [6:0]  display_out_int3;

    ClockDivider clkdivide(clock_i, ~reset_i, clock_1Hz_int, clock_2Hz_int, clock_5Hz_int, clock_14MHz_int);
    ModeSelection modeselect(clock_i, buttons_i, mode_int);
    
    always @ (*) begin
        case(mode_int)
            2'b01: active_clock_int = clock_1Hz_int;
            2'b10: active_clock_int = clock_2Hz_int;
            2'b11: active_clock_int = clock_5Hz_int;
            default: active_clock_int = 1'b0;
        endcase
    end //always
    
    ResetHandler resetornot(clock_i, reset_i, mode_int, reset_int);
    
    TimeControl timer(clock_1Hz_int, reset_int, counttime_int, game_state);
    CountConverter convert(counttime_int, counttime_int2);
    //In-game
    //MoleHandler molesetup(active_clock_int, clock_14MHz_int, reset_int, whacked_int, LEDs_o);
    //WhackHandler whacking(clock_i, reset_int, LEDs_o, switches_i, whacked_int);
    //In-game & postgame
    //ScoreHandler scoring(clock_i, whacked_int, reset_int, gamescore_int);


    //always @ (mode_selected or counttime_int or gamescore_int) begin
    //    if (mode_selected == 2'b01) display_int = counttime_int;
    //    else if (mode_selected == 2'b10 || mode_selected == 2'b11) display_int = gamescore_int;
        //else if (mode_selected_int == 2'b11) display _int
    //end //always
    //display_int
    B2BCD b2bcd(counttime_int2, thousands_int, hundreds_int, tens_int, ones_int);
    SSDControl ssdctrl(clock_i, reset_i, thousands_int, hundreds_int, tens_int, ones_int, display_select_int, display_out_int);
    BCD2SSD bcd2ssd(display_out_int, display_out_int2);
    
    always @ (mode_int or display_select_int or display_out_int2) begin
        if (mode_int == 2'b00) begin
            display_select_int2 <= 4'b1111;
            display_out_int3 <= 7'b1111111;
        end else
            display_select_int2 <= display_select_int;
            display_out_int3 <= display_out_int2;
   end //always
   
   assign display_select_o = display_select_int2;
   assign display_out_o = display_out_int3;
   
endmodule



