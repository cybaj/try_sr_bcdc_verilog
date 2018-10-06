`timescale 1ns/100ps

module tb_BCDCNT;
reg rCLK = 1'b0, rnRESET;
wire [3:0] wY;

BCDCounter bcdc_minseok(.nRESET(rnRESET), .CLK(rCLK), .Y(wY));

always
begin
	#500 rCLK <= ~rCLK;
end

initial
begin
	$dumpfile("test3.vcd");
	$dumpvars(0, tb_BCDCNT);
	rnRESET <= 1'b0;

	#100	rnRESET <= 1'b1;
end

initial
begin
	$monitor("t=$3d rCLK=%d wY=%4d \n", $time, rCLK, wY);
end

endmodule
