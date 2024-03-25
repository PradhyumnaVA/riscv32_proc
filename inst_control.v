`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 10:24:03 AM
// Design Name: 
// Module Name: inst_control
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


module inst_control(
input clk,
input reset,
output [31:0] instr
);
reg [31:0] PC = 0;
inst_mem inst_mem(reset,PC, instr); 

always @(posedge clk, posedge reset)
    begin
        if(reset == 1)  
        PC <= 0;
        else
        PC <= PC+4; 
    end
endmodule
