module ALU_tb();
reg [31:0] rs1, rs2;
reg [3:0] ALUcontrol;
wire [31:0] ALUresult;
wire Zflag;

ALU DUT(.rs1(rs1), .rs2(rs2), .ALUcontrol(ALUcontrol), .ALUresult(ALUresult), .Zflag(Zflag));

integer i = 0;
initial begin
    rs1 = 32'd2; rs2 = 32'd1;
    ALUcontrol = 4'b0000 ;
    while(i<9) begin
        #5 ALUcontrol = ALUcontrol + 1;
        i = i + 1;
    end
    #10 $finish;
end

 initial begin
    $dumpfile("alu.vcd");
    $dumpvars;
 end

endmodule