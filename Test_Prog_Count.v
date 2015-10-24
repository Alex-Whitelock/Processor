`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel Clyde, Logan Scovill, Will Black, Alex Whitelock
//
// Create Date:   12:57:40 10/17/2015
// Design Name:   Program_Counter
// Module Name:   C:/Users/u0607599/Documents/GitHub/Processor/Test_Prog_Count.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Prog_Count;

	// Inputs
	//reg [15:0] branch_addr; ##Branch STuff##
	//reg sel_next;
	reg PCe;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] PC;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		//.branch_addr(branch_addr), ##Branch Stuff##
		//.sel_next(sel_next),
		.PCe(PCe),
		.clk(clk), 
		.reset(reset), 
		.PC(PC)
		
	);

	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		//branch_addr = 0;
		//sel_next = 0;
		clk = 0;
		reset = 0;
		PCe = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#10;
		reset = 0;
		#10;
		//branch_addr = 0;
		//sel_next = 0;
		
		PCe = 1;
		#100; //wait for increment
		PCe = 0;
		#100;
		
		/*branch_addr = 5000; ##Branch Stuff##
		sel_next = 1;
		#10;
		sel_next = 0;
		#100; //wait to increment*/
		
		reset = 1;
		#10;
		reset = 0;
		#50;
		
		
	end
      
endmodule

