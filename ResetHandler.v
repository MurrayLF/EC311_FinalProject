`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 02:20:53 PM
// Design Name: 
// Module Name: ResetHandler
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

// Verilog code for internal reset setting
module ResetHandler(
    input clock_i, 
    input reset_i, 
    input [1:0]mode_i,
    input [3:0]buttons_i,
    output reg reset_o
    );
    
    always @ (posedge clock_i) begin
        if (reset_i == 1'b1) reset_o = 1'b0;
        else if (buttons_i != 4'b0000) reset_o = 1'b0;
        else if (mode_i == 2'b00) reset_o = 1'b0;
        else reset_o = 1'b1;
    end //always
    
endmodule
