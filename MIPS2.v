`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2017 12:46:28 PM
// Design Name: 
// Module Name: MIPS2
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


module MIPS2(
   // input clk,
    output [5:0] PCO,
    output [15:0] R1,
    output [15:0] R2,
    output [15:0] R3
    );
reg clk;
    initial
    begin
    clk = 0; 
    //PCI = 0;
    end
    
    always
    begin
    #5 clk = !clk;
    //#5 PCI = PCI + 1;
    end    
//PC
wire [5:0] pcin, pcadd4,pcoffset,pc4; //pcin goes to PC, pcadd4= pcout+4;
PC pc1(pcin, clk, PCO);               //pc4 = pcadd4 at 2nd stage  
assign pcadd4 = PCO + 1;              //pcoffset = pc4 + const offset
wire pcsrc;                         //pcsrc control signal for pc input
assign pcin = (pcsrc)?pcoffset:pcadd4;
//INSTRUCTION MEMORY
wire [15:0] inst; //inst is instruction read from instruction mem
InstrMem instmem1(PCO, inst);
//IF/ID
wire [15:0] Idecode;                    //Idecode is instruction decoded
IF if1(clk,pcadd4,inst,pc4,Idecode);    //at stage 2   
//BEGINNING STAGE 2
wire [15:0] extended;
//SIGN EXTEND
SignExtend signE( Idecode[3:0],extended );
assign pcoffset =  pc4 + extended;
assign pcsrc = branch & (A != B);
//CONTROL
//control signals at stage 2 intruction decode
wire alusrc, regwrite, memread, memwrite, memtoreg, regdest, branch;
wire [2:0] aluop;
Control controller(
                    Idecode[15:12],
                    alusrc,
                    regwrite,
                    memread,
                    memwrite,
                    memtoreg,
                    regdest,
                    branch,
                    aluop
                    );
//REGISTER FILE
wire [15:0] A,B,C;
wire regwrite5;             //THIS SIGNAL COMES OUT OF STAGE 3 WB
wire [3:0] writeAddr;       //this signal also comes out of stage 3 WB

reg_file regfile (   A,       //read data 1
                     B,      //read data 2
                     C,         //write data
                    Idecode[11:8],      //read address
                    Idecode[7:4],      //read address
                    writeAddr,    //wrtie address
                    regwrite5,            //write
                    0,            //clear. assuming not clearing
                    clk,
                   R1, R2, R3);       


//   ID/EX
//control signals coming out of EX in stage 3
wire alusrc3, regwrite3, memread3, memwrite3, memtoreg3, regdest3, branch3;
wire [2:0] aluop3;
wire [15:0] A3,B3,extended3;
wire [3:0] writeAddr3_1, writeAddr_3_2;
EX EX1(    
        regwrite, memread, memwrite,branch, memtoreg,regdest,alusrc,
        A,
        B,
        extended,
        Idecode[3:0],
        Idecode[7:4],
        aluop,
        regwrite3, memread3, memwrite3, branch3, memtoreg3,regdest3,alusrc3,
        A3,
        B3,
        extended3,
        writeAddr3_1,
        writeAddr3_2,
        aluop3,
        clk);

//STARTING STAGE 3 - EXECUTION       
//ALU
wire [15:0] aluin2,aluout;
Mux_2x1 alumux(alusrc3, B3, extended3, aluin2);
wire zero,gt,slt,ov,cout;
ALU alu1(
            A3,
            aluin2,
            aluout,
            slt,
            zero, 
            gt,
            ov, 
            aluop3);
       
wire [3:0] writeAddr3;
assign writeAddr3 = (regdest3)? writeAddr3_1:writeAddr3_2;
//EX/MEM
wire branch4, memread4,memwrite4,zero4,regwrite4,memtoreg4;
wire [3:0] writeAddr4;
wire [15:0] aluout4, B3_4;
MEM datamem( 
               clk,
               branch3, memread3,memwrite3,zero,regwrite3,memtoreg3,
               aluout,
               B3,
               writeAddr3,
               branch4, memread4,memwrite4,zero4,regwrite4,memtoreg4,
               aluout4,
               B3_4,
               writeAddr4  
                 );
//STARTING STAGE 4 MEMORY READ
//and branchcheck(pcsrc, branch4, zero4);
//DATA MEMORY
wire [15:0] readdata;
DataMem datam1(
                    readdata,       //data out
                    B3_4,         //write data in
                    aluout4,      //read address UPDATED
                    memwrite4,            //write
                    memread4,             //read
                    clk                //clock
                );
//WB
wire memtoreg5;
wire [15:0] aluout5, readdata5;
WB wb(
        clk,
        regwrite4, memtoreg4,
        readdata,
        aluout4,
        writeAddr4,
        regwrite5, memtoreg5,
        readdata5,
        aluout5,
        writeAddr
    );
//STARTING SSTAGE 5
Mux_2x1 memtoregMux(memtoreg5, readdata5, aluout5,C);

endmodule
