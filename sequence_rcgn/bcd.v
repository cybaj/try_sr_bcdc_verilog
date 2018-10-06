module BCDCounter_minseok (
	input		nRESET, CLK,
	output	reg [3:0] Y
	);

always @(negedge nRESET or posedge CLK)
begin
	if (~nRESET) begin
		Y[3:0] <= 4'd0;
	end
	else begin
		if (Y[3:0] < 4'd9) begin
			Y[3:0] <= Y[3:0] + 4'd1;
		end
		else begin
			Y[3:0] <= 4'd0;
		end
	end
end
endmodule
