
module processor (sysclk, data_in, data_out,data_valid);
	
	input 			data_valid;
	
	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data
	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y,fifo,betafifo;
	wire [9:0] 		pulse;
	
	wire 				rdreq;
	wire 				full;
	wire 				latch_out;
	wire signed [9:0]		q;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;
	
	assign x = data_in[9:0] - ADC_OFFSET;
	
	pulse_gen pul(pulse, data_valid, sysclk);
	
	D_latch Dres(full, sysclk, latch_out);
	
	assign rdreq = latch_out & pulse;
	
	FIFO_noempty fifoset(	sysclk,	y,	rdreq,	pulse,	full,	q);	
	
		// x is input in 2's complement
	
	// This part should include your own processing hardware 
	// ... that takes x to produce y
	// ... In this case, it is ALL PASS.
	assign y = x - {q[9],q[9:1]};
	//FIFO_noempty fifosetnew(	sysclk,	y,	rdreq,	pulse,	full,	q);	
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
endmodule
	