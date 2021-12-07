`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 02:42:29 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(clk, rst, out);

  input clk;
  input rst;
  output reg [3:0] out;

  wire feedback;

  assign feedback = ~(out[3] ^ out[2]);

   always @(posedge clk or negedge rst) begin
       if(rst == 0) out <= 4'b0000;
       out = {out[2:0],feedback};
    end
endmodule
