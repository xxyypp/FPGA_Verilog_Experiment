module clkdiv(
	clkin,
	N,
	tick
	);
	
	parameter N_BIT = 16;
	
	input clkin;
	input [N_BIT-1:0] N;
	
	output tick;
	
	reg [N_BIT-1:0] count;
	reg tick;
	
	initial tick = 1'b0;
	
	always @ (posedge clkin)
		if (count == 0) begin
				tick <= 1'b1;
				count <= N;
				end
			else begin
				tick <= 1'b0;
				count <= count - 1'b1;
				end
endmodule
