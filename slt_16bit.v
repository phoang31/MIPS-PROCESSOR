`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 12:37:45 PM
// Design Name: 
// Module Name: slt_16bit
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


module slt_16bit(
    input [15:0] RS,
    input [15:0] RT,
    output [15:0] LT_O
    );
    
wire [15:0] LT_I;

slt_1bit slt0 (
    .RS(RS[0]),
    .RT(RT[0]),
    .lti(1'b0),
    .lto(LT_I[0])
    );
    
slt_1bit slt1 (
    .RS(RS[1]),
    .RT(RT[1]),
    .lti(LT_I[0]),
    .lto(LT_I[1])
);

slt_1bit slt2 (
    .RS(RS[2]),
    .RT(RT[2]),
    .lti(LT_I[1]),
    .lto(LT_I[2])
    );
    
slt_1bit slt3 (
    .RS(RS[3]),
    .RT(RT[3]),
    .lti(LT_I[2]),
    .lto(LT_I[3])
);        

slt_1bit slt4 (
    .RS(RS[4]),
    .RT(RT[4]),
    .lti(LT_I[3]),
    .lto(LT_I[4])
    );
    
slt_1bit slt5 (
    .RS(RS[5]),
    .RT(RT[5]),
    .lti(LT_I[4]),
    .lto(LT_I[5])
);

slt_1bit slt6 (
    .RS(RS[6]),
    .RT(RT[6]),
    .lti(LT_I[5]),
    .lto(LT_I[6])
    );
    
slt_1bit slt7 (
    .RS(RS[7]),
    .RT(RT[7]),
    .lti(LT_I[6]),
    .lto(LT_I[7])
);

slt_1bit slt8 (
    .RS(RS[8]),
    .RT(RT[8]),
    .lti(LT_I[7]),
    .lto(LT_I[8])
    );
    
slt_1bit slt9 (
    .RS(RS[9]),
    .RT(RT[9]),
    .lti(LT_I[8]),
    .lto(LT_I[9])
);

slt_1bit slt10 (
    .RS(RS[10]),
    .RT(RT[10]),
    .lti(LT_I[9]),
    .lto(LT_I[10])
    );
    
slt_1bit slt11 (
    .RS(RS[11]),
    .RT(RT[11]),
    .lti(LT_I[10]),
    .lto(LT_I[11])
);        

slt_1bit slt12 (
    .RS(RS[12]),
    .RT(RT[12]),
    .lti(LT_I[11]),
    .lto(LT_I[12])
    );
    
slt_1bit slt13 (
    .RS(RS[13]),
    .RT(RT[13]),
    .lti(LT_I[12]),
    .lto(LT_I[13])
);

slt_1bit slt14 (
    .RS(RS[14]),
    .RT(RT[14]),
    .lti(LT_I[13]),
    .lto(LT_I[14])
    );
    
slt_1bit slt15 (
    .RS(RS[15]),
    .RT(RT[15]),
    .lti(LT_I[14]),
    .lto(LT_I[15])
);

assign LT_O = (lt_i[15])? 16'h0001: 16'h0000;
       
endmodule
