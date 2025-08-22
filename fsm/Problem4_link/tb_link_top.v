
`timescale 1ns/1ns

module tb_link_top;

    reg clk, rst;
    wire done;

    link_top dut(.clk(clk), .rst(rst), .done(done));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_link_top);
    end

    initial begin
        rst = 1;
        repeat (3) @(posedge clk);
        rst = 0;

        wait(done);
        $display("Master asserted done at time %0t", $time);

        repeat (10) @(posedge clk);

        $finish;
    end

    always @(posedge clk) begin
        $strobe("t=%0t req=%b ack=%b data=%h done=%b",
            $time, dut.u_master.req, dut.u_slave.ack, dut.u_master.data, done);
    end

endmodule
