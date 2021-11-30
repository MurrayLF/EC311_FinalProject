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
    input [7:0] start,// count output from CDH module
    output reg [7:0] score
    );
    
    always @ (whacked) begin
        case(start)
            8'b0: // start game
            score = (whacked) ? score + 1: score;
            default:
            // game hasnt started
            score <= 0;
        endcase
    end 
endmodule
