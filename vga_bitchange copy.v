`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  12:15:38 12/14/2017 
// Design Name: 
// Module Name:  vgaBitChange 
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

// if cell & arr, color = light grey
// else if within rectangle = grey
// else background = black

module vga_bitchange(
	input Clk,
	input bright,
	input r0, 
	input r1,
	input r2,
	input r3,
	input r4,
	input r5,
	input r6,
	input r7,
	input r8,
	input r9,
	input r10,
	input r11,
	input c0, 
	input c1, 
	input c2, 
	input c3, 
	input c4, 
	input c5, 
	input c6, 
	input c7, 
	input c8,
	input c9,  
	input [9:0] arr0,
    input [9:0] arr1,
    input [9:0] arr2,
    input [9:0] arr3,
    input [9:0] arr4,
    input [9:0] arr5,
    input [9:0] arr6,
    input [9:0] arr7, 
    input [9:0] arr8,
    input [9:0] arr9,
    input [9:0] arr10,
    input [9:0] arr11,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb);
	
	parameter BLACK = 12'b0000_0000_0000;
	parameter GREY = 12'b0011_0011_0011;
	parameter LIGHT_GREY = 12'b1010_1010_1010;
	parameter RED = 12'b1111_0000_0000;

	wire square00, square01, square02, square03, square04, square05, square06, square07, square08, square09;
	wire square10, square11, square12, square13, square14, square15, square16, square17, square18, square19;
	wire square20, square21, square22, square23, square24, square25, square26, square27, square28, square29;
	wire square30, square31, square32, square33, square34, square35, square36, square37, square38, square39;
	wire square40, square41, square42, square43, square44, square45, square46, square47, square48, square49;
	wire square50, square51, square52, square53, square54, square55, square56, square57, square58, square59;
	wire square60, square61, square62, square63, square64, square65, square66, square67, square68, square69;
	wire square70, square71, square72, square73, square74, square75, square76, square77, square78, square79;
	wire square80, square81, square82, square83, square84, square85, square86, square87, square88, square89;
	wire square90, square91, square92, square93, square94, square95, square96, square97, square98, square99;
	wire square100, square101, square102, square103, square104, square105, square106, square107, square108, square109;
	wire square110, square111, square112, square113, square114, square115, square116, square117, square118, square119;
	reg [9:0] arr [11:0];

	wire rectangle;
	wire rect;
	
	integer k;
	always @(*)
	begin
		for(k = 0; k < 10; k = k + 1)
		begin
			arr[0][k] <= arr0[k];
			arr[1][k] <= arr1[k];
			arr[2][k] <= arr2[k];
			arr[3][k] <= arr3[k];
			arr[4][k] <= arr4[k];
			arr[5][k] <= arr5[k];
			arr[6][k] <= arr6[k];
			arr[7][k] <= arr7[k];
			arr[8][k] <= arr8[k];
			arr[9][k] <= arr9[k];
			arr[10][k] <= arr10[k];
			arr[11][k] <= arr11[k];
		end
	

	end
	
	always@ (*) 
	begin
		if (~bright)
			rgb = BLACK; // force black if not bright
		else
		begin
			if (rect)
				rgb = 12'b0000_1111_1111;
			else if (square00 && (arr[0][0] || (r0 && c0)))
				rgb = LIGHT_GREY;
			else if (square10 && (arr[0][1] || (r1 && c0)))
				rgb = LIGHT_GREY;
			else if (square20 && (arr[0][2] || (r2 && c0)))
				rgb = LIGHT_GREY;
			else if (square30 && (arr[0][3] || (r3 && c0)))
				rgb = LIGHT_GREY;
			else if (square40 && (arr[0][4] || (r4 && c0)))
				rgb = LIGHT_GREY;
			else if (square50 && (arr[0][5] || (r5 && c0)))
				rgb = LIGHT_GREY;
			else if (square60 && (arr[0][6] || (r6 && c0)))
				rgb = LIGHT_GREY;
			else if (square70 && (arr[0][7] || (r7 && c0)))
				rgb = LIGHT_GREY;
			else if (square80 && (arr[0][8] || (r8 && c0)))
				rgb = LIGHT_GREY;
			else if (square90 && (arr[0][9] || (r9 && c0)))
				rgb = LIGHT_GREY;
			else if (square100 && (arr[0][10] || (r10 && c0)))
				rgb = LIGHT_GREY;
			else if (square110 && (arr[0][11] || (r11 && c0)))
				rgb = LIGHT_GREY;
			else if (square01  && (arr[1][0] || (r0 && c1)))
				rgb = LIGHT_GREY;
			else if (square11 && (arr[1][1] || (r1 && c1)))
				rgb = LIGHT_GREY;
			else if (square21 && (arr[1][2] || (r2 && c1)))
				rgb = LIGHT_GREY;
			else if (square31 && (arr[1][3] || (r3 && c1)))
				rgb = LIGHT_GREY;
			else if (square41 && (arr[1][4] || (r4 && c1)))
				rgb = LIGHT_GREY;
			else if (square51 && (arr[1][5] || (r5 && c1)))
				rgb = LIGHT_GREY;
			else if (square61 && (arr[1][6] || (r6 && c1)))
				rgb = LIGHT_GREY;
			else if (square71 && (arr[1][7] || (r7 && c1)))
				rgb = LIGHT_GREY;
			else if (square81 && (arr[1][8] || (r8 && c1)))
				rgb = LIGHT_GREY;
			else if (square91 && (arr[1][9] || (r9 && c1)))
				rgb = LIGHT_GREY;
			else if (square101 && (arr[1][10] || (r10 && c1)))
				rgb = LIGHT_GREY;
			else if (square111 && (arr[1][11] || (r11 && c1)))
				rgb = LIGHT_GREY;
			else if (square02 && (arr[2][0] || (r0 && c2)))
				rgb = LIGHT_GREY;
			else if (square12 && (arr[2][1] || (r1 && c2)))
				rgb = LIGHT_GREY;
			else if (square22 && (arr[2][2] || (r2 && c2)))
				rgb = LIGHT_GREY;
			else if (square32 && (arr[2][3] || (r3 && c2)))
				rgb = LIGHT_GREY;
			else if (square42 && (arr[2][4] || (r4 && c2)))
				rgb = LIGHT_GREY;
			else if (square52 && (arr[2][5] || (r5 && c2)))
				rgb = LIGHT_GREY;
			else if (square62 && (arr[2][6] || (r6 && c2)))
				rgb = LIGHT_GREY;
			else if (square72 && (arr[2][7] || (r7 && c2)))
				rgb = LIGHT_GREY;
			else if (square82 && (arr[2][8] || (r8 && c2)))
				rgb = LIGHT_GREY;
			else if (square92 && (arr[2][9] || (r9 && c2)))
				rgb = LIGHT_GREY;
			else if (square102 && (arr[2][10] || (r10 && c2)))
				rgb = LIGHT_GREY;
			else if (square112 && (arr[2][11] || (r11 && c2)))
				rgb = LIGHT_GREY;
			else if (square03 && (arr[3][0] || (r0 && c3)))
				rgb = LIGHT_GREY;
			else if (square13 && (arr[3][1] || (r1 && c3)))
				rgb = LIGHT_GREY;
			else if (square23 && (arr[3][2] || (r2 && c3)))
				rgb = LIGHT_GREY;
			else if (square33 && (arr[3][3] || (r3 && c3)))
				rgb = LIGHT_GREY;
			else if (square43 && (arr[3][4] || (r4 && c3)))
				rgb = LIGHT_GREY;
			else if (square53 && (arr[3][5] || (r5 && c3)))
				rgb = LIGHT_GREY;
			else if (square63 && (arr[3][6] || (r6 && c3)))
				rgb = LIGHT_GREY;
			else if (square73 && (arr[3][7] || (r7 && c3)))
				rgb = LIGHT_GREY;
			else if (square83 && (arr[3][8] || (r8 && c3)))
				rgb = LIGHT_GREY;
			else if (square93 && (arr[3][9] || (r9 && c3)))
				rgb = LIGHT_GREY;
			else if (square103 && (arr[3][10] || (r10 && c3)))
				rgb = LIGHT_GREY;
			else if (square113 && (arr[3][11] || (r11 && c3)))
				rgb = LIGHT_GREY;
			else if (square04 && (arr[4][0] || (r0 && c4)))
				rgb = LIGHT_GREY;
			else if (square14 && (arr[4][1] || (r1 && c4)))
				rgb = LIGHT_GREY;
			else if (square24 && (arr[4][2] || (r2 && c4)))
				rgb = LIGHT_GREY;
			else if (square34 && (arr[4][3] || (r3 && c4)))
				rgb = LIGHT_GREY;
			else if (square44 && (arr[4][4] || (r4 && c4)))
				rgb = LIGHT_GREY;
			else if (square54 && (arr[4][5] || (r5 && c4)))
				rgb = LIGHT_GREY;
			else if (square64 && (arr[4][6] || (r6 && c4)))
				rgb = LIGHT_GREY;
			else if (square74 && (arr[4][7] || (r7 && c4)))
				rgb = LIGHT_GREY;
			else if (square84 && (arr[4][8] || (r8 && c4)))
				rgb = LIGHT_GREY;
			else if (square94 && (arr[4][9] || (r9 && c4)))
				rgb = LIGHT_GREY;
			else if (square104 && (arr[4][10] || (r10 && c4)))
				rgb = LIGHT_GREY;
			else if (square114 && (arr[4][11] || (r11 && c4)))
				rgb = LIGHT_GREY;
			else if (square05 && (arr[5][0] || (r0 && c5)))
				rgb = LIGHT_GREY;
			else if (square15 && (arr[5][1] || (r1 && c5)))
				rgb = LIGHT_GREY;
			else if (square25 && (arr[5][2] || (r2 && c5)))
				rgb = LIGHT_GREY;
			else if (square35 && (arr[5][3] || (r3 && c5)))
				rgb = LIGHT_GREY;
			else if (square45 && (arr[5][4] || (r4 && c5)))
				rgb = LIGHT_GREY;
			else if (square55 && (arr[5][5] || (r5 && c5)))
				rgb = LIGHT_GREY;
			else if (square65 && (arr[5][6] || (r6 && c5)))
				rgb = LIGHT_GREY;
			else if (square75 && (arr[5][7] || (r7 && c5)))
				rgb = LIGHT_GREY;
			else if (square85 && (arr[5][8] || (r8 && c5)))
				rgb = LIGHT_GREY;
			else if (square95 && (arr[5][9] || (r9 && c5)))
				rgb = LIGHT_GREY;
			else if (square105 && (arr[5][10] || (r10 && c5)))
				rgb = LIGHT_GREY;
			else if (square115 && (arr[5][11] || (r11 && c5)))
				rgb = LIGHT_GREY;
			else if (square06 && (arr[6][0] || (r0 && c6)))
				rgb = LIGHT_GREY;
			else if (square16 && (arr[6][1] || (r1 && c6)))
				rgb = LIGHT_GREY;
			else if (square26 && (arr[6][2] || (r2 && c6)))
				rgb = LIGHT_GREY;
			else if (square36 && (arr[6][3] || (r3 && c6)))
				rgb = LIGHT_GREY;
			else if (square46 && (arr[6][4] || (r4 && c6)))
				rgb = LIGHT_GREY;
			else if (square56 && (arr[6][5] || (r5 && c6)))
				rgb = LIGHT_GREY;
			else if (square66 && (arr[6][6] || (r6 && c6)))
				rgb = LIGHT_GREY;
			else if (square76 && (arr[6][7] || (r7 && c6)))
				rgb = LIGHT_GREY;
			else if (square86 && (arr[6][8] || (r8 && c6)))
				rgb = LIGHT_GREY;
			else if (square96 && (arr[6][9] || (r9 && c6)))
				rgb = LIGHT_GREY;
			else if (square106 && (arr[6][10] || (r10 && c6)))
				rgb = LIGHT_GREY;
			else if (square116 && (arr[6][11] || (r11 && c6)))
				rgb = LIGHT_GREY;
			else if (square07 && (arr[7][0] || (r0 && c7)))
				rgb = LIGHT_GREY;
			else if (square17 && (arr[7][1] || (r1 && c7)))
				rgb = LIGHT_GREY;
			else if (square27 && (arr[7][2] || (r2 && c7)))
				rgb = LIGHT_GREY;
			else if (square37 && (arr[7][3] || (r3 && c7)))
				rgb = LIGHT_GREY;
			else if (square47 && (arr[7][4] || (r4 && c7)))
				rgb = LIGHT_GREY;
			else if (square57 && (arr[7][5] || (r5 && c7)))
				rgb = LIGHT_GREY;
			else if (square67 && (arr[7][6] || (r6 && c7)))
				rgb = LIGHT_GREY;
			else if (square77 && (arr[7][7] || (r7 && c7)))
				rgb = LIGHT_GREY;
			else if (square87 && (arr[7][8] || (r8 && c7)))
				rgb = LIGHT_GREY;
			else if (square97 && (arr[7][9] || (r9 && c7)))
				rgb = LIGHT_GREY;
			else if (square107 && (arr[7][10] || (r10 && c7)))
				rgb = LIGHT_GREY;
			else if (square117 && (arr[7][11] || (r11 && c7)))
				rgb = LIGHT_GREY;
			else if (square08 && (arr[8][0] || (r0 && c8)))
				rgb = LIGHT_GREY;
			else if (square18 && (arr[8][1] || (r1 && c8)))
				rgb = LIGHT_GREY;
			else if (square28 && (arr[8][2] || (r2 && c8)))
				rgb = LIGHT_GREY;
			else if (square38 && (arr[8][3] || (r3 && c8)))
				rgb = LIGHT_GREY;
			else if (square48 && (arr[8][4] || (r4 && c8)))
				rgb = LIGHT_GREY;
			else if (square58 && (arr[8][5] || (r5 && c8)))
				rgb = LIGHT_GREY;
			else if (square68 && (arr[8][6] || (r6 && c8)))
				rgb = LIGHT_GREY;
			else if (square78 && (arr[8][7] || (r7 && c8)))
				rgb = LIGHT_GREY;
			else if (square88 && (arr[8][8] || (r8 && c8)))
				rgb = LIGHT_GREY;
			else if (square98 && (arr[8][9] || (r9 && c8)))
				rgb = LIGHT_GREY;
			else if (square108 && (arr[8][10] || (r10 && c8)))
				rgb = LIGHT_GREY;
			else if (square118 && (arr[8][11] || (r11 && c8)))
				rgb = LIGHT_GREY;
			else if (square09 && (arr[9][0] || (r0 && c9)))
				rgb = LIGHT_GREY;
			else if (square19 && (arr[9][1] || (r1 && c9)))
				rgb = LIGHT_GREY;
			else if (square29 && (arr[9][2] || (r2 && c9)))
				rgb = LIGHT_GREY;
			else if (square39 && (arr[9][3] || (r3 && c9)))
				rgb = LIGHT_GREY;
			else if (square49 && (arr[9][4] || (r4 && c9)))
				rgb = LIGHT_GREY;
			else if (square59 && (arr[9][5] || (r5 && c9)))
				rgb = LIGHT_GREY;
			else if (square69 && (arr[9][6] || (r6 && c9)))
				rgb = LIGHT_GREY;
			else if (square79 && (arr[9][7] || (r7 && c9)))
				rgb = LIGHT_GREY;
			else if (square89 && (arr[9][8] || (r8 && c9)))
				rgb = LIGHT_GREY;
			else if (square99 && (arr[9][9] || (r9 && c9)))
				rgb = LIGHT_GREY;
			else if (square109 && (arr[9][10] || (r10 && c9)))
				rgb = LIGHT_GREY;
			else if (square119 && (arr[9][11] || (r11 && c9)))
				rgb = LIGHT_GREY;
			else if (rectangle)
				rgb = GREY; // game board
			else 
				// if (started)
				rgb = RED; // background color
				// else
		end
	end

	assign rectangle = ((hCount >= 10'd99) && (hCount <= 10'd369)) && ((vCount >= 10'd77) && (vCount <= 10'd401)) ? 1 : 0;
	assign rect = ((hCount >= 10'd670) && vCount >= 10'd670);


	assign square00 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square10 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square20 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square30 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square40 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square50 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square60 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square70 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square80 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square90 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square100 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square110 = ((hCount >= 10'd100 + 10'd27 * 0) && (hCount <= 10'd127 + 10'd27 * 0)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square01 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square11 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square21 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square31 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square41 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square51 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square61 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square71 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square81 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square91 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square101 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square111 = ((hCount >= 10'd100 + 10'd27 * 1) && (hCount <= 10'd127 + 10'd27 * 1)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square02 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square12 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square22 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square32 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square42 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square52 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square62 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square72 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square82 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square92 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square102 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square112 = ((hCount >= 10'd100 + 10'd27 * 2) && (hCount <= 10'd127 + 10'd27 * 2)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square03 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square13 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square23 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square33 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square43 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square53 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square63 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square73 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square83 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square93 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square103 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square113 = ((hCount >= 10'd100 + 10'd27 * 3) && (hCount <= 10'd127 + 10'd27 * 3)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square04 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square14 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square24 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square34 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square44 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square54 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square64 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square74 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square84 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square94 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square104 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square114 = ((hCount >= 10'd100 + 10'd27 * 4) && (hCount <= 10'd127 + 10'd27 * 4)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square05 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square15 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square25 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square35 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square45 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square55 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square65 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square75 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square85 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square95 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square105 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square115 = ((hCount >= 10'd100 + 10'd27 * 5) && (hCount <= 10'd127 + 10'd27 * 5)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square06 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square16 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square26 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square36 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square46 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square56 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square66 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square76 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square86 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square96 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square106 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square116 = ((hCount >= 10'd100 + 10'd27 * 6) && (hCount <= 10'd127 + 10'd27 * 6)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square07  = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square17 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square27 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square37 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square47 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square57 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square67 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square77 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square87 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square97 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square107 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square117 = ((hCount >= 10'd100 + 10'd27 * 7) && (hCount <= 10'd127 + 10'd27 * 7)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square08 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square18 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square28 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square38 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square48 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square58 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square68 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square78 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square88 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square98 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square108 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square118 = ((hCount >= 10'd100 + 10'd27 * 8) && (hCount <= 10'd127 + 10'd27 * 8)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square09 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 0) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square19 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 1) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square29 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 2) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square39 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 3) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square49 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 4) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square59 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 5) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square69 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 6) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square79 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 7) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square89 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 8) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square99 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 9) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square109 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 10) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square119 = ((hCount >= 10'd100 + 10'd27 * 9) && (hCount <= 10'd127 + 10'd27 * 9)) && ((vCount >= 10'd323 - 10'd27 * 11) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

endmodule
