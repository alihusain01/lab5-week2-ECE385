module gate_mux(input logic [1:0] Choose, 
						input logic [15:0] MARMUX, PC, ALU, MDR, 
						output logic [15:0] BUS);
						
//Choose = 00 => MARMUX
//Choose = 01 => PC
//Choose = 10 => ALU
//Choose = 11 => MDR
	
	always_comb
	begin
		if (Choose == 00)
		begin
		BUS = MARMUX;
		end
		
		else if (Choose == 01)
		begin
		BUS = PC;
		end
	
		else if (Choose == 10)
		begin
		BUS = ALU;
		end	
	
		else
		begin
		BUS = MDR;
		end		
	end	

endmodule
