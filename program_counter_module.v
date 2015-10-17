`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel Clyde, Logan Scovill, Will Black, Alex Whitelock
// 
// Create Date:    12:16:09 10/17/2015 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter(
    input [15:0] branch_addr,
    input sel_next,
	 input clk,
	 input reset,
    output reg [15:0] addr_out
    );
	 reg [15:0] addr;
	 always@(posedge clk, reset)
	 begin
		if(reset)
		begin
			addr_out = 0;
		end
		else if(sel_next)
		begin
			addr_out = branch_addr;
		end
		else
		begin
			addr_out = addr_out + 1;
		end
	 end	
endmodule