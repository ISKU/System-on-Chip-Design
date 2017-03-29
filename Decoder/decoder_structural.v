module decoder_structural(out, in);
	output [3:0] out; // 4out
	input [1:0] in; // 2input
	
	and and1(out[0], ~in[0], ~in[1]); // 00일 때 out0이 1 나머지 0
	and and2(out[1], in[0], ~in[1]); // 01일 때 out1이 1
	and and3(out[2], ~in[0], in[1]); // 10일 때 out2이 1
	and and4(out[3], in[0], in[1]); // 11일 때 out3이 1
endmodule 