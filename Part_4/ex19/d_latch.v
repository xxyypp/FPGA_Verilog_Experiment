module D_latch ( D,clk,  Q);

input clk;
input D;
output Q;
reg Q;

always @ (posedge clk)
		Q <= D;
		
endmodule 
/*use clk input here is to delay the input by 1 clock cycle */