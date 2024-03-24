module top_tb();
reg [31:0]instr,rs1, rs2;
wire [31:0] ALUresult;
wire Zflag;

top DUT(.instr(instr), .rs1(rs1), .rs2(rs2), .ALUresult(ALUresult), .Zflag(Zflag));

initial begin
    instr = 32'h0062E233;
    rs1 = 32'd2; rs2 = 32'd1;
    #10 $finish;
end

initial begin
    $dumpfile("top.vcd");
    $dumpvars;
end

endmodule