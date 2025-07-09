module tb_ram;

  reg clk;
  reg en;
  reg we;
  reg [2:0] addres;
  reg [7:0] data_in;
  wire [7:0] data_out;

  // Instantiate the RAM module
  ram uut (
    .clk(clk),
    .addres(addres),  // Consider renaming to 'address' if needed
    .data_in(data_in),
    .en(en),
    .we(we),
    .data_out(data_out)
  );

  // Clock generator: 50MHz (20ns period)
  initial clk = 0;
  always #10 clk = ~clk;

  initial begin
    en = 1;

    // ? Write one value to address 5
    @(posedge clk);
    we = 1;
    addres = 3'b101;
    data_in = 8'd42;  // Example value

    // ? Read back the same value from address 5
    @(posedge clk);
    we = 0;
    addres = 3'b101;

    @(posedge clk);
    $display("Read Addr %0d: Data = %0d", addres, data_out);

    // Final step: disable enable signal
    @(posedge clk);
    en = 0;

    @(posedge clk);
    $finish;
  end

endmodule