module reg_file(input logic [15:0] BUS,
						input logic [2:0] DRMUX, SR1MUX, SR2,
						input logic LD_REG, Clk, Reset,
						output logic [15:0] SR1OUT, SR2OUT);

logic [7:0] LD_REG_arr ;
logic [7:0] Data_Out_arr[15:0];						
						
reg_16 R0(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[0]), .D(BUS), .Data_Out(Data_Out_arr[0]));
reg_16 R1(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[1]), .D(BUS), .Data_Out(Data_Out_arr[1]));
reg_16 R2(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[2]), .D(BUS), .Data_Out(Data_Out_arr[2]));
reg_16 R3(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[3]), .D(BUS), .Data_Out(Data_Out_arr[3]));
reg_16 R4(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[4]), .D(BUS), .Data_Out(Data_Out_arr[4]));
reg_16 R5(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[5]), .D(BUS), .Data_Out(Data_Out_arr[5]));
reg_16 R6(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[6]), .D(BUS), .Data_Out(Data_Out_arr[6]));
reg_16 R7(.Clk(Clk), .Reset(Reset), .Enable(LD_REG_arr[7]), .D(BUS), .Data_Out(Data_Out_arr[7]));
						
 always_comb
 begin
	 LD_REG_arr[0] = 1'b0;
	 LD_REG_arr[1] = 1'b0;
	 LD_REG_arr[2] = 1'b0;
	 LD_REG_arr[3] = 1'b0;
	 LD_REG_arr[4] = 1'b0;
	 LD_REG_arr[5] = 1'b0;
	 LD_REG_arr[6] = 1'b0;
	 LD_REG_arr[7] = 1'b0;
	case (LD_REG)
		1'b1:						
		case (DRMUX)
			3'b000:
				 LD_REG_arr[0] = 1'b1;
			3'b001:
				 LD_REG_arr[1] = 1'b1;
			3'b010:
				 LD_REG_arr[2] = 1'b1;
			3'b011:
				 LD_REG_arr[3] = 1'b1;
			3'b100:
				 LD_REG_arr[4] = 1'b1;
			3'b101:
				 LD_REG_arr[5] = 1'b1;
			3'b110:
				 LD_REG_arr[6] = 1'b1;	
			3'b111:
				 LD_REG_arr[7] = 1'b1;	
		endcase
	endcase

	case (SR1MUX)
		3'b000:
			 SR1OUT = Data_Out_arr[0];
		3'b001:
			 SR1OUT = Data_Out_arr[1];
		3'b010:
			 SR1OUT = Data_Out_arr[2];
		3'b011:
			 SR1OUT = Data_Out_arr[3];
		3'b100:
			 SR1OUT = Data_Out_arr[4];
		3'b101:
			 SR1OUT = Data_Out_arr[5];
		3'b110:
			 SR1OUT = Data_Out_arr[6];
		3'b111:
			 SR1OUT = Data_Out_arr[7];
	endcase

	case (SR2)
		3'b000:
			 SR2OUT = Data_Out_arr[0];
		3'b001:
			 SR2OUT = Data_Out_arr[1];
		3'b010:
			 SR2OUT = Data_Out_arr[2];
		3'b011:
			 SR2OUT = Data_Out_arr[3];
		3'b100:
			 SR2OUT = Data_Out_arr[4];
		3'b101:
			 SR2OUT = Data_Out_arr[5];
		3'b110:
			 SR2OUT = Data_Out_arr[6];
		3'b111:
			 SR2OUT = Data_Out_arr[7];
	endcase
end			
endmodule
