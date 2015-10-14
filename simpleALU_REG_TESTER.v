`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:26:44 09/22/2015
// Design Name:   ALURegIntegration
// Module Name:   C:/Users/u0694842/Dropbox/3710/Processor/simpleALU_REG_TESTER.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALURegIntegration
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simpleALU_REG_TESTER;

	// Inputs
	reg [15:0] immediate;
	reg [4:0] regEnables;
	reg [4:0] buffAEnables;
	reg [4:0] buffBEnables;
	reg Cin;
	reg regOrImmed;
	reg clock;
	reg reset;
	reg [3:0] op;
	reg [3:0] exop;

	// Outputs
	wire [4:0] flagsOutput;
	wire [15:0] regOut15;

	// Instantiate the Unit Under Test (UUT)
	ALURegIntegration uut (
		.immediate(immediate), 
		.regEnables(regEnables), 
		.buffAEnables(buffAEnables), 
		.buffBEnables(buffBEnables), 
		.Cin(Cin), 
		.regOrImmed(regOrImmed), 
		.clock(clock), 
		.reset(reset), 
		.op(op), 
		.exop(exop), 
		.flagsOutput(flagsOutput), 
		.regOut15(regOut15)
	);

	initial begin
		// Initialize Inputs
		immediate = 0;
		regEnables = 0;
		buffAEnables = 0;
		buffBEnables = 0;
		Cin = 0;
		regOrImmed = 0;
		clock = 0;
		reset = 1;
		op = 0;
		exop = 0;

		// Wait 100 ns for global reset to finish
		#100;
        reset=0;
		  #10;
		 immediate = 1;
		regEnables = 5'd15;
		buffAEnables = 0;
		buffBEnables = 0;
		Cin = 0;
		regOrImmed = 0;
		reset = 0;
		op = 4'b0011;
		exop = 0; 
		// Add stimulus here

	end
      always #1 clock=~clock;
endmodule

