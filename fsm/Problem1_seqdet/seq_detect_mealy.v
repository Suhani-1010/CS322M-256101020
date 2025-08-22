// Problem 1: Mealy overlapping sequence detector for pattern 1101
// Synchronous, active-high reset. `y` goes high for exactly one clock
// when the input stream ends in ...1101 (overlaps allowed).

module seq_detect_mealy(
    input  wire clk,
    input  wire rst,   // sync, active-high reset
    input  wire din,   // one serial bit each clock
    output reg  y      // 1-cycle pulse when we see ...1101
);

    // States track how much of the prefix we've matched so far:
    // S0: nothing matched yet
    // S1: saw '1'
    // S2: saw '11'
    // S3: saw '110'
    localparam S0 = 2'd0,
               S1 = 2'd1,
               S2 = 2'd2,
               S3 = 2'd3;

    reg [1:0] state, next_state;

    // Combinational next-state logic + Mealy output
    always @* begin
        next_state = state;
        y = 1'b0;  // default: no pulse

        case (state)
            S0: begin
                // Waiting for the first '1'
                next_state = din ? S1 : S0;
            end

            S1: begin
                // We have '1'; another '1' moves us forward, '0' resets
                next_state = din ? S2 : S0;
            end

            S2: begin
                // We have '11'; a '0' advances to '110', a '1' stays (to allow overlap)
                next_state = din ? S2 : S3;
            end

            S3: begin
                // We have '110'; a '1' completes '1101'
                if (din) begin
                    y          = 1'b1; // Mealy: asert on the same cycle as the final bit
                    next_state = S1;    // Overlap: that '1' can start the next match
                end else begin
                    next_state = S0;    // Saw '1100' -> no useful prefix
                end
            end

            default: begin
                next_state = S0;
            end
        endcase
    end

    // State register (sync, active-high reset)
    always @(posedge clk) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
endmodule
