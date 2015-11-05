
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Rouge Squadron: 
// 
// Create Date:    16:24:27 09/01/2015 
// Design Name: 
// Module Name:    ALU 
// Project Name: Rogue ALU
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
module ALU(
    input [3:0] op,
	 input [3:0] exop,
    input [15:0] Rdest,//rdest
    input [15:0] Rsrc,
	 input Cin,
    output reg [15:0] out,
	 
	 // Flag bits: 
		//flag[0] - carry bit  (Only care in unsigned)
		//flag[1] - if Rdest < Rsrc  --> flag =1 (unsigned)
		//flag[2] - Overflow   (Only care in signed)
		//flag[3] - Bitwise comparison set to 1 if two values are the same. Equality
		//flag[4] - Rdest<Rsrc (signed)
    output reg [4:0] flags 

    );
//Set S-Foils in attack position

//Parameters for all opcodes

parameter R_Type=4'b0000;
parameter Shift=4'b1000;
parameter LWSW=4'b0100; 

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
//parameter LW = 4'b1100; 
//parameter SW = 4'b1111; 


//---Infor for lwsw exop;
	parameter LW=4'b0000;
	parameter SW=4'b0100;


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



//0000 op is R type  , 1000 is going to be shift type will aslo contain a nested case statment.

always@(Rdest, Rsrc, op, exop,Cin)
	begin
		case (op)		
		R_Type:
			begin
				case(exop)
					ADD:					
						begin				
							out = $signed(Rdest) + $signed(Rsrc);
							if($signed(Rdest)<$signed(Rsrc))
							begin
								flags[4] =1'b1;
							end 
							else
							begin
								flags[4] =1'b0;
							end
							if (Rdest == Rsrc)
							begin
								flags[3]=1'b1;
							end
							else 
							begin
								flags[3]=1'b0;
							end
							if((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15]))
							begin
								flags[2]=1'b1;
							end
							else
							begin				
								flags[2]=1'b0;
							end
							flags[1]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
							flags[0]=1'b0;
						end
					
					ADDU:
						begin
							out = $unsigned(Rdest) + $unsigned(Rsrc);	
							flags[4]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
							if (Rdest == Rsrc) //Z-bit (equality)
								begin
									flags[3]=1'b1;
								end
							else 
								begin
									flags[3]=1'b0;
								end
							flags[2]=1'b0; //Overflow can not happen in unsigned.
							if(Rdest<Rsrc)//Low Flag
								begin
								flags[1] =1'b1;
								end 
							else
								begin
								flags[1] =1'b0;
								end
							if((Rdest[15] & Rsrc[15])| ((Rdest[15] ^ Rsrc[15])& ~out[15])) //Check for a carry by looking at highest bits if both ar 1 a carry will be produced.
								//Another case for carry is if there is a 1 in either of the numbers in the highest bit but after addition a zero results.
								begin
								flags[0]=1'b1;
								end
							else
								begin				
									flags[0]=1'b1;
								end
						end
					
					ADDC:
						begin
							out = $signed(Rdest) + $signed(Rsrc)+Cin;	
							if($signed(Rdest) < $signed(Rsrc))
							begin
								flags[4]=1'b1;
							end
							else
								begin
								flags[4] = 1'b0;
								end							
							if (Rdest == Rsrc) //Z-bit (equality)
							begin
								flags[3]=1'b1;
							end
							else 
							begin
								flags[3]=1'b0;
							end
							if((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15])|(out==0)) 
								begin
									flags[2]=1'b1;
								end
								else
								begin				
									flags[2]=1'b0;
								end
							flags[1]=1'b0; //Low Flag
							flags[0] =1'b0; //Carry can not occur in signed.					
							end
					ADDCU:
						begin
							out = $unsigned(Rdest) + $unsigned(Rsrc) + Cin;	
							flags[4]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
							if (Rdest == Rsrc) //Z-bit (equality)
							begin
								flags[3]=1'b1;
							end
							else 
							begin
								flags[3]=1'b0;
							end
							flags[2]=1'b0; //Overflow can not happen in unsigned.
							if(Rdest<Rsrc)//Low Flag
								begin
								flags[1] =1'b1;
								end 
							else
							begin
							flags[1] =1'b0;
							end
							if((Rdest[15] & Rsrc[15])| ((Rdest[15] ^ Rsrc[15])& ~out[15])) //Check for a carry by looking at highest bits if both ar 1 a carry will be produced.
								//Another case for carry is if there is a 1 in either of the numbers in the highest bit but after addition a zero results.
								begin
								flags[0]=1'b1;
								end
							else
							begin				
								flags[0]=1'b0;
							end
						end
					SUB:
						begin
							out = $signed(Rdest) - $signed(Rsrc);
							if($signed(Rdest)<$signed(Rsrc))
							begin
								flags[4] =1'b1;
							end 
							else
							begin
								flags[4] =1'b0;
							end
							if (Rdest == Rsrc)
							begin
								flags[3]=1'b1;
							end
							else 
							begin
								flags[3]=1'b0;
							end
							if ((Rdest[15] & ~Rsrc[15] & ~out[15]) | (~Rdest[15] & Rsrc[15] & out[15]))//((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15]) 
							begin
								flags[2]=1'b1;
							end
							else
							begin				
								flags[2]=1'b0;
							end
							flags[1]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
							flags[0]=1'b0;
						end
					
					CMP:
						begin
							if ($signed(Rdest) < $signed(Rsrc))
							begin
								out = 16'h0001;
								flags[4] = 1'b1;
								flags[3] = 1'b0;
							end
							else if ($signed(Rdest) > $signed(Rsrc))
							begin
								out = 16'h0000;
								flags[4] = 1'b0;
								flags[3] = 1'b0;
							end
							else 
							begin
								out = 16'h0000;
								flags[4] = 1'b0;
								flags[3] = 1'b1;
							end
							
							flags[2] = 1'b0;
							flags[1] = 1'b0;
							flags[0] = 1'b0;
						end
					CMPU:
						begin
							if ($unsigned(Rdest) < $unsigned(Rsrc))
							begin
								out = 16'h0001;
								flags[3] = 1'b0;
								flags[1] = 1'b1;
							end
							else if ($unsigned(Rdest) > $unsigned(Rsrc))
							begin
								out = 16'h0000;
								flags[3] = 1'b0;
								flags[1] = 1'b0;
							end
							else 
							begin
								out = 16'h0000;
								flags[3] = 1'b1;
								flags[1] = 1'b0;
							end
							
							
							flags[4] = 1'b0;
							flags[2] = 1'b0;
							flags[0] = 1'b0;
						end
					AND:
						begin
							out=Rdest&Rsrc;//This will be fine as it is.
							
							flags[4] = 0;
							if (Rdest == Rsrc)
							begin
								flags[3] = 1'b1;
							end
							else
							begin
								flags[3] = 1'b1;
							end
							
							flags[2] = 0; //No overflow possible we are not doing arithmetic
							flags[1] = 0;//  We don't see why we would use comparison flags here, so set them to zero
							flags[0] = 0; //No carry possible we are not doing arithmetic
							
						end
					OR:
							begin
							out=Rdest|Rsrc;//This will be fine as it is.
							
							flags[4] = 0;
							if (Rdest == Rsrc)
							begin
								flags[3] = 1'b1;
							end
							else
							begin
								flags[3] = 1'b1;
							end
							
							flags[2] = 0; //No overflow possible we are not doing arithmetic
							flags[1] = 0;//  We don't see why we would use comparison flags here, so set them to zero
							flags[0] = 0; //No carry possible we are not doing arithmetic
							
						end
						
					XOR:
							begin
							out=Rdest^Rsrc;
							
							flags[4] = 0;
							if (Rdest == Rsrc)
							begin
								flags[3] = 1'b1;
							end
							else
							begin
								flags[3] = 1'b0;
							end
							
							flags[2] = 0; //No overflow possible we are not doing arithmetic
							flags[1] = 0;//  We don't see why we would use comparison flags here, so set them to zero
							flags[0] = 0; //No carry possible we are not doing arithmetic
							
						end
					NOT:
							begin
							out=~Rdest;						
							flags[4] = 0;
							flags[3] = 0;							
							flags[2] = 0; //No overflow possible we are not doing arithmetic
							flags[1] = 0; //We don't see why we would use comparison flags here, so set them to zero
							flags[0] = 0; //No carry possible we are not doing arithmetic
							
						end
					
					NOP:
						begin
						out=Rdest;
						flags=5'b00000;
						end
					default:
						begin
							out=Rdest;
							flags=5'b00000;
						end
				endcase
			end
		LWSW:
			begin
				case(exop)
					LW:
						begin
						//do we want to pass out rdest considering that r
						out = Rdest;
						flags=5'b00000;
						end
					SW:
						begin
						out = Rdest;
						flags=5'b00000;
						end
					default:
						begin
						out=Rdest;
						flags=5'b00000;
						//should never happen
						end
				endcase
			end
		Shift:
			begin
				case(exop)
				
				LSH:
					begin
						out=Rdest<<Rsrc;
						flags=5'b00000;
					end
				LSHI:
					begin
						out=Rdest<<Rsrc;
						flags=5'b00000;
					end
				RSH:
					begin
						out=Rdest>>Rsrc;
						flags=5'b00000;
					end
				RSHI:
					begin
						out=Rdest>>Rsrc;
						flags=5'b00000;
					end
				ALSH:
					begin
						out=$signed(Rdest)<<<$signed(Rsrc);
						flags=5'b00000;
					end
				ARSH:
					begin
						out=$signed(Rdest)>>>$signed(Rsrc);
						flags=5'b00000;
					end
				default:
				 begin
				 out=0;
				 flags=5'b00000;
				 end
				endcase
			end
			
		
		ADDI:
			begin
				out = $signed(Rdest) + $signed(Rsrc);
				if($signed(Rdest)<$signed(Rsrc))
				begin
					flags[4] =1'b1;
				end 
				else
				begin
					flags[4] =1'b0;
				end
				if (Rdest == Rsrc)
				begin
					flags[3]=1'b1;
				end
				else 
				begin
					flags[3]=1'b0;
				end
				if((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15]))
				begin
					flags[2]=1'b1;
				end
				else
				begin				
					flags[2]=1'b0;
				end
				flags[1]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
				flags[0]=1'b0;
			end		
		ADDUI:
			begin
				out = $unsigned(Rdest) + $unsigned(Rsrc);	
				flags[4]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
				if (Rdest == Rsrc) //Z-bit (equality)
				begin
					flags[3]=1'b1;
				end
				else 
				begin
					flags[3]=1'b0;
				end
				flags[2]=1'b0; //Overflow can not happen in unsigned.
				if(Rdest<Rsrc)//Low Flag
					begin
					flags[1] =1'b1;
					end 
				else
				begin
				flags[1] =1'b0;
				end
				if((Rdest[15] & Rsrc[15])| ((Rdest[15] ^ Rsrc[15])& ~out[15])) //Check for a carry by looking at highest bits if both ar 1 a carry will be produced.
					//Another case for carry is if there is a 1 in either of the numbers in the highest bit but after addition a zero results.
					begin
					flags[0]=1'b1;
					end
				else
				begin				
					flags[0]=1'b0;
				end
			end
	
		ADDCUI:
			begin
				out = $unsigned(Rdest) + $unsigned(Rsrc) + Cin;	
				flags[4]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
				if (Rdest == Rsrc) //Z-bit (equality)
				begin
					flags[3]=1'b1;
				end
				else 
				begin
					flags[3]=1'b0;
				end
				flags[2]=1'b0; //Overflow can not happen in unsigned.
				if(Rdest<Rsrc)//Low Flag
					begin
					flags[1] =1'b1;
					end 
				else
				begin
				flags[1] =1'b0;
				end
				if((Rdest[15] & Rsrc[15])| ((Rdest[15] ^ Rsrc[15])& ~out[15])) //Check for a carry by looking at highest bits if both ar 1 a carry will be produced.
					//Another case for carry is if there is a 1 in either of the numbers in the highest bit but after addition a zero results.
					begin
					flags[0]=1'b1;
					end
				else
				begin				
					flags[0]=1'b0;
				end
			end
			
		ADDCI:
			begin
				out = $signed(Rdest) + $signed(Rsrc)+Cin;	
				if($signed(Rdest)<$signed(Rsrc))
				begin
					flags[4]=1'b1;
				end
				else
					begin
					flags[4] = 1'b0;
					end							
				if (Rdest == Rsrc) //Z-bit (equality)
				begin
					flags[3]=1'b1;
				end
				else 
				begin
					flags[3]=1'b0;
				end
				if((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15])|(out == 0)) 
					begin
						flags[2]=1'b1;
					end
					else
					begin				
						flags[2]=1'b0;
					end
				flags[1]=1'b0; //Low Flag
				flags[0] =1'b0; //Carry can not occur in signed.					
			end
		
		SUBI:
			begin
				out = $signed(Rdest) - $signed(Rsrc);
				if($signed(Rdest)<$signed(Rsrc))
				begin
					flags[4] =1'b1;
				end 
				else
				begin
					flags[4] =1'b0;
				end
				if (Rdest == Rsrc)
				begin
					flags[3]=1'b1;
				end
				else 
				begin
					flags[3]=1'b0;
				end
				if ((Rdest[15] & ~Rsrc[15] & ~out[15]) | (~Rdest[15] & Rsrc[15] & out[15]))//((~Rdest[15] & ~Rsrc[15] & out[15])|(Rdest[15] & Rsrc[15] & ~out[15]) 
				begin
					flags[2]=1'b1;
				end
				else
				begin				
					flags[2]=1'b0;
				end
				flags[1]=1'b0; //We set this to zero without doing a comparison because ADD is signed operation.
				flags[0]=1'b0;
			end
		
		CMPI:
			begin
				if ($signed(Rdest) < $signed(Rsrc))
				begin
					out = 16'h0001;
					flags[4] = 1'b1;
					flags[3] = 1'b0;
				end
				else if ($signed(Rdest) > $signed(Rsrc))
				begin
					out = 16'h0000;
					flags[4] = 1'b0;
					flags[3] = 1'b0;
				end
				else 
				begin
					out = 16'h0000;
					flags[4] = 1'b0;
					flags[3] = 1'b1;
				end
				
				flags[2] = 1'b0;
				flags[1] = 1'b0;
				flags[0] = 1'b0;
			end	
		LWI:
			begin
				out = Rsrc;
				flags=5'b00000;
			end
		ANDI:
			begin
				out=Rdest&Rsrc;
				
				flags[4] = 0;
				if (Rdest == Rsrc)
				begin
					flags[3] = 1'b1;
				end
				else
				begin
					flags[3] = 1'b1;
				end
				
				flags[2] = 0; //No overflow possible we are not doing logical operations
				flags[1] = 0;//  We don't see why we would use comparison flags here, so set them to zero
				flags[0] = 0; //No carry possible we are not doing logical operations
				
			end
		default:
			begin
				out=0;
				flags=5'b00000;
			end
		endcase
	
	end

endmodule
