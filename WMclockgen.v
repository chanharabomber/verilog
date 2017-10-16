module WMclock_gen(input CLK_50,input RST,output xclk,output bclk,output lrclk,output load);

//PLL(in CLK_50,out xclk) 12.288
//XCLKGEN_altpll xclkgen(CLK_50,xclk,locked);
XCLKGEN_altpll xclkgen(RST,xclk,CLK_50);
	
reg [7:0] cnt;
always @(posedge RST , posedge xclk ) begin
	if(RST)
		cnt <= 8'd0;
	else
		cnt <= cnt + 8'd1;
end

assign load = (cnt[7:3] == 5'b01111);
assign bclk = cnt[2];
assign lrclk = cnt[7];

endmodule
