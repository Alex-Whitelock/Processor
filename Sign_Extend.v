`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel Clyde, Logan Scovill, Will Black, Alex Whitelock 
// 
// Create Date:    13:26:42 10/17/2015 
// Design Name: 
// Module Name:    Sign_Extend 
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
module Sign_Extend(
    input [3:0] upper,
    input [3:0] lower,
	 input clock,
	 input reset,
    output reg signed [15:0] imme
    );
	 always@(clk)
	 begin
		if(reset)
		begin
			imme <= 0;
		end
		else
		begin
			imme <= {upper, lower};
			imme <= (imme <<< 8);
			imme <= (imme >>> 8);
		end
	 end
endmodule
