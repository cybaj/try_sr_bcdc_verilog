module SeqRec_2_minseok (
	input		nRESET, CLK, X,
	output		Z
);

reg [2:0] shiftReg;
wire [3:0] tmp;

assign tmp[3:0] = {shiftReg[2:0], X};

always @(negedge nRESET or posedge CLK) 
begin
	if (~nRESET) begin
		shiftReg[2:0] <= 3'b000;
	end
	else begin
		shiftReg[2:0] <= tmp[2:0];
	end
end
assign Z = (tmp[3:0] == 4'b1101);
endmodule
