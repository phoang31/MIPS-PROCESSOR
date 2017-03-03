`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 07:28:57 PM
// Design Name: 
// Module Name: MUX_4x1
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


module MUX_4x1(
    input [15:0] in1,
    input [15:0] in2,
    input [15:0] in3,
    input [15:0] in4,
    input [1:0] sel,
    output [15:0] out
    );
    wire [15:0]mux1out;
    wire [15:0]mux2out;
    Mux_2x1 m1 (sel[0], in4, in3, mux1out); 
    Mux_2x1 m2 (sel[0], in2, in1, mux2out);
    Mux_2x1 m3 (sel[1], mux1out, mux2out, out);
endmodule
