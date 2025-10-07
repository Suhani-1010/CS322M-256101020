# Test Plan for RVX10 

 validate the RV32I + RVX10 implementation.

---

## Plan
-
-  correctness of 10 new RVX10 custom instructions (ANDN, ORN, XNOR, MIN, MAX, MINU, MAXU, ROL, ROR, ABS).


---

## Test Structure
- **tool:** Icarus Verilog (iverilog + vvp).  
- **Waveform:** GTKWave with VCD dumps.    
- **Pass/Fail check:** Testbench prints `"Simulation succeeded"` when memory[100] = 25, else `"Simulation failed"`.

---

## Test Cases

### 1.
- **Input program:** `riscvtest.txt`
- **Expected behavior:**
  - Executes new 10 inst. etc.
  - Writes final result 25 to memory address 100 when successed.
  - Testbench prints `"Simulation succeeded"`.

### 2. RVX10 test files in text folder
- **Input program:** `test/rvx10.hex`
- **20 operations as following:**  
  - ANDN, ORN, XNOR  
  - MIN, MAX, MINU, MAXU  
  - ROL, ROR  
  - ABS  
- **Expected behavior:**    
  - Writes final result 25 to memory address 100 when successed.
  - Testbench prints `"Simulation succeeded"`.

---

## Verification Metrics
- **Waveform inspection** for correctness of ALUControl codes (5-bit) and results.  
- **Final memory content** checked against golden expected value.  
- **No warnings** from `$readmemh` once memory indexing corrected.  

---
