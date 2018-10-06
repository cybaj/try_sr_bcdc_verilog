module SeqRec_minseok (
	input		nRESET, CLK, X,
	output	reg	Z
);
localparam STA = 2'b00;
localparam STB = 2'b01;
localparam STC = 2'b10;
localparam STD = 2'b11;

reg [1:0] state;
reg [1:0] next_state;

always @(*)
begin
//combinational circuit 
//from X and state to Z and next_state

	case ({state, X}) 
		{STA, 1'b0} : begin
			next_state = STA;
			Z = 1'b0;
		end
		{STA, 1'b1} : begin
			next_state = STB;
			Z = 1'b0;
		end
		{STB, 1'b0} : begin
			next_state = STA;
			Z = 1'b0;
		end
		{STB, 1'b1} : begin
			next_state = STC;
			Z = 1'b0;
		end
		{STC, 1'b0} : begin
			next_state = STD;
			Z = 1'b0;
		end
		{STC, 1'b1} : begin
			next_state = STC;
			Z = 1'b0;
		end
		{STD, 1'b0} : begin
			next_state = STA;
			Z = 1'b0;
		end
		{STD, 1'b1} : begin
			next_state = STB;
			Z = 1'b1;
		end
	endcase

end

always @(negedge nRESET or posedge CLK) 
begin
	if (~nRESET) begin
		state[1:0] <= STA;
	end
	else begin
		state[1:0] <= next_state[1:0];
	end
end
endmodule
