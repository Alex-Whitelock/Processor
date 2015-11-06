`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:52 11/03/2015 
// Design Name: 
// Module Name:    ControlLogic 
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
module ControlLogic(
    input clock,
    input [15:0] Instruction,
    input reset,
	 input [1:0] flags,
    output reg [4:0] regWrite,
    output reg [3:0] opCode,
    output reg [3:0] exOp,    
    output reg [3:0] immediateHigh,
    output reg [3:0] immediateLow,
    output reg [4:0] rDest,
    output reg [4:0] rSrc,
	 output reg regOrImm,
    output reg pcEnabled,
	 output reg branchMux,
	 output reg jumpMux,
    output reg pcOrRegMemMUX,
    output reg memAEnabled,
    output reg memAWriteEnabled,
    output reg memBEnabled,
    output reg outReset,
	 output reg pcToRegBuff,
	 output reg memToRegBuff,
	 output reg ALUToRegBuff
    );
parameter R_Type=4'b0000;
parameter Shift=4'b1000;
parameter Bcond=4'b1100;
parameter J_Type=4'b0100;
parameter LWSW=4'b0100;

parameter FetchState=4'd0;
parameter DecodeState=4'd1;
parameter RTypeState=4'd2;
parameter LoadTypeState1=4'd3;
parameter LoadTypeState2=4'd4;
parameter StoreWordState=4'd5;
parameter ImmediateState=4'd6;
parameter BranchTypeState=4'd7;
parameter JumpState=4'd8;
parameter JumpAndLinkStateOne=4'd9;
parameter JumpAndLinkStateTwo=4'd10;
parameter ShiftState=4'd11;
parameter NoOpState=4'd12;


//--Infor exOp LWSW type--
parameter LW=4'b0000;
parameter SW=4'b0100;



//----Info for exOp R-type----
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
//parameter LW = 4'b1100; 
//parameter SW = 4'b1111; 

//----Info for just OP I type and J type----
parameter ADDI = 4'b0101; 
parameter ADDUI = 4'b0110;
parameter ADDCI = 4'b0111;
parameter ADDCUI = 4'b1101;     
parameter SUBI = 4'b1001;
parameter CMPI = 4'b1011;
parameter LWI = 4'b0011;
parameter ANDI = 4'b0001;

//----Info for exOp Shift-Type
parameter LSH = 4'b0100;
parameter LSHI = 4'b1000;
parameter RSH = 4'b0101;
parameter RSHI = 4'b0111;
parameter ALSH = 4'b0110;
parameter ARSH = 4'b0011; 

//----Info for Bcond (Branch Conditional) conditions
parameter BEQ = 4'b0001;
parameter BNE = 4'b0010;
parameter BGT = 4'b0011;
parameter BLT = 4'b0100;
parameter JUC = 4'b0101;//jump unconditionally.
  // Branches if Rdest is less than Rsrc
// These parameters are also used for the Jcond

//----Info for the exOp J_Type
parameter Jcond = 4'b1100;
parameter JAL = 4'b1000;

parameter R0=4'b0000;
parameter R1=4'b0001;
parameter R2=4'b0010;
parameter R3=4'b0011;
parameter R4=4'b0100;
parameter R5=4'b0101;
parameter R6=4'b0110;
parameter R7=4'b0111;
parameter R8=4'b1000;
parameter R9=4'b1001;
parameter R10=4'b1010;
parameter R11=4'b1011;
parameter R12=4'b1100;
parameter R13=4'b1101;
parameter R14=4'b1110;
parameter R15=4'b1111;

	 
reg [4:0] currentState;
reg [4:0] nextState=4'd0;
reg [15:0] currentInstruction;

// Current State
 always@ (posedge clock )
	 begin
		if(reset)
		begin
			currentState<=0;		
		end
		
		else
		begin
			 currentState<=nextState;			
		end
	 
	 end
	 
	 // Next State
	 always@(currentState,Instruction)
		begin
			case (currentState)
				FetchState:
					begin
					//setEnable for latch.
						nextState=DecodeState;
					end
				DecodeState:
					begin

						case(Instruction[15:12])
							R_Type:
								begin
								
									nextState=RTypeState;
								end
							Shift:
								begin
									nextState=ShiftState;
								end
							Bcond:
								begin
									nextState=BranchTypeState;
								end
							J_Type:
								begin
									case(Instruction[7:4])
										Jcond:
											begin
												nextState=JumpState;
											end
										JAL:
											begin
												nextState=JumpAndLinkStateOne;
											end
									default:
											nextState=FetchState;
									endcase
								end
							LWSW:
								begin
									case(Instruction[7:4])
										LW:
											begin
												nextState=LoadTypeState1;
											end
										SW:
											begin
												nextState=StoreWordState;
											end
										default:
											nextState=FetchState;
										
									endcase
								end
								
	
							ADDI:
								begin
									nextState=ImmediateState;
								end
							ADDUI:
								begin
									nextState=ImmediateState;
								end
							ADDCI:
								begin
									nextState=ImmediateState;
								end
							ADDCUI:
								begin
									nextState=ImmediateState;
								end
							SUBI:
								begin
									nextState=ImmediateState;
								end
							CMPI:
								begin
									nextState=ImmediateState;
								end
							LWI:
								begin
									nextState=ImmediateState;
								end
							ANDI:
								begin
									nextState=ImmediateState;
								end
							default:
									nextState=FetchState;
							
							endcase
					
						end
						RTypeState:
							begin
								nextState=FetchState;
							end
						LoadTypeState1:
							begin
								nextState=LoadTypeState2;
							end
						LoadTypeState2:
							begin
								nextState=FetchState;
							end
						StoreWordState:
							begin
								nextState=FetchState;
							end
						ImmediateState:
							begin
						

								nextState=FetchState;
							end
						BranchTypeState:
							begin
								nextState=FetchState;
							end
						JumpState:
							begin
								nextState=FetchState;
							end
						JumpAndLinkStateOne:
							begin
								nextState=JumpAndLinkStateTwo;
							end
						JumpAndLinkStateTwo:
							begin
								nextState=FetchState;
							end
						ShiftState:
							begin
								nextState=FetchState;
							end
						default: 
							begin
								nextState=FetchState;
							end
						
				endcase
				
		end
		
		//This loop will do all of the output logic. 
		always@(currentState,Instruction,flags)
			begin
				
				regOrImm = 1'b0;
			//	memWriteOrRead <= 1'b0;
				pcEnabled = 1'b0;
				branchMux = 1'b0;
				pcOrRegMemMUX = 1'b0;
				memAEnabled = 1'b0;
				memAWriteEnabled = 1'b0;
				memBEnabled = 1'b0;
				jumpMux = 1'b0;
				pcToRegBuff = 1'b0; //only set to 1 in JAL 
				memToRegBuff = 1'b0; //only set to 1 for LW
				ALUToRegBuff = 1'b1; //set to 1 for all other cases.  Set to 0 for the above two cases.
				outReset = 0;
				
				opCode = Instruction[15:12];
				exOp=Instruction[7:4];
				rSrc={1'b0,Instruction[3:0]};
				rDest={1'b0,Instruction[11:8]};
				regWrite={1'b0,Instruction[11:8]};
				immediateHigh=Instruction[7:4];
				immediateLow=Instruction[3:0];
				
				





			case(currentState)
					FetchState:
						begin
							regWrite=5'b10000;
							memAEnabled = 1'b1;
						end
					DecodeState:
						begin
							memAEnabled=1'b0;
							regWrite=5'b10000;
						end
					RTypeState:
						begin
					
								
								regOrImm = 1'b1;
								pcEnabled = 1'b1;
						end
					LoadTypeState1:
						begin
							//Load Type Control Signals
							regWrite=5'b10000;
							
							regOrImm = 1'b1;
							memAEnabled = 1'b1;
							memToRegBuff = 1'b1;
							ALUToRegBuff = 1'b0;
						end
					LoadTypeState2:
						begin
							
								regOrImm = 1'b1;
								pcEnabled = 1'b1;
								memAEnabled = 1'b1;
								memToRegBuff = 1'b1;
								ALUToRegBuff = 1'b0;
						end
					StoreWordState:
						begin
							regWrite=5'b10000;
						
							regOrImm = 1'b1;
							pcEnabled = 1'b1;
							pcOrRegMemMUX = 1'b1;
							memAEnabled = 1'b1;
							memAWriteEnabled = 1'b1;
						end
					ImmediateState:
						begin
						
								pcEnabled = 1'b1;
						end
					BranchTypeState:
						begin
							regWrite=5'b10000;
							pcEnabled = 1'b1;
		// Flag bits: 
		//flag[0] - carry bit  (Only care in unsigned)
		//flag[1] - if Rdest < Rsrc  --> flag =1 (unsigned)
		//flag[2] - Overflow   (Only care in signed)
		//flag[3] - Bitwise comparison set to 1 if two values are the same. Equality
		//flag[4] - Rdest<Rsrc (signed)
							case (Instruction[11:8])
								BEQ: 
									begin
									if (flags[0] == 1'b1)
										begin
										branchMux = 1'b1;
										end
									else
										begin
										branchMux = 1'b0;
										end
									end
								BNE:
									begin
									if (flags[0] == 1'b0)
										begin
										branchMux = 1'b1;
										end
									else
										begin
										branchMux = 1'b0;
										end
									end
								BGT:
									begin
									if (flags[1] == 1'b0 && flags[0] == 1'b0)
										begin
										branchMux = 1'b1;
										end
									else
										begin
										branchMux = 1'b0;
										end
									end
								BLT:
									begin
									if (flags[1] == 1'b1)
										begin
										branchMux = 1'b1;
										end
									else
										begin
										branchMux = 1'b0;
										end
									end
								 default:
										begin
											branchMux=1'b0;
										end
							endcase
						end
						JumpState:
							begin
									regWrite=5'b10000;
									pcEnabled = 1'b1;
									case (Instruction[11:8])
										BEQ: // the acronyms are for branches but I just re-use them for jumps as well
											begin
											if (flags[0] == 1'b1)
												begin
												jumpMux = 1'b1;
												end
											else
												begin
												jumpMux= 1'b0;
												end
											end
										BNE:
											begin
											if (flags[0] == 1'b0)
												begin
												jumpMux = 1'b1;
												end
											else
												begin
												jumpMux = 1'b0;
												end
											end
										BGT:
											begin
											if (flags[1] == 1'b0 && flags[0] == 1'b0)
												begin
												jumpMux = 1'b1;
												end
											else
												begin
												jumpMux = 1'b0;
												end
											end
										BLT:
											begin
											if (flags[1] == 1'b1)
												begin
												jumpMux = 1'b1;
												end
											else
												begin
												jumpMux = 1'b0;
												end
											end	
									    JUC:
											begin
												jumpMux=1'b1;
											end
									 default:
										begin
											jumpMux=1'b0;
										end
									endcase
							end
							
							JumpAndLinkStateOne:
								begin
									
									pcToRegBuff = 1'b1;
									ALUToRegBuff = 1'b0;
								end
							JumpAndLinkStateTwo:
								begin
									
									regWrite=5'b10000;
									pcEnabled = 1'b1;
									jumpMux = 1'b1;
									pcToRegBuff = 1'b1;
									ALUToRegBuff = 1'b0;
								end
							ShiftState:
								begin
									
									regOrImm = 1'b1;
									pcEnabled = 1'b1;
								end

				endcase
			
			end



endmodule
