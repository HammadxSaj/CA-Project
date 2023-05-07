`timescale 1ns / 1ps

module Hazard_detection_Unit(
    input [4:0] if_id_rs1,
    input [4:0] if_id_rs2,
    input [4:0] id_ex_rd,
    input MemRead,
    output reg muxcontrolbit,
    output reg PC_Write,
    output reg If_id_write
    );
    
    always @(*)    
    begin 
      if (MemRead == 1 && (if_id_rs2==id_ex_rd || if_id_rs1==id_ex_rd))
        begin
            muxcontrolbit=0;
      	    PC_Write=0;
      	
          
            If_id_write=0;
        end
        
      else 
      begin
          muxcontrolbit=1;
      	  PC_Write=1;
          If_id_write=1;
        end 
      
    end 
    
endmodule
