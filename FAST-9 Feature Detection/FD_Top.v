module FD_Top (clock, nReset, isCorner, refAddr, refPixel, adjPixel, thres);
	input clock;
	input nReset;
	output isCorner; // Corner 확인
	output [14:0] refAddr; // 기준점 주소
	output [7:0] refPixel; // 기준점 데이터
	output [127:0] adjPixel; // 인접한 16개의 점 데이터
	output [7:0] thres; // 임계값
	
	wire readen; // 읽기 신호
	wire [4:0] adjNumber; // 1~16개의 인접한 점
	wire [4:0] regAddr; // 레지스터 주소
	wire [14:0] sramAddr; // SRAM 주소
	wire [7:0] sramData; // SRAM Output 데이터
	
	// Controller, 기준점과 인접한 16개의 주소를 얻어, 레지스터에 저장하는 과정을 제어
	FD_Controller controller(
		.clock(clock),
		.nReset(nReset),
		.refAddr(refAddr), 
		.adjNumber(adjNumber),
		.regAddr(regAddr),
		.readen(readen)
	);
	
	// 기준점으로 부터 인접한 16개의 점을 계산
	FD_AddrCal addrCal(
		.refAddr(refAddr),
		.adjNumber(adjNumber),
		.sramAddr(sramAddr)
	);

	// 이미지 데이터가 저장된 SRAM
	SRAM sram(
		.clock(clock),
		.address(sramAddr),
		.data(8'bx),
		.wren(1'b0),
		.q(sramData)
	);

	// 기준점과 인접한 16개의 점을 저장할 레지스터 파일
	FD_Reg fd_reg(
		.clock(clock),
		.nReset(nReset),
		.readen(readen),
		.regAddr(regAddr),
		.sramData(sramData),
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres)
	);
	
	// 레지스터에 저장된 기준점과 인접한 16개의 점의 데이터를 이용하여 코너 확인
	FD_Datapath datapath(
		.refPixel(refPixel),
		.adjPixel(adjPixel),
		.thres(thres),
		.isCorner(isCorner)
	);
endmodule 