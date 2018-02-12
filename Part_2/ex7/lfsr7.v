module lfsr7 (data_out, clk);

	output [6:0] data_out;
	input clk;
	
	reg [6:0] sreg;
	
	initial sreg = 7'b0000001;
	always @ (posedge clk)
		sreg <= {sreg[5:0], sreg[0] ^ sreg[6]};
		
	assign data_out = sreg;
endmodule	