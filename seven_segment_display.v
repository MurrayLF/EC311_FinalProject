`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 12:27:27 AM
// Design Name: 
// Module Name: seven_segment_display
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


module seven_segment_display(
    input [3:0] display_out,
    output reg [6:0] DigitN
    );
    
    always @(*) begin
        case (display_out)
            4'b0000: DigitN = 7'b1;
            4'b0001: DigitN = 7'b1001111;
            4'b0010: DigitN = 7'b0010010;
            4'b0011: DigitN = 7'b0000110;
            4'b0100: DigitN = 7'b1001100;
            4'b0101: DigitN = 7'b0100100;
            4'b0110: DigitN = 7'b0100000;
            4'b0111: DigitN = 7'b0001111;
            4'b1000: DigitN = 7'b0000000;
            4'b1001: DigitN = 7'b0001100;
            4'b1010: DigitN = 7'b0001000;
            4'b1011: DigitN = 7'b0000000;
            4'b1100: DigitN = 7'b0110001;
            4'b1101: DigitN = 7'b0000001;
            4'b1110: DigitN = 7'b0110000;
            4'b1111: DigitN = 7'b0111000;
        endcase
    end  
endmodule
