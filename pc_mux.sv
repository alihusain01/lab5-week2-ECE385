module pc_mux(input logic [1:0] Choose, 
						input logic [15:0] BUS, ADDER, PCMUX_In,
						output logic [15:0] PCMUX_Out);
						
//Choose = 00 => PC + 1
//Choose = 01 => ADDER
//Choose = 10 => BUS
//Choose = 11 => Z
	
	always_comb
	begin
		if (Choose == 00)
		begin
		PCMUX_Out = PCMUX_In + 1;
		end
		
		else if (Choose == 01)
		begin
		PCMUX_Out = ADDER;
		end
	
		else if (Choose == 10)
		begin
		PCMUX_Out = BUS;
		end	
	
		else
		begin
		PCMUX_Out = 16'h0;
		end		
	end	

endmodule
