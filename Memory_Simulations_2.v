`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:03:53 10/03/2015
// Design Name:   Memory_Management
// Module Name:   C:/Users/u0755840/Desktop/ALUREG_SEP/ALUREG_SEP/Memory_Simulations_2.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory_Management
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_Simulations_2;

	// Inputs
	reg clk;
	reg enA;
	reg wenA;
	reg enB;
	reg [15:0] WriteDataA;
	reg [14:0] AddressA;
	reg [14:0] AddressB;

	// Outputs
	wire [15:0] ReadDataA;
	wire [15:0] ReadDataB;
	
	integer i;
	integer checkValue;

	// Instantiate the Unit Under Test (UUT)
	Memory_Management uut (
		.clk(clk), 
		.enA(enA), 
		.wenA(wenA), 
		.enB(enB), 
		.WriteDataA(WriteDataA), 
		.AddressA(AddressA), 
		.AddressB(AddressB), 
		.ReadDataA(ReadDataA), 
		.ReadDataB(ReadDataB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		enA = 0;
		wenA = 0;
		enB = 0;
		WriteDataA = 0;
		AddressA = 0;
		AddressB = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

		
		for (i = 1; i < 2**15 - 1; i = i + 1)
			begin
			clk = 0;
			enA = 1;
			wenA = 1;
			AddressA = i;
			WriteDataA = i;
			checkValue = i;
			#10;
			
			clk = 1;
			#10;
			
			clk = 0;
			wenA = 0;
			AddressA = i;
			WriteDataA = 0;
			#10
			
			clk = 1;
			#10;
			
			if (ReadDataB != checkValue)
			begin
				$display("Failure in memory read/write: " +  i);
			end
		
			end


	end
      
endmodule
