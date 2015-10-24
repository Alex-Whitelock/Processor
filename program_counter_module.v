`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Daniel Clyde, Logan Scovill, Will Black, Alex Whitelock
// 
// Create Date:    16:09:54 10/22/2015 
// Design Name: 
// Module Name:    ProcessorControlUnit 
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
module ProcessorControlUnit(
    input clock,
    input [15:0] instruction,
    input reset,
    output [4:0] regWrite,
    output [3:0] opCode,
    output [3:0] exOp,    
    output [3:0] immediateHigh,
    output [3:0] immediateLow,
    output [4:0] rDest,
    output [4:0] rSrc,
	 output regOrImm,
    output pcEnabled,
	 output branchMux,
    output pcOrRegMemMUX,
    output memAEnabled,
    output memAWriteEnabled,
    output memBEnabled,
    output outReset
    );

parameter R_Type=4'b0000;
parameter Shift=4'b1000;

//----Info for ExOp R-type----
parameter ADD = 4'b0101; 
parameter ADDU = 4'b0110;
parameter ADDC = 4'b0111;
parameter ADDCU = 4'b1010;
parameter SUB = 4'b1001;
parameter CMP = 4'b1011;
parameter CMPU= 4'b1000;
parameter AND = 4'b0001;
parameter OR = 4'b0010;
parameter XOR = 4'b0011;
parameter NOP = 4'b0000;
parameter NOT = 4'b0100;
parameter LW = 4'b1100; 
parameter SW = 4'b1111; 

//----Info for just OP I type and J type----
parameter ADDI = 4'b0101; 
parameter ADDUI = 4'b0110;
parameter ADDCI = 4'b0111;
parameter ADDCUI = 4'b1101;     
parameter SUBI = 4'b1001;
parameter CMPI = 4'b1011;
parameter LWI = 4'b0011;
parameter ANDI = 4'b0001;

//----Info for ExOp Shift-Type
parameter LSH = 4'b0100;
parameter LSHI = 4'b1000;
parameter RSH = 4'b0101;
parameter RSHI = 4'b0111;
parameter ALSH = 4'b0110;
parameter ARSH = 4'b0011; 
	 
reg [4:0] currentState;
reg [15:0] currentInstruction;

//At every clock we need to change state where all instructions follow a pattern of 3-4 cycles
//All instructions start a a fetch state
always @(posedge clock)
begin
	regWrite <= 5'b10000; //nothing is written
	opCode <= 4'b0000;
	exOp	 <= 4'b0000; 
	immediateHigh <= 4'b0000;
	immediateLow <= 4'b0000;
	rDest <= 5'b00000;
	rSrc <= 5'b00000;
	regOrImm <= 1'b0;
//	memWriteOrRead <= 1'b0;
	pcEnabled <= 1'b0;
	branchMux <= 1'b0;
	pcOrRegMemMUX <= 1'b0;
	memAEnabled <= 1'b0;
	memAWriteEnabled <= 1'b0;
	memBEnabled <= 1'b0;
	
	if (reset == 1'b1)
		begin
		currentState <= 5'd0;
		end
	else
		begin
		case(currentState)
			4'd0:
			begin
				//This state fetches the instruction from memory.
				memAEnabled <= 1'b1;
				currentInstruction <= instruction;
				currentState <= 5'd1;							
			end	
			4'd1:
			begin
				//Decode State
				memAEnabled <= 1'b0;
				case (currentInstruction[11:8])
					R_Type:
						begin
						case (currentInstruction[7:4])
							NOP:
								begin
								currentState <= 5'd0;
								end
							LW:
								begin
								currentState <= 5'd3;
								end
							SW:
								begin
								currentState <= 5'd5;
								end
							default:
								begin
								currentState <= 5'd2;
								end
						endcase
						end
					Shift:
						begin
							case (currentInstruction[7:4])
								LSH:
									begin
									currentState <= 5'd2;
									end
								LSHI:
									begin
									currentState <= 5'd7;
									end
								RSH:
									begin
									currentState <= 5'd2;
									end
								RSHI:
									begin
									currentState <= 5'd7;
									end
								ALSH:
									begin
									currentState <= 5'd2;
									end
								ARSH:
									begin
									currentState <= 5'd2;
									end
							endcase
						end
					
					default:
						begin
						currentState <= 5'd7;
						end
				endcase
				
			end
			4'd2:
				begin
				//R-Type Control Signals
				regWrite <= {1'b0, currentInstruction[11:8]};
				opCode <= currentInstruction[15:12];
				exop <= currentInstruction[7:4];
				rDest <= currentInstruction[11:8];
				rSrc <= currentInstruction[3:0];
				regOrImm <= 1'b1;
				pcEnabled <= 1'b1;
				//memBEnabled hmm.
				currentState <= 5'd0;
				end
			4'd3:
				begin
				//Load Type Control Signals
				//regWrite <= {1'b0, currentInstruction[11:8]};
				opCode <= currentInstruction[15:12];
				exOp <= currentInstruction[7:4];
				rDest <= currentInstruction[11:8];
				rSrc <= currentInstruction[3:0];
				regOrImm <= 1'b1;
				//memWriteOrRead <= 1'b1;
				memAEnabled <= 1'b1;
				//memBEnabled	
				currentState <= 5'd4;
				end
			4'd4:
				begin
				//Secondary Load Type Control Signals
				regWrite <= {1'b0, currentInstruction[11:8]};
				opCode <= currentInstruction[15:12];
				exOp <= currentInstruction[7:4];
				rDest <= currentInstruction[11:8];
				rSrc <= currentInstruction[3:0];
				regOrImm <= 1'b1;
				pcEnabled <= 1'b1;
				memAEnabled <= 1'b1;
				currentState <= 5'd0;
				end
			4'd5:
				begin
				//Store Type Control Signals
				opCode <= currentInstruction[15:12];
				exop <= currentInstruction[7:4];
				rSrc <= currentInstruction[11:8];
				regOrImm <= 1'b1;
				pcEnabled <= 1'b1;
				memAEnabled <= 1'b1;
				memAWriteEnabled <= 1'b1;
				currentState <= 5'd0;
				end
			4'd6:
				begin
				//Branch Type Control Signals
				opCode <= currentInstruction[15:12];
				//need Alex's paper
				currentState <= 5'd0;
				end
			4'd7:
				begin
				//Immediate Type Control Signals (sign extend)
				opCode <= currentInstruction[15:12];
				immediateHigh <= currentInstruction[7:4];
				immediateLow <= currentInstruction[3:0];
				// no need for regWrite, rDest yet?
				//memWriteOrRead
				currentState <= 5'd8;
				
				end
			4'd8:
				begin
				//Immediate Type Control Signals (execution)
				regWrite <= currentInstruction[11:8];
				opCode <= currentInstruction[15:12];
				immediateHigh <= currentInstruction[7:4];
				immediateLow <= currentInstruction[3:0];
				rDest <= currentInstruction[11:8];
				pcEnabled <= 1'b1;
				currentState <= 5'd0;
				end
			default:
				begin
				currentState <= 5'd0;
				end
		endcase
		end
end

endmodule
