`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2017 06:00:16 PM
// Design Name: 
// Module Name: Mux_2x1
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


module Mux_2x1(
    input S,
    input [15:0] D1,
    input [15:0] D2,
    output [15:0] O
    );
    
    assign O = (S == 1'b0) ? D1 : D2;
endmodule
