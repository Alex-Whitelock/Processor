`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer:	Daniel Clyde, Alexander Whitelock, Logan Scovil, William Black.
//
// Create Date:   20:05:44 09/29/2015
// Design Name:   Mem_FPGA_Test
// Module Name:   C:/Users/u0694842/Desktop/3710_9-29-2015/testMem.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mem_FPGA_Test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testMem;

	// Inputs
	reg clock;

	// Outputs
	//wire [3:0] anDisplay;
//	wire [7:0] outDisplay;
	wire [15:0] ReadDataA;
	wire [15:0] ReadDataB;

	// Instantiate the Unit Under Test (UUT)
	Mem_FPGA_Test uut (
		.clock(clock), 
		//.anDisplay(anDisplay),
		//.outDisplay(outDisplay)
		.ReadDataA(ReadDataA),
		.ReadDataB(ReadDataB)
	); 


	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
        always #1 clock=~clock;
endmodule

