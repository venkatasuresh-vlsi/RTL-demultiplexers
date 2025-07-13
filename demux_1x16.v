module demux_1x16 (
     input din,
	 input [3:0] sel,
	 output reg [15:0] y
	 );
	 always @(*) begin
	     y = 16'b0;
		 y[sel] = din;      		 
		end
	endmodule