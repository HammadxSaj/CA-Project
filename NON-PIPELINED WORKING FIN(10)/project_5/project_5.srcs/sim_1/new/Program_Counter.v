module Program_Counter
(
	input clk,reset,
	input [63:0] PC_In,
	//input pc_write,
	output reg [63:0] PC_Out
);

//	initial 
//	PC_Out=64'd0;

	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			PC_Out=64'd0;
		else if (reset==0)
			PC_Out=PC_In;
	    else   
	       PC_Out=PC_In;
	       
	end

endmodule
