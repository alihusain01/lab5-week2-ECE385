module testbench_1();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

//module slc3(
//	input logic [9:0] SW,
//	input logic	Clk, Reset, Run, Continue,
//	output logic [9:0] LED,
//	input logic [15:0] Data_from_SRAM,
//	output logic OE, WE,
//	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
//	output logic [15:0] ADDR,
//	output logic [15:0] Data_to_SRAM
//);


logic  Clk, Reset, Run, Continue, OE, WE, LD_PC;
logic [9:0] SW, LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] ADDR, Data_to_SRAM, Data_from_SRAM, R0, R1, R2, R3, R4, R5, R6, R7;

logic [15:0] PC, IR, MAR, MDR, BUS;

logic [4:0] State;

logic [1:0] PCMUX_Adder;

slc3_testtop SLC3(.*);

assign PC = SLC3.slc.PC;
assign IR = SLC3.slc.IR;
assign MAR = SLC3.slc.MAR;
assign MDR = SLC3.slc.MDR;
assign BUS = SLC3.slc.BUS;
assign State = SLC3.slc.state_controller.State;
assign R0 = SLC3.slc.Register_file.R0.Data_Out;
assign R1 = SLC3.slc.Register_file.R1.Data_Out;
assign R2 = SLC3.slc.Register_file.R2.Data_Out;
assign R3 = SLC3.slc.Register_file.R3.Data_Out;
assign R4 = SLC3.slc.Register_file.R4.Data_Out;
assign R5 = SLC3.slc.Register_file.R5.Data_Out;
assign R6 = SLC3.slc.Register_file.R6.Data_Out;
assign R7 = SLC3.slc.Register_file.R7.Data_Out;

assign LD_PC = SLC3.slc.LD_PC;


//logic [4:0] state;
//assign state = CT.curr_state;

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 


initial begin: TEST_VECTORS

SW = 10'h3;
Continue  = 1'b0;
Run = 1'b0;

#2 Continue = 1'b1;
Run = 1'b1;

#2 Run = 1'b0;
#2 Run = 1'b1;
	
end
endmodule
