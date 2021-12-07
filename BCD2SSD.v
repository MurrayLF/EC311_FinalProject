`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 12:27:27 AM
// Design Name: 
// Module Name: BCD2SSD
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

// Verilog implementation of BCD to SSD conversion
module BCD2SSD(
    input [3:0] display_in,
    output reg [6:0]digit_o
    );
    
    always @(*) begin
        case (display_in)
            4'b0000: digit_o = 7'b0000001;
            4'b0001: digit_o = 7'b1001111;
            4'b0010: digit_o = 7'b0010010;
            4'b0011: digit_o = 7'b0000110;
            4'b0100: digit_o = 7'b1001100;
            4'b0101: digit_o = 7'b0100100;
            4'b0110: digit_o = 7'b0100000;
            4'b0111: digit_o = 7'b0001111;
            4'b1000: digit_o = 7'b0000000;
            4'b1001: digit_o = 7'b0001100;
            default: digit_o = 7'b1111110;
        endcase
    end  
endmodule
