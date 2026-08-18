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
  
  matrix_controller u_controller (
    .clk       (clk),
    .rst_n     (rst_n),
    .start     (start),
    .done      (done),
    .rd_row_a  (rd_row_a),
    .rd_col_a  (rd_col_a),
    .rd_row_b  (rd_row_b),
    .rd_col_b  (rd_col_b),
    .c_wr_en   (c_wr_en),
    .c_row     (c_row),
    .c_col     (c_col),
    .mul_en    (mul_en),
    .acc_clear (acc_clear),
    .acc_en    (acc_en),
    .state_dbg (state_dbg)
  );

  registers u_registers (
    .clk        (clk),
    .rst_n      (rst_n),
    .load_en    (load_en),
    .load_row   (load_row),
    .load_col   (load_col),
    .load_sel   (load_sel),
    .load_data  (load_data),
    .rd_row_a   (rd_row_a),
    .rd_col_a   (rd_col_a),
    .rd_row_b   (rd_row_b),
    .rd_col_b   (rd_col_b),
    .a_data     (a_data),
    .b_data     (b_data),
    .c_wr_en    (c_wr_en),
    .c_row      (c_row),
    .c_col      (c_col),
    .c_data     (acc_out),
    .rd_row_c   (rd_row_c),
    .rd_col_c   (rd_col_c),
    .c_data_out (c_data_out)
  );

  multiplier u_multiplier (
    .clk        (clk),
    .rst_n      (rst_n),
    .mul_en     (mul_en),
    .a_in       (a_data),
    .b_in       (b_data),
    .prod_out   (prod_out),
    .prod_valid (prod_valid)
  );

  accumulator u_accumulator (
    .clk       (clk),
    .rst_n     (rst_n),
    .acc_clear (acc_clear),
    .acc_en    (acc_en),
    .acc_in    (prod_out),
    .acc_out   (acc_out)
  );

  endmodule 

