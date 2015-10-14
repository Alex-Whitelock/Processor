`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:41 09/22/2015
// Design Name:   Test_Cases
// Module Name:   C:/Users/u0694842/Dropbox/3710/Processor/testFin.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Test_Cases
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testFin;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] immediate;
	wire [4:0] regEnables;
	wire [4:0] buffAEnables;
	wire [4:0] buffBEnables;
	wire Cin;
	wire regOrImmed;
	wire reset_out;
	wire [3:0] op;
	wire [3:0] exop;

	// Instantiate the Unit Under Test (UUT)
	Test_Cases uut (
		.clk(clk), 
		.reset(reset), 
		.immediate(immediate), 
		.regEnables(regEnables), 
		.buffAEnables(buffAEnables), 
		.buffBEnables(buffBEnables), 
		.Cin(Cin), 
		.regOrImmed(regOrImmed), 
		.reset_out(reset_out), 
		.op(op), 
		.exop(exop)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10
		reset =0;


	end
      always #5 clk = ~clk;
endmodule

