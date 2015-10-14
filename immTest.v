`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Alex, Logan, Will, Daniel
//
// Create Date:   16:15:47 09/17/2015
// Design Name:   ALURegIntegration
// Module Name:   C:/Users/u0694842/Dropbox/3710/Processor/immTest.v
// Project Name:  Processor (William Black's conflicted copy 2015-09-15)
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALURegIntegration
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module immTest;
 
	// Inputs
	reg [15:0] immediate;
	reg [4:0] regEnables;
	reg [4:0] buffAEnables;
	reg [4:0] buffBEnables;
	reg Cin;
	reg regOrImmed;
	reg clock;
	reg reset;
	reg [3:0] op;
	reg [3:0] exop;
	
	//----Info for just OP I type and J type----
parameter ADDI = 4'b0101; 
parameter ADDUI = 4'b0110;
parameter ADDCI = 4'b0111;
parameter ADDCUI = 4'b1101;     
parameter SUBI = 4'b1001;
parameter CMPI = 4'b1011;
parameter LWI = 4'b0011;
parameter ANDI = 4'b0001;

parameter shift = 4'b1000;
//----Info for ExOp Shift-Type
parameter LSH = 4'b0100;
parameter LSHI = 4'b1000;//Left Logical
parameter RSH = 4'b0101;//Right Logical
parameter RSHI = 4'b0111;
parameter ALSH = 4'b0110;//Left Arithmetic
parameter ARSH = 4'b0011;//Right Arithmetic

	// Outputs
	wire [4:0] flagsOutput;
	wire [15:0] regOut15;
	
	integer state;

	// Instantiate the Unit Under Test (UUT)
	ALURegIntegration uut (
		.immediate(immediate), 
		.regEnables(regEnables), 
		.buffAEnables(buffAEnables), 
		.buffBEnables(buffBEnables), 
		.Cin(Cin), 
		.regOrImmed(regOrImmed), 
		.clock(clock), 
		.reset(reset), 
		.op(op), 
		.exop(exop), 
		.flagsOutput(flagsOutput), 
		.regOut15(regOut15)
	);

	initial begin
		// Initialize Inputs
		immediate = 0;
		regEnables = 0;
		buffAEnables = 0;
		buffBEnables = 0;
		Cin = 0;
		regOrImmed = 0;
		clock = 0;
		reset = 0;
		op = 0;
		exop = 0;
		state=0;
	
        
		// Add stimulus here
		
	end
	
	
	always@(posedge clock)
		begin		
		case(state)
			5'd0: 
			begin //reset state
			reset=1;
			regEnables=5'd17;
			buffAEnables=4'd0;
			buffBEnables=4'd0;
			regOrImmed=0;
			op=4'b0000;
			exop=4'b0000;
			immediate=16'd1;
			state=5'd1;
			$display("%d",regOut15);
			end
			5'd1: 
			begin //Put a 0 into register 15
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd0;
			buffBEnables=4'd0;
			regOrImmed=0;
			op=LWI;
			exop=4'b0000;
			immediate=16'b1;
			state=5'd2;
			$display("%d",regOut15);
			end
			5'd2:
			begin //Put a 3 in R15
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd0;
			regOrImmed=0;//0 selects immediate
			op=LWI;
			exop=4'b0001;
			immediate=16'd3;
			state=5'd3;		
			end
			5'd3:
			begin //AND 3 with 1 you should get a 1
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd0;
			regOrImmed=0;//0 selects immediate
			op=ANDI;
			immediate=1;
			exop=4'b0101;
			state=5'd4;
				$display("After Stage2 see result of stage1 zero was put in reg: %d",regOut15);
			end
			5'd4:
			begin //R15 + 9 = 10 
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd0;
			regOrImmed=0;//0 selects immediate
			op=ADDI;
			immediate=9;
			exop=4'b0101;
			state=5'd5;
			$display(" a 3 put in R15 LWI %d",regOut15);
			end
			5'd5:
			begin //R15-20 = -10 signed
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd3;
			regOrImmed=0;//0 selects immediate
			op=SUBI;
			immediate=20;
			exop=4'b0101;
			state=5'd6;
			$display("3 AND 1 = 1: %d",regOut15);
			end
			5'd6:
			begin //R15 cmpI -5 = 1 because -10<-5
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd4;//Buff B can be anything 
			regOrImmed=0;//0 selects immediate
			op=CMPI;
			immediate=-5;
			exop=4'b0101;
			state=5'd7;		
				$display("1 ADDI 9 =10: %d",regOut15);	
			end
		//Shift immediate test.
			5'd7:
			begin //Shift 1 left by 2 should give a 4.
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd4;
			regOrImmed=0;//0 selects immediate
			op=shift;
			immediate=2;
			exop=LSHI;
			state=5'd8;
		$display("10 - 20 =-10: %d",regOut15);		
			end
			5'd8:
			begin //Shift 4 back to the right by 1 result should give 2
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd6;
			regOrImmed=0;//0 selects immediate
			op=shift;
			immediate=1;
			exop=RSHI;
			state=5'd9;
			$display("-10 CMPI -5=1: %d",regOut15);
			end		
			5'd9:
			begin//R6 + R7 into R8 = 34
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd6;
			regOrImmed=0;//0 selects immediate
			op=shift;
			immediate=14;
			exop=LSHI;
			state=5'd10;
			$display("LSHI: R15<<2 = 4 %d",regOut15);
		
			end
			5'd10:
			begin//R7 + R8 into R8 = 55
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd8;
			regOrImmed=0;
			op=shift;
			immediate=1;
			exop=LSHI;
			state=5'd11;
			$display("RSHI: R15>>1 = 1 %d",regOut15);
			end
			
			5'd11:
			begin//R8 + R9 into R10 = 89
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd15;
			buffBEnables=4'd8;
			regOrImmed=0;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0000;
			state=5'd12;
			$display("LSHI: R15<<14 = 65562 %d",regOut15);
			end
			
			5'd12:
			begin
				$display("LSHI: R15<<1 = 0 %d",regOut15);
			end
						
			endcase
		
		end
	
	
    always #1 clock=~clock;  
endmodule

