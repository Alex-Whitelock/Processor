`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    12:26:41 09/12/2015 
// Design Name: 
// Module Name:    RegisterBank 
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
module RegisterBank(
    input Clock,	 
    input [15:0] InputBus,
    input [4:0] RegSelect,
	 input reset,
    output  [15:0] Reg0,
    output  [15:0] Reg1,
    output  [15:0] Reg2,
    output  [15:0] Reg3,
    output  [15:0] Reg4,
    output  [15:0] Reg5,
    output  [15:0] Reg6,
    output  [15:0] Reg7,
    output  [15:0] Reg8,
    output  [15:0] Reg9,
    output  [15:0] Reg10,
    output  [15:0] Reg11,
    output  [15:0] Reg12,
    output  [15:0] Reg13,
    output  [15:0] Reg14,
    output  [15:0] Reg15
	
    );
	 
	 wire [15:0] decodedEnable;
	 
	 FourBitDecoder decoder(RegSelect,decodedEnable);
	 
	 
	 Register Register0(Clock,reset,decodedEnable[0],InputBus,Reg0);
	 Register Register1(Clock,reset,decodedEnable[1],InputBus,Reg1);
	 Register Register2(Clock,reset,decodedEnable[2],InputBus,Reg2);
	 Register Register3(Clock,reset,decodedEnable[3],InputBus,Reg3);
	 Register Register4(Clock,reset,decodedEnable[4],InputBus,Reg4);
	 Register Register5(Clock,reset,decodedEnable[5],InputBus,Reg5);
	 Register Register6(Clock,reset,decodedEnable[6],InputBus,Reg6);
	 Register Register7(Clock,reset,decodedEnable[7],InputBus,Reg7);
	 Register Register8(Clock,reset,decodedEnable[8],InputBus,Reg8);
	 Register Register9(Clock,reset,decodedEnable[9],InputBus,Reg9);
	 Register Register10(Clock,reset,decodedEnable[10],InputBus,Reg10);
	 Register Register11(Clock,reset,decodedEnable[11],InputBus,Reg11);
	 Register Register12(Clock,reset,decodedEnable[12],InputBus,Reg12);
	 Register Register13(Clock,reset,decodedEnable[13],InputBus,Reg13);
	 Register Register14(Clock,reset,decodedEnable[14],InputBus,Reg14);
	 Register Register15(Clock,reset,decodedEnable[15],InputBus,Reg15);
	 
	 
	
			
		
endmodule
