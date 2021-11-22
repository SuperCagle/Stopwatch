`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// UT EID: jcr4698
// 
// Create Date: 11/21/2021 11:12:38 PM
// Design Name: Stopwatch/Timer
// Module Name: stopwatch
// Project Name: Lab 6
// Target Devices: Basys3
// Description: Programmable stopwatch/timer design will be implemented using 
// RTL-design methodology with 4 modes.
// 
//////////////////////////////////////////////////////////////////////////////////


module stopwatch(
    input clk,
    input setting,
    input reset,
    input stop,
    input [3:0] n0,
    input [3:0] n1,
    output [3:0] an,
    output [6:0] sseg
    );
    
// Module instantiation of 7 Segment Display Decoder
    wire [6:0] in0, in1, in2, in3;
    reg [3:0] di0, di1, di2, di3;
    timeToDisplay c1 (.x(di0[3:0]), .r(in0));
    timeToDisplay c2 (.x(di1[3:0]), .r(in1));
    timeToDisplay c3 (.x(di2[3:0]), .r(in2));
    timeToDisplay c4 (.x(di3[3:0]), .r(in3));
    
// Module instantiation of timers
  // ~ UP ~
    upCount c5 (.setTime({n1,n0}),
                .stop(stop),
                .clear(reset),
                .di0(di0),
                .di1(di1),
                .di2(di2),
                .di3(di4)
                );
  // ~ DOWN ~
    downCount c6 (.setTime({n1,n0}),
                .stop(stop),
                .clear(reset),
                .di0(di0),
                .di1(di1),
                .di2(di2),
                .di3(di4)
                );
    
// Module instantiation of controller
    stopwatch_state_machine c7 (
        .clk(clk),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg)
     );

endmodule
