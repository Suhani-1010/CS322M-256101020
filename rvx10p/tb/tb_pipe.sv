// tb/tb_pipeline.sv
`timescale 1ns/1ps
module tb_pipeline;
    logic clk;
    logic rst_n;

    // instantiate top-level pipeline
    riscvpipeline dut (.clk(clk), .rst_n(rst_n));

    // clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz-ish for simulation
    end

    // reset and preload memories
    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        // preload instruction memory and data memory
        // The test program (rvx10_pipeline.hex) should be placed into the instruction memory of dut.
        // In this top-level, instruction memory is declared inside riscvpipeline.imem; we'll preload it:
        $display("Loading imem hex...");
        $readmemh("tests/rvx10_pipeline.hex", dut.imem);

        $display("Loading dmem (if provided)...");
        // optional data memory preload if you want:
        // $readmemh("tests/dmem_init.hex", dut.dmem);

        // run simulation until the self-check indicates success or timeout
        #50000; // allow some cycles
        $display("TIMEOUT: test did not finish within cycle limit");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_pipeline);
    end

    // Monitor the memory at address 100 to detect success (store 25)
    always @(posedge clk) begin
        // dmem is inside datapath: path is dut.dp.dmem
        if (dut.dp.dmem[100/4] === 32'd25) begin
            $display("TEST PASSED: memory[100] == 25 at time %0t", $time);
            $display("cycles=%0d instr_retired=%0d", dut.dp.cycle_count, dut.dp.instr_retired);
            $finish;
        end
    end
endmodule
