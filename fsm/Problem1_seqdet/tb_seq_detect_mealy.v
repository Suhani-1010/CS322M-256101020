`timescale 1ns/1ns

module tb_seq_detect_mealy;
    // --- Testbench signals (connect to DUT) ---
    reg  clk = 1'b0;
    reg  rst = 1'b1;    // start in reset so the DUT comes up clean
    reg  din = 1'b0;
    wire y;

    // --- Device Under Test ---
    seq_detect_mealy dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .y  (y)
    );

    // --- Clock: 100 MHz (period = 10 ns) ---
    always #5 clk = ~clk;

    // --- Input pattern (MSB first) ---
    // This bitstream includes overlapping matches of "1101".
    // Example: 11011011101
    // Expected: y should pulse on the cycles where indices (0-based) end at 3, 6, and 10.
    localparam integer N = 11;
    reg [N-1:0] stream = 11'b11011011101;

    integer i;

    initial begin
        // --- Waveform dump for GTKWave/etc. ---
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_seq_detect_mealy);

        // --- Bring the DUT out of reset after a couple of clocks ---
        repeat (2) @(posedge clk);
        rst <= 1'b0;
        @(posedge clk); // one extra cycle to settle after deasserting reset

        $display("Time   idx  din  y   (y pulses on the same cycle the final '1' of 1101 arrives)");

        // --- Drive one input bit per rising edge, MSB -> LSB ---
        for (i = N-1; i >= 0; i = i - 1) begin
            din <= stream[i];
            @(posedge clk);
            $display("%0t  %2d    %0d    %0d", $time, (N-1 - i), stream[i], y);
        end

        // --- A few idle clocks at the end ---
        din <= 1'b0;
        repeat (3) @(posedge clk);

        $finish;
    end
endmodule
