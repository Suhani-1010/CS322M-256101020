module vending_mealy(
    input  wire       clk,
    input  wire       rst,    
    input  wire [1:0] coin,   
    output wire       dispense, 
    output wire       chg5      
);

    localparam [1:0] S0  = 2'b00;
    localparam [1:0] S5  = 2'b01;
    localparam [1:0] S10 = 2'b10;
    localparam [1:0] S15 = 2'b11;

    reg [1:0] state, next_state;

    wire [4:0] coin_val;
    assign coin_val = (coin == 2'b01) ? 5 :
                      (coin == 2'b10) ? 10 : 0;

    reg [4:0] total_val;
    always @(*) begin
        case (state)
            S0:  total_val = 0;
            S5:  total_val = 5;
            S10: total_val = 10;
            S15: total_val = 15;
            default: total_val = 0;
        endcase
    end

    wire [5:0] new_total = total_val + coin_val; 
    assign dispense = (coin_val != 0) && (new_total >= 20);
    assign chg5    = (coin_val != 0) && (new_total == 25);

    always @(*) begin
    
        next_state = state;

        if (coin_val == 0) begin
           
            next_state = state;
        end else begin
           
            if (new_total >= 20) begin
                
                next_state = S0;
            end else begin
                
                case (new_total)
                    0:  next_state = S0;
                    5:  next_state = S5;
                    10: next_state = S10;
                    15: next_state = S15;
                    default: next_state = S0;
                endcase
            end
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

endmodule

