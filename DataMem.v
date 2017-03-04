`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 02:35:17 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    output reg [15:0] A,       //data out
    input [15:0] C,         //write data in
    input [15:0] Aaddr,      //read address UPDATED
 //   input [3:0] Caddr,    //write address
    input load,            //write
    input read,             //read
 //   input clear,            //reset       UPDATED
    input clk               //clock
);
//this register will stores values for ALU operation
reg[15:0] regs[63:0];        //UPDATED 


//assigning initial valies for all registers
    initial begin
    regs[0] = 9;
    regs[1] = 8;
    regs[2] = 7;
    regs[3] = 6;
    regs[4] = 5;
    regs[5] = 4;
    regs[6] = 3;
    regs[7] = 2;
    regs[8] = 1;
    regs[9] = 10;
    regs[10] = 12;
    regs[11] = 13;
    regs[12] = 14;
    regs[13] = 15;
    regs[14] = 16;
    regs[15] = 20;
    end

always @(posedge clk) begin
        if(load) begin
            regs[Aaddr] <= C;
        end
           
end

always@(*) begin
if(read) begin A = regs[Aaddr]; end
else begin A = 16'bz; end
end

endmodule
