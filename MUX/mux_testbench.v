module test_mux;
	reg in0;
	reg in1;
	reg in2;
	reg in3; // 4개의 입력
	reg [1:0] sel; // select 입력 2bit
	wire out;
	
	mux_structural U0(out, in0, in1, in2, in3, sel); 
	// test할 module (mux_dataflow, structural, behavioral)
	
	initial begin
		#100 // 딜레이
		sel = 2'b00; // select가 00일 때
		in0 = 1'b1; in1 = 1'b0; in2 = 1'b0; in3 = 1'b0;
		#100 
		sel = 2'b01; // select가 01일 때
		in0 = 1'b0; in1 = 1'b1; in2 = 1'b0; in3 = 1'b0;
		#100 
		sel = 2'b10; // select가 10일 때
		in0 = 1'b0; in1 = 1'b0; in2 = 1'b0; in3 = 1'b1;
		#100 
		sel = 2'b11; // select가 11일 때
		in0 = 1'b0; in1 = 1'b0; in2 = 1'b0; in3 = 1'b1;
		#100 
		$finish; // 종료
	end
endmodule 
