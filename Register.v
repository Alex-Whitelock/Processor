`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rouge Squadron
// Engineer: William, Logan, Daniel, Alex
// 
// Create Date:    10:38:15 09/12/2015 
// Design Name: 
// Module Name:    Register 
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
module Register(
    input Clock,
	 input Reset,
	 input RegEnable,
    input [15:0] DataIn,
    output reg [15:0] DataOut
    );

always@(posedge Clock)
begin

if(Reset==1)
begin
DataOut=0;
end
else if(RegEnable==1)
begin
DataOut=DataIn;
end
end


endmodule
