`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 12:47:45 AM
// Design Name: 
// Module Name: ssd_control
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


module ssd_control(
    input clock,
    input reset,
    input start,
    input [15:0] score,
    input [15:0] count,
    output reg [3:0] digit_select,
    output reg [3:0] display_out
    );
    
    // if game has started: choose score 
    // otherwise choose countdown
    wire [15:0] num_display;
    assign num_display = (start) ? score:count;
    
    
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
                display_out <= num_display[3:0];
                end
            2'b01: begin
                digit_select <= 4'b1101;
                display_out <= num_display[7:4];
                end
            2'b10: begin
                digit_select <= 4'b1011;
                display_out <= num_display[11:8];
                end
            2'b11: begin
                digit_select <= 4'b0111;
                display_out <= num_display[15:12];
                end
        endcase
    end 
    
endmodule
