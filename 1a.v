module one_bit_full_adder(A, B, Cin, S,Cout);
  
 input A, B, Cin;
 output S, Cout;
  
 
  assign S= A ^ B ^ Cin; // ^ is the exclusive xor operation
  assign Cout = (A && B) || (B && Cin) || (A && Cin);
  
endmodule
