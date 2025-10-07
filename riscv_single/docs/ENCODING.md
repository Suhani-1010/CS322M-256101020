# Instruction Encoding for RVX10 Extensions
provide in the assignment files. with extension in the ALU control from 3 bits to 5bits

---

## Base RV32I Recap
| Instruction | opcode   | funct3 | funct7    | ALUControl |
|-------------|----------|--------|-----------|------------|
| ADD         | 0110011  | 000    | 0000000   | 00000      |
| SUB         | 0110011  | 000    | 0100000   | 00001      |
| AND         | 0110011  | 111    | 0000000   | 00010      |
| OR          | 0110011  | 110    | 0000000   | 00011      |
| XOR         | 0110011  | 100    | 0000000   | 00100      |
| SLT         | 0110011  | 010    | 0000000   | 00101      |
| SLL         | 0110011  | 001    | 0000000   | 00110      |
| SRL         | 0110011  | 101    | 0000000   | 00111      |

---

## RVX10 Custom-0 Extensions
All RVX10 instructions use **CUSTOM-0 opcode = 0001011**  
Control logic maps them to ALUOp = `11`.

| Instruction | opcode   | funct3 | funct7   | ALUControl | Operation                          |
|-------------|----------|--------|----------|------------|------------------------------------|
| ANDN        | 0001011  | 000    | 0000000  | 01000      | rs1 AND (NOT rs2)                 |
| ORN         | 0001011  | 001    | 0000000  | 01001      | rs1 OR (NOT rs2)                  |
| XNOR        | 0001011  | 010    | 0000000  | 01010      | NOT(rs1 XOR rs2)                  |
| MIN         | 0001011  | 000    | 0000001  | 01011      | min(rs1, rs2) signed              |
| MAX         | 0001011  | 001    | 0000001  | 01100      | max(rs1, rs2) signed              |
| MINU        | 0001011  | 010    | 0000001  | 01101      | min(rs1, rs2) unsigned            |
| MAXU        | 0001011  | 011    | 0000001  | 01110      | max(rs1, rs2) unsigned            |
| ROL         | 0001011  | 000    | 0000010  | 01111      | rotate left                       |
| ROR         | 0001011  | 001    | 0000010  | 10000      | rotate right                      |
| ABS         | 0001011  | 000    | 0000011  | 10001      | absolute value of rs1              |

---

