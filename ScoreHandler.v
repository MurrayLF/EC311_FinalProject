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


module ScoreHandler(
    input whacked,
    input reset,
    output reg [15:0] score
    );
    
    always @ (whacked or reset) begin
        if (reset == 0) score = 16'b0;
        else if (whacked)score = score + 1;
    end 
endmodule
