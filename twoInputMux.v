`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    16:05:15 09/14/2015 
// Design Name: 
// Module Name:    SimpleMux 
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
module twoInputMux(
    input enable,
    input [15:0] inputA,
    input [15:0] inputB,
    output [15:0] chosenValue
    );

	assign chosenValue = enable? inputA:inputB;

endmodule
