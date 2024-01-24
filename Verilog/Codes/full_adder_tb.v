module full_adder_tb;
  reg A, B, C;
  
  wire S, Car;

  full_adder uut(
    .S(S),
    .Car(Car),
    .A(A),
    .B(B),
    .C(C)
  );

  initial begin
  $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_tb);
    // Test case 1
    A = 1;
    B = 1;
    C = 0;
    #10;
    $display("Test case 1: A = %b, B = %b, C = %b, S = %b, Car = %b", A, B, C, S, Car);

    // Test case 2
    A = 0;
    B = 1;
    C = 1;
    #10;
    $display("Test case 2: A = %b, B = %b, C = %b, S = %b, Car = %b", A, B, C, S, Car);

    // Test case 3
    A = 1;
    B = 0;
    C = 1;
    #10;
    $display("Test case 3: A = %b, B = %b, C = %b, S = %b, Car = %b", A, B, C, S, Car);

    // Test case 4
    A = 0;
    B = 0;
    C = 1;
    #10;
    $display("Test case 4: A = %b, B = %b, C = %b, S = %b, Car = %b", A, B, C, S, Car);

    $finish;
  end

endmodule
