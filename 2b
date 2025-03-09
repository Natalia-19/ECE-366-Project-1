module one_bit_full_adder(A, B, Cin, Sum, Cout);
  
  input A, B, Cin;
  output Sum, Cout;
  
 
  assign Sum = A ^ B ^ Cin; // ^ is the exclusive xor operation
  assign Cout = (A && B) || (B && Cin) || (A && Cin);
  
endmodule

module four_bit_RCA(A, B, Cin, Sum, Cout);
  
  input [3:0] A, B;
  input Cin; 

  output [3:0] Sum;
  output Cout;
  
  wire [2:0] Center;
  
  one_bit_full_adder FA0(A[0], B[0], Cin, Sum[0], Center[0]);
  one_bit_full_adder FA1(A[1], B[1], Center[0], Sum[1], Center[1]);
  one_bit_full_adder FA2(A[2], B[2], Center[1], Sum[2], Center[2]);
  one_bit_full_adder FA3(A[3], B[3], Center[2], Sum[3], Cout);
  
endmodule

// CLA 4-bit Logic 
module CLA_logic(A, B, Cin, Cout);
  
  input [3:0] A, B;
  input Cin;
  output Cout;
  
  wire [3:0] P, G;
  
  assign G = A & B;
  assign P = A ^ B;

  assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
  
  
endmodule


// 32-bit Carry Lookahead Adder 
module CLA_32_bit(A, B, Cin, Sum, Cout);
  
  input [31:0] A, B;
  input Cin;
  output [31:0] Sum;
  output Cout;
  
  wire [7:0] Carry;
  
  four_bit_RCA FA0 (A[3:0], B[3:0], Cin, Sum[3:0], Carry[0]);
  CLA_logic CL0 (A[3:0], B[3:0], Cin, Carry[0]);
  
  four_bit_RCA FA1 (A[7:4], B[7:4], Carry[0], Sum[7:4], Carry[1]);
  CLA_logic CL1 (A[7:4], B[7:4], Carry[0], Carry[1]);
  
  four_bit_RCA FA2 (A[11:8], B[11:8], Carry[1], Sum[11:8], Carry[2]);
  CLA_logic CL2 (A[11:8], B[11:8], Carry[1], Carry[2]);
  
  four_bit_RCA FA3 (A[15:12], B[15:12], Carry[2], Sum[15:12], Carry[3]);
  CLA_logic CL3 (A[15:12], B[15:12], Carry[2], Carry[3]);
  
  four_bit_RCA FA4 (A[19:16], B[19:16], Carry[3], Sum[19:16], Carry[4]);
  CLA_logic CL4 (A[19:16], B[19:16], Carry[3], Carry[4]);
  
  four_bit_RCA FA5 (A[23:20], B[23:20], Carry[4], Sum[23:20], Carry[5]);
  CLA_logic CL5 (A[23:20], B[23:20], Carry[4], Carry[5]);
  
  four_bit_RCA FA6 (A[27:24], B[27:24], Carry[5], Sum[27:24], Carry[6]);
  CLA_logic CL6 (A[27:24], B[27:24], Carry[5], Carry[6]);
  
  four_bit_RCA FA7 (A[31:28], B[31:28], Carry[6], Sum[31:28], Cout);
  CLA_logic CL7 (A[31:28], B[31:28], Carry[6], Cout);
  
  
endmodule
