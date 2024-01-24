`timescale 1ns/1ns

module And_tb;

    reg [3:0] A, B;
    wire [3:0] out;

    And uut(
        .A(A),
        .B(B),
        .out(out)
    );

    initial begin
        $dumpfile("And.vcd");
        $dumpvars(0,And_tb);
        $display("Testing And module");

        // Test case 1: A = 4'b1101, B = 4'b1011
        A = 4'b1101;
        B = 4'b1011;
        #10;
        result(A, B, out);

        // Test case 2: A = 4'b0100, B = 4'b0010
        A = 4'b0100;
        B = 4'b0010;
        #10;
        result(A, B, out);

        $finish;
    end

    task result(input [3:0] A, B, out);
        $display("A = %b, B = %b, Out = %b", A, B, out);
    endtask

endmodule
