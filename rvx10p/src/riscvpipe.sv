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

    // Instruction memory interface (internal)
    logic [31:0] instr_addr;
    logic [31:0] instr_fetched;

    // Wires for debug/perf
    logic [31:0] cycle_count;
    logic [31:0] instr_retired;

    // Instantiate datapath (contains register file, pipeline regs, ALU, memories)
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

    // Simple instruction memory (icache) - synchronous read
    // Replace with $readmemh image in testbench via $dumpvars / preload
    logic [31:0] imem [0:4095];
    initial begin
        // test image loaded via $readmemh in TB; leave default 0
    end

    assign instr_fetched = imem[instr_addr[13:2]]; // word indexed

    // Hazard and forwarding units live inside datapath; they drive stall/flush outputs
    // For top-level cohesion, datapath generates IF/ID control outputs and hazard signals
    assign IF_stall = dp.IF_stall_o;
    assign IF_flush = dp.IF_flush_o;
    assign ID_stall = dp.ID_stall_o;
    assign ID_flush = dp.ID_flush_o;
    assign EX_flush = dp.EX_flush_o;

endmodule
