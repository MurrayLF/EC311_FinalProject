`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 04:49:13 PM
// Design Name: 
// Module Name: CountDownHandler
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


module CountDownHandler(
    input clock,
    input reset,
    output reg [7:0] count
    );
    
    always @(negedge reset or clock) begin
        if (reset == 0) begin // active low reset
            count <= 8'd5;
        end else if (clock && count != 0) begin
            count <= count - 8'b1;
        end else
            count <= count;
    end 
         
endmodule
