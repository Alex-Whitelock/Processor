`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:38:05 10/24/2015
// Design Name:   ProcessorControlUnit
// Module Name:   C:/Users/u0755840/Desktop/Processor/ControlLogicTest.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProcessorControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnitTest;

	// Inputs
	reg clock;
	reg [15:0] instruction;
	reg reset;

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
	wire pcOrRegMemMUX;
	wire memAEnabled;
	wire memAWriteEnabled;
	wire memBEnabled;
	wire outReset;

	// Instantiate the Unit Under Test (UUT)
	ProcessorControlUnit uut (
		.clock(clock), 
		.instruction(instruction), 
		.reset(reset), 
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
		.pcOrRegMemMUX(pcOrRegMemMUX), 
		.memAEnabled(memAEnabled), 
		.memAWriteEnabled(memAWriteEnabled), 
		.memBEnabled(memBEnabled), 
		.outReset(outReset)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		instruction = 0;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
	instruction=16'b0000000001010010;
	#10;
	clock=1;
	//stage0;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage0;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 1;
	#10;
	clock=0;
	#10;
	clock=1;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 0;
	instruction = 16'h04c3;//lw
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 1
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 3
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 4;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 0
	instruction = 16'h5a3f;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 1;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 7 
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 8;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 0;
	instruction=16'h04fb;
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 5
	#10;
	clock=0;
	#10;
	clock=1;
	//stage 0;
	#10;
	clock=0;
	#10;
	clock=1;
	


	
	
	end	  
		// Add stimulus here


      
endmodule

