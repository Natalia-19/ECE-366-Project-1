module KSA_tb;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S;
    wire Cout;

    // Instantiate the 16-bit KS Adder
    Kogge_Stone_Adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
    $dumpfile("dump.vcd"); 
	  $dumpvars;

        // Test Case 1
        A = 16'h0000; B = 16'h0000; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, S, Cout);

        // Test Case 2
        A = 16'hFFFF; B = 16'h0001; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, S, Cout);

        // Test Case 3
        A = 16'h1234; B = 16'h5678; Cin = 1;
        #10;
        $display("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, S, Cout);

        // Test Case 4
        A = 16'hAAAA; B = 16'h5555; Cin = 0;
        #10;
        $display("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, S, Cout);

     //   $stop;
    end
endmodule

