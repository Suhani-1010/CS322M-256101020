module comp1 (
    input A,
    input B,
    output o1,  
    output o2,  
    output o3, 
);

assign o1 = A & ~B;     
assign o2 = ~(A ^ B);   
assign o3 = ~A & B;     

endmodule
