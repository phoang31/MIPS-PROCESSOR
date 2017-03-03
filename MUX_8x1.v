`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 07:38:39 PM
// Design Name: 
// Module Name: MUX_8x1
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


module MUX_8x1(
    input [15:0] in1,
    input [15:0] in2,
    input [15:0] in3,
    input [15:0] in4,
    input [15:0] in5,
    input [15:0] in6,
    input [15:0] in7,
    input [15:0] in8,
    input [2:0] sel,
    output [15:0] out
    );
    wire [15:0]mux1out;
    wire [15:0]mux2out;
    MUX_4x1 m1(in4, in3, in2, in1, sel[1:0], mux1out);
    MUX_4x1 m2(in8, in7, in6, in5,  sel[1:0], mux2out);
    Mux_2x1 m3(sel[2], mux1out, mux2out, out);
    
endmodule
