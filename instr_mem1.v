module instr_mem (
    input  reset,
    input  [31:0] PC,
    output [31:0] instr
);

  reg [31:0] mem [0:31];

initial begin
        $readmemh("program.hex", mem);
end

assign instr = mem[PC[31:2]];

endmodule
