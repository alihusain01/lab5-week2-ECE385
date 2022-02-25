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


logic  Clk, Reset, Run, Continue, OE, WE;
logic [9:0] SW, LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] ADDR, Data_to_SRAM, Data_from_SRAM;

logic [15:0] PC, IR, MAR, MDR;

slc3_testtop SLC3(.*);

assign PC = SLC3.slc.PC;
assign IR = SLC3.slc.IR;
assign MAR = SLC3.slc.MAR;
assign MDR = SLC3.slc.MDR;

//logic [4:0] state;
//assign state = CT.curr_state;

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 


initial begin: TEST_VECTORS

SW = 10'b0;
Continue  = 1'b0;
Run = 1'b0;

#2 Continue = 1'b1;
Run = 1'b1;

#2 Run = 1'b0;
#2 Run = 1'b1;
#50 Continue = 1'b0;
#2 Continue = 1'b1; 
	
end
endmodule
