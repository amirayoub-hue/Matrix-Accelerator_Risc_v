module accumulator
import matrix_pkg :: *;
(
   input logic clk ,rst_n, acc_clear,acc_en ,
   input logic signed [PROD_WIDTH-1:0] acc_in,
   output logic signed [ACC_WIDTH-1:0] acc_out 
);
    always_ff @( posedge clk or  negedge rst_n ) begin 
       if(!rst_n) 
       acc_out <= '0;
       else if (acc_clear)
       acc_out <='0;
       else if (acc_en)
       acc_out <= acc_out + acc_in;
        
  end 
endmodule 
