module multiplier
  import matrix_pkg::*;
  (
    input logic clk, rst_n , mul_en,
    input logic signed [DATA_WIDTH-1:0] a_in , b_in,
    output logic signed [PROD_WIDTH-1:0] prod_out ,
    output logic  prod_valid 
  );
  always_ff @(posedge clk or  negedge rst_n)begin 
    if(!rst_n)begin 
      prod_out  <= '0;
      prod_valid <= 1'b0;
    end
    else begin
      if(mul_en)begin 
        prod_out <= a_in * b_in;
        prod_valid <= 1'b1;
      end
      else begin
        prod_valid <= 1'b0;
      end
    end
  end
endmodule
