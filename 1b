module one_bit_full_adder(A, B, Cin, S, Cout);

    input A, B, Cin;
    output S, Cout;

    // Your code
    wire w0, w1, w2, w3;

    // Sum
    xor U1(w0, A, B);
    xor U2(S, Cin, w0);

    // Carry-out
    and G1(w1, A, B);
    and G2(w2, B, Cin);
    and G3(w3, Cin, A);

    or G4(Cout, w1, w2, w3);
    
endmodule
