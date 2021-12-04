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
    
    // 2-bit counter
    reg [1:0] counter;
    
    always @(posedge clock or negedge reset) begin
        if (reset == 0) begin
            counter <= 0;
        end else if (counter == 2'b11) begin
            counter <= 0;
        end else begin
            counter <= counter + 1'b1;
        end
    end
    
    // muxes
    always @(posedge clock) begin
        case(counter)
            2'b00: begin
                digit_select <= 4'b1110;
                display_out <= ones_i;
                end
            2'b01: begin
                digit_select <= 4'b1101;
                display_out <= tens_i;
                end
            2'b10: begin
                digit_select <= 4'b1011;
                display_out <= hundreds_i;
                end
            2'b11: begin
                digit_select <= 4'b0111;
                display_out <= thousands_i;
                end
        endcase
    end 
    
endmodule
