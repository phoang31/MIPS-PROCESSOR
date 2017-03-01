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
    output reg [15:0] A,       //read data 1
    output reg [15:0] B,      //read data 2
    input [15:0] C,         //write data
    input [3:0] Aaddr,      //read address
    input [3:0] Baddr,      //read address
    input [3:0] Caddr,    //wrtie address
    input Load,            //write
    input clear,            //reset
    input clk               //clock
    );
    //this register will stores values for ALU operation
    reg[15:0] regs[0:15];
    assign A = regs[Aaddr];
    assign B = regs[Baddr];
    
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
        if(clear) begin
            regs[0] <= 0;
            regs[1] <= 0;
            regs[2] <= 0;
            regs[3] <= 0;
            regs[4] <= 0;
            regs[5] <= 0;
            regs[6] <= 0;
            regs[7] <= 0;
            regs[8] <= 0;
            regs[9] <= 0;
            regs[10] <= 0;
            regs[11] <= 0;
            regs[12] <= 0;
            regs[13] <= 0;
            regs[14] <= 0;
            regs[15] <= 0;
                    end
        else begin
            if(write) begin
                regs[Caddr] <= C;
                end
                end
     end
endmodule
