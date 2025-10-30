// src/riscvpipeline.sv
`timescale 1ns/1ps
module riscvpipeline (
    input  logic clk,
    input  logic rst_n
);
    // Top-level wires between controller/datapath/hazard/forwarding
    logic        IF_stall, IF_flush;
    logic        ID_stall, ID_flush;
    logic        EX_flush;

    logic [31:0] instr_addr;
    logic [31:0] instr_fetched;

    logic [31:0] cycle_count;
    logic [31:0] instr_retired;
    datapath dp (
        .clk           (clk),
        .rst_n         (rst_n),
        .IF_stall      (IF_stall),
        .IF_flush      (IF_flush),
        .ID_stall      (ID_stall),
        .ID_flush      (ID_flush),
        .EX_flush      (EX_flush),
        .instr_addr    (instr_addr),
        .instr_fetched (instr_fetched),
        .cycle_count   (cycle_count),
        .instr_retired (instr_retired)
    );

    logic [31:0] imem [0:4095];
    initial begin
    end

    assign instr_fetched = imem[instr_addr[13:2]]; 
    assign IF_stall = dp.IF_stall_o;
    assign IF_flush = dp.IF_flush_o;
    assign ID_stall = dp.ID_stall_o;
    assign ID_flush = dp.ID_flush_o;
    assign EX_flush = dp.EX_flush_o;

endmodule

