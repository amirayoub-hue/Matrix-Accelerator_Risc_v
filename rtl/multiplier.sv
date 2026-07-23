module multiplier
  import matrix_pkg::*;
  (
    input logic clk, rst_n , mul_en,
    input logic signed [DATA_WIDTH-1:0] a_in , b_in,
    output logic signed [PROD_WIDTH-1:0] prod_out ,
    output logic  prod_valid 
  );
