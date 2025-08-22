`timescale 1ns/1ns

module tb_vending_mealy;

    reg clk, rst;
    reg [1:0] coin;
    wire dispense, chg5;

    vending_mealy dut(
        .clk(clk), .rst(rst), .coin(coin),
        .dispense(dispense), .chg5(chg5)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_vending_mealy);
    end

    task put_coin;
        input [1:0] c;          
        input exp_disp;        
        input exp_chg;          
        begin
            @(negedge clk);
            coin = c;
            @(posedge clk);  
            if (dispense !== exp_disp)
                $display("ERROR: coin=%b exp_disp=%b got=%b", c, exp_disp, dispense);
            if (chg5 !== exp_chg)
                $display("ERROR: coin=%b exp_chg=%b got=%b", c, exp_chg, chg5);
            @(negedge clk);
            coin = 2'b00; 
        end
    endtask

    task idle;
        begin
            @(negedge clk);
            coin = 2'b00;
            @(posedge clk);
            if (dispense) $display("ERROR: idle -> dispense=1");
            if (chg5)     $display("ERROR: idle -> chg5=1");
        end
    endtask

    initial begin
        rst = 1; coin = 2'b00;
        repeat (2) @(posedge clk);
        rst = 0;

        $display("Test1: 10 + 10 => vend");
        put_coin(2'b10, 0, 0); 
                put_coin(2'b10, 1, 0); 
        idle();

        $display("Test2: 5 + 5 + 10 => vend");
        put_coin(2'b01, 0, 0); 
        put_coin(2'b01, 0, 0); 
        put_coin(2'b10, 1, 0); 

        idle();

        $display("Test3: 10 + 5 + 10 => vend + change");
        put_coin(2'b10, 0, 0); 
        put_coin(2'b01, 0, 0); 
        put_coin(2'b10, 1, 1); 

        idle();

        $display("Test4: invalid coin (11) ignored");
        put_coin(2'b11, 0, 0); 

        idle();

        $display("Simulation finished.");
        $finish;
    end

endmodule
