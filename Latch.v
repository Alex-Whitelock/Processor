`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel, Logan, Will, Alexander
// 
// Create Date:    09:32:28 11/07/2015 
// Design Name: 
// Module Name:    Latch 
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
module Latch(
	 input enable,
    input latchInput,
    output latchOutput
    );

always@ (enable)
	begin
	if (enable == 1'b1)
		begin
		latchOutput <= latchInput;
		end
	else
		latchOutput <= latchOutput;
	end

endmodule
