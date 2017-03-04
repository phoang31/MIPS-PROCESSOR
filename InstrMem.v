`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 01:38:59 PM
// Design Name: 
// Module Name: InstrMem
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


module InstrMem(
    input [5:0] PCI,
    output reg [15:0] OUT
    );
//what should be put in here? 
//maybe 5 stages of pipeline?
    reg[7:0] inst[0:15];
    assign OUT = inst[PCI];
    initial begin
    //add r0,r1,r2
    inst[0] = 16'b0010000100100000;
    //sub r3,r4,r5
    inst[1] = 4'h6453;
    //and r6,r7,r8
    inst[2] = 4'h0786;
    //or r9,r10,r11
    inst[3] = 4'h1ab9;
    //slt r12, r13, r14
    inst[4] = 4'h7dec;
    //lw r15,6(r1);
    inst[5] = 4'h81f6;
    //sw r2,10(r3)
    inst[6] = 4'ha32a;
    //bne r6,r7,-2
    inst[7] = 4'he76e;
    end
endmodule
