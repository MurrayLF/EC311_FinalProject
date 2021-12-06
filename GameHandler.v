`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 07:01:05 PM
// Design Name: 
// Module Name: GameHandler
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


module GameHandler(
    input countdown_start,
    input game_start,
    input game_finish, 
    output reg [1:0] game_select
    );
    
    always @ (*) begin
        if (countdown_start == 1) begin
            game_select <= 2'b01;
        end
        if (game_start == 1) begin
            game_select <= 2'b10;
        end
        if (game_finish == 1) begin
            game_select <= 2'b11;
        end //if
    end //always
endmodule
