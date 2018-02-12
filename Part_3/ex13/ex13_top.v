module ex13_top(
		CLOCK_50, //clock input
		PWM_OUT,
		DAC_CS,
		DAC_SDI,
		DAC_LD,
		DAC_SCK
		);
		
		input CLOCK_50;
		
		output DAC_CS;
		output DAC_SDI;
		output DAC_LD;
		output DAC_SCK;
		output PWM_OUT;
		
		wire [9:0] counterout;		
		wire [9:0] romout;		
		wire [15:0] tick;
		
	clkdiv div5000 (CLOCK_50, 4999,tick);
		
	counter_16 counter16(CLOCK_50,	tick, 	counterout, 	0);
	
	ROM romo(counterout,tick,romout);
	
	spi2dac  spi(CLOCK_50, romout, tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm pwo(CLOCK_50,romout,tick,PWM_OUT);
	
endmodule 
