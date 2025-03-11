module Testbench;
    // Inputs
    reg [3:0] A, B;
    reg Cin;
    // Outputs
    wire [3:0] S;
    wire Cout;

    // Instantiate the 4-bit RCA/RCS module
    four_bit_RCS RCA_RCS (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: Addition (5 + 3)
        A = 4'b0101; B = 4'b0011; Cin = 1'b0; // 5 + 3
        #10;
        $display("Addition: A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 2: Subtraction (5 - 3)
        A = 4'b0101; B = 4'b0011; Cin = 1'b1; // 5 - 3
        #10;
        $display("Subtraction: A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 3: Addition with carry-out (15 + 1)
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; // 15 + 1
        #10;
        $display("Addition with Carry-Out: A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 4: Subtraction with borrow (3 - 5)
        A = 4'b0011; B = 4'b0101; Cin = 1'b1; // 3 - 5
        #10;
        $display("Subtraction with Borrow: A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);
    end
endmodule
