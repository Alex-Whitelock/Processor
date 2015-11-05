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
	 input PCe,
	 input clk,
	 input reset,
	 input [14:0]pcInput,
    output reg  [14:0] PC
    );
	 
	 //wire [14:0] signExtendedBranchOff;
	// wire [14:0] jumpAddrRemoveTopBit = JumpAddr[14:0];
	 
	 
	 
	 always@(posedge clk)
		begin
		if(reset)
			PC <= 0;
		else if(PCe)
			begin
				PC<=pcInput;
			end
		else
			begin 
				PC <= PC;
			end
		end 	
endmodule
