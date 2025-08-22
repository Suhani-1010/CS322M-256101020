module slave_fsm(
    input  wire clk,
    input  wire rst,
    input  wire req,
    input  wire [7:0] data_in,
    output reg  ack,
    output reg  [7:0] last_byte
);

    localparam [1:0]
        S_WAIT_REQ   = 2'd0,
        S_ASSERT_ACK = 2'd1,
        S_HOLD_ACK   = 2'd2,
        S_DROP_ACK   = 2'd3;

    reg [1:0] state, next;
    reg [1:0] hold_cnt;

    always @* begin
        next = state;
        case (state)
            S_WAIT_REQ:   if (req) next = S_ASSERT_ACK;
            S_ASSERT_ACK: next = S_HOLD_ACK;
            S_HOLD_ACK:   if (hold_cnt == 2'd1) next = S_DROP_ACK;
            S_DROP_ACK:   if (!req) next = S_WAIT_REQ;
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            state <= S_WAIT_REQ;
            ack <= 0;
            last_byte <= 8'h00;
            hold_cnt <= 0;
        end else begin
            state <= next;
            case (state)
                S_WAIT_REQ: begin
                    ack <= 0;
                end
                S_ASSERT_ACK: begin
                    ack <= 1;
                    last_byte <= data_in; 
                    hold_cnt <= 0;
                end
                S_HOLD_ACK: begin
                    ack <= 1;
                    hold_cnt <= hold_cnt + 1;
                end
                S_DROP_ACK: begin
                    ack <= 0;
                end
            endcase
        end
    end
endmodule

