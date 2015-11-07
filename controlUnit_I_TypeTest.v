`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:29:16 11/07/2015
// Design Name:   ControlLogic
// Module Name:   C:/Users/u0694842/Documents/GitHub/Processor/controlUnit_I_TypeTest.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnit_I_TypeTest;

	// Inputs
	reg clock;
	reg [15:0] Instruction;
	reg reset;
	reg [1:0] flags;

	// Outputs
	wire [4:0] regWrite;
	wire [3:0] opCode;
	wire [3:0] exOp;
	wire [3:0] immediateHigh;
	wire [3:0] immediateLow;
	wire [4:0] rDest;
	wire [4:0] rSrc;
	wire regOrImm;
	wire pcEnabled;
	wire branchMux;
	wire jumpMux;
	wire pcOrRegMemMUX;
	wire memAEnabled;
	wire memAWriteEnabled;
	wire memBEnabled;
	wire outReset;
	wire pcToRegBuff;
	wire memToRegBuff;
	wire ALUToRegBuff;

	// Instantiate the Unit Under Test (UUT)
	ControlLogic uut (
		.clock(clock), 
		.Instruction(Instruction), 
		.reset(reset), 
		.flags(flags), 
		.regWrite(regWrite), 
		.opCode(opCode), 
		.exOp(exOp), 
		.immediateHigh(immediateHigh), 
		.immediateLow(immediateLow), 
		.rDest(rDest), 
		.rSrc(rSrc), 
		.regOrImm(regOrImm), 
		.pcEnabled(pcEnabled), 
		.branchMux(branchMux), 
		.jumpMux(jumpMux), 
		.pcOrRegMemMUX(pcOrRegMemMUX), 
		.memAEnabled(memAEnabled), 
		.memAWriteEnabled(memAWriteEnabled), 
		.memBEnabled(memBEnabled), 
		.outReset(outReset), 
		.pcToRegBuff(pcToRegBuff), 
		.memToRegBuff(memToRegBuff), 
		.ALUToRegBuff(ALUToRegBuff)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		Instruction = 0;
		reset = 0;
		flags = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

