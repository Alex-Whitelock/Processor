`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alexander
// 
// Create Date:    12:06:09 10/17/2015 
// Design Name: 
// Module Name:    Control_Logic 
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
module Control_Logic(
    input [15:0] instruction,
	 input clock,
	 input reset,
	 output [3:0] immediateLow,
	 output [3:0] immediateHigh,
    output [4:0] registerEnables,
	 output [4:0] Rdest,
	 output [4:0] Rsrc,
    output [3:0] aluOp,
    output [3:0] aluExOp,
	 output immediateOrReg,
    output memAEnabled,
    output memAWriteEn,
    output memBEnabled,
    output memCntrlBranch,
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



always@(instruction)
begin 	
	Rdest=instruction[11:8];
	memBEnabled=1;
	case(instruction[11:8])
			R_Type:
			begin
			case(instruction[7:4])
			LW:
				begin 
				immediateLow=4'd0;
				immedaiteHigh=4'd0;
				registerEnables=instruction[11:8];
				Rsrc=instruction[3:0];
				aluOp=instruction[15:12];
				aluExOp=instruction[7:4];
				immediateOrReg=1;//1 selects the register value.
				memAEnabled=1;
				memAWriteEn=0;
				outReset=0;
				end
			SW:
				begin
				immediateLow=4'd0;
				immedaiteHigh=4'd0;
				registerEnables=instruction[11:8];
				Rsrc=instruction[3:0];
				aluOp=instruction[15:12];
				aluExOp=instruction[7:4];
				immediateOrReg=1;//1 selects the register value.
				memAEnabled=1;
				memAWriteEn=1;
				outReset=0;
				end
			default:
				begin
				immediateLow=4'd0;
				immedaiteHigh=4'd0;
				registerEnables=instruction[11:8];
				Rsrc=instruction[3:0];
				aluOp=instruction[15:12];
				aluExOp=instruction[7:4];
				immediateOrReg=1;//1 selects the register value.
				memAEnabled=0;
				memAWriteEn=0;
				outReset=0;
				end
			endcase
		end
		Shift:
			begin
				case(instruction[7:4])
						LSHI:
							begin
								immediateLow=instruction[3:0];
								if(instruction[3])
									begin
									immediateHigh=4'b1111;
									end
								else
									begin
									immediateHigh=4'b0000;
									end	
								registerEnables=instruction[11:8];
								Rsrc=instruction[3:0];
								aluOp=instruction[15:12];
								aluExOp=instruction[7:4];
								immediateOrReg=0;//1 selects the register value.
								memAEnabled=0;
								memAWriteEn=0;
								outReset=0;
							end
						RSHI:
							begin
								immediateLow=instruction[3:0];
								if(instruction[3])
									begin
									immediateHigh=4'b1111;
									end
								else
									begin
									immediateHigh=4'b0000;
									end							
								registerEnables=instruction[11:8];
								Rsrc=instruction[3:0];
								aluOp=instruction[15:12];
								aluExOp=instruction[7:4];
								immediateOrReg=0;//1 selects the register value.
								memAEnabled=0;
								memAWriteEn=0;
								outReset=0;
							end
						default:
							begin
								immediateLow=4'd0;
								immedaiteHigh=4'd0;
								registerEnables=instruction[11:8];
								Rsrc=instruction[3:0];
								aluOp=instruction[15:12];
								aluExOp=instruction[7:4];
								immediateOrReg=1;//1 selects the register value.
								memAEnabled=0;
								memAWriteEn=0;
								outReset=0;
							end
					endcase		
				end
				default:
					begin
								immediateLow=instruction[3:0];
								immedaiteHigh=instruction[7:4];
								registerEnables=instruction[11:8];
								Rsrc=instruction[3:0];
								aluOp=instruction[15:12];
								aluExOp=instruction[7:4];
								immediateOrReg=0;//1 selects the register value.
								memAEnabled=0;
								memAWriteEn=0;
								outReset=0;
					end
			endcase	
	end
endmodule
