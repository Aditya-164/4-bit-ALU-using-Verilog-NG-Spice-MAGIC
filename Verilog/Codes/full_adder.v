module full_adder(S,Car,A,B,C);
    input A,B,C;
    output S,Car;

    wire a1,a2,a3;
    xor G1(a1,B,A);
    and G2(a2,B,A);
    xor G3(S,a1,C);
    and G4(a3,a1,C);
    or G5(Car,a3,a2);

endmodule