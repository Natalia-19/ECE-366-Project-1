module testbench;

    reg [31:0] A, B;
    reg Cin;
    wire [31:0] Sum;
    wire Cout;

    // Instantiate the 32-bit CLA
    CLA_32_bit cla (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
    $dumpfile("dump.vcd"); 
	$dumpvars;
        // Test case 1
        A = 32'h0000_0001;
        B = 32'h0000_0001;
        Cin = 0;
        #10;
      $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test case 2
        A = 32'hFFFF_FFFF;
        B = 32'h0000_0001;
        Cin = 0;
        #10;
      $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);

        // Test case 3
        A = 32'h1234_5678;
        B = 32'h8765_4321;
        Cin = 1;
        #10;
      $display("A = %h, B = %h, Cin = %b, Sum = %h, Cout = %b", A, B, Cin, Sum, Cout);
    end
      endmodule

