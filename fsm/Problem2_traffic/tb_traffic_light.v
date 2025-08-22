`timescale 1ns/1ns

module tb_traffic_light;

    reg clk, rst, tick;
    wire ns_g, ns_y, ns_r, ew_g, ew_y, ew_r;

    traffic_light dut(
        .clk(clk), .rst(rst), .tick(tick),
        .ns_g(ns_g), .ns_y(ns_y), .ns_r(ns_r),
        .ew_g(ew_g), .ew_y(ew_y), .ew_r(ew_r)
    );

    initial clk = 0;
    always #5 clk = ~clk;
    integer cyc;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        tick <= (cyc % 20 == 0);
    end
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_traffic_light);
    end

    initial begin
        cyc = 0; tick = 0;
        rst = 1;
        repeat(3) @(posedge clk);
        rst = 0;

        repeat(1200) @(posedge clk); 
        $display("Simulation complete.");
        $finish;
    end

    always @(posedge clk) if (tick) begin
        $display("TICK %0d : NS(g,y,r)=%0d%0d%0d  EW(g,y,r)=%0d%0d%0d",
            cyc/20, ns_g, ns_y, ns_r, ew_g, ew_y, ew_r);
    end


endmodule
