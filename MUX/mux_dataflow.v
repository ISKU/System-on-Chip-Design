module mux_dataflow(out, in0, in1, in2, in3, sel); 
	input in0, in1, in2, in3; // 4input 
	input  [1:0] sel; // select 2bit (00, 01, 10, 11)
	output out; // out port
	wire out;
	
	assign out =
		(sel == 2'b00) ? in0 : // select가 00일 때 in0의 값 출력
		(sel == 2'b01) ? in1 : // select가 01일 때 in1의 값 출력
		(sel == 2'b10) ? in2 : // select가 10일 때 in2의 값 출력
		(sel == 2'b11) ? in3 : 1'bx; // select가 11일 때 in3의 값 출력
endmodule 