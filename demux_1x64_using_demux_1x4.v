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

module demux_1x64 (
		input din,
		input [5:0] sel,
		output [63:0] y
	 );
		wire [3:0] level1;
		wire [3:0] level2[3:0];
		wire [3:0] level3[15:0];
		

		demux_1x4 d1 (
			.din(din),
			.sel(sel[5:4]),
			.y(level1)
		);

		genvar i;

		generate
			for (i = 0; i < 4; i = i + 1) begin 
				demux_1x4 d2 (
					.din(level1[i]),
					.sel(sel[3:2]),
					.y(level2[i])
				);
			end
		endgenerate

		generate
			for (i = 0; i < 16; i = i + 1) begin 
				demux_1x4 d3 (
					.din(level2[i >> 2][i & 2'b11]),
					.sel(sel[1:0]),
					.y(level3[i])
				);
			end
		endgenerate
      assign y = {level3[15], level3[14], level3[13], level3[12], 
	              level3[11], level3[10], level3[9], level3[8],
				  level3[7], level3[6], level3[5], level3[4],
				  level3[3], level3[2], level3[1], level3[0]
		};
	endmodule
