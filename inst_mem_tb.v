module inst_mem_tb ();
    reg clk;
    reg reset;
    wire [31:0]instr;

    
    inst_control UUT(clk,reset,instr);

   
    initial
    begin
        clk =0;
        reset = 1'b0;
        #20 reset = 1'b1;
        #200 reset = 1'b0;
        #100 reset = 1'b1;
    end
    
    initial
    #150 $finish;
    
    always #20 clk = ~clk;

endmodule
