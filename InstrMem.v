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
    output [15:0] OUT
    );
//what should be put in here? 
//maybe 5 stages of pipeline?
    reg[15:0] inst[15:0];
    assign OUT = inst[PCI[3:0]];
    initial begin
/*  //add R4,R2,R0
    inst[0] = 16'h2204;
    //LOOP: add R3,R3,R1          
    inst[1] = 16'h2313;
    //noop
    inst[2] = 16'hf000;
    //sub R4,R4,R5
    inst[3] = 16'h6454;
    //noop
    inst[4] = 16'hf000;
    //noop
    inst[5] = 16'hf000;
    //bne R2,R4,LOOP
    inst[6] = 16'he24a;
    //noop
    inst[7] = 16'hf000;
    //noop
    inst[8] = 16'hf000;
    //noop
    inst[9] = 16'hf000;
    //noop
    inst[10] = 16'hf000;
    
    inst[11] = 16'hf000;
    //nop
    inst[12] = 16'hf000;
    //noop
    inst[13] = 16'hf000;
    //noop
    inst[14] = 16'hf000;
    //noop
    inst[15] = 16'hf000;
*/
    //add R4,R2,R1
    inst[0] = 16'h2213;
        inst[11] = 16'hf000;
    //nop
    inst[1] = 16'hf000;
    //noop
    inst[2] = 16'hf000;
    //noop
    inst[3] = 16'hf000;
    //noop
    inst[4] = 16'hf000;
        inst[7] = 16'hf000;
    //noop
    inst[5] = 16'hf000;
    //noop
    inst[6] = 16'hf000;
    //noop
    inst[7] = 16'hf000;
   
    inst[8] = 16'hf000;
      //noop
    inst[9] = 16'hf000;
      //noop
    inst[10] = 16'hf000;    

    inst[11] = 16'hf000;
    //nop
    inst[12] = 16'hf000;
    //noop
    inst[13] = 16'hf000;
    //noop
    inst[14] = 16'hf000;
    //noop
    inst[15] = 16'hf000;
    end
endmodule
