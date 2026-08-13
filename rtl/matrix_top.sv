module matrix_top
  import matrix_pkg::*;
(
  input  logic  clk, rst_n, load_en, load_sel, start,
  input  logic [IDX_WIDTH-1:0]  load_row,  load_col,
  input  logic signed [DATA_WIDTH-1:0] load_data,                      
  input  logic [IDX_WIDTH-1:0]   rd_row_c, rd_col_c,
  output logic  done,
  output logic signed [ACC_WIDTH-1:0]  c_data_out,
  output logic [3:0] state_dbg
);

  logic [IDX_WIDTH-1:0]  rd_row_a, rd_col_a, rd_row_b, rd_col_b, c_row, c_col;
  logic c_wr_en , mul_en ,acc_clear, acc_en ,prod_valid;
  logic signed [DATA_WIDTH-1:0] a_data, b_data;
  logic signed [PROD_WIDTH-1:0] prod_out;
  logic signed [ACC_WIDTH-1:0]  acc_out;

  endmodule 

