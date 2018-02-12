module ex6_top(
	 //reset signal
		CLOCK_50, //clock input
		KEY, //enable to run
		HEX0,
		HEX1,
		HEX2,
		HEX3,
		HEX4
		);
		
		input CLOCK_50;
		input [1:0] KEY;
	
		
		
		output [6:0] HEX0;
		output [6:0] HEX1;
		output [6:0] HEX2;
		output [6:0] HEX3;
		output [6:0] HEX4;
		
		wire [15:0] count;
		
		wire [3:0] BCD0;
		wire [3:0] BCD1;
		wire [3:0] BCD2;
		wire [3:0] BCD3;
		wire [3:0] BCD4;
		
		wire [15:0] tick;
		wire enablein;
		
	clkdiv div50000 (CLOCK_50, 49999,tick);
		
	assign enablein = (tick & ~KEY[0]);
		
	counter_16 counterout (CLOCK_50,	enablein,count,~KEY[1]);
	 
	bin2bcd_16 bin (count, BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg seg0 (HEX0, BCD0);
	hex_to_7seg seg1 (HEX1, BCD1);
	hex_to_7seg seg2 (HEX2, BCD2);
	hex_to_7seg seg3 (HEX3, BCD3);
	hex_to_7seg seg4 (HEX4, BCD4);

	
endmodule 
