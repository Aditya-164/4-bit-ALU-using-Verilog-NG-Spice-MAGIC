module comparator(
    input [3:0] A,
    input [3:0] B,
    output equal,
    output greator,
    output lesser
);
    wire x0, x1, x2, x3;
    wire a0, a1, a2, a3;
    wire b0, b1, b2, b3;
    wire g0, g1, g2, g3;
    wire l0, l1, l2, l3;

    xnor G0(x0, A[0], B[0]);
    xnor G1(x1, A[1], B[1]);
    xnor G2(x2, A[2], B[2]);
    xnor G3(x3, A[3], B[3]);

    and G4(equal, x3, x2, x1, x0);

    not G5(b0, B[0]);
    not G6(b1, B[1]);
    not G7(b2, B[2]);
    not G8(b3, B[3]);

    not G9(a0, A[0]);
    not G10(a1, A[1]);
    not G11(a2, A[2]);
    not G12(a3, A[3]);

    and G13(g0, A[3], b3);
    and G14(g1, x3, A[2], b2);
    and G15(g2, x3, x2, A[1], b1);
    and G16(g3, x3, x2, x1, A[0], b0);

    and G17(l0, B[3], a3);
    and G18(l1, x3, B[2], a2);
    and G19(l2, x3, x2, B[1], a1);
    and G20(l3, x3, x2, x1, B[0], a0);

    or G21(greator, g0, g1, g2, g3);
    or G22(lesser, l0, l1, l2, l3);

endmodule
