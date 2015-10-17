`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    12:39:26 09/19/2015 
// Design Name: 
// Module Name:    FPGA_REG_ALU_TEST 
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
///////////DANIEL WAS HERE//////////////////
module FPGA_REG_ALU_Display(
    input clk,
	 input [1:0] select,
	 input resetIN,
    output [3:0] anDisplay,
    output [7:0] outDisplay
    );
	 
	 wire [15:0] num; 
	 wire [15:0] immediate;
	 wire [4:0] regEnables;
	 wire [4:0] buffAEnables;
	 wire [4:0] buffBEnables;
	 wire Cin;
	 wire regOrImmed;
	 wire reset;
	 wire [3:0] op;
	 wire [3:0] exop;
	 wire [4:0] FlAGS;

	 Test_Cases TEST(clk, resetIN, immediate, regEnables, buffAEnables, buffBEnables, Cin, regOrImmed, reset, op, exop);
	 ALURegIntegration alu(immediate,regEnables,buffAEnables,buffBEnables,Cin,regOrImmed,clk,reset,op,exop,FlAGS,num);
	 FOUR_LIGHTS_FSM light(clk, num , outDisplay, anDisplay);
	 
	 
	 
	 
	
endmodule
