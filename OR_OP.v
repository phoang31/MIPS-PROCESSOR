`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2017 05:43:45 PM
// Design Name: 
// Module Name: OR_OP
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


module OR_OP(
    output [15:0] O,
    input [15:0] Rs,
    input [15:0] Rt
    );
    
    or(O[0], RS[0], RT[0]);
    or(O[1], RS[1], RT[1]);
    or(O[2], RS[2], RT[2]);
    or(O[3], RS[3], RT[3]);
    or(O[4], RS[4], RT[4]);
    or(O[5], RS[5], RT[5]);
    or(O[6], RS[6], RT[6]);
    or(O[7], RS[7], RT[7]);
    or(O[8], RS[8], RT[8]);
    or(O[9], RS[9], RT[9]);
    or(O[10], RS[10], RT[10]);
    or(O[11], RS[11], RT[11]);
    or(O[12], RS[12], RT[12]);
    or(O[13], RS[13], RT[13]);
    or(O[14], RS[14], RT[14]);
    or(O[15], RS[15], RT[15]); 
    
endmodule
