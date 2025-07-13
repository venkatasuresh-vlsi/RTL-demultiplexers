module demux_1x32 (
     input din,
	 input [4:0] sel,
	 output reg [31:0] y
	 );
	 always @(*) begin
	     y = 32'b0;
		 y[sel] = din;      		 
		end
	endmodule