module pc_mux(input logic [1:0] Choose, 
						input logic [15:0] BUS, ADDER, PCMUX_In,
						output logic [15:0] PCMUX_Out);
						
//Choose = 00 => PC + 1
//Choose = 01 => ADDER
//Choose = 10 => BUS
//Choose = 11 => Z
	
	always_comb
	begin
		case (Choose)
			2'b00 : begin
				PCMUX_Out = PCMUX_In + 16'h0001;
			end
			2'b01 : begin
				PCMUX_Out = ADDER;
			end
			2'b10 : begin
				PCMUX_Out = BUS;
			end
			2'b11 : begin
				PCMUX_Out = 16'hFFFF;
			end
		endcase		
	end	

endmodule
