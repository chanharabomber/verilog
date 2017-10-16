module dataout(input bclk,input RST,input signed [15:0] dataL,input signed [15:0] dataR,input load,output dac_dat);
reg [31:0] data;

always @(posedge RST , negedge bclk) begin
	if(RST)
		data <= 32'd0;
	else if(load)
		data <= {dataL,dataR};
	else
		data <= {data[30:0],1'b0};
end

assign dac_dat = data[31];

endmodule
