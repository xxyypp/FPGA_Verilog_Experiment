
module processor (sysclk, data_in, data_out,data_valid,SW,HEX0,HEX1,HEX2,HEX3,HEX4);
	
	input 			data_valid;
	input [8:0] SW;
	
	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data
	
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
	
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y,fifo,betafifo;
	wire [9:0] 		pulse;
	
	wire 				rdreq;
	wire 				full;
	wire 				latch_out;
	wire signed [8:0]		q;
	wire [12:0] counterout;
	wire [12:0] wdaddr;
	wire [19:0] shift;
	

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;
	
	assign x = data_in[9:0] - ADC_OFFSET;
	
	pulse_gen pul(pulse, data_valid, sysclk);
	
	counter_13 ctr13(	~data_valid,	1, 	counterout, 	0 );
	
	assign wdaddr = {SW[8:0],1'b0,1'b0,1'b0,1'b0} + counterout;
	//FIFO_noempty fifoset(	sysclk,	y[9:1],	rdreq,	pulse,	full,	q);	
	RAM ramout(	sysclk,	y[9:1],	counterout,	pulse,	wdaddr,	pulse,	q);
	
	// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	assign y = x - {q[8],q[8:0]};
	
	assign shift = SW[8:0]*11'h666;
	
	bin2bcd_16 bin (shift[19:10], BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg seg0 (HEX0, BCD0);
	hex_to_7seg seg1 (HEX1, BCD1);
	hex_to_7seg seg2 (HEX2, BCD2);
	hex_to_7seg seg3 (HEX3, BCD3);
	hex_to_7seg seg4 (HEX4, BCD4);
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	