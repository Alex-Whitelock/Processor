`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    12:44:49 09/19/2015 
// Design Name: 
// Module Name:    FOUR_LIGHTS_FSM 
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
module FOUR_LIGHTS_FSM(
	 input clk,
	 input [15:0] num,
    output wire [7:0] BCD_display,
    output wire [3:0] An_display
    );
	 
	 reg en;
	 reg [27:0] count;	
	 reg [1:0] pres_s = 2'b00;
	 reg [1:0] next_s = 2'b01;
	 reg [1:0] An_Sel;
	 reg [3:0] BCD_Sel;	 
	
	
	seg_display seg_display(An_Sel, BCD_Sel, An_display, BCD_display);
	
	//present state (state will change every 5ms)
	always@(posedge clk)
	begin
		if(count == 10**5)
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
			2'b00: next_s = 2'b01;
			2'b01: next_s = 2'b10;
			2'b10: next_s = 2'b11;
			2'b11: next_s = 2'b00;
		endcase
	end
	
	//Output
	always@(pres_s)
	begin
		case(pres_s)
			2'b00:
				begin
					An_Sel = 2'b00;
					BCD_Sel = num[15:12];
				end
			2'b01:
				begin
					An_Sel = 2'b01;
					BCD_Sel = num[11:8];
				end
			2'b10:
				begin
					An_Sel = 2'b10;
					BCD_Sel = num[7:4];
				end
			2'b11:
				begin
					An_Sel = 2'b11;
					BCD_Sel = num[3:0];
				end
		endcase
	end

endmodule