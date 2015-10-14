`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    15:28:22 09/14/2015 
// Design Name: 
// Module Name:    ALU_Buffer 
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
module ALU_Buffer(
    input [15:0] buffInput,
    input enable,
    output [15:0] buffOutput
    );


assign buffOutput = enable? buffInput:16'bzzzzzzzzzzzzzzzz;

endmodule
