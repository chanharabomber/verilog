module singen(CLK,RST,SIN_OUT);
	input CLK,RST;
	output signed [15:0] SIN_OUT;
	
	reg [5:0] sin_cnt;

	always @(posedge CLK or posedge RST) begin
		if(RST)
			sin_cnt <= 6'd0;
		else if(sin_cnt >= 6'd47)
			sin_cnt <= 6'd0;
		else
			sin_cnt <= sin_cnt + 6'd1;
	end
	
	function signed [15:0] singenerater(input [5:0] cnt);
		
		case(cnt)
		
			6'd0: singenerater = 16'd0;
			6'd1: singenerater = 16'd3919;
			6'd2: singenerater = 16'd7772;
			6'd3: singenerater = 16'd11491;
			6'd4: singenerater = 16'd15014;
			6'd5: singenerater = 16'd18281;
			6'd6: singenerater = 16'd21234;
			6'd7: singenerater = 16'd23824;
			6'd8: singenerater = 16'd26006;
			6'd9: singenerater = 16'd27744;
			6'd10: singenerater = 16'd29006;
			6'd11: singenerater = 16'd29773;
			6'd12: singenerater = 16'd30030;
			6'd13: singenerater = 16'd29773;
			6'd14: singenerater = 16'd29006;
			6'd15: singenerater = 16'd27744;
			6'd16: singenerater = 16'd26006;
			6'd17: singenerater = 16'd23824;
			6'd18: singenerater = 16'd21234;
			6'd19: singenerater = 16'd18281;
			6'd20: singenerater = 16'd15014;
			6'd21: singenerater = 16'd11491;
			6'd22: singenerater = 16'd7772;
			6'd23: singenerater = 16'd3919;
			6'd24: singenerater = 16'd0;
			6'd25: singenerater = -16'd3919;
			6'd26: singenerater = -16'd7772;
			6'd27: singenerater = -16'd11491;
			6'd28: singenerater = -16'd15015;
			6'd29: singenerater = -16'd18281;
			6'd30: singenerater = -16'd21234;
			6'd31: singenerater = -16'd23824;
			6'd32: singenerater = -16'd26006;
			6'd33: singenerater = -16'd27744;
			6'd34: singenerater = -16'd29006;
			6'd35: singenerater = -16'd29773;
			6'd36: singenerater = -16'd30030;
			6'd37: singenerater = -16'd29773;
			6'd38: singenerater = -16'd29006;
			6'd39: singenerater = -16'd27744;
			6'd40: singenerater = -16'd26006;
			6'd41: singenerater = -16'd23824;
			6'd42: singenerater = -16'd21234;
			6'd43: singenerater = -16'd18281;
			6'd44: singenerater = -16'd15015;
			6'd45: singenerater = -16'd11491;
			6'd46: singenerater = -16'd7772;
			6'd47: singenerater = -16'd3919;
			default: singenerater = 16'hxxxx;
			
		endcase
	endfunction
	
	assign SIN_OUT = singenerater(sin_cnt);
	
endmodule
