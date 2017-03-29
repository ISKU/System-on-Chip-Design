module decoder_dataflow(out, in);
	output [3:0] out; // 4out
	input [1:0] in; // 2input
	
	assign out[0] = (~in[0] & ~in[1]); // 00 일 때 out0이 1 나머지 0
	assign out[1] = (in[0] & ~in[1]); // 01 일 때 out1이 1
	assign out[2] = (~in[0] & in[1]); // 10 일 대 out2이 1
	assign out[3] =  (in[0] & in[1]); // 11 일 때 out3이 1
endmodule 