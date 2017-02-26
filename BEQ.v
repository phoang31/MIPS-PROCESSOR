`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 01:08:47 PM
// Design Name: 
// Module Name: BEQ
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


module BEQ(
    input [15:0] X,
    input [15:0] Y,
    output isEqual
    );
    wire [15:0] w;
    wire Cout, OV;
    wire isNotZero;
    unsigned_adder BEQ(1'b1, X, Y, w, Cout, OV);
    
    OR(isNotZero, w);
    NOR(isEqual, isNotZero, Cout);
    
endmodule
