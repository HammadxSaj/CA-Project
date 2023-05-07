`timescale 1ns / 1ps

module ID_EX(
     input clk,
     input reset,
     input branch,
     input MemRead,
     input MemtoReg,
     input MemWrite,
     input ALUsrc,
     input RegWrite,
     input [1:0] ALU_Op, 
     input [63:0] readdata1,
     input [63:0] readdata2,
     input [63:0] immediate,
     input [63:0] pc_out, 
     input [4:0] rs1,
     input [4:0] rs2,
     input [4:0] rd ,
     input[3:0] func,
     output reg branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUsrc_out, RegWrite_out, 
     output reg [1:0] AlU_Op_out, 
     output reg [63:0]  readdata1_out,readdata2_out,immediate_out,pc_out_out,
     output reg [4:0] rs1_out, rs2_out, rd_out , 
     output reg [3:0] func_out
    );
    
    initial
        begin
          branch_out = 0;
          MemRead_out=0;
          AlU_Op_out=0;
          MemWrite_out=0;
          ALUsrc_out=0;
          AlU_Op_out=0;
          RegWrite_out=0;
          readdata1_out=0;
          readdata2_out=0;
          immediate_out=0;
          pc_out_out=0;
          rs1_out= 0;
          rs2_out=0;
          rd_out=0;
          func_out=0;
    end
      always @(*)
        begin
          if (reset==1'b1)
            begin
      
              branch_out = 0; 
              MemRead_out=0;
              MemtoReg_out=0;
              MemWrite_out=0;
              ALUsrc_out=0;
              AlU_Op_out=0;
              RegWrite_out=0;
              readdata1_out=0;
              readdata2_out=0;
              immediate_out=0;
              pc_out_out=0;
              rs1_out= 0;
              rs2_out=0;
              rd_out=0;
              func_out=0;
              
            end 
  else if (clk==1)
    begin     
    	MemRead_out=MemRead;
    	MemtoReg_out=MemtoReg;
    	MemWrite_out=MemWrite;
    	ALUsrc_out=ALUsrc;
    	AlU_Op_out=ALU_Op;
        RegWrite_out=RegWrite;
        readdata1_out=readdata1;
        readdata2_out=readdata2;
        immediate_out=immediate;
        pc_out_out=pc_out;
        rs1_out= rs1;
        rs2_out=rs2;
        rd_out=rd;
        func_out=func;
      end   
    end 
endmodule
