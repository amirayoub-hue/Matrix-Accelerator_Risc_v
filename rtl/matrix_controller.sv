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

    state_t state ,state_n;

logic [IDX_WIDTH-1:0] i_idx, j_idx, k_idx, i_n, j_n, k_n;
assign state_dbg = state ;

always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
      state <= S_IDLE;
      i_idx <= '0;
      j_idx <= '0;
      k_idx <= '0;
    end
    else begin 
      state <= state_n;
      i_idx <= i_n;
      j_idx <= j_n;
      k_idx <= k_n;  
    end
end

always_comb begin 
    state_n   = state;
    i_n       = i_idx;
    j_n       = j_idx;
    k_n       = k_idx;
    rd_row_a  = i_idx;
    rd_col_a  = k_idx;
    rd_row_b  = k_idx;
    rd_col_b  = j_idx;
    c_wr_en   = 1'b0;
    c_row     = i_idx;
    c_col     = j_idx;
    mul_en    = 1'b0;
    acc_clear = 1'b0;
    acc_en    = 1'b0;
    done      = 1'b0;

    unique case (state)
           S_IDLE:begin 
      if(start)begin
        i_n       = '0;
        j_n       = '0;
        k_n       = '0;
        acc_clear = 1'b1;  
        state_n   = S_LOAD;
      end
    end

    S_LOAD:begin 
        state_n = S_MUL ;
    end

    S_MUL:begin
        mul_en =1'b1;
        state_n = S_ACC;
    end  

    S_ACC:begin 
        acc_en  = 1'b1;
        state_n = S_STORE;
    end  

    S_STORE:begin 
        if(k_idx == IDX_WIDTH'(N-1))begin
             c_wr_en = 1'b1;  
         end
         state_n =S_NEXT;
    end  

    S_NEXT:begin
        if(k_idx != IDX_WIDTH'(N-1))begin
          k_n     = k_idx + 1'b1;
          state_n = S_LOAD; 
        end
        else begin
          acc_clear = 1'b1;
          k_n       = '0;
          if(j_idx != IDX_WIDTH'(N-1))begin
            j_n     = j_idx + 1'b1;
            state_n = S_LOAD;
          end
          else if(i_idx != IDX_WIDTH'(N-1))begin
            i_n     = i_idx + 1'b1;
            j_n     = '0;
            state_n = S_LOAD;
          end
          else begin
            state_n = S_DONE ;
           end
        end
     end 

    S_DONE:begin
        done = 1'b1;
        if(!start)
        state_n = S_IDLE ;
     end

        default: state_n = S_IDLE ;
    endcase
end
endmodule 

