module ALU (input logic [15:0] SR1, SR2_OUT, 
				input logic [1:0] ALUK, 
				output logic [15:0] OUT);
// ADD = 00
//AND = 01
//NOT = 10
								
always_comb
begin
	if (ALUK == 2'b00)
	begin
	OUT = SR1 + SR2_OUT;
	end
	else if (ALUK == 2'b01)
	begin
	OUT = SR1 & SR2_OUT;
	end
	else
	begin
	OUT = ~SR1;
	end
end		
endmodule
