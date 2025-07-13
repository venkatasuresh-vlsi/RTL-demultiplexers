module tb_demux_1x2;
     reg din, sel;
	 wire y0, y1;
	 
	 integer i;
	 
	 demux_1x2 uut(
	     .din(din),
		 .sel(sel),
		 .y0(y0),
		 .y1(y1)
		 );
		 
	 initial begin
	     $monitor("Time=%0t | sel=%b | y0=%b | y1=%b", $time, sel, y0, y1);
		 din = 1;
		 for(i=0; i<2; i=i+1)begin
		     sel = i;
			 #10;
			end
		 $finish;
		end
	endmodule