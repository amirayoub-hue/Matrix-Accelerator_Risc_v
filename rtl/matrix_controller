module matrix_controller
import matrix_pkg::*;

(input logic clk , rst_n , start , done ,
output logic [IDX_WIDTH-1:0] rd_row_a ,rd_row_b,
output logic [IDX_WIDTH-1:0] rd_col_a ,rd_col_b ,
output logic [IDX_WIDTH-1:0] C_row ,c_col,
output logic c_wr_en , mul_en, _acc_clear, acc_en,
output logic [3:0] state_dbg );

typedef enum logic [3:0]{
    S_IDLE  = 4'd0,
    S_LOAD  = 4'd1,
    S_MUL   = 4'd2,
    S_ACC   = 4'd3,
    S_STORE = 4'd4,
    S_NEXT  = 4'd5,
    S_DONE  = 4'd6
} state_t;
endmodule 

