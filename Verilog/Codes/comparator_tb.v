`timescale 1ns/1ns

module comparator_tb;

    reg [3:0] A, B;
    wire equal, greator, lesser;

    comparator uut(
        .A(A),
        .B(B),
        .equal(equal),
        .greator(greator),
        .lesser(lesser)
    );

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0,comparator_tb);
        $display("Testing comparator");

        // Test case 1: A = 4, B = 3 (A is greater)
        A = 4;
        B = 3;
        #10;
        result(A, B, equal, greator, lesser);

        // Test case 2: A = 2, B = 2 (A and B are equal)
        A = 2;
        B = 2;
        #10;
        result(A, B, equal, greator, lesser);

        // Test case 3: A = 1, B = 5 (B is greater)
        A = 1;
        B = 5;
        #10;
        result(A, B, equal, greator, lesser);

// Test case 4: A = 7, B = 7 (A and B are equal)
A = 7;
B = 7;
#10;
result(A, B, equal, greator, lesser);

// Test case 5: A = 0, B = 0 (A and B are equal)
A = 0;
B = 0;
#10;
result(A, B, equal, greator, lesser);

// Test case 6: A = 3, B = 6 (B is greater)
A = 3;
B = 6;
#10;
result(A, B, equal, greator, lesser);

// Test case 7: A = 15, B = 8 (A is greater)
A = 15;
B = 8;
#10;
result(A, B, equal, greator, lesser);

// Test case 8: A = 12, B = 12 (A and B are equal)
A = 12;
B = 12;
#10;
result(A, B, equal, greator, lesser);

        $finish;
    end
    task result(input [3:0] A, B, equal, greator, lesser);
        $display("A = %b, B = %b, Equal = %h, Greater = %h, Lesser = %h", A, B, equal, greator, lesser);
    endtask

endmodule
