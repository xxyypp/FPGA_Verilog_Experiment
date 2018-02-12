module ex11_top(
		CLOCK_50, //clock input
		SW, //enable to run
		DAC_CS,
		DAC_SDI,
		DAC_LD,
		DAC_SCK,
		PWM_OUT
		);
		
		input CLOCK_50;
		input [9:0] SW;
	
		output DAC_CS;
		output DAC_SDI;
		output DAC_LD;
		output DAC_SCK;
		output PWM_OUT;
		
		clkdiv clk(CLOCK_50,5000,tick);
		
		spi2dac fpgaout (CLOCK_50, SW[9:0], tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
		
		pwm pwmmodul (CLOCK_50,SW[9:0],tick,PWM_OUT);
	
endmodule 