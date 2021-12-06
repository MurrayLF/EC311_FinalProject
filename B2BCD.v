`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 06:28:20 PM
// Design Name: 
// Module Name: B2BCD
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

// Verilog implementation for binary to BCD conversion
module B2BCD(
    input [15:0]binary_i,
    output reg [3:0]thousands_o,
    output reg [3:0]hundreds_o,
    output reg [3:0]tens_o,
    output reg [3:0]ones_o
    );
    
    integer i;
    always @ (binary_i) begin
        thousands_o = 4'b0;
        hundreds_o = 4'b0;
        tens_o = 4'b0;
        ones_o = 4'b0;
        
        for (i = 15; i >= 0; i = i - 1) begin
            if (thousands_o >= 4'd5) thousands_o = thousands_o + 4'd3;
            if (hundreds_o >= 4'd5) hundreds_o = hundreds_o + 4'd3;
            if (tens_o >= 4'd5) tens_o = tens_o + 4'd3;
            if (ones_o >= 4'd5) ones_o = ones_o + 4'd3;
            
            thousands_o = thousands_o << 1;
            thousands_o[0] = hundreds_o[3];
            hundreds_o = hundreds_o << 1;
            hundreds_o[0] = tens_o[3];
            tens_o = tens_o << 1;
            tens_o[0] = ones_o[3];
            ones_o = ones_o << 1;
            ones_o[0] = binary_i[i];
        end //for
    end //always
endmodule


