`timescale 1ns/1ns
module tb_seq_detect_mealy;
    reg  clk = 1'b0;
    reg  rst = 1'b1;   
    reg  din = 1'b0;
    wire y;
    
    seq_detect_mealy dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .y  (y)
    );
    always #5 clk = ~clk;

    localparam integer N = 11;
    reg [N-1:0] stream = 11'b11011011101;

    integer i;

    initial begin
    
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_seq_detect_mealy);
        repeat (2) @(posedge clk);
        rst <= 1'b0;
        @(posedge clk);

        $display("Time   idx  din  y   (y pulses on the same cycle the final '1' of 1101 arrives)");
        
        for (i = N-1; i >= 0; i = i - 1) begin
            din <= stream[i];
            @(posedge clk);
            $display("%0t  %2d    %0d    %0d", $time, (N-1 - i), stream[i], y);
        end
        din <= 1'b0;
        repeat (3) @(posedge clk);

        $finish;
    end
endmodule

