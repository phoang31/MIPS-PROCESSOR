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
    output [15:0] A,       //read data 1
    output [15:0] B,      //read data 2
    input [15:0] C,         //write data
    input [3:0] Aaddr,      //read address
    input [3:0] Baddr,      //read address
    input [3:0] Caddr,    //wrtie address
    input Load,            //write
    input clear,            //reset
    input clk,              //clock
    output [15:0] R1,R2,R3
    );
    //this register will stores values for ALU operation
    reg[15:0] regs[0:15];

    
    //assigning initial valies for all registers
    initial begin
    regs[0] = 0;
    regs[1] = 2;
    regs[2] = 5;
    regs[3] = 0;   //will store the result
    regs[4] = 1;
    regs[5] = 1;
    regs[6] = 3;
    regs[7] = 2;
    regs[8] = 1;
    regs[9] = 2;
    regs[10] = 4;
    regs[11] = 2;
    regs[12] = 5;
    regs[13] = 5;
    regs[14] = 6;
    regs[15] = 3;
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
            if(Load) begin
                regs[Caddr] <= C;
                end
        end
     end
         assign A = regs[Aaddr];
     assign B = regs[Baddr];
     assign R1 = regs[1];
     assign R2 = regs[2];
     assign R3 = regs[3];
endmodule
