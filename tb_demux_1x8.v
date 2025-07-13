module tb_demux_1x8;
     reg din;
	 reg [2:0] sel;
	 wire [7:0] y;
	 
	 integer i;
	 
	 demux_1x8 uut (
	     .din(din),
		 .sel(sel),
		 .y(y)
		 );
	 initial begin
	     $monitor("Time=%0t | sel=%b | y=%b", $time, sel, y);
		 din = 1;
		 for(i=0; i<8; i=i+1)begin
		     sel = i;
			 #10;
			end
		 $finish;
		end
	endmodule