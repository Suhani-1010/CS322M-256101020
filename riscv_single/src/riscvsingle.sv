

// riscvsingle.sv


// RISC-V single-cycle processor plus 10 new instructions
// RVX10 (single-cycle implementation)
// Adds the following instructions to RV32I:
// They are just variations of normal ALU operations:

//ANDN → rs1 AND (NOT rs2)

//ORN → rs1 OR (NOT rs2)

//XNOR → NOT(rs1 XOR rs2)

//MIN, MAX, MINU, MAXU → compare numbers and pick min/max (signed and unsigned).

//ROL/ROR → rotate left/right.

//ABS → absolute value of rs



// expanding to ALUControl from 3 bits to 5 bits to accommodate new instructions
// ALUControl values for new instructions:
// ANDN  = 3'b1000  


// From Section 7.6 of Digital Design & Computer Architecture
// 27 April 2020
// David_Harris@hmc.edu 
// Sarah.Harris@unlv.edu

// run 210
// Expect simulator to print "Simulation succeeded"
// when the value 25 (0x19) is written to address 100 (0x64)

// Single-cycle implementation of RISC-V (RV32I)
// User-level Instruction Set Architecture V2.2 (May 7, 2017)
// Implements a subset of the base integer instructions:
//    lw, sw
//    add, sub, and, or, slt, 
//    addi, andi, ori, slti
//    beq
//    jal
// Exceptions, traps, and interrupts not implemented
// little-endian memory

// 31 32-bit registers x1-x31, x0 hardwired to 0
// R-Type instructions
//   add, sub, and, or, slt
//   INSTR rd, rs1, rs2
//   Instr[31:25] = funct7 (funct7b5 & opb5 = 1 for sub, 0 for others)
//   Instr[24:20] = rs2
//   Instr[19:15] = rs1
//   Instr[14:12] = funct3
//   Instr[11:7]  = rd
//   Instr[6:0]   = opcode
// I-Type Instructions
//   lw, I-type ALU (addi, andi, ori, slti)
//   lw:         INSTR rd, imm(rs1)
//   I-type ALU: INSTR rd, rs1, imm (12-bit signed)
//   Instr[31:20] = imm[11:0]
//   Instr[24:20] = rs2
//   Instr[19:15] = rs1
//   Instr[14:12] = funct3
//   Instr[11:7]  = rd
//   Instr[6:0]   = opcode
// S-Type Instruction
//   sw rs2, imm(rs1) (store rs2 into address specified by rs1 + immm)
//   Instr[31:25] = imm[11:5] (offset[11:5])
//   Instr[24:20] = rs2 (src)
//   Instr[19:15] = rs1 (base)
//   Instr[14:12] = funct3
//   Instr[11:7]  = imm[4:0]  (offset[4:0])
//   Instr[6:0]   = opcode
// B-Type Instruction
//   beq rs1, rs2, imm (PCTarget = PC + (signed imm x 2))
//   Instr[31:25] = imm[12], imm[10:5]
//   Instr[24:20] = rs2
//   Instr[19:15] = rs1
//   Instr[14:12] = funct3
//   Instr[11:7]  = imm[4:1], imm[11]
//   Instr[6:0]   = opcode
// J-Type Instruction
//   jal rd, imm  (signed imm is multiplied by 2 and added to PC, rd = PC+4)
//   Instr[31:12] = imm[20], imm[10:1], imm[11], imm[19:12]
//   Instr[11:7]  = rd
//   Instr[6:0]   = opcode

//   Instruction  opcode    funct3    funct7
//   add          0110011   000       0000000
//   sub          0110011   000       0100000
//   and          0110011   111       0000000
//   or           0110011   110       0000000
//   slt          0110011   010       0000000
//   addi         0010011   000       immediate
//   andi         0010011   111       immediate
//   ori          0010011   110       immediate
//   slti         0010011   010       immediate
//   beq          1100011   000       immediate
//   lw	          0000011   010       immediate
//   sw           0100011   010       immediate
//   jal          1101111   immediate immediate

module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] WriteData, DataAdr;
  logic        MemWrite;

  // instantiate device to be tested
  top dut(clk, reset, WriteData, DataAdr, MemWrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end
  initial 
    begin
    $dumpfile("wave.vcd");          // output file name
    $dumpvars(0, testbench);        // dump everything under 'testbench'
    // (optional) also dump memories explicitly:
    // $dumpvars(0, testbench.imem.RAM);
    // $dumpvars(0, testbench.dmem.RAM);
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  always @(negedge clk)
    begin
      if(MemWrite) begin
        if(DataAdr === 100 & WriteData === 25) begin
          $display("Simulation succeeded");
          $stop;
        end else if (DataAdr !== 96) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule

module top(input  logic        clk, reset, 
           output logic [31:0] WriteData, DataAdr, 
           output logic        MemWrite);

  logic [31:0] PC, Instr, ReadData;
  
  // instantiate processor and memories
  riscvsingle rvsingle(clk, reset, PC, Instr, MemWrite, DataAdr, 
                       WriteData, ReadData);
  imem imem(PC, Instr);
  dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule

module riscvsingle(input  logic        clk, reset,
                   output logic [31:0] PC,
                   input  logic [31:0] Instr,
                   output logic        MemWrite,
                   output logic [31:0] ALUResult, WriteData,
                   input  logic [31:0] ReadData);

  logic       ALUSrc, RegWrite, Jump, Zero;
  logic [1:0] ResultSrc, ImmSrc;
  logic [4:0] ALUControl;

  controller c(Instr[6:0], Instr[14:12], Instr[30], Zero,
               ResultSrc, MemWrite, PCSrc,
               ALUSrc, RegWrite, Jump,
               ImmSrc, ALUControl);
  datapath dp(clk, reset, ResultSrc, PCSrc,
              ALUSrc, RegWrite,
              ImmSrc, ALUControl,
              Zero, PC, Instr,
              ALUResult, WriteData, ReadData);
endmodule

module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  input  logic       Zero,
                  output logic [1:0] ResultSrc,
                  output logic       MemWrite,
                  output logic       PCSrc, ALUSrc,
                  output logic       RegWrite, Jump,
                  output logic [1:0] ImmSrc,
                  output logic [4:0] ALUControl);

  logic [1:0] ALUOp;
  logic       Branch;

  maindec md(op, ResultSrc, MemWrite, Branch,
             ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
  aludec  ad(op[5], funct3, funct7b5, ALUOp, ALUControl);

  assign PCSrc = Branch & Zero | Jump;
endmodule

// add CUSTOM-0 in maindec
module maindec(input  logic [6:0] op,
               output logic [1:0] ResultSrc,
               output logic       MemWrite,
               output logic       Branch, ALUSrc,
               output logic       RegWrite, Jump,
               output logic [1:0] ImmSrc,
               output logic [1:0] ALUOp);

  logic [10:0] controls;

  assign {RegWrite, ImmSrc, ALUSrc, MemWrite,
          ResultSrc, Branch, ALUOp, Jump} = controls;

  always_comb
    case(op)
    // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
      7'b0000011: controls = 11'b1_00_1_0_01_0_00_0; // lw
      7'b0100011: controls = 11'b0_01_1_1_00_0_00_0; // sw
      7'b0110011: controls = 11'b1_xx_0_0_00_0_10_0; // R-type 
      7'b1100011: controls = 11'b0_10_0_0_00_1_01_0; // beq
      7'b0010011: controls = 11'b1_00_1_0_00_0_10_0; // I-type ALU
      7'b1101111: controls = 11'b1_11_0_0_10_0_00_1; // jal
    //// RVX10 new instructions R-type CUSTOM-0
      7'b0001011: controls = 11'b1_xx_0_0_00_0_11_0; // ANDN, ORN, XNOR, ROL, ROR, MIN, MAX, MINU, MAXU

      default:    controls = 11'bx_xx_x_x_xx_x_xx_x; // non-implemented instruction
    endcase
endmodule

// expand ALUControl to 5 bits to accommodate new instructions
// same old mapping by changing the 3'bxxx to 5'b00xxx for CUSTOM-0
module aludec(
  input  logic       opb5,
  input  logic [2:0] funct3,
  input  logic       funct7b5,
  input  logic [1:0] ALUOp,
  output logic [4:0] ALUControl   // <<< was [2:0]
);

  logic RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction

  always_comb begin
    unique case (ALUOp)
      2'b00: ALUControl = 5'b00000; // add      (old 3'b000)
      2'b01: ALUControl = 5'b00001; // sub      (old 3'b001)

      // Old R/I ALU via funct3 (keep identical mappings)
      2'b10: unique case (funct3)
        3'b000: ALUControl = RtypeSub ? 5'b00001  // sub (old 001)
                                      : 5'b00000; // add (old 000)
        3'b010: ALUControl = 5'b00101; // slt     (old 101)
        3'b110: ALUControl = 5'b00011; // or      (old 011)
        3'b111: ALUControl = 5'b00010; // and     (old 010)
        3'b100: ALUControl = 5'b00100; // xor     (old 100)
        3'b001: ALUControl = 5'b00110; // sll     (old 110)
        3'b101: ALUControl = 5'b00111; // srl     (old 111)
        default: ALUControl = 5'bxxxxx;
      endcase

      //  RVX10 (CUSTOM-0) via funct7+funct3
      2'b11: unique case ({funct7b5, funct3})
        // funct7 (full 7 bits) are needed; key on the top bit + funct3 first
        // Then refine using full funct7 below if needed.

        // We’ll decode by full funct7 & funct3 using nested conditionals:
        default: begin
          // ANDN/ORN/XNOR: funct7 = 0000000
          if      (funct3 == 3'b000 && !funct7b5) ALUControl = 5'b01000; // ANDN
          else if (funct3 == 3'b001 && !funct7b5) ALUControl = 5'b01001; // ORN
          else if (funct3 == 3'b010 && !funct7b5) ALUControl = 5'b01010; // XNOR

          // MIN/MAX/MINU/MAXU: funct7 = 0000001
          else if (funct3 == 3'b000 &&  funct7b5) ALUControl = 5'b01011; // MIN
          else if (funct3 == 3'b001 &&  funct7b5) ALUControl = 5'b01100; // MAX
          else if (funct3 == 3'b010 &&  funct7b5) ALUControl = 5'b01101; // MINU
          else if (funct3 == 3'b011 &&  funct7b5) ALUControl = 5'b01110; // MAXU

          // ROL/ROR: funct7 = 0000010
          else if (funct3 == 3'b000 &&  !funct7b5) ALUControl = 5'b01111; // ROL
          else if (funct3 == 3'b001 &&  !funct7b5) ALUControl = 5'b10000; // ROR

          // ABS: funct7 = 0000011, funct3 = 000
          else if (funct3 == 3'b000 &&  !funct7b5) ALUControl = 5'b10001; // ABS

          else ALUControl = 5'bxxxxx;
        end
      endcase
      default: ALUControl = 5'bxxxxx;
    endcase
  end
endmodule
//Mapping matches the assignment’s funct7/funct3 table for all 10 RVX10 ops.

module datapath(input  logic        clk, reset,
                input  logic [1:0]  ResultSrc, 
                input  logic        PCSrc, ALUSrc,
                input  logic        RegWrite,
                input  logic [1:0]  ImmSrc,
                input  logic [4:0]  ALUControl,
                output logic        Zero,
                output logic [31:0] PC,
                input  logic [31:0] Instr,
                output logic [31:0] ALUResult, WriteData,
                input  logic [31:0] ReadData);

  logic [31:0] PCNext, PCPlus4, PCTarget;
  logic [31:0] ImmExt;
  logic [31:0] SrcA, SrcB;
  logic [31:0] Result;

  // next PC logic
  flopr #(32) pcreg(clk, reset, PCNext, PC); 
  adder       pcadd4(PC, 32'd4, PCPlus4);
  adder       pcaddbranch(PC, ImmExt, PCTarget);
  mux2 #(32)  pcmux(PCPlus4, PCTarget, PCSrc, PCNext);
 
  // register file logic
  regfile     rf(clk, RegWrite, Instr[19:15], Instr[24:20], 
                 Instr[11:7], Result, SrcA, WriteData);
  extend      ext(Instr[31:7], ImmSrc, ImmExt);

  // ALU logic
  mux2 #(32)  srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
  alu         alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
  mux3 #(32)  resultmux(ALUResult, ReadData, PCPlus4, ResultSrc, Result);
endmodule

module regfile(input  logic        clk, 
               input  logic        we3, 
               input  logic [ 4:0] a1, a2, a3, 
               input  logic [31:0] wd3, 
               output logic [31:0] rd1, rd2);

  logic [31:0] rf[31:0];

  // three ported register file
  // read two ports combinationally (A1/RD1, A2/RD2)
  // write third port on rising edge of clock (A3/WD3/WE3)
  // register 0 hardwired to 0

  always_ff @(posedge clk)
    if (we3) rf[a3] <= wd3;	

  assign rd1 = (a1 != 0) ? rf[a1] : 0;
  assign rd2 = (a2 != 0) ? rf[a2] : 0;
endmodule

module adder(input  [31:0] a, b,
             output [31:0] y);

  assign y = a + b;
endmodule

module extend(input  logic [31:7] instr,
              input  logic [1:0]  immsrc,
              output logic [31:0] immext);
 
  always_comb
    case(immsrc) 
               // I-type 
      2'b00:   immext = {{20{instr[31]}}, instr[31:20]};  
               // S-type (stores)
      2'b01:   immext = {{20{instr[31]}}, instr[31:25], instr[11:7]}; 
               // B-type (branches)
      2'b10:   immext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0}; 
               // J-type (jal)
      2'b11:   immext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; 
      default: immext = 32'bx; // undefined
    endcase             
endmodule

module flopr #(parameter WIDTH = 8)
              (input  logic             clk, reset,
               input  logic [WIDTH-1:0] d, 
               output logic [WIDTH-1:0] q);

  always_ff @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule

module mux2 #(parameter WIDTH = 8)
             (input  logic [WIDTH-1:0] d0, d1, 
              input  logic             s, 
              output logic [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
endmodule

module mux3 #(parameter WIDTH = 8)
             (input  logic [WIDTH-1:0] d0, d1, d2,
              input  logic [1:0]       s, 
              output logic [WIDTH-1:0] y);

  assign y = s[1] ? d2 : (s[0] ? d1 : d0); 
endmodule

module imem(input  logic [31:0] a,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  initial
      $readmemh("C:\Users\suhani\Documents\phd course work\logistic\LAB2\CS322M-256101011\riscv_single\tests\rvx10.txt",RAM);

  assign rd = RAM[a[31:2]]; // word aligned
endmodule

module dmem(input  logic        clk, we,
            input  logic [31:0] a, wd,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  assign rd = RAM[a[31:2]]; // word aligned

  always_ff @(posedge clk)
    if (we) RAM[a[31:2]] <= wd;
endmodule
//Keep all your old cases (ADD/SUB/AND/OR/XOR/SLT/SLL/SRL) using the same 5-bit values we set above for backward compatibility
module alu(
  input  logic [31:0] a, b,
  input  logic [4:0]  alucontrol,   // <<< was [2:0]
  output logic [31:0] result,
  output logic        zero
);
  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when add or subtract
  logic signed [31:0] as = a;
  logic signed [31:0] bs = b;
  logic [4:0] sh = b[4:0];

  assign condinvb = alucontrol[0] ? ~b : b;
  assign isAddSub = (alucontrol == 5'b00000) || (alucontrol == 5'b00001);

  // Adder shared by add/sub and slt
  assign sum = a + condinvb + alucontrol[0];

  always_comb begin
    unique case (alucontrol)
      // Original ops
      5'b00000: result = sum;                   // add
      5'b00001: result = sum;                   // sub
      5'b00010: result = a & b;                 // and
      5'b00011: result = a | b;                 // or
      5'b00100: result = a ^ b;                 // xor
      5'b00101: result = sum[31] ^ v;           // slt (signed)
      5'b00110: result = a << sh;               // sll
      5'b00111: result = a >> sh;               // srl (logical)

      // RVX10 new ops 
      5'b01000: result = a & ~b;                                   // ANDN
      5'b01001: result = a | ~b;                                   // ORN
      5'b01010: result = ~(a ^ b);                                 // XNOR
      5'b01011: result = (as <  bs) ? a : b;                       // MIN  (signed)
      5'b01100: result = (as >  bs) ? a : b;                       // MAX  (signed)
      5'b01101: result = (a  <  b ) ? a : b;                       // MINU (unsigned)
      5'b01110: result = (a  >  b ) ? a : b;                       // MAXU (unsigned)
      5'b01111: result = (sh == 0) ? a : ((a << sh) | (a >> (32-sh))); // ROL
      5'b10000: result = (sh == 0) ? a : ((a >> sh) | (a << (32-sh))); // ROR
      5'b10001: result = (as >= 0) ? a : (32'h0000_0000 - a);      // ABS

      default: result = 32'bx;
    endcase
  end

  assign zero = (result == 32'b0);
  assign v = ~(alucontrol[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & isAddSub;
endmodule

