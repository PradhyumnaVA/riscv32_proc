`include "ALU.v"
`include "controlUnit.v"
`include "inst_control.v"
`include "RegFile.v"

module R_type (
    input clk, rst,
    // input [31:0]instr,
    // input [31:0] rs1, rs2,
    output [31:0] ALUresult,
    output Zflag 
);

wire [31:0]instr;
wire [3:0] ALUcontrol;
wire reg_write;
wire [31:0] srcA, srcB;

inst_control inst_path(clk, rst, instr);

RegFile regfile(reg_write, clk, rst, instr[19:15], instr[24:20], instr[11:7], ALUresult, srcA, srcB);

controlUnit contr_path(instr[14:12], instr[31:25], instr[6:0], ALUcontrol, reg_write);

ALU alu_path(srcA, srcB, ALUcontrol, ALUresult, Zflag);

endmodule