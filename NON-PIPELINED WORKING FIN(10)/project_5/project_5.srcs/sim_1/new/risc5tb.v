`timescale 1ns / 1ps


module risc5tb();
    reg clk;
    reg reset;
    wire [63:0] PC_In;
    wire [63:0] PC_Out;
    wire [31:0] instruction;
    wire [4:0] rs1; 
    wire [4:0] rs2; 
    wire [4:0] rd;
    wire [63:0] WriteData;
    wire [63:0] readData1;
    wire [63:0] readData2;
    wire [63:0] imm_data;
    wire [63:0] Result;
    wire ZERO;
    wire [63:0] Read_Data;
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [63:0] ele1;
    wire [63:0] ele2;
    wire [63:0] ele3;
    wire [63:0] ele4;
    wire [63:0] ele5;
    wire [63:0] ele6;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire Regwrite;
    
    //Instantiating RISC V processor 
    risc5processor processor (clk, reset, PC_In, PC_Out, instruction, rs1, rs2, rd, WriteData, readData1, readData2, imm_data, Result, ZERO, Read_Data, opcode, funct3, funct7, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, ele1, ele2, ele3, ele4, ele5, ele6);
    
    //Clock is to jump to next ins
//        initial begin
//            clk = 1'b0; reset = 1'b0;
//            #10 reset = 1'b1;
//            #10 reset = 1'b0;
//            #300 reset = 1'b1;
//            #10 reset = 1'b0;
//            end
//            always
//                #2 clk = ~clk;
        initial
            begin
           clk = 1'b0;
           reset = 1'b1;
              #10
           reset = 1'b0;
            end
          
          always
            begin
              #5
              clk = ~clk;
            end 
       
endmodule
