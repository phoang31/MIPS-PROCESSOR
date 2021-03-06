`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2017 06:14:29 PM
// Design Name: 
// Module Name: slt
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


module slt_1bit(
    input  RS,
    input RT,
    input lti,
    output lto
    );
    
    assign lto = (RT & ~RS) | (~(RS ^ RT) & lti);
endmodule
