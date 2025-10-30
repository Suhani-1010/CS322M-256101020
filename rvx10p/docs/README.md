# RVX10-P — Five-Stage Pipelined RISC-V Core (RV32I + RVX10)

This repository contains a five-stage pipelined RISC-V core that implements RV32I plus a 10-instruction custom ALU extension (RVX10). The design was developed to satisfy the CS322M assignment "RVX10-P — Five-Stage Pipelined Implementation of the RVX10 Core".

## Repository layout
- `src/` — SystemVerilog sources
  - `riscvpipe.sv` — top-level
  - `datapath.sv` — datapath + pipeline regs + memories
  - `alu.sv` — ALU with RVX10 operations
  - `hazard_unit.sv` — load-use stall detection
  - `forward_unit.sv` — forwarding mux logic
- `tb/`
  - `tb_pipe.sv` — self-checking testbench
- `test/`
- `encoding.md` - RVX10‑P Instruction Encoding
  - `rvx10_pipe.hex` — instructions
- `docs/`
  - `REPORT.md` — design notes
  
## How to run (iverilog + gtkwave)
1. Install iverilog and gtkwave (Ubuntu):
2. Compile:
3. Place your assembled instruction memory image at `test/rvx10_pipe.hex` and ensure `tb` reads it.
4. Run:



