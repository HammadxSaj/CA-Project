`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 10:35:07 PM
// Design Name: 
// Module Name: Hazard_detection_MUX
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


module Hazard_detection_MUX(
    input sel,
    input branch,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input ALUsrc,
    input RegWrite,
    input [1:0] ALU_Op,
    output reg branch_eq_hazard,
    output reg MemRead_hazard,
    output reg MemtoReg_hazard,
    output reg MemWrite_hazard,
    output reg ALUsrc_hazard,
    output reg RegWrite_hazard,
    output reg [1:0] ALU_Op_hazard
    );

  always @ (*)
    begin
          if (sel)
            begin
              branch_eq_hazard=branch;
              MemRead_hazard=MemRead;
              MemtoReg_hazard=MemtoReg;
              MemWrite_hazard=MemWrite;
              ALUsrc_hazard=ALUsrc;
              RegWrite_hazard=RegWrite;
              ALU_Op_hazard=ALU_Op;
              end 
          
         else
            begin
              branch_eq_hazard=0;
              MemRead_hazard=0;
              MemtoReg_hazard=0;
              MemWrite_hazard=0;
              ALUsrc_hazard=0;
              RegWrite_hazard=0;
              ALU_Op_hazard=0;
            end 
          
    end 
endmodule 
