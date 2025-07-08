module clock_divide_50M_to_1Hz (
    input wire clk_in,     // 50 MHz input clock
    input wire reset,      // Active-high reset
    output reg clk_out     // 1 Hz output clock
);

    // 25 million = 0x017D7840, needs 26 bits
    reg [25:0] counter = 0;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == 25_000_000 - 1) begin
                counter <= 0;
                clk_out <= ~clk_out;  // Toggle output clock
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
