module ex12_top(
		CLOCK_50, //clock input
		SW, //enable to run
		HEX0,
		HEX1,
		HEX2,
		HEX3,
		HEX4
		);
		
		input CLOCK_50;
		input [9:0] SW;
		
		wire [9:0] qout;
		
		output [6:0] HEX0;
		output [6:0] HEX1;
		output [6:0] HEX2;
		output [6:0] HEX3;
		output [6:0] HEX4;
		
		wire [3:0] BCD0;
		wire [3:0] BCD1;
		wire [3:0] BCD2;
		wire [3:0] BCD3;
		wire [3:0] BCD4;
		
		ROM romout(SW[9:0],CLOCK_50,qout[9:0]);
		
		bin2bcd_16 bin (qout[9:0], BCD0, BCD1, BCD2, BCD3, BCD4);
		
		
	hex_to_7seg seg0 (HEX0, BCD0);
	hex_to_7seg seg1 (HEX1, BCD1);
	hex_to_7seg seg2 (HEX2, BCD2);
	hex_to_7seg seg3 (HEX3, BCD3);
	hex_to_7seg seg4 (HEX4, BCD4);

	
endmodule 