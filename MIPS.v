`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 03:03:20 PM
// Design Name: 
// Module Name: MIPS
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


module MIPS(
    input clk,
    output [5:0] PC,
    output [15:0] R1,
    output [15:0] R2,
    output [15:0] R3
    );
    
//STARTING STAGE 1
wire [5:0] pcin;

PC pc1(pcin, clk, PC); 
//assign PC = pcout;  

wire [15:0] inst;
InstrMem mem1(PC, inst);

wire [5:0] pcadd4, newpc;
wire cout;
pcadder pcadder1(PC, 4, pcadd4,cout);
wire [15:0] Idecode;
IF if1(clk,pcadd4,inst,newpc,Idecode);

wire [5:0] pcoffset;
wire pcsrc;
Mux2x1_4bits pcmux(pcsrc,pcoffset, pcadd4, pcin);

//STARTING STAGE 2

wire [5:0] offset;
wire [15:0] extended;
SignExtend ext1( Idecode[3:0],extended );
wire cout2;
pcadder pcadder2(newpc, extended[5:0] << 2 , pcoffset,cout2);

wire [15:0] d1,d2, writedata;
wire [3:0] regdst;
//all control signals
wire alusrc;
wire regwrite3,memread,memwrite,memtoreg,regdest,branch;
wire [2:0] aluop;

reg_file regfile1 ( d1,       //read data 1
                d2,      //read data 2
                writedata,         //write data
                Idecode[11:8],      //read address
                Idecode[7:4],      //read address
                Idecode[3:0],    //wrtie address
                regwrite3,            //write
                0,            //clear. assuming not clearing
                clk);     
                
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
wire regwriteout, memreadout, memwriteout, branchout, memtoregout, regdstout;
wire [15:0] data1out,data2out, extendedout;
wire [3:0] regdest1out,regdest2out;
wire [2:0] aluopout;
EX exc(    
        regwrite, memread, memwrite,branch, memtoreg,regdest,
        d1,
        d2,
        extended,
        Idecode[3:0],
        Idecode[7:4],
        aluop,
        regwriteout, memreadout, memwriteout, branchout, memtoregout,regdstout,
        data1out,
        data2out,
        extendedout,
        regdest1out,
        regdest2out,
        aluopout,
        clk);

//STARTING STAGE 3
wire [15:0] aluin2;
Mux_2x1 alumux(alusrc, data2out, extendedout,aluin2);
wire [3:0] regw1,regw2;
mux2x1_4b regmux(regdstout, regdest1out, regdest2out, regw1);

wire zero, Cin, Cout, SLT, GT, OV;            //NEED TO DEFINE ALU CONTROL
wire [15:0] result;

ALU alu1(
            data1out,
            aluin2,
            result,
 //           Cin,   //WHAT does this come from?
    //        Cout, 
            SLT,
            zero, 
            GT,
            OV, 
            aluopout);
    
wire branchout2, memreadout2,memwriteout2,zeroout,regwriteout2,memtoregout2;           
wire [15:0] resout, dtoM;
MEM m1( 
               clk,
               branchout, memreadout,memwriteout,zero,regwriteout,memtoregout,
               result,
               data2out,
               regw1,
               branchout2, memreadout2,memwriteout2,zeroout,regwriteout2,memtoregout2,
               resout,
               dtoM,
               regw2  
                 );

//STARTING STAGE 3
and bneAnd(pcsrc,branchout2,zeroout);
wire [15:0] dmem;
DataMem datam1(
                    dmem,       //data out
                    dtoM,         //write data in
                    resout,      //read address UPDATED
                    memwriteout2,            //write
                    memreadout2,             //read
                    clk                //clock
                );
wire [15:0] dmem2;
wire [15:0] resout2;
wire memtoregout3;
WB wb1(
        clk,
        regwriteout2, memtoregout2,
        dmem,
        resout,
        regw2,
        regwrite3, memtoregout3,
        dmem2,
        resout2,
        regdst
    );
//STARTING STAGE 4
Mux_2x1 wbmux(
                memtoregout3,
                dmem2,
                resout2,
                writedata
              );
              
assign R1 = data1out;
assign R2 = data2out;
assign R3 = writedata;
endmodule
