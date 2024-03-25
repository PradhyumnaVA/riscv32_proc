module LOAD_type_tb();
reg clk,rst;
// wire [31:0] ALUresult;
wire Zflag;

Load_type DUT(.clk(clk), .rst(rst), .Zflag(Zflag));

initial begin
    clk=1;rst=1;
    #6 rst = 0;
    #50 $finish;
end

always #5 clk = ~clk;
initial begin
    $dumpfile("load.vcd");
    $dumpvars;
end

endmodule
