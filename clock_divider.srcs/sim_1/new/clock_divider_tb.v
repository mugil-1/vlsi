module tb_clock_divider;

    reg clk_in;
    reg reset;
    wire clk_out;

    // Instantiate the DUT (Device Under Test)
    clock_divide_50M_to_1Hz DUT (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

  // Clock generation
initial begin
    clk_in = 0;
    forever #10 clk_in = ~clk_in;
end

// Test sequence
initial begin
    reset = 1;
    #50;
    reset = 0;

    $dumpfile("dump.vcd");
    $dumpvars;
    #1000;

    $finish;
end

endmodule