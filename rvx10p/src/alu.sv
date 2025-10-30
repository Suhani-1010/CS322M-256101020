// src/alu.sv
module alu (
    input  logic [31:0] opA,
    input  logic [31:0] opB,
    input  logic [2:0]  funct3,
    input  logic [6:0]  funct7,
    input  logic [6:0]  opcode,
    input  logic [3:0]  ALUop,
    output logic [31:0] result
);
    // For R-type RV32I + RVX10 custom ops
    // Assumed mapping:
    // - RVX10: opcode = 7'b0110011 (R-type), funct7 = 7'b0100000 and use funct3 codes to select the custom op
    // Custom funct3 mapping (example — change to match your single-cycle):
    // funct3:
    // 000 -> ANDN
    // 001 -> ORN
    // 010 -> XNOR
    // 011 -> MIN
    // 100 -> MAX
    // 101 -> MINU
    // 110 -> MAXU
    // 111 -> ROL (use funct7 LSB to differentiate ROR/ABS)
    // For ABS and ROR we use funct7 LSB bit as modifier (example)
    logic [31:0] tmp;
    always_comb begin
        result = 32'b0;
        case (ALUop)
            4'b0010: result = opA + opB; // add / address calc
            4'b0001: result = opA - opB; // sub / compare
            4'b1111: begin // R-type: decode by funct3/funct7
                // Standard R-type ops (simplified)
                if (funct3 == 3'b000 && funct7 == 7'b0000000) result = opA + opB; // ADD
                else if (funct3 == 3'b000 && funct7 == 7'b0100000) result = opA - opB; // SUB
                else begin
                    // custom RVX10 when funct7 == 0100000
                    if (funct7 == 7'b0100000) begin
                        case (funct3)
                            3'b000: result = opA & ~opB;           // ANDN
                            3'b001: result = opA | ~opB;           // ORN
                            3'b010: result = ~(opA ^ opB);         // XNOR
                            3'b011: // MIN signed
                                result = ($signed(opA) < $signed(opB)) ? opA : opB;
                            3'b100: // MAX signed
                                result = ($signed(opA) > $signed(opB)) ? opA : opB;
                            3'b101: // MINU unsigned
                                result = (opA < opB) ? opA : opB;
                            3'b110: // MAXU unsigned
                                result = (opA > opB) ? opA : opB;
                            3'b111: begin // ROL / ROR / ABS (use opB[4:0] as shift amount)
                                // If bit0 of funct7 == 1 -> ROR else ROL; if opB==0xFFFF then ABS
                                if (opB == 32'hFFFF_FFFF) begin
                                    // ABS (example sentinel)
                                    if ($signed(opA) < 0) result = -$signed(opA); else result = opA;
                                end else begin
                                    int sh = opB[4:0];
                                    if (funct7[0] == 1) begin
                                        result = (opA >> sh) | (opA << (32-sh)); // ROR
                                    end else begin
                                        result = (opA << sh) | (opA >> (32-sh)); // ROL
                                    end
                                end
                            end
                            default: result = 32'hDEAD_DEAD;
                        endcase
                    end else begin
                        result = 32'hBAD_FUNK;
                    end
                end
            end
            default: result = 32'h00000013; // NOP fallback
        endcase
    end
endmodule
