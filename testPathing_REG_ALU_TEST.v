`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:06:33 09/22/2015
// Design Name:   FPGA_REG_ALU_TEST
// Module Name:   C:/Users/u0694842/Dropbox/3710/Processor/testPathing_REG_ALU_TEST.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPGA_REG_ALU_TEST
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testPathing_REG_ALU_TEST;

	// Inputs
	reg clk;
	reg [1:0] select;
	reg resetIN;

	// Outputs
	wire [3:0] anDisplay;
	wire [7:0] outDisplay;

	// Instantiate the Unit Under Test (UUT)
	FPGA_REG_ALU_Display uut (
		.clk(clk), 
		.select(select), 
		.resetIN(resetIN), 
		.anDisplay(anDisplay), 
		.outDisplay(outDisplay)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		select = 0;
		resetIN = 1;
		#100
		resetIN=0;


	end
     always #1 clk =~clk; 
endmodule

