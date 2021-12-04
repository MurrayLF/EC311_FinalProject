`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 10:22:27 AM
// Design Name: 
// Module Name: WhackHandler
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

// Verilog implementation of handler for user "whack" (switch) inputs
module WhackHandler(
    input reset_i,
    input [15:0]mole_i,
    input [15:0]hammer_i,
    output reg whacked_o
    );
    
    reg [15:0]prev_hammer_int;
    reg [15:0]strikes_int;
    reg [15:0]hits_int;
    
    always @ (*) begin
        if (reset_i == 0) whacked_o = 1'b0;
        else begin
            strikes_int <= hammer_i ^ prev_hammer_int;
            prev_hammer_int <= hammer_i;
            hits_int <= mole_i & strikes_int;
            if (hits_int != 16'b0) whacked_o = 1'b1;
            else whacked_o = 1'b0;
        end //else
    end //always
endmodule
