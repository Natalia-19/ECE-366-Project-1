module Prefix_Adder_tb;
    reg [15:0] A, B;
    reg Cin;
  wire [15:0] Sum;
    wire Cout;
    
    integer j;
  
    Prefix_Adder uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
      .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        $dumpfile("dump.vcd"); 
	$dumpvars;
      $monitor("A = %h, B = %h, Cin = %b, S = %h, Cout = %b", A, B, Cin, Sum, Cout);
        
        for (j = 0; j < 5; j = j + 1) begin
            case (j)
                0: begin A = 16'h0003; B = 16'h0002; Cin = 1'b0; end
                1: begin A = 16'hFFFF; B = 16'h0000; Cin = 1'b1; end
                2: begin A = 16'hAAAA; B = 16'h5555; Cin = 1'b0; end
                3: begin A = 16'h8000; B = 16'h8000; Cin = 1'b1; end
                4: begin A = 16'h7FFF; B = 16'h0001; Cin = 1'b1; end
            endcase
            #10;
        end
        
        $finish;
    end
endmodule





