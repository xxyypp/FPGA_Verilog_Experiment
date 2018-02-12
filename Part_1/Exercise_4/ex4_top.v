module ex4_top (
SW, 		// Input switches
HEX0, 	// Hex output on 7 segment display
HEX1,
HEX2,
HEX3
);

	input [9:0] SW; // Declares input and output ports
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	
	wire [9:0] BCD0;
	wire [9:0] BCD1;
	wire [9:0] BCD2;
	wire [9:0] BCD3;
	
	
	bin2bcd_10 bin (SW[9:0], BCD0, BCD1, BCD2, BCD3);
	
	hex_to_7seg SEG0 (HEX0, BCD0);
	hex_to_7seg SEG1 (HEX1, BCD1);
	hex_to_7seg SEG2 (HEX2, BCD2);
	hex_to_7seg SEG3 (HEX3, BCD3);
	
endmodule 