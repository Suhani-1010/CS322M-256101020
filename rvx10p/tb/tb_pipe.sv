// tb/tb_pipeline.sv
`timescale 1ns/1ns
module tb_pipeline;
    logic clk;
    logic rst_n;

    // instantiate top-level pipeline
    riscvpipeline dut (.clk(clk), .rst_n(rst_n));

    // clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        $display("Loading imem hex...");
        $readmemh("tests/rvx10_pipeline.hex", dut.imem);

        $display("Loading dmem (if provided)...");
        
        #50000; 
        $display("TIMEOUT: test did not finish within cycle limit");
        $finish;
    end

    // Waveform dump
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_pipeline);
    end
    always @(posedge clk) begin
        
        if (dut.dp.dmem[100/4] === 32'd25) begin
            $display("TEST PASSED: memory[100] == 25 at time %0t", $time);
            $display("cycles=%0d instr_retired=%0d", dut.dp.cycle_count, dut.dp.instr_retired);
            $finish;
        end
    end
endmodule


