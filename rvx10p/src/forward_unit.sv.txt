// src/forwarding_unit.sv
module forwarding_unit (
    input  logic EX_RegWrite,
    input  logic [4:0] EX_rd,
    input  logic MEM_RegWrite,
    input  logic [4:0] MEM_rd,
    input  logic WB_RegWrite,
    input  logic [4:0] WB_rd,
    input  logic [4:0] ID_rs1,
    input  logic [4:0] ID_rs2,
    output logic [1:0] forwardA,
    output logic [1:0] forwardB
);
    // forwardA/B: 00=from regfile, 01=from EX stage (ALU out), 10=from MEM stage (WB or mem)
    always_comb begin
        forwardA = 2'b00;
        forwardB = 2'b00;
        // EX hazard
        if (MEM_RegWrite && (MEM_rd != 0) && (MEM_rd == ID_rs1)) forwardA = 2'b10;
        if (MEM_RegWrite && (MEM_rd != 0) && (MEM_rd == ID_rs2)) forwardB = 2'b10;
        // WB hazard
        if (WB_RegWrite && (WB_rd != 0) && (WB_rd == ID_rs1)) forwardA = 2'b01;
        if (WB_RegWrite && (WB_rd != 0) && (WB_rd == ID_rs2)) forwardB = 2'b01;
    end
endmodule
