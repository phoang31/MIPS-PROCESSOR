`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2017 05:17:40 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input Cin,
    input x,
    input y,
    output s,
    output Cout
    );
    wire temp1, temp2, temp3;
    xor(s, x, y, Cin);
    and(temp1, y, Cin);
    and(temp2, x, Cin);
    and(temp3, x, y);
    or(Cout, temp1, temp2, temp3);
endmodule
