module demux_1x8 (
     input din,
	 input [2:0] sel,
	 output reg [7:0] y
	 );
	 always @(*) begin
	     y = 8'b0;
		 y[sel] = din;      		 
		end
	endmodule