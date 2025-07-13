module demux_1x4 (
     input din,
	 input [1:0] sel,
	 output reg [3:0] y
	 );
	 always @(*) begin
	     y = 4'b0;
		 y[sel] = din;      		 
		end
	endmodule