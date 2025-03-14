module Prefix_Adder (A, B, Cin, Sum, Cout);
  
    input [15:0] A, B;
    input Cin;
    output [15:0] Sum;
    output Cout;

    wire [15:0] P, G;
    wire [15:0] C;

    // Compute Propagate and Generate
    genvar i;
    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign P[i] = A[i] | B[i]; // Propagate
            assign G[i] = A[i] & B[i]; // Generate
        end
    endgenerate

    // Prefix Tree for Carry Computation
    assign C[0] = Cin; // Initial carry-in
    
    generate 
        for (i = 1; i < 16; i = i + 1) begin
            assign C[i] = (P[i-1] & C[i-1]) | G[i-1];
        end
    endgenerate

    // Compute Sum
    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign Sum[i] = P[i] ^ C[i];
        end
    endgenerate

    assign Cout = (P[15] & C[15]) | G[15]; // Final carry-out
endmodule
