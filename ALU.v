`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2017 06:27:31 PM
// Design Name: 
// Module Name: ALU
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
// ALUop(add) = 000
// ALUop(and) = 001
// ALUop(or) =  010
// ALUop(slt) = 011
// ALUop(beq), ALUop(sub) = 100
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [15:0] x,
    input [15:0] y,
    output [15:0] res,
    input Cin,
    output Cout, 
    output SLT,
    output zero, 
    output GT,
    output OV, 
    input [2:0] op
    );
    wire [15:0] muxin [4:0];
    wire [1:0] muxsel;
    
    //computing muxsel from op
    assign muxsel[1]=op[2];
    assign muxsel[0]=op[1];
    
    signed_Adder as1(Cin, op[2], x, y, muxin[0], Cout, OV, zero);
    AND_OP and1(muxin[1], x, y);
    OR_OP or1(muxin[2], x, y);
    slt_16bit slt1(x, y, muxin[3]);
    
    MUX_4x1(muxin[0], muxin[1], ,muxin[2], muxin[3], muxsel, res);
    
    //finds the output for SLT and GT
    or(SLT, muxin[3]);
    nand(GT, SLT, zero);
    
endmodule
