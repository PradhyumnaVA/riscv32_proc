`include "instr_mem.v"

module inst_control(
input clk,
input reset,
output [31:0] instr
);
reg [31:0] PC = 0;
instr_mem ins(reset,PC, instr); 

always @(posedge clk, posedge reset)
    begin
        if(reset)  
        PC <= 0;
        else
        PC <= PC+4; 
    end
endmodule
