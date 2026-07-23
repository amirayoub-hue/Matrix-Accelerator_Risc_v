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
    
endmodule
