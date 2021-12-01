//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Nicholas Cagle
// UT EID: ntc445
// 
// Create Date: 11/24/2021 11:12:38 PM
// Design Name: Stopwatch/Timer
// Module Name: clk_dib
// Project Name: Lab 6
// Target Devices: Basys3
// Description:  Up counter with optional initial time programmable stopwatch/timer. 
// Design will be implemented using RTL-design methodology with 4 modes.
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


// clock divider for the display so it's readable and visible to human eye

module clk_div(
  input clk,
  input reset,
  output clk_out
);
  
  reg [16:0] COUNT;
  
  always @(posedge clk) begin 
    if(reset) // if reset then clk needs to start over
      COUNT = 0;
    else 
      COUNT = COUNT + 1 // if being played then continually add one to itself for the counter 
      end
      
      endmodule 
