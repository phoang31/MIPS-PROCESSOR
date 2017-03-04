`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2017 01:11:32 PM
// Design Name: 
// Module Name: Control
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


module Control(
    input [3:0] op,
    output reg alusrc,
    output reg regwrite,
    output reg memread,
    output reg memwrite,
    output reg memtoreg,
    output reg regdest,
    output reg branch,
    output reg [2:0] aluop
    );
    
    initial begin
    
    alusrc = 0;
    regwrite = 0;
    memread = 0;
    memwrite = 0;
    memtoreg = 0;
    regdest = 0;
    branch = 0;
    aluop = 0;
    
    end
    
    always@(*) begin
        if(op == 4'h2) begin    //2 = add
        
        alusrc = 0;         //seelct reg read 2
        regwrite = 1;       //allow writing to reg
        memread = 0;        //no read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 1;       // not writing anything from memory
        regdest = 0;        //select rd- inst[3:0]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        
        else if(op == 4'h6) begin    //6 = subtract
        
        alusrc = 0;         //seelct reg read 2
        regwrite = 1;       //allow writing to reg
        memread = 0;        //no read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 1;       // not writing anything from memory
        regdest = 0;        //select rd- inst[3:0]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        else if(op == 4'h0) begin    //0 = and
        
        alusrc = 0;         //seelct reg read 2
        regwrite = 1;       //allow writing to reg
        memread = 0;        //no read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 1;       // not writing anything from memory
        regdest = 0;        //select rd- inst[3:0]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        else if(op == 4'h1) begin    //1 = or
        
        alusrc = 0;         //seelct reg read 2
        regwrite = 1;       //allow writing to reg
        memread = 0;        //no read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 1;       // not writing anything from memory
        regdest = 0;        //select rd- inst[3:0]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        else if(op == 4'h7) begin    //7 = slt
        
        alusrc = 0;         //seelct reg read 2
        regwrite = 1;       //allow writing to reg
        memread = 0;        //no read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 1;       // not writing anything from memory
        regdest = 0;        //select rd- inst[3:0]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        //need to double check for source of data: write to rd either 1 or 0
        end
        else if(op == 4'h8) begin    //8 = load
        
        alusrc = 1;         //seelct offset after sign extended
        regwrite = 1;       //allow writing to reg
        memread = 1;        //read from mem
        memwrite = 0;       //no write to mem
        memtoreg = 0;       //writing data from memory
        regdest = 1;        //select rt- inst[7:4]
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        else if(op == 4'hA) begin    //A = sw
        
        alusrc = 1;         //seelct offset after sign extended
        regwrite = 0;       //not writing to reg
        memread = 0;        //not reading from mem
        memwrite = 1;       //need to write to mem
        memtoreg = 0;       //dont care
        regdest = 1;        //dont care
        branch = 0;         //no branching
        aluop = 0;          //Austin 
        
        end
        else if(op == 4'hE) begin    // E = bne
        
        alusrc = 0;         //select read data 2
        regwrite = 1;       //not writing to reg
        memread = 0;        //not reading from mem
        memwrite = 0;       //no write to mem
        memtoreg = 0;       //dont care
        regdest = 1;        //dont care
        branch = 1;         //branching
        aluop = 0;          //Austin 
        
        end
        else begin          //no op
        alusrc = 0;         //select read data 2
        regwrite = 0;       //not writing to reg
        memread = 0;        //not reading from mem
        memwrite = 0;       //no write to mem
        memtoreg = 0;       //dont care
        regdest = 0;        //dont care
        branch = 0;         //branching
        aluop = 0;          //Austin        
        
        end
        
    end
    
endmodule
