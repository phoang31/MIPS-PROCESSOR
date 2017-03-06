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


module IF(
    input clk,
    input [5:0] pcadd4,
    input [15:0] inst,
    output reg [5:0] newpc,
    output reg [15:0] instout
    );
    always@(posedge clk) begin
        newpc <= pcadd4;
        instout <= inst;      
    end 
    
    
endmodule
