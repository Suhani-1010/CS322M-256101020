module seq_detect_mealy(
    input  wire clk,
    input  wire rst,   
    input  wire din,   
    output reg  y      
);
    localparam S0 = 2'd0,
               S1 = 2'd1,
               S2 = 2'd2,
               S3 = 2'd3;

    reg [1:0] state, next_state;
    
    always @* begin
        next_state = state;
        y = 1'b0;  
        case (state)
            S0: begin
                next_state = din ? S1 : S0;
            end

            S1: begin
                next_state = din ? S2 : S0;
            end

            S2: begin
                next_state = din ? S2 : S3;
            end

            S3: begin
                if (din) begin
                    y          = 1'b1; 
                    next_state = S1;   
                end else begin
                    next_state = S0;   
                end
            end

            default: begin
                next_state = S0;
            end
        endcase
    end
 always @(posedge clk) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
endmodule

