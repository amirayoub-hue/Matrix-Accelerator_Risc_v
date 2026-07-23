module registers
import matrix_pkg::*;
(
        input logic clk , rst_n,
        input logic load_en, load_sel,
        input logic [IDX_WIDTH-1:0] load_row ,load_col,
        input logic signed [DATA_WIDTH-1:0] load_data,        
        input logic [IDX_WIDTH-1 :0]  rd_row_a, rd_col_a, rd_row_b,rd_col_b,
        output logic signed [DATA_WIDTH-1:0] a_data, b_data,
        input logic c_wr_en,
        input logic [IDX_WIDTH-1:0] c_row, c_col,
        input logic signed [ACC_WIDTH-1:0] c_data,
        input logic [IDX_WIDTH-1:0] rd_row_c, rd_col_c,
        output logic [ACC_WIDTH-1:0] c_data_out 
);
logic signed [DATA_WIDTH-1:0] mem_a[0:N-1][0:N-1];
logic signed [DATA_WIDTH-1:0] mem_b [0:N-1][0:N-1];
logic signed [ACC_WIDTH-1:0] mem_c [0:N-1][0:N-1];
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      for (int r = 0; r < N; r++) begin
        for (int c = 0; c < N; c++) begin
          mem_a[r][c] <= '0;
          mem_b[r][c] <= '0;
          mem_c[r][c] <= '0;
     end
   end
 end
 else begin
    if (load_en) begin
       if (!load_sel)
          mem_a[load_row][load_col] <= load_data;
      else
          mem_b[load_row][load_col] <= load_data;
      end
      if (c_wr_en)
        mem_c[c_row][c_col] <= c_data;
    end
  end
  assign a_data = mem_a[rd_row_a][rd_col_a];
  assign b_data = mem_b[rd_row_b][rd_col_b];
  assign c_data_out = mem_c[rd_row_c][rd_col_c];
endmodule 
