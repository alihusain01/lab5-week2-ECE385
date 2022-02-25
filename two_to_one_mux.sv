module two_to_one_mux(input logic Choose, 
						input logic [15:0] S0, S1,
						output logic [15:0] OUT);
						
//Choose = 0 => S0
//Choose = 1 => S1

	always_comb
	begin
		if (Choose == 0)
		begin
		OUT = S0;
		end
	
		else
		begin
		OUT = S1;
		end		
	end	

endmodule
