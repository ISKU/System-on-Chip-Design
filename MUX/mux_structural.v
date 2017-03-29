module mux_structural(out, in0, in1, in2, in3, sel);
	output out; // outport
	input in0, in1, in2, in3; // 4input
	input [1:0] sel; // select 2bit (00, 01, 10, 11)
	wire notsel0, notsel1; // not select
	wire y0, y1, y2, y3; // and 연산 결과
	
	not not0 (notsel0, sel[0]);
	not not1 (notsel1, sel[1]); // select의 not연산
	and and0 (y0, in0, notsel1, notsel0); // 00
	and and1 (y1, in1, notsel1, sel[0]); // 01
	and and2 (y2, in2, sel[1], notsel0); // 10
	and and3 (y3, in3, sel[1], sel[0]); // 11
	or or0 (out, y0, y1, y2, y3); // 위 and 연산 결과를 or 연산
endmodule 