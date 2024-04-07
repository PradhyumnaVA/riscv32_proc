`include "instr_mem.v"
// `include "mux_2.v"

module inst_control(
input clk,
input rst,
input [1:0]PCsrc,
input [31:0]PCTarget,
input [31:0] ALUresult,
output [31:0] instr, 
output reg [31:0] PCplus4, PC
);
wire [31:0] PCnext;

instr_mem ins(rst,PC, instr); 
mux_3 pc_sel(
    .a(PCplus4), 
    .b(PCTarget),
    .c(ALUresult), 
    .sel(PCsrc), 
    .y(PCnext)
    );

always @(posedge clk, posedge rst)
    begin
        if(rst)  
        PC <= 0;
        else
        PC <= PCnext; 
    end

always @(PC) begin
    PCplus4 <= PC+4;
end

endmodule