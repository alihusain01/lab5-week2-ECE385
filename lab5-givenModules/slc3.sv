//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Lab 5 Given Code - SLC-3 top-level (Physical RAM)
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//------------------------------------------------------------------------------


module slc3(
	input logic [9:0] SW,
	input logic	Clk, Reset, Run, Continue,
	output logic [9:0] LED,
	input logic [15:0] Data_from_SRAM,
	output logic OE, WE,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic [15:0] ADDR,
	output logic [15:0] Data_to_SRAM
);


// An array of 4-bit wires to connect the hex_drivers efficiently to wherever we want
// For Lab 1, they will direclty be connected to the IR register through an always_comb circuit
// For Lab 2, they will be patched into the MEM2IO module so that Memory-mapped IO can take place
logic [3:0] hex_4[3:0]; 
HexDriver hex_drivers[3:0] (hex_4, {HEX3, HEX2, HEX1, HEX0});
// This works thanks to http://stackoverflow.com/questions/1378159/verilog-can-we-have-an-array-of-custom-modules


// Internal connections
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic SR2MUX, ADDR1MUX, MARMUX;
logic BEN, MIO_EN, DRMUX, SR1MUX;
logic [1:0] PCMUX, ADDR2MUX, ALUK;
logic [15:0] MDR_In;
logic [15:0] MAR, MDR, IR;

//ASSIGNING HEX DRIVERS
assign hex_4[0] = R5_Out[3:0];
assign hex_4[1] = R5_Out[7:4];
assign hex_4[2] = R5_Out[11:8];
assign hex_4[3] = R5_Out[15:12];


// Connect MAR to ADDR, which is also connected as an input into MEM2IO
//	MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
//	input into MDR)
assign ADDR = MAR; 
assign MIO_EN = OE;
// Connect everything to the data path (you have to figure out this part)
//datapath d0 (.*);

// Our SRAM and I/O controller (note, this plugs into MDR/MAR)

Mem2IO memory_subsystem(
    .*, .Reset(Reset), .ADDR(ADDR), .Switches(SW),
//    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]),
	 .HEX0(), .HEX1(), .HEX2(), .HEX3(),
    .Data_from_CPU(MDR), .Data_to_CPU(MDR_In),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// State machine, you need to fill in the code here as well
ISDU state_controller(
	.*, .Reset(Reset), .Run(Run), .Continue(Continue),
	.Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
   .Mem_OE(OE), .Mem_WE(WE)
);

// SRAM WE register
//logic SRAM_WE_In, SRAM_WE;
//// SRAM WE synchronizer
//always_ff @(posedge Clk or posedge Reset_ah)
//begin
//	if (Reset_ah) SRAM_WE <= 1'b1; //resets to 1
//	else 
//		SRAM_WE <= SRAM_WE_In;
//end



//I started building below this
//instantiate 16-bit registers IR, MDR,MAR, BUS, PC

logic [15:0] PC, PC_In, BUS, MARMUX_16, ALU, MIOMUX_Out, IN1_MARMUX, IN2_MARMUX, SR1OUT, SR2OUT, SR2MUX_Out, R5_Out;
logic [2:0] DRMUX_Out, SR1MUX_Out, CC_In, CC_Out;
logic BEN_In;

//logic for MARMUX
always_comb
begin
MARMUX_16 = IN1_MARMUX + IN2_MARMUX;
end

//logic for LEDS
//always_comb
//begin
//if(LD_LED == 1'b1)
//	begin
//	LED=IR[11:0];
//	end
//else
//begin
//LED=LED;
//end
//end

always_comb
	begin
	LED = IR[9:0];
	end


//logic for CC
always_comb
begin
if(BUS[15] == 1'b1)
	begin
		CC_In = 3'b100;
	end
else if(BUS == 16'h0)
	begin
		CC_In = 3'b010;
	end
else
	begin
		CC_In = 3'b001;
	end
end

//logic for BEN
always_comb
begin
	if((CC_Out[2] & IR[11]) || (CC_Out[1] & IR[10]) || (CC_Out[0] & IR[9]))
		begin
		BEN_In = 1'b1;
		end
	else
		begin
		BEN_In = 1'b0;
		end
end

//ALU:
ALU ALU_Unit(.SR1(SR1OUT), .SR2_OUT(SR2MUX_Out), .ALUK(ALUK), .OUT(ALU));


//MULTIPLEXERS:
pc_mux 					PC_Mux_Unit(.Choose(PCMUX), .BUS(BUS), .ADDER(MARMUX_16), .PCMUX_In(PC), .PCMUX_Out(PC_In));
two_to_one_mux 		MIO_Mux(.Choose(MIO_EN), .S0(BUS), .S1(MDR_In), .OUT(MIOMUX_Out));
gate_mux 				GATE_Mux_Unit(.GatePC(GatePC), .GateMDR(GateMDR), .GateALU(GateALU), .GateMARMUX(GateMARMUX),
												.PC(PC), .MDR(MDR), .ALU(ALU), .MARMUX(MARMUX_16), 
												.BUS(BUS));
addr2_mux 				ADDR2_Mux(.ADDR2MUX(ADDR2MUX), .ELEVEN({{5{IR[10]}}, IR[10:0]}), .NINE({{7{IR[8]}}, IR[8:0]}), 
									.SIX({{10{IR[5]}}, IR[5:0]}), .OUT(IN2_MARMUX));
two_to_one_mux 		ADDR1_Mux(.Choose(ADDR1MUX), .S0(SR1OUT), .S1(PC), .OUT(IN1_MARMUX));

reg_two_to_one_mux 	DR_Mux(.Choose(DRMUX), .S0(IR[11:9]), .S1(3'b111), .OUT(DRMUX_Out));
reg_two_to_one_mux 	SR1_Mux(.Choose(SR1MUX), .S0(IR[8:6]), .S1(IR[11:9]), .OUT(SR1MUX_Out));

two_to_one_mux 		SR2_Mux(.Choose(IR[5]), .S0(SR2OUT), .S1({{11{IR[4]}}, IR[4:0]}), .OUT(SR2MUX_Out));						

//REGISTERS
reg_16 PC_Unit(.Clk(Clk), .Reset(Reset), .Enable(LD_PC), .D(PC_In), .Data_Out(PC));
reg_16 MAR_Unit(.Clk(Clk), .Reset(Reset), .Enable(LD_MAR),.D(BUS), .Data_Out(MAR));
reg_16 MDR_Unit(.Clk(Clk), .Reset(Reset), .Enable(LD_MDR),.D(MIOMUX_Out), .Data_Out(MDR));
reg_16 IR_Unit( .Clk(Clk), .Reset(Reset), .Enable(LD_IR), .D(BUS) , .Data_Out(IR));

reg_file Register_file(.BUS(BUS), .DRMUX(DRMUX_Out), .SR1MUX(SR1MUX_Out), .SR2(IR[2:0]), .LD_REG(LD_REG),
								.Clk(Clk), .Reset(Reset), .SR1OUT(SR1OUT), .SR2OUT(SR2OUT), .R5_Out(R5_Out));
								
reg_1 BEN_Unit(.Clk(Clk), .Reset(Reset), .Enable(LD_BEN), .D(BEN_In), .Data_Out(BEN));
reg_3 CC_Unit(.Clk(Clk), .Reset(Reset), .Enable(LD_CC), .D(CC_In), .Data_Out(CC_Out));
								

	
endmodule
