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
    //input [15:0] branch_addr,  ##Branch Stuff##
    //input sel_next,
	 input PCe,
	 input clk,
	 input reset,
    output reg [15:0] PC
    );
	 always@(posedge clk, reset)
	 begin
		if(reset)
		begin
			PC <= 0;
		end
		else
		begin
			if(PCe == 1'b1)
				PC <= PC + 1;
			else
				PC <= PC;
		end
		
		/*else if(sel_next)   #####Branch stuff#####
		begin
			PC = branch_addr;
		end*/
	 end	
endmodule
