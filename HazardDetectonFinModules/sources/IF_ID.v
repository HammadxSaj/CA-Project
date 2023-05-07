`timescale 1ns / 1ps


module IF_ID(
    input clk,
    input reset,
	input [31:0] instruction,
	input [63:0] PC_Out,
	input IF_write,
	output reg [31:0] IF_ID_instruction,
	output reg [63:0] IF_ID_PCOut
    );
 
	always @(*)
        begin
			if (reset == 1'b1)
				begin
					IF_ID_instruction = 0;
					IF_ID_PCOut = 0;
				end
          else if (clk==1 || IF_write == 1)
				begin
					IF_ID_instruction = instruction;
					IF_ID_PCOut = PC_Out;
				end
		end

endmodule
