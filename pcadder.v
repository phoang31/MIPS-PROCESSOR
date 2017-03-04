`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 03:47:11 PM
// Design Name: 
// Module Name: pcadder
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


module pcadder(
   input [5:0] pcin,
   input [5:0] in2,
   output reg [5:0] out,
   output reg cout
   );
   
   wire [5:1] c;      //Internal Wires
   
   full_adder FA0(0,    pcin[0], in2[0], out[0], c[1]);
   full_adder FA1(c[1], pcin[1], in2[1] ,out[1], c[2]);
   full_adder FA2(c[2], pcin[2], in2[2], out[2], c[3]);
   full_adder FA1(c[3], pcin[3], in2[3], out[3], c[4]);
   full_adder FA2(c[4], pcin[4], in2[4], out[4], c[5]);
   full_adder FA3(c[5], pcin[5], in2[5], out[5], cout);
endmodule
