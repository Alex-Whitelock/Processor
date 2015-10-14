`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Alex Whitelock
//  
// Create Date:    17:25:15 09/29/2015 
// Design Name: 
// Module Name:    Mem_FPGA_Test 
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
module Mem_FPGA_Test(
	 input clock,
	// output [3:0] anDisplay,
   // output [7:0] outDisplay
    output [15:0] ReadDataA,
    output [15:0] ReadDataB
    );
	 wire [15:0]memOutA;
	 wire [15:0]memOutB;
	wire [15:0] ReadDataA;
	wire [15:0] ReadDataB;
	wire [15:0] num;
	wire enA;
	wire wenA;
	wire enB;
	wire [15:0]WriteA;
	wire [32767:0]AddressA;
	wire [32767:0]AddressB;
	
	 FSM_MEM_Test fsm(clock,enA,wenA,enB,WriteA,AddressA,AddressB);
	 Memory_Management mem(clock,enA,wenA,enB,WriteA,AddressA,AddressB,ReadDataA,ReadDataB);
	 FOUR_LIGHTS_FSM light(clock, num, outDisplay, anDisplay);
	 
endmodule
