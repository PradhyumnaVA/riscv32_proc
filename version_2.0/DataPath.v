`include "RegFile.v"
`include "ALU.v"
`include "sign_ext.v"
`include "PC_B_J.v"
`include "loadExt.v"
// `include "mux_2.v"

module DataPath (
    input clk,rst,
    input [31:0]instr,PC,Result,
    input reg_write, ALUSrc, Loadsrc,
    input [1:0] ImmSrc,
    input [3:0] ALUcontrol,
    output Zflag,
    output [31:0] ALUresult, PCTarget, WriteData
);

    wire [31:0]mux_wire;
    wire [31:0]srcA,srcB;
    wire [31:0]ImmExt;
    wire [31:0]ext_out, mux_ext_out;

    RegFile rf(
        .WE3(reg_write), 
        .clk(clk), 
        .rst(rst), 
        .A1(instr[19:15]), 
        .A2(instr[24:20]), 
        .A3(instr[11:7]), 
        .WD3(mux_ext_out), 
        .RD1(srcA), 
        .RD2(mux_wire)
    );

    sign_extend sExt(
        .InstrD(instr), 
        .ImmSrcD(ImmSrc), 
        .ImmExtD(ImmExt)
    );

    mux_2 src_sel(
        .a(mux_wire),
        .b(ImmExt),
        .sel(ALUSrc),
        .y(srcB)
    );

    ALU alu_path(
        .rs1(srcA), 
        .rs2(srcB), 
        .ALUcontrol(ALUcontrol), 
        .ALUresult(ALUresult), 
        .Zflag(Zflag)
        );

    PC_B_J pcPath(
        .PCin(PC),
        .ImmExtIn(ImmExt),
        .PCTarget(PCTarget)
    );

    loadExt extender(
        .y(Result),
        .funct3(instr[14:12]),
        .writeD(ext_out)
    );

    mux_2 ext_sel(
        .a(Result),
        .b(ext_out),
        .sel(Loadsrc),
        .y(mux_ext_out)
    );

    assign WriteData=mux_wire;

endmodule