`define S0 3'b000 // 시작 state
`define S1 3'b001 // 1 state
`define S2 3'b010 // 11 state
`define S3 3'b011 // 111 state
`define S4 3'b100 // 0 state
`define S5 3'b110 // 00 state
`define S6 3'b111 // 000 state

module mealy (nRESET, clk, in, out);
	input nRESET, clk, in; // reset, clock, input
	output out; // output
	reg [2:0] curState, nextState; // 현재 state와 다음 state
	reg out;
	
	always @(posedge clk or negedge nRESET)
		if (!nRESET)
			curState <= `S0;
		else
			curState <= nextState;
	// 매 클락이 상승 할 때 현재 state에서 다음 state로 바꾼다.
			
	always @(curState or in)
		casex (curState)
			`S0: // 시작 state
				if (in == 0) begin
					nextState = `S4; // 0 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S1; // 1 state로 이동
					out = 1'b0;
				end
			`S1: // 현재 1의 입력이 1번 들어온 1 state
				if (in == 0) begin
					nextState = `S4; // 0 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S2; // 11 state 이동
					out = 1'b0;
				end
			`S2: // 현재 1의 입력이 2번 들어온 11 state
				if (in == 0) begin
					nextState = `S4; // 0 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S3; // 111 state 이동
					out = 1'b0;
				end
			`S3: // 현재 1의 입력이 3번 들어온 111 state
				if (in == 0) begin
					nextState = `S4; // 0 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S3; // 111 state 이동
					out = 1'b1; // 1의 입력이 3번 들어온 상태에서 1입력이 들어왔으므로 1 출력
				end
			`S4: // 현재 0의 입력이 1번 들어온 0 state
				if (in == 0) begin
					nextState = `S5; // 00 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S1; // 1 state 이동
					out = 1'b0;
				end
			`S5: // 현재 0의 입력이 2번 들어온 00 state
				if (in == 0) begin
					nextState = `S6; // 000 state 이동
					out = 1'b0;
				end
				else begin
					nextState = `S1; // 1 state 이동
					out = 1'b0;
				end
			`S6: // 현재 0의 입력이 3번 들어온 000 state
				if (in == 0) begin
					nextState = `S6; // 000 state 이동
					out = 1'b1; // 0의 입력이 3번 들어온 상태에서 0입력이 들어왔으므로 1 출력
				end
				else begin
					nextState = `S1; // 1 state 이동
					out = 1'b0;
				end
			default: begin
				nextState = `S0;
				out = 1'b0;
			end
		endcase
endmodule 