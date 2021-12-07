`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:15:14 AM
// Design Name: 
// Module Name: TimeControl
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

//Verilog code for control of the time
module TimeControl(
    input clock_1Hz_i,
    input reset_i,
    output reg [15:0]count_o,
    output reg [1:0]state_o
    );
    
    always @ (posedge clock_1Hz_i or negedge reset_i) begin
        if (reset_i == 1'b0) begin
            count_o = 16'b0;
        end else if(count_o < 16'd36) begin
            count_o = count_o + 1'b1;
        end // else
    end // always

    always @ (*) begin
        if (count_o <= 16'd5) state_o = 2'b01;
        else if (count_o <= 16'd35) state_o = 2'b10;
        else state_o = 2'b11;
    end //always
endmodule
