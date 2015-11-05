`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    12:52:59 10/24/2015 
// Design Name: 
// Module Name:    CPU_Top 
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
module CPU_Top(
    input clock,
    input reset,
    output [15:0] seeOutput
    );
	 /* REMEMBER! *regOrImm 1Or0; reg = 1, imm = 0 */

	//Program_Counter PC(PCe, clock, reset, jumpMux, JumpAddr, branchMux, BranchOff, addr_next_instruction);	
	
	// clock, reset
	
	//flagEn output from control unit fsm?
	
	//also the value going from memory Dout to the register is called 'instruction.'  Watch out for that.
	
	ControlLogic controlCPU(clock, readDataA, reset, flagsOutput, regWrite, opCode, exOp, immediateHigh, immediateLow,
		rDest, rSrc, regOrImm, pcEnabled, branchMux, jumpMux, pcOrRegMemMUX, memAEnabled, memAWriteEnabled, memBEnabled, 
		outReset, pcToRegBuff, memToRegBuff, ALUToRegBuff);
		//flagsEnabled goes to the flags register
		//flagsEnabled is removed for the time being, we need to put it back in once it's been implemented in the control logic and we know the order of inputs
		
	Program_Counter PC(pcEnabled, clock, reset, PCLogicOutput, PCOutput);
	
	ProgramCounterLogic PCL({immediateHigh, immediateLow}, /*<--this is the 8 bit branch displacement*/  inputBBus,/*<--the jump address*/ branchMux,
		jumpMux, PCOutput, /*PCoutput is the output from the clocked program counter.  PCLogicOutput is the output of the preceding
		combinational logic */ PCLogicOutput);
	
	//ALURegIntegration RegALU(immediate, regWrite, buffAEnable, buffBEnable, Cin, regOrImm, clock, reset, opCode, 
	//	exOp, flagEn, flags, regOut15);
	
	ALURegIntegration RegALU({{8{immediateHigh[4]}}, /*this sign extends the immediate value*/ immediateHigh, immediateLow}, regWrite, rDest,
		rSrc,  regOrImm, clock, reset, opCode, exOp, pcToRegBuff, ALUToRegBuff, memToRegBuff, {{1'b0, PCOutput} + 1}, /*<--this zero 
		extends and adds one to the current address. Used for JAL*/ readDataA, flagsOutput, inputABus, inputBBus);//flagEn, flags, regOut15);
		
	Memory_Management mem(clock, memAEnabled, memAWriteEnabled, memBEnabled, inputBBus, memAddressInputA, XXXAddressB, ReadDataA, 
		ReadDataB);
		
	twoInputMux memAddressMux(pcOrRegMemMUX, inputABus, {1'b0, PCOutput}, memAddressInputA); 

	
endmodule