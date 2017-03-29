module decoder_behavioral(out, in);
	output [3:0] out; // 4out
	input [1:0] in; // 2input
	reg [3:0] out;
	
	always @(in)
		begin
			if (in == 2'b00) out = 4'b0001; // 00일 때 0001 출력
			else if (in == 2'b01) out = 4'b0010; // 01일 때 0010 출력
			else if (in == 2'b10) out = 4'b0100; // 10일 때 0100 출력
			else out = 4'b1111; // 11일 때 1111 출력
		end
endmodule 