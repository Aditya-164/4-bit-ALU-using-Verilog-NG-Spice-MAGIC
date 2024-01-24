module And(
    input [3:0] A,
    input [3:0] B,
    output [3:0] out
);

and G0(out[0],A[0],B[0]);
and G1(out[1],A[1],B[1]);
and G2(out[2],A[2],B[2]);
and G3(out[3],A[3],B[3]);

endmodule