module one_bit_full_adder(A, B, Cin, S,Cout);
  
  input A, B, Cin;
  output S, Cout;
  
 
  assign S= A ^ B ^ Cin; // ^ is the exclusive xor operation
  assign Cout = (A && B) || (B && Cin) || (A && Cin);
  
endmodule

module four_bit_RCS(A, B, Cin, S, Cout);
  input [3:0] A, B;
  input Cin; 
  output [3:0] S;
  output Cout;
  
  wire[2:0] Center;
  
  one_bit_full_adder FA0(A[0], !B[0], 1'b1, S[0], Center[0]);
  one_bit_full_adder FA1(A[1], !B[1], Center[0], S[1], Center[1]);
  one_bit_full_adder FA2(A[2], !B[2], Center[1], S[2], Center[2]);
  one_bit_full_adder FA3(A[3], !B[3], Center[2], S[3], Cout);
  
endmodule
