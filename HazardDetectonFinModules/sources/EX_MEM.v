`timescale 1ns / 1ps

module EX_MEM(
    input clk, reset,
    input [4:0] rd,
    input [63:0] write_data , 
    //input branch_MUX,
    input [63:0] ALU_result, PC_out,
    input zero, branch, MemRead, MemWrite, RegWrite, MemtoReg, 
    output reg [4:0] rd_out,
    output reg [63:0] write_data_out, 
    output reg [63:0] ALU_result_out, 
    output reg zero_out, branch_out, MemRead_out, MemWrite_out, RegWrite_out, MemtoReg_out, 
    output reg [63:0] PC_out_out,
    output reg branch_MUX_out
    );
//    initial
//        begin
//            MemRead_out=0;
//            MemWrite_out=0;
//            RegWrite_out=0;
//            MemtoReg_out=0;
//            PC_out_out=0;
//            rd_out = 0;
//            write_data_out=0; 
//            ALU_result_out = 0;
//            branch_MUX_out=0;
//            zero_out=0;
//            branch_out=0;
//   	   end 

	always @(*)
		begin
          if (reset==1)
				begin
                  PC_out_out=0;
                  rd_out = 0;
                  branch_out=0;
                  MemRead_out=0;
                  MemWrite_out=0;
                  RegWrite_out=0;
                  MemtoReg_out=0;
                  write_data_out=0; 
                  ALU_result_out = 0;
                  branch_MUX_out=0;
                  zero_out=0;
			    end

      else if (clk==1)
        begin
            PC_out_out=PC_out;
            rd_out=rd ;
            write_data_out=write_data; 
            MemRead_out=MemRead;
            MemWrite_out=MemWrite;
            RegWrite_out= RegWrite ;
            MemtoReg_out=MemtoReg ;
            ALU_result_out=ALU_result ;
            branch_MUX_out=ALU_result ;
            zero_out= zero;
            branch_out=branch;  
        end
	end
endmodule
