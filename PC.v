`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 01:21:00 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [5:0] PCI,
    input CLK,
    output reg [5:0] PCO  //need to be reg because it follows the clk signal
    );          //reg stores values
    
initial 
PCO <= 0;   

always@(posedge CLK)

PCO <= PCI;

endmodule
