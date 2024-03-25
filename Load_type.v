`include "ALU.v"
`include "controlUnit.v"
`include "inst_control.v"
`include "RegFile.v"
`include "sign_ext.v"
`include "dataMem.v"

module Load_type (
    input clk, rst,
    output Zflag 
);

wire [31:0] ALUresult;
wire [31:0]instr;
wire [3:0] ALUcontrol;
wire reg_write, Zflag;
wire [31:0] srcA, srcB;
wire [1:0]ImmSrc;
wire [31:0]ImmExt;
wire [31:0]Wd;
wire [31:0]ReadData;

inst_control inst_path(clk, rst, instr);

sign_extend sExt(instr, ImmSrc, ImmExt);

controlUnit contr_path(instr[14:12], instr[31:25], instr[6:0], ALUcontrol, ImmSrc, reg_write);

ALU alu_path(srcA, ImmExt, ALUcontrol, ALUresult, Zflag);

data_mem d_path(clk, rst, reg_write, ALUresult, Wd, ReadData);

RegFile regfile(.WE3(reg_write), .clk(clk), .rst(rst), .A1(instr[19:15]), .A2(), .A3(instr[11:7]), .WD3(ReadData), .RD1(srcA), .RD2());

endmodule