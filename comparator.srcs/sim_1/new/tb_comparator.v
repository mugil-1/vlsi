`timescale 1ns / 1ps


module tb_comparator;

reg [3:0] A, B;
wire A_gt_B, A_eq_B, A_lt_B;

comparator uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
);

initial begin
    A = 4'b0000; B = 4'b0000; #10;

    A = 4'b0001; B = 4'b1000; #10;

    A = 4'b1001; B = 4'b0111; #10;
    
    A = 4'b1111; B = 4'b1111; #10;

    
    
       $monitor("Time = %0t  A = %b, B = %b  A > B = %b, A == B = %b, A < B = %b", 
   $time, A, B, A_gt_B, A_eq_B, A_lt_B);
   
    
   $finish;
end

endmodule
