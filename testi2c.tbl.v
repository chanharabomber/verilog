//'timescale 1ps/1ps

module testtest_tp;
reg CLOCK_50,RST,start;

wire sclk,busy,sda;

parameter STEP= 100000;

I2C I2C(.CLK(CLOCK_50),.RST(RST),.start(start),.busy(busy),.data(16'h1234),.sda(sda),.sclk(sclk));

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

always @(posedge RST , posedge CLOCK_50) begin
 if(RST)
  start <= 1'b1;
 else if(busy)
  start <= 1'b0;
end
  

/*
initial begin
 CLOCK_50=1'b0;RST=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b0;RST=1'b1;start=1'b0;
 #STEP CLOCK_50=1'b1;RST=1'b1;start=1'b0;
 #STEP CLOCK_50=1'b0;RST=1'b1;start=1'b0;
 #STEP CLOCK_50=1'b1;RST=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b0;RST=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b1;RST=1'b0;start=1'b1;
 #STEP CLOCK_50=1'b0;RST=1'b0;start=1'b1;
 #STEP CLOCK_50=1'b1;RST=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b0;RST=1'b0;start=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1; 
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1; 
#STEP CLOCK_50=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b1;start=1'b0;
 #STEP CLOCK_50=1'b0;start=1'b1;
 #STEP CLOCK_50=1'b1;start=1'b1;
 #STEP CLOCK_50=1'b0;start=1'b1;
 #STEP CLOCK_50=1'b1;start=1'b0;
 #STEP CLOCK_50=1'b0;start=1'b0;
 #STEP CLOCK_50=1'b1;start=1'b0;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1; 
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1; 
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1; 
#STEP CLOCK_50=1'b0;
#STEP CLOCK_50=1'b1;
 #STEP $finish;
end
*/

initial $monitor( $time,"CLOCK_50=%d RST=%d busy=%d sda=%d sclk=%d",CLOCK_50,RST,start,busy,sda,sclk );

endmodule

