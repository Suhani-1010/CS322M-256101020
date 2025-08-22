module master_fsm(
    input  wire clk,
    input  wire rst,
    input  wire ack,
    output reg  req,
    output reg  [7:0] data,
    output reg  done
);

    localparam [2:0]
        M_IDLE      = 3'd0,
        M_REQ       = 3'd1,
        M_WAIT_ACK  = 3'd2,
        M_DROP_REQ  = 3'd3,
        M_FINISH    = 3'd4;

    reg [2:0] state, next;
    reg [1:0] byte_idx; 

    always @* begin
        next = state;
        case (state)
            M_IDLE:     next = M_REQ;
            M_REQ:      next = M_WAIT_ACK;
            M_WAIT_ACK: if (ack) next = M_DROP_REQ;
            M_DROP_REQ: if (!ack) begin
                           if (byte_idx == 2'd3) next = M_FINISH;
                           else next = M_REQ;
                         end
            M_FINISH:   next = M_IDLE;
        endcase
    end
    always @(posedge clk) begin
        if (rst) begin
            state <= M_IDLE;
            byte_idx <= 0;
            req <= 0; data <= 8'h00; done <= 0;
        end else begin
            state <= next;
            done <= 0; 
            case (state)
                M_IDLE: begin
                    req <= 0;
                    byte_idx <= 0;
                end
                M_REQ: begin
                    req <= 1;
                    data <= {6'h0, byte_idx}; 
                end
                M_WAIT_ACK: begin
                    
                end
                M_DROP_REQ: begin
                    req <= 0;
                    if (!ack) byte_idx <= byte_idx + 1;
                end
                M_FINISH: begin
                    done <= 1;
                end
            endcase
        end
    end
endmodule

