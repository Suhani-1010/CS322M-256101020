module traffic_light(
    input  wire clk,
    input  wire rst,   
    input  wire tick,  
    output reg  ns_g, ns_y, ns_r,
    output reg  ew_g, ew_y, ew_r
);

    localparam [1:0]
        S_NS_G = 2'd0,
        S_NS_Y = 2'd1,
        S_EW_G = 2'd2,
        S_EW_Y = 2'd3;

    localparam integer DUR_NS_G = 5;
    localparam integer DUR_NS_Y = 2;
    localparam integer DUR_EW_G = 5;
    localparam integer DUR_EW_Y = 2;

    reg [1:0] state, next_state;
    reg [2:0] tick_count; 
    
    always @* begin
        next_state = state;
        case (state)
            S_NS_G: if (tick && tick_count == DUR_NS_G-1) next_state = S_NS_Y;
            S_NS_Y: if (tick && tick_count == DUR_NS_Y-1) next_state = S_EW_G;
            S_EW_G: if (tick && tick_count == DUR_EW_G-1) next_state = S_EW_Y;
            S_EW_Y: if (tick && tick_count == DUR_EW_Y-1) next_state = S_NS_G;
        endcase
    end
    
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

    always @* begin
    
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
