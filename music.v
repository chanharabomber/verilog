module musicmicin(CLOCK_50,SW,AUD_ADCLRCK,AUD_ADCDAT,AUD_DACLRCK,AUD_DACDAT,AUD_XCK,AUD_BCLK,I2C_SCLK,I2C_SDAT);
	
	input CLOCK_50;	//RST => SW0
	input [1:0] SW;
	input AUD_ADCDAT;//nouse
	
	output AUD_ADCLRCK,	//no use
			 AUD_DACLRCK,
			 AUD_DACDAT,
			 AUD_XCK,
			 AUD_BCLK,
			 I2C_SCLK;
	inout I2C_SDAT;
	
	wire RST = SW[0];
	assign AUD_ADCLRCK =1'b0;
	
	wire load;
	wire signed [15:0] sindata;
	dataout dataout(.bclk(AUD_BCLK),.RST(RST),.dataL(sindata),.dataR(sindata),.load(load),.dac_dat(AUD_DACDAT));
	
	singen singen(.CLK(AUD_DACLRCK),.RST(RST),.SIN_OUT(sindata));
	
	WMclock_gen WMclock_gen(.CLK_50(CLOCK_50),.RST(RST),.xclk(AUD_XCK),.bclk(AUD_BCLK),.lrclk(AUD_DACLRCK),.load(load));
	
	WM8731_config WM8731_config(.CLK_50(CLOCK_50),.RST(RST),.sclk(I2C_SCLK),.sda(I2C_SDAT));

endmodule
