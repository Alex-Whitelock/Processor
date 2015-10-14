`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rouge Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    15:15:05 09/14/2015 
// Design Name: 
// Module Name:    ALURegIntegration 
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
module ALURegIntegration(
	 input [15:0] immediate,
	 input [4:0] regEnables,
	 input [4:0] buffAEnables,
	 input [4:0] buffBEnables,
	 input Cin,
    input regOrImmed,
	 input clock,
	 input reset, 
	 input [3:0] op,
	 input [3:0] exop,
	 
	 output [4:0] flagsOutput,
	 output [15:0] regOut15
    );
	 
	wire [15:0] regOut0;
	wire [15:0] regOut1;
	wire [15:0] regOut2;
	wire [15:0] regOut3;
	wire [15:0] regOut4;
	wire [15:0] regOut5;
	wire [15:0] regOut6;
	wire [15:0] regOut7;
	wire [15:0] regOut8;
	wire [15:0] regOut9;
	wire [15:0] regOut10;
	wire [15:0] regOut11;
	wire [15:0] regOut12;
	wire [15:0] regOut13;
	wire [15:0] regOut14;
	//wire [15:0] regOut15;

	wire [15:0] inputABus ;
	wire [15:0] outputBuffsB ;
	wire [15:0] inputBBus;
	
	wire  [15:0] aluOutputBus;
	
	wire [15:0] decodedBuffAEn;
	wire [15:0] decodedBuffBEn;
	wire [4:0] flags;
	
	
	RegisterBank regBank(clock,aluOutputBus,regEnables,reset,regOut0,regOut1,regOut2,regOut3,
	regOut4,regOut5,regOut6,regOut7,regOut8,regOut9,regOut10,regOut11,regOut12,
	regOut13,regOut14,regOut15);
	
	FourBitDecoder buff_A_Decoder(buffAEnables,decodedBuffAEn);
	FourBitDecoder buff_B_Decoder(buffBEnables,decodedBuffBEn);
	
	ALU_Buffer ALU_Buf_A_0(regOut0,decodedBuffAEn[0],inputABus);
	ALU_Buffer ALU_Buf_A_1(regOut1,decodedBuffAEn[1],inputABus);
	ALU_Buffer ALU_Buf_A_2(regOut2,decodedBuffAEn[2],inputABus);
	ALU_Buffer ALU_Buf_A_3(regOut3,decodedBuffAEn[3],inputABus);
	ALU_Buffer ALU_Buf_A_4(regOut4,decodedBuffAEn[4],inputABus);
	ALU_Buffer ALU_Buf_A_5(regOut5,decodedBuffAEn[5],inputABus);
	ALU_Buffer ALU_Buf_A_6(regOut6,decodedBuffAEn[6],inputABus);
	ALU_Buffer ALU_Buf_A_7(regOut7,decodedBuffAEn[7],inputABus);
	ALU_Buffer ALU_Buf_A_8(regOut8,decodedBuffAEn[8],inputABus);
	ALU_Buffer ALU_Buf_A_9(regOut9,decodedBuffAEn[9],inputABus);
	ALU_Buffer ALU_Buf_A_10(regOut10,decodedBuffAEn[10],inputABus);
	ALU_Buffer ALU_Buf_A_11(regOut11,decodedBuffAEn[11],inputABus);
	ALU_Buffer ALU_Buf_A_12(regOut12,decodedBuffAEn[12],inputABus);
	ALU_Buffer ALU_Buf_A_13(regOut13,decodedBuffAEn[13],inputABus);
	ALU_Buffer ALU_Buf_A_14(regOut14,decodedBuffAEn[14],inputABus);
	ALU_Buffer ALU_Buf_A_15(regOut15,decodedBuffAEn[15],inputABus);
	
	ALU_Buffer ALU_Buf_B_0(regOut0,decodedBuffBEn[0],outputBuffsB);
	ALU_Buffer ALU_Buf_B_1(regOut1,decodedBuffBEn[1],outputBuffsB);
	ALU_Buffer ALU_Buf_B_2(regOut2,decodedBuffBEn[2],outputBuffsB);
	ALU_Buffer ALU_Buf_B_3(regOut3,decodedBuffBEn[3],outputBuffsB);
	ALU_Buffer ALU_Buf_B_4(regOut4,decodedBuffBEn[4],outputBuffsB);
	ALU_Buffer ALU_Buf_B_5(regOut5,decodedBuffBEn[5],outputBuffsB);
	ALU_Buffer ALU_Buf_B_6(regOut6,decodedBuffBEn[6],outputBuffsB);
	ALU_Buffer ALU_Buf_B_7(regOut7,decodedBuffBEn[7],outputBuffsB);
	ALU_Buffer ALU_Buf_B_8(regOut8,decodedBuffBEn[8],outputBuffsB);
	ALU_Buffer ALU_Buf_B_9(regOut9,decodedBuffBEn[9],outputBuffsB);
	ALU_Buffer ALU_Buf_B_10(regOut10,decodedBuffBEn[10],outputBuffsB);
	ALU_Buffer ALU_Buf_B_11(regOut11,decodedBuffBEn[11],outputBuffsB);
	ALU_Buffer ALU_Buf_B_12(regOut12,decodedBuffBEn[12],outputBuffsB);
	ALU_Buffer ALU_Buf_B_13(regOut13,decodedBuffBEn[13],outputBuffsB);
	ALU_Buffer ALU_Buf_B_14(regOut14,decodedBuffBEn[14],outputBuffsB);
	ALU_Buffer ALU_Buf_B_15(regOut15,decodedBuffBEn[15],outputBuffsB);
	
	twoInputMux inputBMux(regOrImmed,outputBuffsB,immediate,inputBBus);//if 1 select register value
																						//else select immediate value
	
	ALU theALU(op,exop,inputABus,inputBBus,flagsOutput[0],aluOutputBus,flags);
	
	FlagRegister Flags(clock,flags,flagsOutput);
																						
	
	
	
	
	
	
	
	

endmodule
