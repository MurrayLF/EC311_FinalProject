`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:23:00 AM
// Design Name: 
// Module Name: ClockDivider
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


// Verilog implementation of 100MHz to 1Hz, 5Hz, 10Hz
module ClockDivider(
    input clock_i,
    input reset_i,
    output reg clock_1Hz_o,
    output reg clock_5Hz_o,
    output reg clock_10Hz_o,
    output reg clock_14MHz_o
    );
    
    reg [27:0]count_1Hz;
    reg [27:0]count_5Hz;
    reg [27:0]count_10Hz;
    reg [2:0]count_14MHz;
    
    parameter divisor_1Hz = 28'd100000000;
    parameter divisor_5Hz = 28'd20000000;
    parameter divisor_10Hz = 28'd10000000;
    parameter divisor_14MHz = 3'd7;
   
    always @ (posedge clock_i) begin
        if (reset_i == 0) begin
            count_1Hz = 28'd0;
            count_5Hz = 28'd0;
            count_10Hz = 28'd0;
            count_14MHz = 3'd0;
        end else begin
        
            if (count_1Hz >= divisor_1Hz/2) begin
                clock_1Hz_o = 1'b1;
            end else begin
                clock_1Hz_o = 1'b0;
            end //else
            if (count_5Hz >= divisor_5Hz/2) begin
                clock_5Hz_o = 1'b1;
            end else begin
                clock_5Hz_o = 1'b0;
            end //else
            if (count_10Hz >= divisor_10Hz/2) begin
                clock_10Hz_o = 1'b1;
            end else begin
                clock_10Hz_o = 1'b0;
            end //else
            if (count_14MHz >= divisor_14MHz/2) begin
                clock_14MHz_o = 1'b1;
            end else begin
                clock_14MHz_o = 1'b0;
            end //else
            
            count_1Hz = count_1Hz + 1;
            count_5Hz = count_5Hz + 1;
            count_10Hz = count_10Hz + 1;
            count_14MHz = count_14MHz + 1;
            
            if (count_1Hz == divisor_1Hz) begin
                count_1Hz <= 28'd0;
            end //if
            if (count_5Hz == divisor_5Hz) begin
                count_5Hz <= 28'd0;
            end //if
            if (count_10Hz == divisor_10Hz) begin
                count_10Hz <= 28'd0;
            end //if
            if (count_14MHz == divisor_14MHz) begin
                count_14MHz <= 3'd0;
            end //if
        end //else
    end//always
endmodule
