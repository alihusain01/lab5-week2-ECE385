module gate_mux(input logic GatePC, GateMDR, GateALU, GateMARMUX, 
						input logic [15:0] PC, MDR, ALU, MARMUX, 
						output logic [15:0] BUS);
						
//Choose = 00 => MARMUX
//Choose = 01 => PC
//Choose = 10 => ALU
//Choose = 11 => MDR
	
	always_comb
	begin
		if (GatePC == 1)
		begin
		BUS = PC;
		end
		
		else if (GateMDR == 1)
		begin
		BUS = MDR;
		end
	
		else if (GateALU == 1)
		begin
		BUS = ALU;
		end	
	
		else
		begin
		BUS = MARMUX;
		end		
	end	

endmodule
