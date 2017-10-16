module I2C(input CLK,input RST,input start,output reg busy,input [15:0] data,inout sda,output sclk);

parameter WM8731_raddr = 8'h34;


reg [4:0] cnt;
always @(posedge RST , posedge CLK) begin
	if(RST)
		cnt <= 5'd0;
	else if(cnt == 5'd0) begin
		if(start)
			cnt <= 5'd1;
	end else 
		cnt <= cnt + 5'd1;
end


reg [29:0] shift_data;
always @(posedge RST , posedge CLK) begin
	if(RST)
		shift_data <= 30'h3fffffff;
	else if(cnt == 5'd1) //load
		shift_data <= {1'b0,WM8731_raddr,1'b1,data[15:8],1'b1,data[7:0],3'b101};
	else 
		shift_data <= {shift_data[28:0],1'b1};
end

assign sda = shift_data[29]?1'bz:1'b0;


always @(posedge RST , negedge CLK) begin
	if(RST)
		busy <= 1'b0;
	else if(cnt == 5'd0)
		busy <= 1'b0;	
	else if(cnt == 5'd2)
		busy <= 1'b1;
	else if(cnt == 5'd30)
		busy <= 1'b0;
end

assign sclk = ~(busy & CLK);

endmodule


