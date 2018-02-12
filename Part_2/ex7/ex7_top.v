module ex7_top(
	 //reset signal
		KEY, //enable to run
		HEX0,
		HEX1
		);
		
		input [3:0] KEY;
		
		output [6:0] HEX0;
		output [6:0] HEX1;
		
		wire [6:0] shiftres;

	lfsr7 shift (shiftres,KEY[3]);
	
	hex_to_7seg seg0 (HEX0, shiftres[3:0]);
	hex_to_7seg seg1 (HEX1, {1'b0,shiftres[6:4]});
	
endmodule 