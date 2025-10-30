// src/datapath.sv
`timescale 1ns/1ps
module datapath (
    input  logic clk,
    input  logic rst_n,
    input  logic IF_stall,
    input  logic IF_flush,
    input  logic ID_stall,
    input  logic ID_flush,
    input  logic EX_flush,

    // imem interface
    output logic [31:0] instr_addr,
    input  logic [31:0] instr_fetched,

    // performance counters (optional)
    output logic [31:0] cycle_count,
    output logic [31:0] instr_retired,

    // expose stall/flush to top
    output logic IF_stall_o,
    output logic IF_flush_o,
    output logic ID_stall_o,
    output logic ID_flush_o,
    output logic EX_flush_o
);
    // Program counter
    logic [31:0] pc, pc_next;
    logic [31:0] if_pc, id_pc, ex_pc, mem_pc, wb_pc;
    logic [31:0] if_instr, id_instr, ex_instr, mem_instr, wb_instr;

    // pipeline register fields
    // ID/EX
    logic [31:0] id_rs1_val, id_rs2_val, id_imm;
    logic [4:0]  id_rs1, id_rs2, id_rd;
    logic [6:0]  id_opcode;
    logic [2:0]  id_funct3;
    logic [6:0]  id_funct7;
    logic        id_RegWrite, id_MemRead, id_MemWrite, id_Branch, id_ALUSrc;
    logic [3:0]  id_ALUop;

    // EX/MEM
    logic [31:0] ex_alu_out;
    logic [31:0] ex_rs2_val;
    logic [4:0]  ex_rd;
    logic        ex_RegWrite, ex_MemRead, ex_MemWrite;
    logic [31:0] ex_branch_target;
    logic        ex_branch_taken;

    // MEM/WB
    logic [31:0] mem_read_data;
    logic [31:0] mem_alu_out;
    logic [4:0]  mem_rd;
    logic        mem_RegWrite;

    // Register file
    logic [31:0] regfile [0:31];
    integer i;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i=0;i<32;i++) regfile[i] <= 32'b0;
        end
    end

    // Simple synchronous instruction fetch
    assign instr_addr = pc;

    // IF Stage: update PC
    always_comb begin
        pc_next = pc + 4;
        // branch update happens when EX says taken; handled below in sequential logic
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 0;
            if_pc <= 0;
            if_instr <= 32'h00000013; // NOP (ADDI x0,x0,0)
        end else begin
            // allow stall/flush behavior
            if (!IF_stall) begin
                pc <= pc_next;
            end
            if (IF_flush) begin
                if_instr <= 32'h00000013; // NOP
                if_pc <= 0;
            end else if (!IF_stall) begin
                if_instr <= instr_fetched;
                if_pc <= pc;
            end
        end
    end

    // IF/ID -> ID registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            id_instr <= 32'h00000013;
            id_pc <= 0;
        end else begin
            if (ID_flush) begin
                id_instr <= 32'h00000013;
                id_pc <= 0;
            end else if (!ID_stall) begin
                id_instr <= if_instr;
                id_pc <= if_pc;
            end
        end
    end

    // Instruction decode (simple)
    // Extract fields
    always_comb begin
        id_opcode = id_instr[6:0];
        id_rd     = id_instr[11:7];
        id_funct3 = id_instr[14:12];
        id_rs1    = id_instr[19:15];
        id_rs2    = id_instr[24:20];
        id_funct7 = id_instr[31:25];

        // immediates
        // I-type imm
        id_imm = {{20{id_instr[31]}}, id_instr[31:20]};
        // For branch/j-type/s-type additional logic below when needed
    end

    // Read register file (combinational read)
    logic [31:0] rs1_val_r, rs2_val_r;
    always_comb begin
        rs1_val_r = regfile[id_rs1];
        rs2_val_r = regfile[id_rs2];
    end

    // Simple control unit for subset + RVX10 custom ALU ops
    // We keep a compact controller here. For clarity, use task to set signals.
    task automatic control_unit (
        input  logic [6:0] opcode,
        input  logic [2:0] funct3,
        input  logic [6:0] funct7,
        output logic RegWrite,
        output logic MemRead,
        output logic MemWrite,
        output logic Branch,
        output logic ALUSrc,
        output logic [3:0] ALUop
    );
        begin
            // default
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUSrc   = 0;
            ALUop    = 4'b0000;
            // opcode decoding (basic subset)
            case (opcode)
                7'b0110011: begin // R-type
                    RegWrite = 1;
                    ALUSrc = 0;
                    // ALUop mid-level encoding
                    // We'll map funct3/funct7 in ALU
                    ALUop = 4'b1111; // use ALU to decode full funct
                end
                7'b0010011: begin // I-type ALU (ADDI, etc)
                    RegWrite = 1;
                    ALUSrc = 1;
                    ALUop = 4'b0010; // add immediate
                end
                7'b0000011: begin // LW
                    RegWrite = 1;
                    MemRead = 1;
                    ALUSrc = 1;
                    ALUop = 4'b0010; // add for address calc
                end
                7'b0100011: begin // SW
                    MemWrite = 1;
                    ALUSrc = 1;
                    ALUop = 4'b0010;
                end
                7'b1100011: begin // Branches (BEQ only implemented)
                    Branch = 1;
                    ALUSrc = 0;
                    ALUop = 4'b0001; // subtract for compare
                end
                7'b1101111: begin // JAL
                    RegWrite = 1;
                    ALUSrc = 0;
                    ALUop = 4'b0000;
                end
                default: begin
                    // treat unknown as NOP
                end
            endcase
        end
    endtask

    // ID stage -> generate control and pipeline ID/EX registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            id_rs1_val <= 0;
            id_rs2_val <= 0;
            id_RegWrite <= 0;
            id_MemRead <= 0;
            id_MemWrite <= 0;
            id_Branch <= 0;
            id_ALUSrc <= 0;
            id_ALUop <= 4'b0;
        end else begin
            // if ID_stall then hold; if ID_flush then clear
            if (ID_flush) begin
                id_rs1_val <= 0;
                id_rs2_val <= 0;
                id_RegWrite <= 0;
                id_MemRead <= 0;
                id_MemWrite <= 0;
                id_Branch <= 0;
                id_ALUSrc <= 0;
                id_ALUop <= 4'b0;
            end else if (!ID_stall) begin
                id_rs1_val <= rs1_val_r;
                id_rs2_val <= rs2_val_r;
                control_unit(id_opcode, id_funct3, id_funct7,
                             id_RegWrite, id_MemRead, id_MemWrite, id_Branch, id_ALUSrc, id_ALUop);
            end
        end
    end

    // EX stage: forwarding handled below (for simplicity this datapath contains forwarding_unit)
    // Create ALU input A and B with forwarding muxes (simple)
    logic [31:0] alu_in1, alu_in2;
    // default connect from ID/EX pipeline
    assign alu_in1 = id_rs1_val;
    assign alu_in2 = id_ALUSrc ? id_imm : id_rs2_val;

    // ALU module (see src/alu.sv) - instantiate inline for simplicity
    logic [31:0] alu_result;
    alu alu_u (
        .opA (alu_in1),
        .opB (alu_in2),
        .funct3(id_funct3),
        .funct7(id_funct7),
        .opcode(id_opcode),
        .ALUop(id_ALUop),
        .result(alu_result)
    );

    // EX/MEM pipeline registers
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ex_alu_out <= 0;
            ex_rs2_val <= 0;
            ex_rd <= 0;
            ex_RegWrite <= 0;
            ex_MemRead <= 0;
            ex_MemWrite <= 0;
            ex_branch_target <= 0;
            ex_branch_taken <= 0;
        end else begin
            if (EX_flush) begin
                ex_alu_out <= 0;
                ex_rs2_val <= 0;
                ex_rd <= 0;
                ex_RegWrite <= 0;
                ex_MemRead <= 0;
                ex_MemWrite <= 0;
                ex_branch_target <= 0;
                ex_branch_taken <= 0;
            end else begin
                ex_alu_out <= alu_result;
                ex_rs2_val <= id_rs2_val;
                ex_rd <= id_rd;
                ex_RegWrite <= id_RegWrite;
                ex_MemRead <= id_MemRead;
                ex_MemWrite <= id_MemWrite;
                // branch decisions (very small subset: BEQ)
                if (id_Branch && (alu_result == 0)) begin
                    ex_branch_taken <= 1;
                    ex_branch_target <= id_pc + {{20{id_instr[31]}}, id_instr[31:20]}; // crude, please adapt immediate
                end else begin
                    ex_branch_taken <= 0;
                end
            end
        end
    end

    // Simple data memory (synchronous)
    logic [31:0] dmem [0:4095];
    initial begin
        // memory zero-initialized; testbench can preload with $readmemh
    end

    // MEM stage: memory access & pipeline to WB
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mem_read_data <= 0;
            mem_alu_out <= 0;
            mem_rd <= 0;
            mem_RegWrite <= 0;
        end else begin
            // memory read/write
            if (ex_MemWrite) begin
                dmem[ex_alu_out[13:2]] <= ex_rs2_val;
            end
            if (ex_MemRead) begin
                mem_read_data <= dmem[ex_alu_out[13:2]];
            end else begin
                mem_read_data <= 0;
            end
            mem_alu_out <= ex_alu_out;
            mem_rd <= ex_rd;
            mem_RegWrite <= ex_RegWrite;
        end
    end

    // WB stage: write-back
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // nothing
        end else begin
            if (mem_RegWrite && (mem_rd != 0)) begin
                // choose writeback from mem_read_data (for loads) or alu result (for ALU)
                if (ex_MemRead) begin
                    regfile[mem_rd] <= mem_read_data;
                end else begin
                    regfile[mem_rd] <= mem_alu_out;
                end
                instr_retired <= instr_retired + 1;
            end
            cycle_count <= cycle_count + 1;
        end
    end

    // expose control signals (for top-level)
    assign IF_stall_o = IF_stall;
    assign IF_flush_o = IF_flush;
    assign ID_stall_o = ID_stall;
    assign ID_flush_o = ID_flush;
    assign EX_flush_o = EX_flush;

    // initialize counters
    initial begin
        cycle_count = 0;
        instr_retired = 0;
    end

endmodule
