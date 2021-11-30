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
    output reg [15:0] count,
    output reg start
    );
    
    always @(negedge reset or posedge clock) begin
        if (reset == 0) begin // active low reset
            count <= 16'd5;
            start <= 0;
        end else if (clock && count != 0) begin
            count <= count - 16'b1;
            start <= 0;
        end else begin
            count <= count;
            start <= 1;
        end
    end 
         
endmodule
