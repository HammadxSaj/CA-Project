`timescale 1ns / 1ps


module risc5processor(
    input clk,
    input reset,
    output wire [63:0] PC_In,
    output wire [63:0] PC_Out, // Instruction address
    output wire [31:0] instruction,
    output wire [4:0] rs1, 
    output wire [4:0] rs2, 
    output wire [4:0] rd,
    output wire [63:0] WriteData,
    output wire [63:0] readData1,
    output wire [63:0] readData2,
    output wire [63:0] imm_data,
    output wire [63:0] Result,
    output wire ZERO,
    output wire [63:0] Read_Data,
    output wire [6:0] opcode,
    output wire [2:0] funct3,
    output wire [6:0] funct7,
    output wire Branch,
    output wire MemRead,
    output wire MemtoReg,
    output wire MemWrite,
    output wire ALUSrc,
    output wire Regwrite,
    output wire [63:0] ele1,
    output wire [63:0] ele2,
    output wire [63:0] ele3,
    output wire [63:0] ele4,
    output wire [63:0] ele5,
    output wire [63:0] ele6
    );
 
    wire [63:0] out1;
    wire [63:0] out2;
    wire [1:0] ALUOp;
    wire [3:0] Operation;
    wire [63:0] data_out;
    
    //The code below is for program counter to go to next address
    Program_Counter pc (clk,reset, PC_In, PC_Out);
    
    //Add +4 to previous instruction for next instruction
    Adder add1 (PC_Out, 64'd4, out1);
    
    //Code below is for instruction memory instantiation
    Instruction_Memory insmem (PC_Out, instruction);
    
    //Code below is for instruction parser instantiation
    InsParser inspar (instruction, opcode, rd, funct3, rs1, rs2, funct7);
    
    //Code below is for control unit instantiation
    Control_Unit conunit (opcode, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, ALUOp);
    
    //Code below is for register file instantiation
    registerFile regf (WriteData, rs1, rs2,rd, Regwrite, clk, reset, readData1, readData2); 
    
    //Code below is for immediate generator instantiation
    ImmGen immgen (instruction, imm_data);
    
    //Code below is for alu control instantiation
    ALU_Control ALUcont (ALUOp, {instruction[30], instruction[14:12]}, Operation);
    
    //Code below is for ALU mux instantiation to choose imm data/readdata2
    Mux ALUs (readData2, imm_data, ALUSrc, data_out); 
    
    //Code below is for ALU instantiation    
    ALU_64_bit ALU (readData1, data_out, Operation, Result, ZERO);
    
    //Code below is for data memory instantiation
    Data_Memory datamem (Result, readData2, clk, MemWrite, MemRead, Read_Data, ele1, ele2, ele3, ele4, ele5, ele6);
    
    //Code below is for data memory mux instantiation to select between alu result or read data for R-type/S-type/I-type ins   
    Mux memreg (Result, Read_Data, MemtoReg, WriteData); 
    
    //Code below is for branch adder instantiation to add branch and prev instruction address.
    Adder add2 (PC_Out,(imm_data << 1),out2);
    
    //code below is for program counter mux instantiation to select between adder +4 instruction or branch ins
    Mux PCs (out1, out2, (Branch & ZERO) , PC_In); 
    
endmodule

