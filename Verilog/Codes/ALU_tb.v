module ALU_tb;

  reg [3:0] A, B;
  reg s0, s1;

  wire [4:0] Out;

  ALU uut(
    .A(A),
    .B(B),
    .s0(s0),
    .s1(s1),
    .Out(Out)
  );

  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,ALU_tb);
    // Test case 1: Addition
    A = 4'b0010;
    B = 4'b0011;
    s0 = 0;
    s1 = 0;
    #10;
    $display("Test case 1: A = %b, B = %b, s0 = %b, s1 = %b, Out = %b", A, B, s0, s1, Out);

    // Test case 2: Subtraction
    A = 4'b1010;
    B = 4'b0011;
    s0 = 1;
    s1 = 0;
    #10;
    $display("Test case 2: A = %b, B = %b, s0 = %b, s1 = %b, Out = %b", A, B, s0, s1, Out);

    // Test case 3: Comparison
    A = 4'b0100;
    B = 4'b0011;
    s0 = 0;
    s1 = 1;
    #10;
    $display("Test case 3: A = %b, B = %b, s0 = %b, s1 = %b, Out = %b", A, B, s0, s1, Out);

    // Test case 4: Logical AND
    A = 4'b1100;
    B = 4'b1010;
    s0 = 1;
    s1 = 1;
    #10;
    $display("Test case 4: A = %b, B = %b, s0 = %b, s1 = %b, Out = %b", A, B, s0, s1, Out);

    $finish;
  end

endmodule
