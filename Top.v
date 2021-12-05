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
    wire        clock_2Hz_int;
    wire        clock_5Hz_int;
    wire        clock_14MHz_int;
    wire [1:0]  mode_int;
    wire        whacked_int;
    wire        countdown_start;
    wire        game_start;
    wire        game_finish;
    wire [1:0]  mode_selected;
    wire [3:0]  thousands_int;
    wire [3:0]  hundreds_int;
    wire [3:0]  tens_int;
    wire [3:0]  ones_int;
    wire [3:0]  display_out_int;
    wire        countdown_start;
    wire [15:0] counttime_int;
    wire [15:0] gamescore_int;
    
    reg         active_clock_int;
    reg [1:0]   mode_selected_int;
    reg [15:0]  display_int;

    ClockDivider clkdivide(clock_i, ~reset_i, clock_1Hz_int, clock_2Hz_int, clock_5Hz_int, clock_14MHz_int);
    ModeSelection modeselect(buttons_i, countdown_start, mode_int);
    
    always @ (*) begin
        case(mode_int)
            2'b01: active_clock_int = clock_1Hz_int;
            2'b10: active_clock_int = clock_2Hz_int;
            2'b11: active_clock_int = clock_5Hz_int;
            default: active_clock_int = 1'b0;
        endcase
    end //always
    
    GameHandler gamehandle(countdown_start, game_start, game_finish, mode_selected);
    CountDownHandler countdown(clock_1Hz_int, reset_i, counttime_int, game_start);
    
    GameTimer gametime(clock_1Hz_int, reset_i, game_finish);
    MoleHandler molesetup(active_clock_int, clock_14MHz_int, ~reset_i, whacked_int, LEDs_o);
    WhackHandler whacking(~reset_i, LEDs_o, switches_i, whacked_int);
    ScoreHandler scoring(whacked_int, game_start, gamescore_int);
    
    /*if (countdown_start == 1) begin
        if (mode_int != 2'b00) begin
            CountDownHandler countdown(clock_1Hz_int, reset_i, gametime_int, game_start);
            if (game_start == 1) begin
                GameTimer gametime(clock_1Hz_int, reset_i, gametime_int, game_finish);
                MoleHandler molesetup(active_clock_int, clock_14MHz_int, ~reset_i, whacked_int, LEDs_o);
                WhackHandler whacking(~reset_i, LEDs_o, switches_i, whacked_int);
            end
        end
    end
     //else
    
     //display_select = 4'b1111;
     //display_out = 7'b1111111;
    
     //end*/

    always @ (mode_selected) begin
        if (mode_selected == 2'b01) display_int = counttime_int;
        else if (mode_selected == 2'b10 || mode_selected == 2'b11) display_int = gamescore_int;
        //else if (mode_selected_int == 2'b11) display _int
    end //always
    
    B2BCD b2bcd(counttime_int, thousands_int, hundreds_int, tens_int, ones_int);
    SSDControl ssdctrl(clock_i, reset_i, thousands_int, hundreds_int, tens_int, ones_int, display_select_o, display_out_int);
    BCD2SSD bcd2ssd(display_out_int, display_out_o);
    
endmodule