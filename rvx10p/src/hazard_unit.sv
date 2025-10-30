// src/hazard_unit.sv
module hazard_unit (
    input  logic ID_MemRead,
    input  logic [4:0] ID_rd,
    input  logic [4:0] IF_rs1,
    input  logic [4:0] IF_rs2,
    output logic stall_IF,
    output logic stall_ID,
    output logic flush_EX
);
    // detect load-use hazard: if ID stage is load and its rd is needed by IF/ID decoded regs
    always_comb begin
        stall_IF = 0;
        stall_ID = 0;
        flush_EX = 0;
        if (ID_MemRead && ((ID_rd == IF_rs1) || (ID_rd == IF_rs2))) begin
            stall_IF = 1;
            stall_ID = 1;
            flush_EX = 1; // bubble EX
        end
    end
endmodule
