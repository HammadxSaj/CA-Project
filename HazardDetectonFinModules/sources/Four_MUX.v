`timescale 1ns / 1ps

module Four_MUX(
    input [63:0] a, b, c, d, 
    input [1:0] sel, 
    output reg [63:0] mux_result
    );
    
    always @(*)
        begin
          if (sel==2'b00)
            mux_result=a;
          else if (sel ==2'b01)
            mux_result=b;
            else if (sel==2'b10)
              mux_result=c;
          else if (sel==2'b11)
            mux_result=d;    
    end 
    
endmodule
