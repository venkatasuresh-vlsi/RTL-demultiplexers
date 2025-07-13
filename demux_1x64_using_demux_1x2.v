module demux_1x2 (
		input din,
		input sel,
		output reg [1:0] y
	 );
		always @(*) begin
			y = 2'b00;
			y[sel] = din;
		end
	endmodule

module demux_1x64 (
		input din,
		input [5:0] sel,
		output [63:0] y
	 );
		wire [1:0] level1;
		wire [1:0] level2[1:0];
		wire [1:0] level3[3:0];
		wire [1:0] level4[7:0];
		wire [1:0] level5[15:0];
		wire [1:0] level6[31:0];

		demux_1x2 d1 (
			.din(din),
			.sel(sel[5]),
			.y(level1)
		);

		genvar i;

		generate
			for (i = 0; i < 2; i = i + 1) begin 
				demux_1x2 d2 (
					.din(level1[i]),
					.sel(sel[4]),
					.y(level2[i])
				);
			end
		endgenerate

		generate
			for (i = 0; i < 4; i = i + 1) begin 
				demux_1x2 d3 (
					.din(level2[i >> 1][i & 1]),
					.sel(sel[3]),
					.y(level3[i])
				);
			end
		endgenerate

		generate
			for (i = 0; i < 8; i = i + 1) begin 
				demux_1x2 d4 (
					.din(level3[i >> 1][i & 1]),
					.sel(sel[2]),
					.y(level4[i])
				);
			end
		endgenerate

		generate
			for (i = 0; i < 16; i = i + 1) begin
				demux_1x2 d5 (
					.din(level4[i >> 1][i & 1]),
					.sel(sel[1]),
					.y(level5[i])
				);
			end
		endgenerate

		generate
			for (i = 0; i < 32; i = i + 1) begin 
				demux_1x2 d6 (
					.din(level5[i >> 1][i & 1]),
					.sel(sel[0]),
					.y(level6[i])
				);
			end
		endgenerate

		assign y = {
			level6[31], level6[30], level6[29], level6[28],
			level6[27], level6[26], level6[25], level6[24],
			level6[23], level6[22], level6[21], level6[20],
			level6[19], level6[18], level6[17], level6[16],
			level6[15], level6[14], level6[13], level6[12],
			level6[11], level6[10], level6[9],  level6[8],
			level6[7],  level6[6],  level6[5],  level6[4],
			level6[3],  level6[2],  level6[1],  level6[0]
		};
	endmodule
