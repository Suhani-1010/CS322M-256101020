# Vending Machine (Mealy FSM)

This project implements a **Mealy finite state machine (FSM)** in Verilog for a vending machine that accepts coins and dispenses an item when the total value reaches 20 units. If an extra 5-unit coin is inserted (total 25), the machine dispenses the item **and returns change**.

---

## 🔹 Problem Statement

* Accepts coins of **5 units** (`coin=01`) and **10 units** (`coin=10`).
* Item costs **20 units**.
* If total reaches 20 → **dispense item**.
* If total reaches 25 → **dispense item + return 5 units change**.
* Any higher amount resets back to 0.
* Reset (`rst`) puts FSM into idle state.

---

## 🔹 Inputs & Outputs

* **Inputs**:

  * `coin` (2-bit): 00 = no coin, 01 = 5-unit coin, 10 = 10-unit coin.
  * `clk`: system clock.
  * `rst`: synchronous, active-high reset.

* **Outputs**:

  * `dispense`: 1 when item is dispensed.
  * `chg5`: 1 when 5-unit change is returned.

---

## 🔹 State Definitions

The FSM tracks balance with 4 states:

* **S0 (00)** → Balance = 0
* **S5 (01)** → Balance = 5
* **S10 (10)** → Balance = 10
* **S15 (11)** → Balance = 15

If balance + new coin ≥ 20 → dispense item and reset to **S0**.

---

## 🔹 State Transition Table

| Current State | Coin Inserted | New Total | Next State | Dispense | Change |
| ------------- | ------------- | --------- | ---------- | -------- | ------ |
| **S0**        | 5             | 5         | S5         | 0        | 0      |
|               | 10            | 10        | S10        | 0        | 0      |
| **S5**        | 5             | 10        | S10        | 0        | 0      |
|               | 10            | 15        | S15        | 0        | 0      |
| **S10**       | 5             | 15        | S15        | 0        | 0      |
|               | 10            | 20        | S0         | 1        | 0      |
| **S15**       | 5             | 20        | S0         | 1        | 0      |
|               | 10            | 25        | S0         | 1        | 1      |

---

## 🔹 State Transition Diagram

```
     +-----+      5      +-----+      5      +-----+
     | S0  | --------->  | S5  | ---------> | S10 |
     +-----+             +-----+            +-----+
       |10                 |10                 |10 → dispense
       v                   v                   
     +-----+      5      +-----+
     |S15  | <------------|     |
     +-----+              
       |10 → dispense+chg5
```

---

## 🔹 How to Run the Program

### 1. Save the code

Save the Verilog module as `vending_mealy.v`.

### 2. Create a Testbench (example `tb_vending_mealy.v`)s

### 3. Compile & Simulate

Using **Icarus Verilog (iverilog)** and **GTKWave**:

```bash
iverilog -o sim.out vending_mealy.v tb_vending_mealy.v
vvp sim.out
gtkwave dump.vcd &
```

### 4. Observe Output

* `dispense` pulses high when balance reaches ≥20.
* `chg5` pulses high only when balance = 25.

---

## ✅ Key Notes

* **Mealy FSM**: Outputs depend on current state + input (coin inserted).
* FSM resets to **S0** after dispense.
* Invalid states (totals > 25) reset to **S0** for safety.


