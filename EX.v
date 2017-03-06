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


module EX(
    input regwrite, memread, memwrite,branch, memtoreg,regdst,alusrc,
    input [15:0] data1,
    input [15:0] data2,
    input [15:0] offset,
    input [3:0] regdest1,
    input [3:0] regdest2,
    input [2:0] aluop,
    output reg regwriteout, memreadout, memwriteout, branchout, memtoregout,regdstout,alusrcout,
    output reg [15:0] data1out,
    output reg [15:0] data2out,
    output reg [15:0] offsetout,
    output reg [3:0] regdest1out,
    output reg [3:0] regdest2out,
    output reg [2:0] aluopout,
    input clk
    );
    always@(posedge clk) begin
   
    
    regwriteout <= regwrite;
    memreadout <= memread;
    memwriteout <= memwrite;
    branchout <= branch;
    memtoregout <= memtoreg;
    regdstout <= regdst;
    alusrcout <= alusrc;
    data1out <= data1;
    data2out <= data2;
    offsetout <= offset;
    regdest1out <= regdest1;
    regdest2out <= regdest2;    
    aluopout <= aluop;
    
   
    end   
    
endmodule