`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel, Alex, Will, Logan
// 
// Create Date:    16:09:50 11/01/2015 
// Design Name: 
// Module Name:    ProgramCounterLogic 
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
module ProgramCounterLogic(
    input [7:0] eightBitBranchOffset,
    //input [14:0] programCounterValue,
    input [15:0] jumpAddress,
    input branchSel,
    input jumpSel,
	 input [14:0] PCInput,
    output [14:0] PC
    );

wire signed [14:0] signExtendedBranchOff;

wire [14:0] shortenedJumpAddress =jumpAddress[14:0];
wire signed [14:0] oneOrBranch;
wire signed [14:0] wirePCAdder;
 

assign signExtendedBranchOff ={ {7{eightBitBranchOffset[7]}}, eightBitBranchOffset};/*{eightBitBranchOffset[7]},{eightBitBranchOffset[7]},
{eightBitBranchOffset[7]},{eightBitBranchOffset[7]},
{eightBitBranchOffset[7]},{eightBitBranchOffset[7]},{eightBitBranchOffset[7]} , eightBitBranchOffset[7:0]};*/

assign oneOrBranch=(branchSel) ? signExtendedBranchOff : 15'b1;

assign wirePCAdder=PCInput+oneOrBranch;

assign PC=(jumpSel) ? shortenedJumpAddress : wirePCAdder;

	

endmodule