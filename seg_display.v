`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    16:01:12 04/22/2015 
// Design Name: 
// Module Name:    bcdStuff 
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
module seg_display(
    input [1:0] sel,
    input [3:0] bcd,
    output reg [3:0] sel_out,
    output reg [7:0] bcd_out
    );
	 
	 always@(bcd,sel)
	 begin
	 
		case(bcd)
		4'd0: bcd_out=8'b10000001;
		4'd1: bcd_out=8'b11001111;
		4'd2: bcd_out=8'b10010010;
		4'd3: bcd_out=8'b10000110;
		4'd4: bcd_out=8'b11001100;
		4'd5: bcd_out=8'b10100100;
		4'd6: bcd_out=8'b10100000;
		4'd7: bcd_out=8'b10001111;
		4'd8: bcd_out=8'b10000000;
		4'd9: bcd_out=8'b10000100;
		4'd10: bcd_out=8'b10001000;
		4'd11: bcd_out=8'b11100000;
		4'd12: bcd_out=8'b10110001;
		4'd13: bcd_out=8'b11000010;
		4'd14: bcd_out=8'b10110000;		
		4'd15: bcd_out=8'b10111000;
		default bcd_out=8'b11111111;
		endcase;
		
		case(sel)
		2'd0: sel_out=4'b1110;
		2'd1: sel_out=4'b1101;
		2'd2: sel_out=4'b1011;
		2'd3: sel_out=4'b0111;
		endcase;
		
	end;
		
endmodule
