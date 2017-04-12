module test_Register;
	reg clk; // 클럭
	reg nRESET; // 리셋
	reg write_enable; // 쓰기를 사용할 것인지 나타낼 enable 비트
	reg [2:0] write_addr; // 쓰기를 할 주소
	reg [15:0] write_data; // 쓰기 할 값
	
	reg [2:0] read_addr_A;
	reg [2:0] read_addr_B;
	reg [2:0] read_addr_C; // 읽어올 값의 주소 A, B, C
	wire [15:0] read_data_A;
	wire [15:0] read_data_B;
	wire [15:0] read_data_C; // 주소에 대해 읽어온 값 A, B, C
	
	// 3R1W 16bit Register File
	RegisterFile register 
	(
		.clk(clk),
		.nRESET(nRESET),
		.write_enable(write_enable),
		.write_addr(write_addr),
		.write_data(write_data),
		.read_addr_A(read_addr_A),
		.read_addr_B(read_addr_B),
		.read_addr_C(read_addr_C),
		.read_data_A(read_data_A),	
		.read_data_B(read_data_B),	
		.read_data_C(read_data_C)		
	);
	
	integer i;
	integer num_correct; // 값이 맞을 경우 증가
	integer num_wrong; // 값이 틀릴 경우 증가
	
	always #100 clk = ~clk; // clock cycle은 200마다 상승 
	
	initial begin
		clk = 1'b1; 
		nRESET = 1'b1; // 초기 클럭과 리셋 신호 셋팅
		write_enable = 1'b1; // 레지스터에 임의의 값을 쓰기 위하여 쓰기 신호 셋팅
		
		num_correct = 0;
		num_wrong = 0; // 값이 맞는지 체크할 변수
		
		for (i = 0; i < 8; i = i + 1) begin
			#200
			write_addr = i; // i가 0~7의 주소
			write_data = 1 << (i * 2); // 저장되는 값
		end
		// 먼저 주소에 대한 값을 읽기 전에 8개의 레지스터 파일에 임의의 값을 저장한다.
		// 저장되는 값은 0번부터 1, 4, 16, 64, 256, 1024, 4096, 16384의 값이 저장된다.
		
		#200
		
		for (i = 0; i < 8; i = i + 1 ) begin
			read_addr_A = i; 
			read_addr_B = i;
			read_addr_C = i; // A, B, C의 주소를 0~7로 같은 주소로 준다.
			#200
			
			// A, B, C의 주소가 같으므로 각 주소에 저장된 값은 똑같다.
			// 따라서 A, B, C 각 주소의 값이 모두 같으면 num_correct 값을 증가시킨다. 
			if ((read_data_A == read_data_B) && (read_data_B == read_data_C) && (read_data_A == read_data_C))
				num_correct = num_correct + 1;
			else
				num_wrong = num_wrong + 1;
				
			$display($time, ": A: %d, B: %d, C: %d", read_data_A, read_data_B, read_data_C);
			// A, B, C 값 체크
		end
		
		#200
		$display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
		$finish;
		// 레지스터에 저장된값이 정상인지 확인
	end
endmodule 