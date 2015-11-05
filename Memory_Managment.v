`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    12:38:50 09/26/2015 
// Design Name: 
// Module Name:    Memory_Management 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Memory_Management(
    input clk,
    input enA,
    input wenA,
	 input enB,
    input [15:0] WriteDataA,
    input [14:0] AddressA,
	 input [14:0] AddressB,
    output reg [15:0] ReadDataA,
	 output reg [15:0] ReadDataB	 
    );
	
	//parameter RAM_WIDTH = 16; //<ram_width>;
	//parameter RAM_ADDR_BITS = 10; //<ram_addr_bits>;
		
 
	// Notice that the address bits = 10 implies 1024 words, which can be included in
	// one block. If this is increased to 11, the tool will map it to 2 BRAMs. 
	// View Tech Schematic.
	// RAM_ADDR_BITS = 15 will address 32 blocks of RAM. If this is extended to 16, then
	// the tool will also start synthesizing distributed RAM, and that will just be infeasible.
	
/*	 // Port A
	 input clk, enA, weA;
	 input [RAM_WIDTH-1:0] din;
	 input [RAM_ADDR_BITS-1:0] addr;
	 output reg [RAM_WIDTH-1:0] dout;
	 
	 // Port B description is your job
	 input en, we;
	 input [RAM_WIDTH-1:0] din;
	 input [RAM_ADDR_BITS-1:0] addr;
	 output reg [RAM_WIDTH-1:0] dout;*/
	 

   
    reg [15:0] the_memory_core [(2**15-1):0];
//   reg [RAM_WIDTH-1:0] <output_data>;
//
//   <reg_or_wire> [RAM_ADDR_BITS-1:0] <address>;
//   <reg_or_wire> [RAM_WIDTH-1:0] <input_data>;


	 always @(posedge clk)
			if (enA == 1'b1) begin
				if (wenA == 1'b1) begin
					the_memory_core[AddressA] <= WriteDataA;
					// In write-first mode, the din is also passed on to dout
					ReadDataA <= WriteDataA;
				end
				else
					ReadDataA <= the_memory_core[AddressA];
			end
			
	 always @(posedge clk)
			if (enB == 1'b1) begin
				ReadDataB <= the_memory_core[AddressB];
			end
			else 
				begin
					ReadDataB <= ReadDataB;
				end
	

endmodule

   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
//   initial
//$readmemh("<data_file_name>", <rom_name>, <begin_address>, <end_address>);

   
