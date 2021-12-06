`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 05:11:29 PM
// Design Name: 
// Module Name: ScoreHandler
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

// Verilog code for determination of score
module ScoreHandler(
    input clock,
    input whacked,
    input reset,
    output reg [15:0] score
    );
    
    always @ (posedge clock) begin
        if (reset == 0) score = 16'b0;
        else if (whacked) score = score + 1;
        else score = score;
    end 
endmodule



