`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: Alex Whitelock
// 
// Create Date:    17:40:17 09/29/2015 
// Design Name: 
// Module Name:    FSM_MEM_Test 
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
module FSM_MEM_Test(
    input clock,
    output reg enA,
	 output reg wenA,
    output reg enB,
	 output reg [15:0] WriteA,
    output reg [32767:0] AddressA,
    output reg [32767:0] AddressB
    );
	 
	reg [29:0]count =29'd0;
	reg [6:0] pres_s;
	reg [6:0] next_s=0;
	
	always@(posedge clock)
	begin
		if(count == 2) //10**5/2 because reasons
		begin
			pres_s <= next_s;
			count <= 0;
		end
		else
		begin
			pres_s <= pres_s;
			count <= count+1;
		end
	end
	
	//Next State
	always@(pres_s)
		begin		
			case(pres_s)
				6'd0: next_s = 6'd1;
				6'd1: next_s = 6'd2;
				6'd2: next_s = 6'd3; 
				6'd3: next_s =6'd4;
				6'd4: next_s = 6'd5;
				6'd5: next_s = 6'd6;	
				6'd6: next_s = 6'd7;
				6'd7: next_s = 6'd8;
				6'd8: next_s = 6'd9;
				6'd9: next_s = 6'd10;
				6'd10: next_s = 6'd11;
				6'd11: next_s = 6'd12;	
				6'd12: next_s = 6'd13;
				6'd13: next_s = 6'd14;
				6'd14: next_s = 6'd15;
				6'd15: next_s = 6'd16;
				6'd16: next_s = 6'd17;
				6'd17: next_s = 6'd18;
				6'd18: next_s = 6'd19;
				6'd19: next_s = 6'd20;
				6'd20: next_s = 6'd21; 
				6'd21: next_s = 6'd22;
				6'd22: next_s = 6'd23;
				6'd23: next_s = 6'd24;	
				6'd24: next_s = 6'd25;
				6'd25: next_s = 6'd26;
				6'd26: next_s = 6'd27;
				6'd27: next_s = 6'd28;
				6'd28: next_s = 6'd29;
				6'd29: next_s = 6'd30;	
				6'd30: next_s = 6'd31;
				6'd31: next_s = 6'd32;
				6'd32: next_s = 6'd33;
				6'd33: next_s = 6'd0;
			endcase
		
		end
		
	
	//Output
	always@(pres_s)
	begin
		case(pres_s)
			6'd0:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd0;
				AddressA=15'd0;
				AddressB=15'd0;
				end
			6'd1://Print
				begin
				enA = 1'd1;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd0;
				AddressB=15'd0;
				end
			6'd2:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd1;
				AddressA=15'd1000;
				AddressB=15'd0;
				end
			6'd3://Print
				begin
				enA = 1'd1;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd1000;
				end
			6'd4:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd1;
				AddressA=15'd2024;
				AddressB=15'd0;
				end
			6'd5://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd2024;
				end
			6'd6:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd2;
				AddressA=15'd3048;
				AddressB=15'd0;
				end
			6'd7://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd3048;
				end
			6'd8:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd3;
				AddressA=15'd4072;
				AddressB=15'd0;
				end
			6'd9://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd4072;
				end
			6'd10:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd5;
				AddressA=15'd5096;
				AddressB=15'd0;
				end
			6'd11://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd5096;
				end
			6'd12:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd8;
				AddressA=15'd6120;
				AddressB=15'd0;
				end
			6'd13://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd6120;
				end
			6'd14:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd13;
				AddressA=15'd7144;
				AddressB=15'd0;
				end
			6'd15://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd7144;
				end
			6'd16:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd21;
				AddressA=15'd8168;
				AddressB=15'd0;
				end
			6'd17://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd8168;
				end
			6'd18:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd34;
				AddressA=15'd9192;
				AddressB=15'd0;
				end
			6'd19://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd9192;
				end
			6'd20:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd55;
				AddressA=15'd10216;
				AddressB=15'd0;
				end
			6'd21://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd10216;
				end
			6'd22:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd89;
				AddressA=15'd11240;
				AddressB=15'd0;
				end
			6'd23://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd11240;
				end
			6'd24:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd144;
				AddressA=15'd12264;
				AddressB=15'd0;
				end
			6'd25://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd12264;
				end
			6'd26:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd233;
				AddressA=15'd13288;
				AddressB=15'd0;
				end
			6'd27://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd13288;
				end
			6'd28:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd377;
				AddressA=15'd14312;
				AddressB=15'd0;
				end
			6'd29://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd14312;
				end
			6'd30:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd610;
				AddressA=15'd15336;
				AddressB=15'd0;
				end
			6'd31://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd15336;
				end
			6'd32:
				begin
				enA = 1'd1;
				wenA = 1'd1;
				enB=1'd0;
				WriteA= 15'd987;
				AddressA=15'd16360;
				AddressB=15'd0;
				end
			6'd33://Print
				begin
				enA = 1'd0;
				wenA = 1'd0;
				enB=1'd1;
				WriteA= 15'd0;
				AddressA=15'd1;
				AddressB=15'd16360;
				end
			
		endcase
	end



endmodule
