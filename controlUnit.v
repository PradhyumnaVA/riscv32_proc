module controlUnit (
    input [2:0] funct3,
    input [6:0] funct7,
    input [6:0] op,
    output reg [3:0] ALUcontrol,
    output reg [1:0] ImmSrc,
    output reg reg_write
);

localparam [6:0]R_TYPE  = 7'b0110011,
                I_TYPE  = 7'b0010011,
                STORE   = 7'b0100011,
                LOAD    = 7'b0000011,
                BRANCH  = 7'b1100011,
                JALR    = 7'b1100111,
                JAL     = 7'b1101111,
                AUIPC   = 7'b0010111,
                LUI     = 7'b0110111;

always @(funct3,funct7,op) begin
    case (op)
        //R-Type instruction
        R_TYPE :begin
            reg_write <= 1;
            case (funct3)
                0: begin
                    if (funct7 == 7'd32) begin
                        ALUcontrol <= 4'b0001;
                    end
                    else ALUcontrol <= 4'b0000;
                end
                7: ALUcontrol <= 4'b0010;
                6: ALUcontrol <= 4'b0011;
                1: ALUcontrol <= 4'b0100;
                5: ALUcontrol <= 4'b0101;
                4: ALUcontrol <= 4'b0111;
                2: ALUcontrol <= 4'b1000; 
            endcase
        end

        LOAD :begin
            reg_write<=1;
            ALUcontrol<=4'b0000;
            ImmSrc<=2'b00;
        end
    endcase
end
endmodule