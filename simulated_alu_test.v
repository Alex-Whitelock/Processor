`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:10 09/07/2015
// Design Name:   ALU
// Module Name:   C:/Users/u0607599/Dropbox/3710/Processor/simulated_alu_test.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module simulated_alu_test;

	// Inputs
	reg [3:0] op;
	reg [3:0] exop;
	reg [15:0] Rdest;
	reg [15:0] Rsrc;

	// Outputs
	wire [15:0] out;
	wire [4:0] flags;
	integer i;
	integer j;
	integer k;
	
	wire [15:0] testOut;
	wire [4:0]  testFlags;
	
parameter ADD = 4'b0101; 
parameter ADDU = 4'b0110;
parameter ADDC = 4'b0111;
parameter ADDCU = 4'b1010;
parameter SUB = 4'b1001;
parameter CMP = 4'b1011;
parameter CMPU= 4'b1000;
parameter AND = 4'b0001;
parameter OR = 4'b0010;
parameter XOR = 4'b0011;
parameter NOP = 4'b0000;
parameter NOT = 4'b0100;
parameter LW = 4'b1100; 
parameter SW = 4'b1111; 


//----Info for just OP I type and J type----
parameter ADDI = 4'b0101; 
parameter ADDUI = 4'b0110;
parameter ADDCI = 4'b0111;
parameter ADDCUI = 4'b1101;     
parameter SUBI = 4'b1001;
parameter CMPI = 4'b1011;
parameter LWI = 4'b0011;



//----Info for ExOp Shift-Type
parameter LSH = 4'b0100;
parameter LSHI = 4'b0000;
parameter RSH = 4'b0101;
parameter RSHI = 4'b0111;
parameter ALSH = 4'b0110;
parameter ARSH = 4'b0011;




	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.op(op), 
		.exop(exop), 
		.Rdest(Rdest), 
		.Rsrc(Rsrc), 
		.out(out), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		exop = 0;
		Rdest = 0;
		Rsrc = 0;
		i = 0;
		j = 0;
		k = 0;
		
		
		
		
		
		//----Info for ExOp R-type----

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		// Exhaustive Test of ALU inputs
		for(i=0; i < 255; i=i+1) //Loop through op codes and exop codes
		begin
			#10
			{op, exop} = i;
			Rdest = 65535;
			Rsrc = 65535;
			#10
			Rdest = 0;
			Rsrc = 0;
			#10
			for(j = 1; j < 32768; j=j<<1) // Loop through input 1 combinations
				begin
					#10
					Rdest = j;
					for(k = 1; k < 32768; k=k<<1) // Loop through input 2 combinations for each input 1 combination
					begin
						#10
						Rsrc = k;
						
						
						
					end
				end
		end

	end
      
endmodule

