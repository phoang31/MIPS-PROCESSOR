`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2017 05:07:46 PM
// Design Name: 
// Module Name: PC_Adder
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


module unsigned_Adder(
    input Cin,
    input [15:0] x,
    input [15:0] y,
    output [15:0] out,
    output Cout,
    output OV
    );
    
    wire [15:1] c;      //Internal Wires
    wire [15:0] yxorCin;
    
    assign yxorCin = Cin ^ y;
    
    full_adder FA0(Cin, x[0], yxorCin[0], out[0], c[1]);
    full_adder FA1(c[1], x[1], yxorCin[1], out[1], c[2]);
    full_adder FA2(c[2], x[2], yxorCin[2], out[2], c[3]);
    full_adder FA3(c[3], x[3], yxorCin[3], out[3], c[4]);
    full_adder FA4(c[4], x[4], yxorCin[4], out[4], c[5]);
    full_adder FA5(c[5], x[5], yxorCin[5], out[5], c[6]);
    full_adder FA6(c[6], x[6], yxorCin[6], out[6], c[7]);
    full_adder FA7(c[7], x[7], yxorCin[7], out[7], c[8]);
    full_adder FA8(c[8], x[8], yxorCin[8], out[8], c[9]);
    full_adder FA9(c[9], x[9], yxorCin[9], out[9], c[10]);
    full_adder FA10(c[10], x[10], yxorCin[10], out[10], c[11]);
    full_adder FA11(c[11], x[11], yxorCin[11], out[11], c[12]);
    full_adder FA12(c[12], x[12], yxorCin[12], out[12], c[13]);
    full_adder FA13(c[13], x[13], yxorCin[13], out[13], c[14]);
    full_adder FA14(c[14], x[14], yxorCin[14], out[14], c[15]);
    full_adder FA15(c[15], x[15], yxorCin[15], out[15], Cout);
    
    xor(OV, Cout, c[15]);
endmodule
