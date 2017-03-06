`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 04:04:40 PM
// Design Name: 
// Module Name: Mux2x1_4bits
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


module Mux2x1_4bits(
    input s,
    input [5:0] d1,
    input [5:0] d2,
    output [5:0] dout
    );
    assign dout = (s == 1'b0) ? d1 : d2;
endmodule
