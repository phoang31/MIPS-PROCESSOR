`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2017 05:43:45 PM
// Design Name: 
// Module Name: AND_OP
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


module AND_OP(
    output [15:0] O,
    input [15:0] RS,
    input [15:0] RT
    );
    
   and(O[0], RS[0], RT[0]);
   and(O[1], RS[1], RT[1]);
   and(O[2], RS[2], RT[2]);
   and(O[3], RS[3], RT[3]);
   and(O[4], RS[4], RT[4]);
   and(O[5], RS[5], RT[5]);
   and(O[6], RS[6], RT[6]);
   and(O[7], RS[7], RT[7]);
   and(O[8], RS[8], RT[8]);
   and(O[9], RS[9], RT[9]);
   and(O[10], RS[10], RT[10]);
   and(O[11], RS[11], RT[11]);
   and(O[12], RS[12], RT[12]);
   and(O[13], RS[13], RT[13]);
   and(O[14], RS[14], RT[14]);
   and(O[15], RS[15], RT[15]); 
   
endmodule
