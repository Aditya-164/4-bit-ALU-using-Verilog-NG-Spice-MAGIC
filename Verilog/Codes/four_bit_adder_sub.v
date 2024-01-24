`include "full_adder.v"

module four_bit_adder_sub(S,Cout, A, B, Cin);
    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;

    wire [3:0] c;
    wire cout;

    full_adder fa0(S[0], c[0], A[0], B[0], Cin);
    full_adder fa1(S[1], c[1], A[1], B[1], c[0]);
    full_adder fa2(S[2], c[2], A[2], B[2], c[1]);
    full_adder fa3(S[3], c[3], A[3], B[3], c[2]);
    
    assign Cout = c[3];
endmodule
