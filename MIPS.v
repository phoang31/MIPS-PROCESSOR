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
    input clk,clear,
    output [5:0] pc,
    output [15:0] reg1,
    output [15:0] reg2,
    output [15:0] reg3
    );
    
//STARTING STAGE 1
wire [5:0] pcin, pcout;
PC pc1(pcin, clk, pcout); 
assign pc = pcout;  

wire [15:0] inst;
InstrMem mem1(pcout, inst);

wire [4:0] pcadd4, newpc, cout;
pcadder pcadder1(pcout, 4, pcadd4,cout);
wire [15:0] instout;
IF if1(clk,pcadd4,inst,newpc,instout);

wire [5:0] pcoffset;
wire pcsrc;
Mux2x1_4bits pcmux(pcsrc,pcoffset, pcadd4, pcin);

//STARTING STAGE 2
wire [15:0] Idecode;
wire [5:0] pc4,offset;
wire [5:0] extended;
SignExtend ext1( Idecode[3:0],extended );
pcadder pcadder2(pc4, extended << 2 , pcoffset);

wire [15:0] d1,d2, writedata;
wire [3:0] regdst;
//all control signals
wire alusrc;
wire regwrite,memread,memwrite,memtoreg,regdest,branch;
wire [2:0] aluop;
reg_file reg1 ( d1,       //read data 1
                d2,      //read data 2
                writedata,         //write data
                Idecode[11:8],      //read address
                Idecode[7:4],      //read address
                Idecode[3:0],    //wrtie address
                regwrite,            //write
                clear,            //reset
                clk);     
                
Control controller(
                    Idecode[15-12],
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
wire [3:0] aluopout;
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
wire [3:0] regw1;
mux2x1_4b regmux(regdstout, regdest1out, regdest2out, regw1);

wire zero, Cin, Cout, SLT, GT, OV;            //NEED TO DEFINE ALU CONTROL
wire [15:0] result;
wire [2:0] aluCon;
ALU alu1(
            data1out,
            aluin2,
            result,
            Cin,   //WHAT does this come from?
            Cout, 
            SLT,
            zero, 
            GT,
            OV, 
            aluCon);
    
wire branchout2, memreadout2,memwriteout2,zeroout,regwriteout2,memtoregout2;           
wire [15:0] resout, dtoM;
MEM mem1( 
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
endmodule
