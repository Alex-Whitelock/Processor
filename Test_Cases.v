`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
//
// Create Date:    13:24:30 09/19/2015 
// Design Name: 
// Module Name:    Reg_ALU_FPGA_Tester 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//	FSM to give fixed values to the other modules.
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Test_Cases(
    input clk,
	 input reset,
	 output reg [15:0] immediate,
	 output reg [4:0] regEnables,
	 output reg [4:0] buffAEnables,
	 output reg [4:0] buffBEnables,
	 output reg Cin,
    output reg regOrImmed,
	 output reg reset_out, 
	 output reg [3:0] op,
	 output reg [3:0] exop
    );

	 reg [26:0]counter =27'd0;
	 reg [4:0] presentStage;
	 reg [4:0] nextStage=0;
	 reg status=0;
	// Pres State
	always@(posedge clk)
	begin	
		begin
			if(reset)
			begin
				counter<=27'd0;
				presentStage<=0;
			end
			else if(counter==27'd500000000)//500000000 actually 500million
			begin
				presentStage<=nextStage;
				counter<=0;
			end
			else
			begin
				presentStage <= presentStage;	
				counter<=counter+27'd1;
			end
		end
	end
	//Next State
	always@(presentStage)
		begin		
			case(presentStage)
				6'd0: nextStage = 6'd1;
				6'd1: nextStage = 6'd2;
				6'd2: nextStage = 6'd3;
				6'd3: nextStage = 6'd20; // forgot the 2 phase.  Diddnt want to redo the case statement
				6'd20: nextStage = 6'd4;
				6'd4: nextStage = 6'd5;
				6'd5: nextStage = 6'd6;	
				6'd6: nextStage = 6'd7;
				6'd7: nextStage = 6'd8;
				6'd8: nextStage = 6'd9;
				6'd9: nextStage = 6'd10;
				6'd10: nextStage = 6'd11;
				6'd11: nextStage = 6'd12;	
				6'd12: nextStage = 6'd13;
				6'd13: nextStage = 6'd14;
				6'd14: nextStage = 6'd15;
				6'd15: nextStage = 6'd16;
				6'd16: nextStage = 6'd17;
				6'd17: nextStage = 6'd0;
			endcase
		
		end
	
	
	//output
	 always@(presentStage)
		begin
			case(presentStage)
			6'd0: begin //Force reset no op
		 reset_out = reset;
		 immediate = 16'd0;
		 regEnables = 5'd0;
		 buffAEnables = 5'd0;
		 buffBEnables = 5'b00000;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0000; 
		 exop = 4'b0000; 
		 end		 
			6'd1: begin 
		 reset_out = reset;
		 immediate = 16'd0;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
			6'd2: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd1;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //add
		 exop = 4'b0101; 
		 end
		 
		 6'd3: begin  //Basic test 0+1=1
		 reset_out = reset;
		 immediate = 16'd1;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //add
		 exop = 4'b0000; 
		 end
		 
		 6'd20: begin  //Basic test 1+1=2
		 reset_out = reset;
		 immediate = 16'd2;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0000; 
		 end
		 
		 6'd4: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd3;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 6'd5: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd5;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		  6'd6: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd8;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd7: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd13;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd8: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd21;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001;  
		 end
		 
		 	6'd9: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd34;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd10: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd55;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd11: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd89;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd12: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd144;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd13: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd233;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd14: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd377;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd15: begin  //Basic test
		  reset_out = reset;
		 immediate = 16'd610;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
		 	6'd16: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd987;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0101; //addi
		 exop = 4'b0001; 
		 end
		 
		 	6'd17: begin  //Basic test
		 reset_out = reset;
		 immediate = 16'd987;
		 regEnables = 5'b01111;
		 buffAEnables = 5'b01111;
		 buffBEnables = 5'b00010;
		 Cin = 0;
		 regOrImmed = 0;
		 op = 4'b0011; //lwi
		 exop = 4'b0001; 
		 end
		 
	
		 
			endcase;
		
		end
	

endmodule
