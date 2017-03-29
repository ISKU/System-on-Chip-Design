module mux_behavioral(out, in0, in1, in2, in3, sel);
	input in0, in1, in2, in3; // 4input
	input [1:0] sel; // select 2bit (00, 01, 10, 11)
	output out; // outport
	reg out;
	
	always @(in0 or in1 or in2 or in3 or sel) 
		begin 
			if (sel == 2'b00) out = in0; // select가 00일 때 in0 값 출력
			else if (sel == 2'b01) out = in1; // select가 01일 때 in1값 출력
			else if (sel == 2'b10) out = in2; // select가 10일 때 in2 값 출력
			else out = in3; // 이외 select가 11일 때 in3값 출력
		end 
endmodule 