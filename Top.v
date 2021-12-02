﻿`timescale 1ns / 1ps
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




module Top(clock_i, reset_i, buttons_i, switches_i, LEDs_o);//, SSD_o);
    input           clock_i;
    input           reset_i;
    input   [3:0]   buttons_i;
    input   [15:0]  switches_i;
    output  [15:0]  LEDs_o;
    //output  [6:0]   SSD_o;
    
    wire        clock_1Hz_int;
    wire        clock_5Hz_int;
    wire        clock_10Hz_int;
    wire        clock_14MHz_int;
    wire [1:0]  mode_int;
    wire        whacked_int;
    
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


endmodule