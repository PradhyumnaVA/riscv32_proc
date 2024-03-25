module R_type_tb();
reg clk,rst;
wire [31:0] ALUresult;
wire Zflag;

top DUT(.clk(clk), .rst(rst), .ALUresult(ALUresult), .Zflag(Zflag));

initial begin
    clk=1;rst=1;
    #6 rst = 0;
    #50 $finish;
end

always #5 clk = ~clk;
initial begin
    $dumpfile("top.vcd");
    $dumpvars;
end

endmodule
