`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 05:25:37 PM
// Design Name: 
// Module Name: mux2x1_4b
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


module mux2x1_4b(
    input s,
    input [3:0] d0,
    input [3:0] d1,
    output [3:0] dout
    );   
    assign dout = (s == 1'b0) ? d0 : d1;
endmodule
