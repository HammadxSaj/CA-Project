`timescale 1ns / 1ps


module risc5tb();
    reg clk;
    reg reset;
    wire [31:0] instruction;
    wire [31:0] instruction_IF;
    wire [4:0] rs1; 
    wire [4:0] rs2; 
    wire [4:0] rd;
    wire [4:0] rd_ID;
    wire [4:0] rd_MEM;
    wire [4:0] rd_EX;
    wire MemRead_ID;
    wire PC_write;
    wire IF_write;
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
    wire [1:0] forwardA;
    wire [1:0] forwardB;
    wire Regwrite_EX;
    wire Regwrite_ID;
    wire Regwrite_MEM; 
    wire [4:0] rs1_ID;
    wire Branch;
    wire toBranch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire Regwrite;
    wire HazardMux;
    wire Branch_EX;
    wire ZERO_EX;
    wire [63:0] PC_EX;
    wire [63:0] out1;
    wire [63:0] PC_IF;
    wire [63:0] PC_ID;
    wire [63:0] out2;
    wire [63:0] PC_In;
    wire [63:0] PC_Out;
    
    //Instantiating RISC V processor 
    risc5processor processor (clk, reset, PC_In, PC_Out, instruction, instruction_IF, rs1, rs2, rd, WriteData, readData1, readData2, imm_data, Result, ZERO, Read_Data, opcode, funct3, funct7, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, forwardA, forwardB, Regwrite_EX, Regwrite_ID, Regwrite_MEM, rd_EX, rd_ID, rd_MEM, rs1_ID, HazardMux, Branch_EX, ZERO_EX, PC_EX, PC_IF, PC_ID, PC_write, IF_write, MemRead_ID, toBranch, out1, out2, ele1, ele2, ele3, ele4, ele5, ele6);
    
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
