`include "four_bit_adder_sub.v"
`include "comparator.v"
`include "And.v"

module ALU(
    input [3:0] A,
    input [3:0] B,
    input s0,s1,
    output [4:0] Out
);

wire [3:0] enable;
wire d0,d1,d2;
wire [3:0] sum;
wire carryOut;
wire equal_temp,equal, greator, lesser;
wire [3:0] AND;

wire [3:0]f;
wire [3:0]g;//add
wire [3:0]h;//subtract
wire [3:0]j; 
wire[3:0]k;//compare
wire [3:0]l; 
wire[3:0]m; //ANd

not G1(d0,s0);
not G2(d1,s1);

and G3(enable[0],d0,d1);
and G4(enable[1],s0,d1);
and G5(enable[2],d0,s1);
and G6(enable[3],s0,s1);

or G7(d2,enable[0],enable[1]);

//adder and subtractor
and G8(f[0],d2,A[0]);
and G9(f[1],d2,A[1]);
and G10(f[2],d2,A[2]);
and G11(f[3],d2,A[3]);
and G12(g[0],d2,B[0]);
and G13(g[1],d2,B[1]);
and G14(g[2],d2,B[2]);
and G15(g[3],d2,B[3]);
xor G16(h[0],enable[1],g[0]);
xor G17(h[1],enable[1],g[1]);
xor G18(h[2],enable[1],g[2]);
xor G19(h[3],enable[1],g[3]);

four_bit_adder_sub fb0(sum,carryOut,f,h,enable[1]);

//comparator
and G20(j[0],enable[2],A[0]);
and G21(j[1],enable[2],A[1]);
and G22(j[2],enable[2],A[2]);
and G23(j[3],enable[2],A[3]);
and G24(k[0],enable[2],B[0]);
and G25(k[1],enable[2],B[1]);
and G26(k[2],enable[2],B[2]);
and G27(k[3],enable[2],B[3]);

comparator com0 (j,k,equal_temp, greator, lesser);
and G40(equal, equal_temp, enable[2]);
//and
and G28(l[0],enable[3],A[0]);
and G29(l[1],enable[3],A[1]);
and G30(l[2],enable[3],A[2]);
and G31(l[3],enable[3],A[3]);
and G32(m[0],enable[3],B[0]);
and G33(m[1],enable[3],B[1]);
and G34(m[2],enable[3],B[2]);
and G35(m[3],enable[3],B[3]);

And an0 (l,m,AND);

or G36(Out[0],AND[0],lesser,sum[0]);
or G37(Out[1],AND[1],equal,sum[1]);
or G38(Out[2],AND[2],greator,sum[2]);
or G39(Out[3],AND[3],sum[3]);

assign Out[4]=carryOut;

endmodule
