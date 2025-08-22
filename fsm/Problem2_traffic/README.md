# Traffic Light Controller (FSM)

This project implements a **synchronous finite state machine (FSM)** in Verilog to control a traffic light system with **North-South (NS)** and **East-West (EW)** directions. The design uses a time base (`tick`) to cycle through green, yellow, and red lights.

---

## 🔹 Problem Statement

* Two directions: **North-South** and **East-West**.
* Lights cycle as follows:

  * **NS Green → NS Yellow → EW Green → EW Yellow → (repeat)**
* Timing:

  * NS Green: 5 ticks
  * NS Yellow: 2 ticks
  * EW Green: 5 ticks
  * EW Yellow: 2 ticks
* Reset (`rst`) sets FSM to **NS Green**.
* `tick` is a **1-cycle pulse** from a slower clock divider.

---

## 🔹 State Definitions

The FSM has **4 states**:

* **S\_NS\_G (00)** → North-South Green, East-West Red
* **S\_NS\_Y (01)** → North-South Yellow, East-West Red
* **S\_EW\_G (10)** → East-West Green, North-South Red
* **S\_EW\_Y (11)** → East-West Yellow, North-South Red

---

## 🔹 State Transition Table

| Current State | Ticks Required | Next State | Lights Active     |
| ------------- | -------------- | ---------- | ----------------- |
| **S\_NS\_G**  | 5              | S\_NS\_Y   | NS=Green, EW=Red  |
| **S\_NS\_Y**  | 2              | S\_EW\_G   | NS=Yellow, EW=Red |
| **S\_EW\_G**  | 5              | S\_EW\_Y   | EW=Green, NS=Red  |
| **S\_EW\_Y**  | 2              | S\_NS\_G   | EW=Yellow, NS=Red |

---

## 🔹 State Transition Diagram

```
     +-------+       5 ticks       +-------+       2 ticks
     | S_NS_G| ------------------> | S_NS_Y| ------------------>
     +-------+                     +-------+                    
        ^                                                        
        |                                                        
   2 ticks <------------------ +-------+ <----------------- 5 ticks
                                | S_EW_Y|                    
                                +-------+                    
                                 ^                          
                                 |                          
                              5 ticks                     
                                 |                          
                              +-------+                    
                              | S_EW_G| ------------------>
                              +-------+       2 ticks
```

---

## 🔹 Simulation Example

At each `tick`, the counter increments until the duration expires, then transitions to the next state. Example sequence:

1. Reset → **S\_NS\_G** (NS green, EW red)
2. After 5 ticks → **S\_NS\_Y** (NS yellow, EW red)
3. After 2 ticks → **S\_EW\_G** (EW green, NS red)
4. After 5 ticks → **S\_EW\_Y** (EW yellow, NS red)
5. After 2 ticks → back to **S\_NS\_G**

---

## 🔹 How to Run the Program

### 1. Save the code

Save the Verilog module as `traffic_light.v`.

### 2. Create a Testbench (example `tb_traffic_light.v`)

### 3. Compile & Simulate

Using **Icarus Verilog (iverilog)** and **GTKWave**:

```bash
iverilog -o sim.out traffic_light.v tb_traffic_light.v
vvp sim.out
gtkwave dump.vcd &
```

### 4. Observe Output

* **NS lights** will be green → yellow → red
* **EW lights** will be red → green → yellow
* Each light duration matches configured tick counts.

---

## ✅ Key Notes

* **Moore FSM**: Outputs depend only on the current state.
* **Tick-based timing** allows easy scaling by adjusting `DUR_*` parameters.
* **Synchronous reset** ensures safe startup.
