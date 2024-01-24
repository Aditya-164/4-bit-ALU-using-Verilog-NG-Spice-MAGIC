`timescale 1ns/1ns

module four_bit_adder_sub_tb;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    four_bit_adder_sub uut(
        .S(S),
        .Cout(Cout),
        .A(A),
        .B(B),
        .Cin(Cin)
    );

    initial begin
    $dumpfile("four_bit_adder_sub.vcd");
    $dumpvars(0,four_bit_adder_sub_tb);
        $display("Testing 4-bit adder with Cin");

        // Test case 1
        A = 4'b0010;
        B = 4'b0011;
        Cin = 1'b0;
        #10;
        result(A, B, Cin, S, Cout);

        // Test case 2
        A = 4'b1101;
        B = 4'b0010;
        Cin = 1'b1;
        #10;
        result(A, B, Cin, S, Cout);

// Test case 3
A = 4'b0110;
B = 4'b1010;
Cin = 1'b0;
#10;
result(A, B, Cin, S, Cout);

// Test case 4
A = 4'b1111;
B = 4'b1111;
Cin = 1'b1;
#10;
result(A, B, Cin, S, Cout);

// Test case 5
A = 4'b0101;
B = 4'b0011;
Cin = 1'b1;
#10;
result(A, B, Cin, S, Cout);

        $finish;
    end

    task result(input [3:0] A, B, Cin, S, Cout);
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %h", A, B, Cin, S, Cout);
    endtask

endmodule
