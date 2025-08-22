# Sequence Detector (Mealy FSM) — Pattern `1101`

This project implements a **Mealy Finite State Machine (FSM)** in Verilog to detect the overlapping binary sequence `1101` in a serial input stream. The output `y` is asserted high (`1`) for exactly one clock cycle when the sequence is detected.

---

## 🔹 Problem Statement

* Detect sequence `1101` in a serial stream of bits.
* Overlapping sequences should be detected (e.g., input `1101101` should trigger twice).
* Synchronous FSM with **active-high reset**.
* Output `y` goes high **only on the clock cycle when the last `1` of the sequence is received**.

---

## 🔹 State Definitions

The FSM has **4 states** to track prefix matches:

* **S0 (00)** → Initial state, no bits matched yet.
* **S1 (01)** → Saw `1`.
* **S2 (10)** → Saw `11`.
* **S3 (11)** → Saw `110`.

---

## 🔹 State Transition Table

| Current State | Input (`din`) | Next State | Output (`y`) |
| ------------- | ------------- | ---------- | ------------ |
| **S0**        | 0             | S0         | 0            |
|               | 1             | S1         | 0            |
| **S1**        | 0             | S0         | 0            |
|               | 1             | S2         | 0            |
| **S2**        | 0             | S3         | 0            |
|               | 1             | S2         | 0            |
| **S3**        | 0             | S0         | 0            |
|               | 1             | S1         | **1**        |

---

## 🔹 State Transition Diagram

```
   +-----+     1      +-----+     1      +-----+
   | S0  | ---------> | S1  | ---------> | S2  |
   +-----+            +-----+            +-----+
     ^  |0              |0                 |0
     |  v               v                  v
     | S0 <-------------+                 | S3
     +------------------------------------+
                     1 → (y=1) → back to S1
```

---

## 🔹 Simulation Example

For input stream: `1101101`

* Sequence `1101` detected at index 3 → `y=1`
* Sequence `1101` detected again at index 6 → `y=1`

Output `y` waveform will show **pulses** aligned with detections.

---

## 🔹 How to Run the Program

### 1. Save the code

Save the Verilog module as `seq_detect_mealy.v`.

### 2. Create a Testbench (example `tb_seq_detect_mealy.v`)

### 3. Compile & Simulate

Using **Icarus Verilog (iverilog)** and **GTKWave**:

```bash
iverilog -o sim.out seq_detect_mealy.v tb_seq_detect_mealy.v
vvp sim.out
gtkwave dump.vcd &
```

### 4. Observe Output

* In the waveform, `y` will pulse **high (1)** whenever the sequence `1101` is detected.

---

## ✅ Key Notes

* **Mealy FSM**: Output depends on state + input → allows single-cycle detection.
* **Overlap Handling**: After detecting `1101`, FSM returns to `S1` (since last `1` can start a new match).
* **Reset**: Active-high, synchronous.

