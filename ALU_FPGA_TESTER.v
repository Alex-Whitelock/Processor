
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Alex, Logan, Will, Daniel
// 
// Create Date:    21:11:55 09/07/2015 
// Design Name: 
// Module Name:    outputs 
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
module ALU_FPGA_TESTER(
    input clock,
    input reset,
    input start,
    input stop,
    output [7:0] bdOut,
    output [3:0] selOut,
	 output [4:0] flags
    );
	 
	 wire [15:0] data1;
	 wire [15:0] data2;
	 wire [3:0] opcode1;
	 wire [3:0] opcode2;
	 wire [15:0] out;
	 wire [4:0] flags;
	 
	 physical_tester tester(clock,reset,start,stop,data1,data2,opcode1,opcode2);
	 
	 ALU alu(opcode1,opcode2,data1,data2,out,flags);
	 
	 seg_display seg_display(2'd0,out[3:0], selOut,bdOut);


endmodule
