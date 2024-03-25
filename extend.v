`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 06:02:56 PM
// Design Name: 
// Module Name: extend
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


module extend(
input [31:7] instr,
output reg [31:0] immext,
input [1:0] immsrc
    );

    always @(*) begin
    case(immsrc)
        2'b00:  immext = {{20{instr[31]}}, instr[31:20]};
        2'b01:   immext = {{20{instr[31]}}, instr[31:25], instr[11:7]};      
    endcase 
end

endmodule
