`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:39:25 10/17/2015
// Design Name:   Sign_Extend
// Module Name:   C:/Users/u0607599/Documents/GitHub/Processor/Sign_Test.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sign_Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sign_Test;

	// Inputs
	reg [3:0] upper;
	reg [3:0] lower;
	reg reset;

	// Outputs
	wire [15:0] imme;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extend uut (
		.upper(upper), 
		.lower(lower), 
		.reset(reset), 
		.imme(imme)
	);

	initial begin
		// Initialize Inputs
		upper = 0;
		lower = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#10;
		reset = 0;
		//positive
		upper = 4'b0001;
		lower = 4'b0000;
		#10; // expect: 16
		//negative
		upper = 4'b1000;
		lower = 4'b0000;
		#10; // expect: -128
		//pseudo random
		upper = 4'b1111;
		lower = 4'b0000;
		#10; // expect: -16
		upper = 4'b1111;
		lower = 4'b1111;
		#10;// expect: -1
		upper = 4'b0000;
		lower = 4'b0110;
		#10;// expect: 6 

	end
      
endmodule

