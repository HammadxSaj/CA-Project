`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 01:49:18 AM
// Design Name: 
// Module Name: Branch_Module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Branch_Module(
  input zero,
  input pos,
  input branch,
  input [2:0] funct3,
  output reg bne,
  output reg beq,
  output reg bge,
  output reg blt,
  output reg to_branch
    );
  always @(*)
    begin
      if (branch) begin
        if (zero && funct3 == 3'b000) begin
            beq <= 1'b1;
            bne <= 1'b0;
            bge <= 1'b0;
            blt <= 1'b0;
        end
        else if (~zero && funct3 == 3'b001) begin
            bne <= 1'b1;
            beq <= 1'b0;
            bge <= 1'b0;
            blt <= 1'b0;
        end
        else if ((pos || zero) && funct3 ==3'b101) begin
            bne <= 1'b0;
            beq <= 1'b0;
            bge <= 1'b1;
            blt <= 1'b0;
        end
        else if ((~pos && ~zero) && funct3 ==3'b100) begin
            bne <= 1'b0;
            beq <= 1'b0;
            blt <= 1'b1;
            bge <= 1'b0;
        end
        else begin
            bne <= 1'b0;
            beq <= 1'b0;
            blt <= 1'b0;
            bge <= 1'b0;
        end
      end
      else begin
            bne <= 1'b0;
            beq <= 1'b0;
            blt <= 1'b0;
            bge <= 1'b0;
      end
      to_branch <= branch && (bne || beq || blt || bge);
    end
endmodule
