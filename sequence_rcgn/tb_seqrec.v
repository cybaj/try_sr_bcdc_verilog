`timescale 1ns/10ps

module tb_seqrec;

reg rnRESET, rCLK, rX;
wire wZ;

SeqRec_minseok seqrec0(.nRESET(rnRESET), .CLK(rCLK), .X(rX), .Z(wZ));

always
begin
  #500 rCLK <= ~rCLK;
end

initial
begin
	$dumpfile("test.vcd");
	$dumpvars(0, tb_seqrec);
	rCLK <= 1'b1;
	rnRESET <= 1'b0;
	rX <= 1'b0;
	#100 rnRESET <= 1'b1;
	#1000 rX <= 1'b1;
	#1000 rX <= 1'b1;
	#1000 rX <= 1'b0;
	#1000 rX <= 1'b0;
	#1000 rX <= 1'b1;
	#1000 rX <= 1'b1;
	#1000 rX <= 1'b0;
	#1000 rX <= 1'b1; // Z=1
	#1000 rX <= 1'b1;
	#1000 rX <= 1'b0;
	#1000 rX <= 1'b1; // Z=1
	#1000 rX <= 1'b0;
	#1000 rX <= 1'b1;
end

initial
begin
	$monitor("t=$3d rCLK=%d rX=%d wZ=%d \n",$time,rCLK,rX,wZ);
end
endmodule
