`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// UT EID: jcr4698
// 
// Create Date: 11/21/2021 11:12:38 PM
// Design Name: Stopwatch/Timer
// Module Name: stopwatch_state_machine
// Project Name: Lab 6
// Target Devices: Basys3
// Description: State machine of programmable stopwatch/timer with RTL Design.
// 
//////////////////////////////////////////////////////////////////////////////////


module stopwatch_state_machine(
    input clk,
    input play,
    input reset,
    input [6:0] in0,
    input [6:0] in1,
    input [6:0] in2,
    input [6:0] in3,
    output reg [3:0] an,
    output reg [6:0] sseg,
    output reg clr,
    output reg stop,
    
//    output reg [1:0] state
    );
    
    reg [1:0] state;
    reg [1:0] next_state;
    
// 7 Segment Display State Machine Logic
always @ (*)
    begin
        case(state) // Multiplexer
            2'b00: sseg = in0;
            2'b01: sseg = in1;
            2'b10: sseg = in2;
            2'b11: sseg = in3;
            default: sseg = in0;
        endcase

        case(state) // Decoder
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
            default: an = 4'b1110;
        endcase
    end
    
always @(*)
    begin
        case(state) // State Transition
            // Init
            2'b00: begin
                stop = 1'b1;
                clr = 1'b1;
                next_state = 2'b01;
            end
            // Wait for start
            2'b01: begin
                stop = 1'b1;
                clr = 1'b0;
                if(~play)
                    next_state = 2'b01;
                else
                    next_state = 2'b10;
                end
            // play
            2'b10: begin
                stop = 0'b0;
                clr = 0'b0;    
                if(~play)
                    next_state = 2'b10;
                else
                    next_state = 2'b11;
            end
            // pause
            2'b11: begin
                stop = 1'b1;
                clr = 1'b0;
                if(~play)
                    next_state = 2'b11;
                else
                    next_state = 2'b10;
            end
            // other
            default: next_state = 2'b00;
        endcase
    end
    
always @ (posedge clk or posedge reset)
begin
    if (reset)
        state <= 2'b00;
    else
        state <= next_state;
end
    
endmodule
