`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 02:33:09 PM
// Design Name: 
// Module Name: CountConverter
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


module CountConverter(
    input [15:0]counttime_i,
    output reg [15:0]counttime_o
    );
    
    always @ (*) begin
        if (counttime_i <= 16'd5) counttime_o = 16'd5 - counttime_i;
        else counttime_o = counttime_i - 16'd5;
    end //always
    
endmodule



