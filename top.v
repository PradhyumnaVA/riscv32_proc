`include "ALU.v"
`include "controlUnit.v"

module top (
    input [31:0]instr,
    input [31:0] rs1, rs2,
    output [31:0] ALUresult,
    output Zflag 
);

wire [3:0] ALUcontrol;

controlUnit path(instr[14:12], instr[31:25], instr[6:0], ALUcontrol);
ALU alu_path(rs1, rs2, ALUcontrol, ALUresult, Zflag);

endmodule