module loadExt (
    input [31:0]y,
    input [2:0] funct3,
    output reg [31:0] writeD
);
    always @(*) begin
        case (funct3)
            //sign-ext for byte
            0: writeD = {{24{y[7]}},y[7:0]};
            //sign-ext for half-word
            1: writeD = {{16{y[7]}},y[15:0]};
            //zero-ext for  byte
            4: writeD = {{24{1'b0}},y[7:0]};
            ////zero-ext for  half-word
            5: writeD = {{16{1'b0}},y[15:0]};
        endcase
    end
    
endmodule