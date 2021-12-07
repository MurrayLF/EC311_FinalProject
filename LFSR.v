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

//Verilog code for random number generation
module LFSR(clock_i, reset_i, out_o);

  input clock_i;
  input reset_i;
  output reg [3:0] out_o;

  wire feedback_int;

  assign feedback_int = ~(out_o[3] ^ out_o[2]);

  always @(posedge clock_i or negedge reset_i) begin
    if(reset_i == 0) out_o <= 4'b0000;
    out_o = {out_o[2:0], feedback_int};
  end //always
endmodule
