module inst_mem(
    input reset,
    input [31:0] PC,
    output [31:0] instr
);
    reg [7:0] mem[31:0];
   
    assign instr = {mem[PC+3],mem[PC+2],mem[PC+1],mem[PC]};

    
    always @(reset)
    begin
        if(reset == 1)
        begin
            //stack 0
            mem[3] = 8'h33;
            mem[2] = 8'hE2;
            mem[1] = 8'h62;
            mem[0] = 8'h00;
            //stack 1
            mem[7] = 8'h00;
            mem[6] = 8'h00;
            mem[5] = 8'h00;
            mem[4] = 8'h00;
            //stack 2
            mem[11] = 8'h00;
            mem[10] = 8'h00;
            mem[9] = 8'h00;
            mem[8] = 8'h00;
            //stack 3
            mem[15] = 8'h00;
            mem[14] = 8'h00;
            mem[13] = 8'h00;
            mem[12] = 8'h00;
            //stack 4
            mem[19] = 8'h00;
            mem[18] = 8'h00;
            mem[17] = 8'h00;
            mem[16] = 8'h00;
            //stack 5
            mem[23] = 8'h00;
            mem[22] = 8'h00;
            mem[21] = 8'h00;
            mem[20] = 8'h00;
            //stack 6
            mem[27] = 8'h00;
            mem[26] = 8'h00;
            mem[25] = 8'h00;
            mem[24] = 8'h00;
            //stack 7
            mem[31] = 8'h00;
            mem[30] = 8'h00;
            mem[29] = 8'h00;
            mem[28] = 8'h00;
        end
    end

endmodule