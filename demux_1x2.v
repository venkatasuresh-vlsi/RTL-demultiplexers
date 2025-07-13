module demux_1x2 (
		input din,     
		input sel,    
		output reg  y0,     
		output reg  y1       
	 );
		always @(*) begin
			case (sel)
				1'b0: begin
					y0 = din;
					y1 = 0;
				end
				1'b1: begin
					y0 = 0;
					y1 = din;
				end
			endcase
		end
	endmodule
