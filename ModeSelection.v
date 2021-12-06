`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:38:56 AM
// Design Name: 
// Module Name: ModeSelection
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

// Verilog code for selection of mode: off, easy, medium, hard
module ModeSelection(
    input clock_i,
    input [3:0]buttons_i,
    output reg [1:0]mode_o
    );
    
    reg [1:0]mode_int;
       
    always @ (posedge clock_i) begin
        if (buttons_i[3] == 1'b1) mode_int <= 2'b00;
        else begin
            if (buttons_i[2] == 1'b1) mode_int <= 2'b01;
            else if (buttons_i[1] == 1'b1) mode_int <= 2'b10;
            else if (buttons_i[0] == 1'b1) mode_int <= 2'b11;
        end
    end //always
    
    always @ (mode_int) begin
        mode_o <= mode_int;
    end //always
endmodule



