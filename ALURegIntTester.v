`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Alex, Logan, Will, Daniel
//
// Create Date:   15:19:26 09/15/2015
// Design Name:   ALURegIntegration
// Module Name:   C:/Users/u0726750/Dropbox/3710/Processor/ALURegIntTester.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: This does the Fibonacci Sequence using all registers until finally ouputing the result to 
// 					to reg 15 as output. 
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

module ALURegIntTester;

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
			$display("This is testing");	
			reset=1;
			regEnables=5'd17;
			buffAEnables=4'd0;
			buffBEnables=4'd0;
			regOrImmed=0;
			op=4'b0000;
			exop=4'b0000;
			immediate=16'd1;
			state=5'd1;
			end
			5'd1: 
			begin //Put 1 in R0	
			reset=0;
			regEnables=4'd0;
			buffAEnables=4'd0;
			buffBEnables=4'd0;
			regOrImmed=0;
			op=4'b0101;
			exop=4'b0001;
			immediate=16'd1;
			state=5'd2;
			end
			5'd2:
			begin //Put a 1 in R1
			reset=0;
			regEnables=4'd1;
			buffAEnables=4'd0;
			buffBEnables=4'd0;
			regOrImmed=0;//0 selects immediate
			op=4'b0011;
			exop=4'b0001;
			immediate=16'd1;
			state=5'd3;
			end
			5'd3:
			begin //R1 + R0 into R2 = 2
			reset=0;
			regEnables=4'd2;
			buffAEnables=4'd0;
			buffBEnables=4'd1;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd4;
		//	$finish(2);
			end
			5'd4:
			begin //R2 + R1 into R3 = 3
			reset=0;
			regEnables=4'd3;
			buffAEnables=4'd1;
			buffBEnables=4'd2;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd5;
			end
			5'd5:
			begin //R3 + R2 into R4 = 5
			reset=0;
			regEnables=4'd4;
			buffAEnables=4'd2;
			buffBEnables=4'd3;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd6;
			end
			5'd6:
			begin //R4 + R3 into R5 = 8
			reset=0;
			regEnables=4'd5;
			buffAEnables=4'd3;
			buffBEnables=4'd4;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd7;
			end
			5'd7:
			begin //R4 + R5 into R6 = 13
			reset=0;
			regEnables=4'd6;
			buffAEnables=4'd5;
			buffBEnables=4'd4;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd8;
			end
			5'd8:
			begin //R5 + R6 into R7 = 21
			reset=0;
			regEnables=4'd7;
			buffAEnables=4'd5;
			buffBEnables=4'd6;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd9;
			end		
			5'd9:
			begin//R6 + R7 into R8 = 34
			reset=0;
			regEnables=4'd8;
			buffAEnables=4'd7;
			buffBEnables=4'd6;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd10;
			end
			5'd10:
			begin//R7 + R8 into R8 = 55
			reset=0;
			regEnables=4'd9;
			buffAEnables=4'd7;
			buffBEnables=4'd8;
			regOrImmed=1;
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd11;
			end
			
			5'd11:
			begin//R8 + R9 into R10 = 89
			reset=0;
			regEnables=4'd10;
			buffAEnables=4'd9;
			buffBEnables=4'd8;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd12;
			end
			
			5'd12:
			begin//R9 + R10 into R11 = 144
			reset=0;
			regEnables=4'd11;
			buffAEnables=4'd10;
			buffBEnables=4'd9;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd13;
			end
			
			5'd13:
			begin
			reset=0;
			regEnables=4'd12;
			buffAEnables=4'd10;
			buffBEnables=4'd11;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd14;
			end
			
			5'd14:
			begin
			reset=0;
			regEnables=4'd13;
			buffAEnables=4'd12;
			buffBEnables=4'd11;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd15;
			end
			
			5'd15:
			begin
			reset=0;
			regEnables=4'd14;
			buffAEnables=4'd12;
			buffBEnables=4'd13;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd16;
			end
			
			5'd16:
			begin
			reset=0;
			regEnables=4'd15;
			buffAEnables=4'd14;
			buffBEnables=4'd13;
			regOrImmed=1;//0 selects immediate
			op=4'b0000;
			immediate=1;
			exop=4'b0101;
			state=5'd16;
			end
			
			endcase
		
		end
	
	
    always #1 clock=~clock;  
endmodule

