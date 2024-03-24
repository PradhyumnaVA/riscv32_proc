module controlUnit (
    input [2:0] funct3,
    input [6:0] funct7,
    input [6:0] op,
    output reg [3:0] ALUcontrol
);

always @(funct3,funct7,op) begin
    case (op)
        //R-Type instruction
        7'b0110011:begin
            case (funct3)
                3'd0: begin
                    if (funct7==7'd32) begin
                        ALUcontrol = 4'b0001;
                    end
                    else ALUcontrol = 4'b0000;
                end
                3'd7: ALUcontrol = 4'b0010;
                3'd6: ALUcontrol = 4'b0011;
                3'd1: ALUcontrol = 4'b0100;
                3'd5: ALUcontrol = 4'b0101;
                3'd4: ALUcontrol = 4'b0111;
                3'd2: ALUcontrol = 4'b1000; 
            endcase
        end 
    endcase
end
endmodule