module test_half_adder;
  reg a, b;
  wire sum, carry;

  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    $dumpfile("half_adder_tb.vcd");
    $dumpvars;

    $display("A B | SUM CARRY");
    

    a = 0; b = 0; #10;

    a = 0; b = 1; #10;

    a = 1; b = 0; #10;

    a = 1; b = 1; #10;

    $finish;
  end
endmodule