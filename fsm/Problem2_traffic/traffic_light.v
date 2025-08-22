// traffic_light.v
// Moore FSM: NS/EW traffic lights with 5/2/5/2 tick durations

module traffic_light(
    input  wire clk,
    input  wire rst,   // sync active-high
    input  wire tick,  // 1-cycle pulse (slow time base)
    output reg  ns_g, ns_y, ns_r,
    output reg  ew_g, ew_y, ew_r
);

    // States
    localparam [1:0]
        S_NS_G = 2'd0,
        S_NS_Y = 2'd1,
        S_EW_G = 2'd2,
        S_EW_Y = 2'd3;

    // Tick durations
    localparam integer DUR_NS_G = 5;
    localparam integer DUR_NS_Y = 2;
    localparam integer DUR_EW_G = 5;
    localparam integer DUR_EW_Y = 2;

    reg [1:0] state, next_state;
    reg [2:0] tick_count; // enough to count up to 5

    // Next-state + tick counter
    always @* begin
        next_state = state; // default stay
        case (state)
            S_NS_G: if (tick && tick_count == DUR_NS_G-1) next_state = S_NS_Y;
            S_NS_Y: if (tick && tick_count == DUR_NS_Y-1) next_state = S_EW_G;
            S_EW_G: if (tick && tick_count == DUR_EW_G-1) next_state = S_EW_Y;
            S_EW_Y: if (tick && tick_count == DUR_EW_Y-1) next_state = S_NS_G;
        endcase
    end

    // State register + counter
    always @(posedge clk) begin
        if (rst) begin
            state <= S_NS_G;
            tick_count <= 0;
        end else begin
            if (tick) begin
                if ((state==S_NS_G && tick_count==DUR_NS_G-1) ||
                    (state==S_NS_Y && tick_count==DUR_NS_Y-1) ||
                    (state==S_EW_G && tick_count==DUR_EW_G-1) ||
                    (state==S_EW_Y && tick_count==DUR_EW_Y-1)) begin
                    tick_count <= 0;
                    state <= next_state;
                end else begin
                    tick_count <= tick_count + 1;
                end
            end
        end
    end

    // Moore outputs
    always @* begin
        // default all red
        ns_g=0; ns_y=0; ns_r=0;
        ew_g=0; ew_y=0; ew_r=0;
        case (state)
            S_NS_G: begin ns_g=1; ew_r=1; end
            S_NS_Y: begin ns_y=1; ew_r=1; end
            S_EW_G: begin ew_g=1; ns_r=1; end
            S_EW_Y: begin ew_y=1; ns_r=1; end
        endcase
    end

endmodule