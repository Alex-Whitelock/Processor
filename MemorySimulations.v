`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:16 09/29/2015
// Design Name:   Memory_Management
// Module Name:   U:/My Documents/ALUREG_SEP/MemorySimulations.v
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

module MemorySimulations;

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
	
	integer  j;
	integer  lastWritten;

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
		lastWritten=0;

		// Wait 100 ns for global reset to finish
		#100;
        for(j = 1; j < 2**15 - 1; j=j+1) // Loop through input 1 combinations
				begin
				
					clk=1;
					enA=1;
					enB=1;
					wenA=1;
					AddressA=j;
					AddressB=j-1;
					WriteDataA=j;
					#10;
					
					if(clk)
						begin
							clk=0;
							#10;
						end
					if(ReadDataB!=lastWritten)
						begin
							$display("memory did not display properly." +  j);
						end
						lastWritten=j;
					
						
					
				end

		// Add stimulus here

	end
      
		
endmodule

