module testvga1(CLOCK_50,RST,VGA_R,VGA_G,VGA_B,VGA_VS,VGA_HS,VGA_CLK);
	input CLOCK_50;
	input RST;
	output [7:0] VGA_R;
	output [7:0] VGA_G;
	output [7:0] VGA_B;
	reg [7:0] vga_R,vga_G,vga_B;
	output VGA_VS,VGA_HS;
	output VGA_CLK;
	reg VGA_VS,VGA_HS;
	
	reg [9:0] HCNT;
	reg [9:0] VCNT;
	reg PCLK;
	
	always @(posedge CLOCK_50,posedge RST) begin 
		if(RST)
			PCLK <= 1'b0;
		else
			PCLK <= ~PCLK;
	end

	assign VGA_CLK = PCLK;
	
	parameter HMAX = 800;
	parameter VMAX = 521;
	
	//hcnt
	always @(posedge PCLK,posedge RST) begin 
		if(RST)
			HCNT <= 10'h000;
		else if (HCNT == HMAX-1'b1)
			HCNT <= 10'h000;
		else HCNT <= HCNT + 10'h001;
	end
	
	//vcnt
	always @(posedge PCLK,posedge RST) begin 
		if(RST)
			VCNT <= 10'h000;
		else if (HCNT == HMAX-1'b1) begin
			if(VCNT==VMAX-10'h001)
				VCNT <= 10'h000;
			else
				VCNT <= VCNT + 10'h001;
		end
	end
	
	
	parameter HVALID = 640;
	parameter HPULSE = 96;
	parameter HBPORCH = 16;
	
	parameter VVALID = 480;
	parameter VPULSE = 2;
	parameter VBPORCH = 10;
	
	
	always @(posedge PCLK) begin
		//vsync
		if((VCNT >= VVALID + VBPORCH) && ( VCNT < (VVALID + VBPORCH + VPULSE) ))
			VGA_VS <= 1'b0;
		else
			VGA_VS <= 1'b1;
			
		if((HCNT >= HVALID + HBPORCH) && ( HCNT < (HVALID + HBPORCH + HPULSE) ))
			VGA_HS <= 1'b0;
		else
			VGA_HS <= 1'b1;
			
	end	
	
	always @(posedge PCLK or posedge RST) begin
		if(RST) begin
			vga_R <= 8'd0;
			vga_G <= 8'd0;
			vga_B <= 8'd0;
		end else begin
			if((VCNT < VVALID) && (HCNT < HVALID)) begin
				vga_R <= 8'd255;
				vga_G <= 8'd0;
				vga_B <= 8'd0;
				if(HCNT < 210) begin
					vga_R <= 8'd0;
					vga_G <= 8'd0;
					vga_B <= 8'd255;
				end
				if(HCNT < 420 && HCNT >=  210) begin
					vga_R <= 8'd255;
					vga_G <= 8'd255;
					vga_B <= 8'd255;
				end
			
			end else begin 
				vga_R <= 8'd0;
				vga_G <= 8'd0;
				vga_B <= 8'd0;	
			end
		end
	end

	assign VGA_R = vga_R;
	assign VGA_G = vga_G;
	assign VGA_B = vga_B;

endmodule