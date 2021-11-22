`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// UT EID: jcr4698
// 
// Create Date: 11/21/2021 11:12:38 PM
// Design Name: Stopwatch/Timer
// Module Name: timeToDisplay
// Project Name: Lab 6
// Target Devices: Basys3
// Description:  7 Segment Display for programmable stopwatch/timer.
// Design will be implemented using RTL-design methodology with 4 modes.
// 
//////////////////////////////////////////////////////////////////////////////////


module timeToDisplay(
    input [3:0] x,
    output reg [6:0] r
    );
    
always @(*)
begin
    case(x)
        4'b0000: r = 7'b0000001;
        4'b0001: r = 7'b1001111;
        4'b0010: r = 7'b0010010;
        4'b0011: r = 7'b0000110;
        4'b0100: r = 7'b1001100;
        4'b0101: r = 7'b0100100;
        4'b0110: r = 7'b0100000;
        4'b0111: r = 7'b0001111;
        4'b1000: r = 7'b0000000;
        4'b1001: r = 7'b0000100;
    endcase
end 
endmodule
