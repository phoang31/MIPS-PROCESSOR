`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 02:26:26 PM
// Design Name: 
// Module Name: GPReg
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


module reg_file(
    output reg [15:0] A,
    output reg [15:0] B,  
    input [15:0] C,      
    input [3:0] Aaddr,
    input [3:0] Baddr,
    input [3:0] Caddr,
    input Load,
    input clear,
    input clk
    );
    //this register will stores values for ALU operation
endmodule
