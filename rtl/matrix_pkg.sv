package matrix_pkg;
    parameter int DATA_WIDTH = 8; 
    parameter int N = 2; //2x2
    parameter int IDX_WIDTH =(N>1) ?clog2(N) : 1;
    parameter int PROD_WIDTH = 2 * DATA_WIDTH;
    parameter int ACC_WIDTH  = PROD_WIDTH + 4;
endpackage : matrix_pkg

