`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 10:05:37 AM
// Design Name: 
// Module Name: MoleHandler
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

// Verilog implementation handler for mole location
module MoleHandler(
    input active_clock_i,
    input clock_14MHz_i,
    input reset_i,
    input whacked_i,
    output reg [15:0]mole_o
    );
    
    reg [3:0]mole_location_int;
    reg [15:0]mole_int;
    
    always @ (posedge clock_14MHz_i) mole_location_int <= mole_location_int + 1'b1;
    
    always @ (posedge active_clock_i) begin
        if (reset_i == 1'b0) mole_int <= 16'b0;
        else begin
            case (mole_location_int)
                4'b0000: mole_int <= 16'b0000000000000001;
                4'b0001: mole_int <= 16'b0000000000000010; 
                4'b0010: mole_int <= 16'b0000000000000100; 
                4'b0011: mole_int <= 16'b0000000000001000; 
                4'b0100: mole_int <= 16'b0000000000010000; 
                4'b0101: mole_int <= 16'b0000000000100000; 
                4'b0110: mole_int <= 16'b0000000001000000; 
                4'b0111: mole_int <= 16'b0000000010000000; 
                4'b1000: mole_int <= 16'b0000000100000000; 
                4'b1001: mole_int <= 16'b0000001000000000;
                4'b1010: mole_int <= 16'b0000010000000000;
                4'b1011: mole_int <= 16'b0000100000000000;
                4'b1100: mole_int <= 16'b0001000000000000;
                4'b1101: mole_int <= 16'b0010000000000000;
                4'b1110: mole_int <= 16'b0100000000000000;
                4'b1111: mole_int <= 16'b1000000000000000;
            endcase
        end //else
    end //always
    
    always @ (*) begin
        if (whacked_i == 1'b1 | reset_i == 1'b0) mole_o = 16'b0;
        else mole_o = mole_int;
    end //always
endmodule
