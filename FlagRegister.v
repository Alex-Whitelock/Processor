`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    15:05:14 09/15/2015 
// Design Name: 
// Module Name:    FlagResgister 
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
module FlagRegister(
    input Clock,
    input [4:0] Flags,
    output reg [4:0] savedFlags
    );
	 
	 always@(posedge Clock)
	 begin
	 
		savedFlags=Flags;
	 
	 end


endmodule
