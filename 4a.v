module Kogge_Stone_Adder (
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] S,
    output Cout
);
    wire [15:0] G, P;
    wire [15:0] C;

    assign G = A & B;
    assign P = A ^ B;

    // Level 1
    wire [15:0] G1, P1;
    assign G1[0] = G[0];
    assign P1[0] = P[0];
    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin 
            assign G1[i] = G[i] | (P[i] & G[i-1]);
            assign P1[i] = P[i] & P[i-1];
        end
    endgenerate

    // Level 2
    wire [15:0] G2, P2;
    assign G2[1:0] = G1[1:0];
    assign P2[1:0] = P1[1:0];
    generate
        for (i = 2; i < 16; i = i + 1) begin 
            assign G2[i] = G1[i] | (P1[i] & G1[i-2]);
            assign P2[i] = P1[i] & P1[i-2];
        end
    endgenerate

    // Level 3
    wire [15:0] G3, P3;
    assign G3[3:0] = G2[3:0];
    assign P3[3:0] = P2[3:0];
    generate
        for (i = 4; i < 16; i = i + 1) begin 
            assign G3[i] = G2[i] | (P2[i] & G2[i-4]);
            assign P3[i] = P2[i] & P2[i-4];
        end
    endgenerate

    // Level 4
    wire [15:0] G4, P4;
    assign G4[7:0] = G3[7:0];
    assign P4[7:0] = P3[7:0];
    generate
        for (i = 8; i < 16; i = i + 1) begin 
            assign G4[i] = G3[i] | (P3[i] & G3[i-8]);
            assign P4[i] = P3[i] & P3[i-8];
        end
    endgenerate

    // Carry Computation
    assign C[0] = Cin;
    generate
        for (i = 1; i < 16; i = i + 1) begin : carry
            assign C[i] = G4[i-1] | (P4[i-1] & C[i-1]);
        end
    endgenerate

    assign S = P ^ {C[14:0], Cin};
    assign Cout = C[15];
endmodule
