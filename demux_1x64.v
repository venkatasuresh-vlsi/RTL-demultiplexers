module demux_1x64 (
     input din,
	 input [5:0] sel,
	 output reg [63:0] y
	 );
	 always @(*) begin
	     y = 64'b0;
		 y[sel] = din;      		 
		end
	endmodule