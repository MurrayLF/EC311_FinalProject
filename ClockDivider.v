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


// Verilog implementation of 100MHz to 0.5Hz, 1Hz, 2Hz, 4Hz, 10Hz
module ClockDivider(
    input clock_i,
    input reset_i,
    output reg clock_05Hz_o,
    output reg clock_1Hz_o,
    output reg clock_2Hz_o,
    output reg clock_4Hz_o,
    output reg clock_10KHz_o
    );
    
    reg [27:0]count_05Hz;
    reg [27:0]count_1Hz;
    reg [27:0]count_2Hz;
    reg [27:0]count_4Hz;
    reg [27:0]count_10KHz;
    
    parameter divisor_05Hz = 28'd200000000;
    parameter divisor_1Hz = 28'd100000000;
    parameter divisor_2Hz = 28'd50000000;
    parameter divisor_4Hz = 28'd25000000;
    parameter divisor_10KHz = 28'd10000;
   
    always @ (posedge clock_i) begin
        if (reset_i == 0) begin
            count_05Hz = 28'd0;
            count_1Hz = 28'd0;
            count_2Hz = 28'd0;
            count_4Hz = 28'd0;
            count_10KHz = 3'd0;
        end else begin
        
            if (count_05Hz >= divisor_05Hz/2) begin
                clock_05Hz_o = 1'b1;
            end else begin
                clock_05Hz_o = 1'b0;
            end //else
            if (count_1Hz >= divisor_1Hz/2) begin
                clock_1Hz_o = 1'b1;
            end else begin
                clock_1Hz_o = 1'b0;
            end //else
            if (count_2Hz >= divisor_2Hz/2) begin
                clock_2Hz_o = 1'b1;
            end else begin
                clock_2Hz_o = 1'b0;
            end //else
            if (count_4Hz >= divisor_4Hz/2) begin
                clock_4Hz_o = 1'b1;
            end else begin
                clock_4Hz_o = 1'b0;
            end //else
            if (count_10KHz >= divisor_10KHz/2) begin
                clock_10KHz_o = 1'b1;
            end else begin
                clock_10KHz_o = 1'b0;
            end //else
            
            count_05Hz = count_05Hz + 1;
            count_1Hz = count_1Hz + 1;
            count_2Hz = count_2Hz + 1;
            count_4Hz = count_4Hz + 1;
            count_10KHz = count_10KHz + 1;
            
            if (count_05Hz == divisor_05Hz) begin
                count_05Hz <= 28'd0;
            end //if
            if (count_1Hz == divisor_1Hz) begin
                count_1Hz <= 28'd0;
            end //if
            if (count_2Hz == divisor_2Hz) begin
                count_2Hz <= 28'd0;
            end //if
            if (count_4Hz == divisor_4Hz) begin
                count_4Hz <= 28'd0;
            end //if
            if (count_10KHz == divisor_10KHz) begin
                count_10KHz <= 3'd0;
            end //if
        end //else
    end//always
endmodule
