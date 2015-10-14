`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rogue Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    15:43:09 09/14/2015 
// Design Name: 
// Module Name:    FourBitDecoder 
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
module FourBitDecoder(
    input [4:0] enableSelect,
    output reg [15:0] decodedEnableOut
    );

reg [15:0] decodedEnable;

always@(enableSelect)
		begin
			case(enableSelect)
			5'h0:
				begin
					decodedEnable=16'b0000000000000001;
				end
			5'h1:
				begin
					decodedEnable=16'b0000000000000010;
				end
			5'h2:
				begin
					decodedEnable=16'b0000000000000100;				
				end
			5'h3:
				begin
					decodedEnable=16'b0000000000001000;	
				end
			5'h4:
				begin
					decodedEnable=16'b0000000000010000;	
				end
			5'h5:
				begin
					decodedEnable=16'b0000000000100000;
				end
			5'h6:
				begin
					decodedEnable=16'b0000000001000000;
				end
			5'h7:
				begin
					decodedEnable=16'b0000000010000000;
				end
			5'h8:
				begin
					decodedEnable=16'b0000000100000000;
				end
			5'h9:
				begin
					decodedEnable=16'b0000001000000000;
				end
			5'ha:
				begin
					decodedEnable=16'b0000010000000000;
				end
			5'hb:
				begin
					decodedEnable=16'b0000100000000000;
				end
			5'hc:
				begin
					decodedEnable=16'b0001000000000000;
				end
			5'hd:
				begin
					decodedEnable=16'b0010000000000000;
				end
			5'he:
				begin
					decodedEnable=16'b0100000000000000;
				end
			5'hf:
				begin
					decodedEnable=16'b1000000000000000;
				end
			default:
				begin
					decodedEnable=16'b0000000000000000;
					
				end
				
			 
				
			endcase	
			
			decodedEnableOut=decodedEnable;
		end
				
			

endmodule
