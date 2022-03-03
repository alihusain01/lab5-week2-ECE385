module addr2_mux(input logic [1:0] ADDR2MUX, 
						input logic [15:0] ELEVEN, NINE, SIX,
						output logic [15:0] OUT);
						
//Choose = 00 => ZERO
//Choose = 01 => ELEVEN
//Choose = 10 => SIX
//Choose = 11 => NINE
	
	always_comb
	begin
		if (ADDR2MUX == 2'b00)
		begin
		OUT = ELEVEN;
		end
		
		else if (ADDR2MUX == 2'b01)
		begin
		OUT = NINE;
		end
	
		else if (ADDR2MUX == 2'b10)
		begin
		OUT = SIX;
		end	
	
		else
		begin
		OUT = 16'h0;
		end		
	end	

endmodule