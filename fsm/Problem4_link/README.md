# Master-Slave Handshake Link (Top Module)

This project implements a **master-slave communication system** using FSMs in Verilog. The `link_top` module connects a `master_fsm` and a `slave_fsm` through a simple **request/acknowledge handshake** and an 8-bit data bus.

---

## 🔹 Problem Statement

* Design a **synchronous master-slave link** where:

  * **Master FSM** initiates communication by sending a `req` signal with `data`.
  * **Slave FSM** responds with `ack` and processes the incoming `data`.
  * The transaction ends with either completion (`done` from master) or the slave storing the last received byte (`last_byte`).
* Communication uses:

  * `req` (request from master)
  * `ack` (acknowledge from slave)
  * `data` (8-bit bus for transfer)

---

## 🔹 Module Description

### **link\_top**

* Instantiates `master_fsm` and `slave_fsm`.
* Handles interconnection:

  * `req` ↔ request line between master and slave.
  * `ack` ↔ acknowledge line between slave and master.
  * `data` ↔ 8-bit bus from master to slave.
  * `done` ↔ signals completion of master’s task.
  * `last_byte` ↔ stores the last data byte received by slave.

### **master\_fsm**

* Inputs: `clk`, `rst`, `ack`.
* Outputs: `req`, `data[7:0]`, `done`.
* Behavior: Sends request with data, waits for `ack`, signals completion after transmission.

### **slave\_fsm**

* Inputs: `clk`, `rst`, `req`, `data_in[7:0]`.
* Outputs: `ack`, `last_byte[7:0]`.
* Behavior: Responds with `ack` when `req` is high, latches incoming data into `last_byte`.

---

## 🔹 Handshake Protocol

1. **Master asserts `req`** and places data on `data` bus.
2. **Slave sees `req`**, latches `data_in` into `last_byte`, asserts `ack`.
3. **Master sees `ack`**, deasserts `req`, may signal `done`.
4. **Slave deasserts `ack`**, ready for next transfer.

---

## 🔹 State Diagram (Handshake Overview)

```
Master FSM:                Slave FSM:
------------               ------------
IDLE → SEND_REQ → WAIT_ACK  IDLE → WAIT_REQ → LATCH_DATA → SEND_ACK
         ^                          ^
         |__________________________|
```

---

## 🔹 How to Run the Program

### 1. Save the code

Save the Verilog files as:

* `link_top.v`
* `master_fsm.v`
* `slave_fsm.v`

### 2. Create a Testbench (example `tb_link_top.v`)

### 3. Compile & Simulate

Using **Icarus Verilog (iverilog)** and **GTKWave**:

```bash
iverilog -o sim.out link_top.v master_fsm.v slave_fsm.v tb_link_top.v
vvp sim.out
gtkwave dump.vcd &
```

### 4. Observe Output

* `req` and `ack` handshake signals toggling.
* `data` bus transferring bytes.
* `last_byte` updated in the slave.
* `done` signal goes high when master completes transaction.

---

## ✅ Key Notes

* Demonstrates **master-slave handshake protocol**.
* Clean FSM partitioning between master and slave.
* Useful for **bus communication, protocols, and digital system interfacing**.