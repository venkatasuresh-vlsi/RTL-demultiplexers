module tb_demux_1x64_1x2;
     reg din;
	 reg [5:0] sel;
	 wire [63:0] y;
	 
	 integer i;
	 
	 demux_1x64 uut (
	     .din(din),
		 .sel(sel),
		 .y(y)
		 );
	 initial begin
	     $monitor("Time=%0t | sel=%b | y=%b", $time, sel, y);
		 din = 1;
		 for(i=0; i<64; i=i+1)begin
		     sel = i;
			 #10;
			end
		 $finish;
		end
	endmodule