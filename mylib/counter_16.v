`timescale 1ns/100ps  //unit time is 1ns, resolution 100ps
//-----------------------------
//Design name: counter_8
//Function: an 8-bit synchronous counter with enable input
//------------------------------


module counter_16(
	clock, //clock input
	enable, //high enable counting
	count, //count value
	reset //reset count value to 0
	);
	
	//-----------declare ports----------------
	
	parameter BIT_SZ = 16;
	input clock;
	input enable;
	input reset;
	output [BIT_SZ-1:0] count;
	
	//count needs to be declared as reg
	reg[BIT_SZ-1:0] count;
	
	//---always initialise storage elements such as D-FF
	initial count = 0;
	
	//reset
	
		
	
	//---main body of the module---
	
	always @(posedge clock)
		if (reset == 1'b1)
			count <= 0;
		else if (enable == 1'b1)
			count <= count + 1'b1;
		
			
endmodule //end of module