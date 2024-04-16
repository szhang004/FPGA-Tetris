`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:00 12/14/2017 
// Design Name: 
// Module Name:    vga_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Date: 04/04/2020
// Author: Yue (Julien) Niu
// Description: Port from NEXYS3 to NEXYS4
//////////////////////////////////////////////////////////////////////////////////
module vga_top(
	input ClkPort,
	input BtnL, BtnU, BtnD, BtnR, BtnC,	

	//VGA signal
	output hSync, vSync,
	output [3:0] vgaR, vgaG, vgaB,
	
	// //SSG signal 
	// output An0, An1, An2, An3, An4, An5, An6, An7,
	// output Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp,
	
	output MemOE, MemWR, RamCS, QuadSpiFlashCS
	);
	
	// CLOCKING 

	wire		Reset;
	wire		board_clk, game_clk;
	reg [26:0]	DIV_CLK;

	BUFGP BUFGP1 (board_clk, ClkPort);

	always @(posedge board_clk, posedge Reset) 	
    begin							
        if (Reset)
		DIV_CLK <= 0;
        else
		DIV_CLK <= DIV_CLK + 1'b1;
    end

	assign game_clk = DIV_CLK[20];


	// disable mamory ports
	assign {MemOE, MemWR, RamCS, QuadSpiFlashCS} = 4'b1111;

	wire bright;
	wire[9:0] hc, vc;
	wire[15:0] score;
	// wire [6:0] ssdOut;
	// wire [3:0] anode;
	wire [11:0] rgb;

	wire Start_Ack;
	wire BtnR_pulse, BtnL_pulse, BtnD_pulse, BtnU_pulse;
	wire bottom_flag, top_flag, gen_flag; 
	assign Reset = BtnC;
	assign Start_Ack = BtnU;

	wire x1,y1,x2,y2,x3,y3,x4,y4;
	reg [9:0][11:0] arr;

	display_controller dc(.clk(ClkPort), .hSync(hSync), .vSync(vSync), .bright(bright), .hCount(hc), .vCount(vc));
	vga_bitchange vbc(.Clk(ClkPort), .hCount(hc), .vCount(vc), .arr(arr), .rgb(rgb));
	// counter cnt(.clk(ClkPort), .displayNumber(score), .anode(anode), .ssdOut(ssdOut));
	
	// assign Dp = 1;
	// assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg} = ssdOut[6 : 0];
    // assign {An7, An6, An5, An4, An3, An2, An1, An0} = {4'b1111, anode};

	
	assign vgaR = rgb[11 : 8];
	assign vgaG = rgb[7  : 4];
	assign vgaB = rgb[3  : 0];

	ee354_debouncer #(.N_dc(28)) button_U 
        (.CLK(sys_clk), .RESET(Reset), .PB(BtnU), .DPB( ), 
		.SCEN(BtnU_pulse), .MCEN( ), .CCEN( ));

	ee354_debouncer #(.N_dc(28)) button_D 
        (.CLK(sys_clk), .RESET(Reset), .PB(BtnD), .DPB( ), 
		.SCEN(BtnD_pulse), .MCEN( ), .CCEN( ));
	
	ee354_debouncer #(.N_dc(28)) button_L 
        (.CLK(sys_clk), .RESET(Reset), .PB(BtnL), .DPB( ), 
		.SCEN(BtnL_pulse), .MCEN( ), .CCEN( ));

	ee354_debouncer #(.N_dc(28)) button_R
        (.CLK(sys_clk), .RESET(Reset), .PB(BtnR), .DPB( ), 
		.SCEN(BtnR_pulse), .MCEN( ), .CCEN( ));

	game_array game_space(
		.Clk(game_clk), 
		.Ack(Start_Ack), 
		.Start(Start_Ack), 
		.Reset(Reset), 
		.bottom_flag(bottom_flag), 
		.top_flag(top_flag), 
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.x3(x3),
		.y3(y3),
		.x4(x4),
		.y4(y4),
		.gen_flag(gen_flag), 
		.arr(arr),  
		.score(score)
	);

	block_gen block(
		.Clk(game_clk), 
		.Ack(Start_Ack), 
		.Reset(Reset), 
		.gen_flag(gen_flag), 
		.SCEN_U(BtnU_pulse),
		.SCEN_D(BtnD_pulse), 
		.SCEN_L(BtnL_pulse), 
		.SCEN_R(BtnR_pulse),
		.arr(arr), 
		.bottom_flag(bottom_flag), 
		.top_flag(top_flag), 
		.x1(x1),
		.y1(y1),
		.x2(x2),
		.y2(y2),
		.x3(x3),
		.y3(y3),
		.x4(x4),
		.y4(y4));


endmodule
