module test_FSM;
	reg nRESET; // RESET
	reg clk; // CLOCK
	reg in; // input
	wire out; // ouput
	
	always #100 clk = ~clk; // clock cycle은 200마다 상승 

	mealy U0 
	(
		.nRESET(nRESET),
		.clk(clk),
		.in(in),
		.out(out)
	);
/*
	moore U0 
	(
		.nRESET(nRESET),
		.clk(clk),
		.in(in),
		.out(out)
	);
*/
	initial begin
		clk = 1'b1;
		nRESET = 1'b1;
		
		#200 in = 1'b1;
		#200 in = 1'b1;
		#200 in = 1'b1;
		#200 in = 1'b1; // 1의 입력이 4번 들어올 때 출력 1이 나와야 한다.
		#200 in = 1'b1; // 여기까지 1의 입력이 5번 들어온다. (출력 1)
		#200 in = 1'b0; // 0의 입력 (출력 0)
		#200 in = 1'b0; 
		#200 in = 1'b1; // 1 입력

		#200 in = 1'b0;
		#200 in = 1'b0;
		#200 in = 1'b0;
		#200 in = 1'b0; // 0 입력 4번이 들어올 때 출력 1이 나와야 한다.
		#200 in = 1'b0; // 0 입력 5번 유지할 때 (출력 1)
		#200 in = 1'b1;
		#200 in = 1'b1; // 1의 입력 (출력 0)
		#200 in = 1'b0;
		
		#300
		$finish;
	end
endmodule 
