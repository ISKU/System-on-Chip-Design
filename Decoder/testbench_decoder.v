module test_decoder;
	reg [1:0] in;
	wire [3:0] out;
	
	decoder_dataflow U0(out, in); 
	// test할 module (decoder_dataflow, decoder_structural, decoder_behavioral)
	
	initial begin
		#100 // 딜레이
		in = 2'b00; // 입력 00 
		#100 
		in = 2'b01; // 입력 01
		#100 
		in = 2'b10; // 입력 10
		#100 
		in = 2'b11; // 입력 11
		#100
		$finish; // 종료
	end
endmodule 
