`define S0 4'b0000 // 시작 state
`define S1 4'b0001 // 0 state
`define S2 4'b0010 // 00 state
`define S3 4'b0011 // 000 state
`define S4 4'b0100 // 0000 state
`define S5 4'b1001 // 1 state
`define S6 4'b1010 // 11 state
`define S7 4'b1011 // 111 state 
`define S8 4'b1100 // 1111 state

module moore (nRESET, clk, in, out);
	input nRESET, clk, in; // reset, clock, input
	output out; // output
	reg [3:0] curState, nextState; // 현재 state와 다음 state 
	reg out;
	
	always @(posedge clk or negedge nRESET)
		if (!nRESET)
			curState <= `S0;
		else
			curState <= nextState;
	// 매 클락이 상승 할 때 현재 state에서 다음 state로 바꾼다.
			
	always @(curState or in)
		casex (curState)
			`S0: begin // 시작 state
				if (in == 0) nextState = `S1; // 0 state 이동
				else nextState = `S5; // 1 state 이동
				out = 1'b0;
			end
			`S1: begin // 현재 0이 1번 들어온 state
				if (in == 0) nextState = `S2; // 00 state 이동
				else nextState = `S5; // 1 state 이동
				out = 1'b0;
			end
			`S2: begin // 현재 0이 2번 들어온 state 
				if (in == 0) nextState = `S3; // 000 state 이동
				else nextState = `S5; // 1 state 이동
				out = 1'b0;
			end
			`S3: begin // 현재 0이 3번 들어온 state
				if (in == 0) nextState = `S4; // 0000 state 이동
				else nextState = `S5; // 1 state 이동
				out = 1'b0;
			end
			`S4: begin // 현재 0이 4번 들어온 state
				if (in == 0) nextState = `S4; // 0000 state 이동
				else nextState = `S5; // 1 state 이동
				out = 1'b1; // 현재 0이 4번 들어온 상태이므로 1 출력
			end
			`S5: begin // 현재 1이 1번 들어온 state
				if (in == 0) nextState = `S1; // 0 state 이동
				else nextState = `S6; // 11 state 이동
				out = 1'b0;
			end
			`S6: begin // 현재 1이 2번 들어온 state 
				if (in == 0) nextState = `S1; // 0 state 이동
				else nextState = `S7; // 111 state 이동
				out = 1'b0;
			end
			`S7: begin // 현재 1이 3번 들어온 state 
				if (in == 0) nextState = `S1; // 0 state 이동
				else nextState = `S8; // 1111 state 이동
				out = 1'b0;
			end
			`S8: begin // 현재 1이 4번 들어온 state
				if (in == 0) nextState = `S1; // 0 state 이동
				else nextState = `S8; // 1111 state 이동
				out = 1'b1; // 현재 1이 4번 들어온 상태이므로 1 출력
			end
			default: begin
				nextState = `S0;
				out = 1'b0;
			end
		endcase
endmodule 