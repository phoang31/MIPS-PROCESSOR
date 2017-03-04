`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 01:54:19 PM
// Design Name: 
// Module Name: IF
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


module WB(
    input regwrite, memtoreg,
    input [15:0] memdata,
    input [15:0] aluresult,
    input [15:0] regdst,
    output reg regwriteout, memtoregout,
    output reg [15:0] memdataout,
    output reg [15:0] aluresultout,
    output reg [15:0] regdstout
    );
    
    always@(posedge clk) begin
    regwriteout <= regwrite;
    memtoregout <= memtoreg;
    memdataout <= memdata;
    aluresultout <= aluresult;
    regdstout <= regdst;

    end
endmodule