module sreg7 (data_out, data_in, clk);

	output data_out;
	input data_in;
	input clk;
	
	reg [7:1] sreg;
	initial sreg = 7'b0;
	always @ (posedge clk)
		begin
			sreg[7] <= sreg[6];
			sreg[6] <= sreg[5];
			sreg[5] <= sreg[4];
			sreg[4] <= sreg[3];
			sreg[3] <= sreg[2];
			sreg[2] <= sreg[1];
			sreg[1] <= data_in;
		end
		
		wire data_out;
		assign data_out = sreg[7];
endmodule
