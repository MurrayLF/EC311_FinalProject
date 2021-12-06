`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 12:47:45 AM
// Design Name: 
// Module Name: SSDControl
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


module SSDControl(
    input clock,
    input reset,
    input [3:0]thousands_i,
    input [3:0]hundreds_i,
    input [3:0]tens_i,
    input [3:0]ones_i,
    output reg [3:0] digit_select,
    output reg [3:0] display_out
    );
    
    // muxes
    always @(posedge clock) begin
        if (reset == 1'b0) begin
            digit_select <= 4'b1110;
            display_out <= ones_i;
        end else begin
            case(digit_select)
                4'b1110: begin
                    digit_select <= 4'b1101;
                    display_out <= tens_i;
                    end
                4'b1101: begin
                    digit_select <= 4'b1011;
                    display_out <= hundreds_i;
                    end
                4'b1011: begin
                    digit_select <= 4'b0111;
                    display_out <= thousands_i;
                    end
                default: begin
                    digit_select <= 4'b1110;
                    display_out <= ones_i;
                    end
            endcase
        end // else
    end // always
    
endmodule


