module wm8731_tp;
reg CLOCK_50,RST;

wire sclk,sda;

parameter STEP= 100000;

WM8731_config mo(.CLK(CLOCK_50),.RST(RST),.sclk(sclk),.sda(sda));


initial 
 begin 
  #5 RST = 1'b1;
  #6 RST = 1'b0; 
end

initial 
 begin
  CLOCK_50 = 0;
  forever #10 CLOCK_50 = ~CLOCK_50;
end

endmodule
