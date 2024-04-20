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
	input gen,
	input move,
	input clear, 
	input [3:0] x1,
    input [3:0] y1,
    input [3:0] x2,
    input [3:0] y2,
    input [3:0] x3,
    input [3:0] y3,
    input [3:0] x4,
    input [3:0] y4,
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
	parameter BLUE = 12'b0000_0000_1111;
	parameter GREEN = 12'b0000_1111_0000;

	wire square00, square01, square02, square03, square04, square05, square06, square07, square08, square09;
	wire square10, square11, square12, square13, square14, square15, square16, square17, square18, square19;
	wire square20, square21, square22, square23, square24, square25, square26, square27, square28, square29;
	wire square30, square31, square32, square33, square34, square35, square36, square37, square38, square39;
	wire square40, square41, square42, square43, square44, square45, square46, square47, square48, square49;
	wire square50, square51, square52, square53, square54, square55, square56, square57, square58, square59;
	wire square60, square61, square62, square63, square64, square65, square66, square67, square68, square69;
	wire square70, square71, square72, square73, square74, square75, squared76, square77, square78, square79;
	wire square80, square81, square82, square83, square84, square85, square86, square87, square88, square89;
	wire square90, square91, square92, square93, square94, square95, square96, square97, square98, square99;
	wire square100, square101, square102, squared103, square104, square105, square106, square107, square108, square109;
	wire square110, square111, square112, square113, square114, square115, square116, square117, square118, square119;
	reg [9:0] arr [11:0];

	wire rectangle;

	wire r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9;

	assign r0 = ((y1 == 4'd0) || (y2 == 4'd0) || (y3 == 4'd0) || (y4 == 4'd0));
	assign r1 = ((y1 == 4'd1) || (y2 == 4'd1) || (y3 == 4'd1) || (y4 == 4'd1));
	assign r2 = ((y1 == 4'd2) || (y2 == 4'd2) || (y3 == 4'd2) || (y4 == 4'd2));
	assign r3 = ((y1 == 4'd3) || (y2 == 4'd3) || (y3 == 4'd3) || (y4 == 4'd3));
	assign r4 = ((y1 == 4'd4) || (y2 == 4'd4) || (y3 == 4'd4) || (y4 == 4'd4));
	assign r5 = ((y1 == 4'd5) || (y2 == 4'd5) || (y3 == 4'd5) || (y4 == 4'd5));
	assign r6 = ((y1 == 4'd6) || (y2 == 4'd6) || (y3 == 4'd6) || (y4 == 4'd6));
	assign r7 = ((y1 == 4'd7) || (y2 == 4'd7) || (y3 == 4'd7) || (y4 == 4'd7));
	assign r8 = ((y1 == 4'd8) || (y2 == 4'd8) || (y3 == 4'd8) || (y4 == 4'd8));
	assign r9 = ((y1 == 4'd9) || (y2 == 4'd9) || (y3 == 4'd9) || (y4 == 4'd9));
	assign r10 = ((y1 == 4'd10) || (y2 == 4'd10) || (y3 == 4'd10) || (y4 == 4'd10));
	assign r11 = ((y1 == 4'd11) || (y2 == 4'd11) || (y3 == 4'd11) || (y4 == 4'd11));
	assign c0 = ((x1 == 4'd0) || (x2 == 4'd0) || (x3 == 4'd0) || (x4 == 4'd0));
	assign c1 = ((x1 == 4'd1) || (x2 == 4'd1) || (x3 == 4'd1) || (x4 == 4'd1));
	assign c2 = ((x1 == 4'd2) || (x2 == 4'd2) || (x3 == 4'd2) || (x4 == 4'd2));
	assign c3 = ((x1 == 4'd3) || (x2 == 4'd3) || (x3 == 4'd3) || (x4 == 4'd3));
	assign c4 = ((x1 == 4'd4) || (x2 == 4'd4) || (x3 == 4'd4) || (x4 == 4'd4));
	assign c5 = ((x1 == 4'd5) || (x2 == 4'd5) || (x3 == 4'd5) || (x4 == 4'd5));
	assign c6 = ((x1 == 4'd6) || (x2 == 4'd6) || (x3 == 4'd6) || (x4 == 4'd6));
	assign c7 = ((x1 == 4'd7) || (x2 == 4'd7) || (x3 == 4'd7) || (x4 == 4'd7));
	assign c8 = ((x1 == 4'd8) || (x2 == 4'd8) || (x3 == 4'd8) || (x4 == 4'd8));
	assign c9 = ((x1 == 4'd9) || (x2 == 4'd9) || (x3 == 4'd9) || (x4 == 4'd9));
	
	always@ (*) 
	begin
		if (~bright)
			rgb = BLACK; // force black if not bright
		else
		begin
			if (square00 && (arr0[9] || (r0 && c0)))
				rgb = LIGHT_GREY;
			else if (square10 && (arr1[9] || (r1 && c0)))
				rgb = LIGHT_GREY;
			else if (square20 && (arr2[9] || (r2 && c0)))
				rgb = LIGHT_GREY;
			else if (square30 && (arr3[9] || (r3 && c0)))
				rgb = LIGHT_GREY;
			else if (square40 && (arr4[9] || (r4 && c0)))
				rgb = LIGHT_GREY;
			else if (square50 && (arr5[9] || (r5 && c0)))
				rgb = LIGHT_GREY;
			else if (square60 && (arr6[9] || (r6 && c0)))
				rgb = LIGHT_GREY;
			else if (square70 && (arr7[9] || (r7 && c0)))
				rgb = LIGHT_GREY;
			else if (square80 && (arr8[9] || (r8 && c0)))
				rgb = LIGHT_GREY;
			else if (square90 && (arr9[9] || (r9 && c0)))
				rgb = LIGHT_GREY;
			else if (square100 && (arr10[9] || (r10 && c0)))
				rgb = LIGHT_GREY;
			else if (square110 && (arr11[9] || (r11 && c0)))
				rgb = LIGHT_GREY;
			else if (square01)
				rgb = LIGHT_GREY;
			else if (square11 && (arr1[8] || (r1 && c1)))
				rgb = LIGHT_GREY;
			else if (square21 && (arr2[8] || (r2 && c1)))
				rgb = LIGHT_GREY;
			else if (square31 && (arr3[8] || (r3 && c1)))
				rgb = LIGHT_GREY;
			else if (square41 && (arr4[8] || (r4 && c1)))
				rgb = LIGHT_GREY;
			else if (square51 && (arr5[8] || (r5 && c1)))
				rgb = LIGHT_GREY;
			else if (square61 && (arr6[8] || (r6 && c1)))
				rgb = LIGHT_GREY;
			else if (square71 && (arr7[8] || (r7 && c1)))
				rgb = LIGHT_GREY;
			else if (square81 && (arr8[8] || (r8 && c1)))
				rgb = LIGHT_GREY;
			else if (square91 && (arr9[8] || (r9 && c1)))
				rgb = LIGHT_GREY;
			else if (square101 && (arr10[8] || (r10 && c1)))
				rgb = LIGHT_GREY;
			else if (square111 && (arr11[8] || (r11 && c1)))
				rgb = LIGHT_GREY;
			else if (square02 && (arr0[7] || (r0 && c2)))
				rgb = LIGHT_GREY;
			else if (square12 && (arr1[7] || (r1 && c2)))
				rgb = LIGHT_GREY;
			else if (square22 && (arr2[7] || (r2 && c2)))
				rgb = LIGHT_GREY;
			else if (square32 && (arr3[7] || (r3 && c2)))
				rgb = LIGHT_GREY;
			else if (square42 && (arr4[7] || (r4 && c2)))
				rgb = LIGHT_GREY;
			else if (square52 && (arr5[7] || (r5 && c2)))
				rgb = LIGHT_GREY;
			else if (square62 && (arr6[7] || (r6 && c2)))
				rgb = LIGHT_GREY;
			else if (square72 && (arr7[7] || (r7 && c2)))
				rgb = LIGHT_GREY;
			else if (square82 && (arr8[7] || (r8 && c2)))
				rgb = LIGHT_GREY;
			else if (square92 && (arr9[7] || (r9 && c2)))
				rgb = LIGHT_GREY;
			else if (square102 && (arr10[7] || (r10 && c2)))
				rgb = LIGHT_GREY;
			else if (square112 && (arr11[7] || (r11 && c2)))
				rgb = LIGHT_GREY;
			else if (square03 && (arr0[6] || (r0 && c3)))
				rgb = LIGHT_GREY;
			else if (square13 && (arr1[6] || (r1 && c3)))
				rgb = LIGHT_GREY;
			else if (square23 && (arr2[6] || (r2 && c3)))
				rgb = LIGHT_GREY;
			else if (square33 && (arr3[6] || (r3 && c3)))
				rgb = LIGHT_GREY;
			else if (square43 && (arr4[6] || (r4 && c3)))
				rgb = LIGHT_GREY;
			else if (square53 && (arr5[6] || (r5 && c3)))
				rgb = LIGHT_GREY;
			else if (square63 && (arr6[6] || (r6 && c3)))
				rgb = LIGHT_GREY;
			else if (square73 && (arr7[6] || (r7 && c3)))
				rgb = LIGHT_GREY;
			else if (square83 && (arr8[6] || (r8 && c3)))
				rgb = LIGHT_GREY;
			else if (square93 && (arr9[6] || (r9 && c3)))
				rgb = LIGHT_GREY;
			else if (squared103 && (arr10[6] || (r10 && c3)))
				rgb = LIGHT_GREY;
			else if (square113 && (arr11[6] || (r11 && c3)))
				rgb = LIGHT_GREY;
			else if (square04 && (arr0[5] || (r0 && c4)))
				rgb = LIGHT_GREY;
			else if (square14 && (arr1[5] || (r1 && c4)))
				rgb = LIGHT_GREY;
			else if (square24 && (arr2[5] || (r2 && c4)))
				rgb = LIGHT_GREY;
			else if (square34 && (arr3[5] || (r3 && c4)))
				rgb = LIGHT_GREY;
			else if (square44 && (arr4[5] || (r4 && c4)))
				rgb = LIGHT_GREY;
			else if (square54 && (arr5[5] || (r5 && c4)))
				rgb = LIGHT_GREY;
			else if (square64 && (arr6[5] || (r6 && c4)))
				rgb = LIGHT_GREY;
			else if (square74 && (arr7[5] || (r7 && c4)))
				rgb = LIGHT_GREY;
			else if (square84 && (arr8[5] || (r8 && c4)))
				rgb = LIGHT_GREY;
			else if (square94 && (arr9[5] || (r9 && c4)))
				rgb = LIGHT_GREY;
			else if (square104 && (arr10[5] || (r10 && c4)))
				rgb = LIGHT_GREY;
			else if (square114 && (arr11[5] || (r11 && c4)))
				rgb = LIGHT_GREY;
			else if (square05 && (arr0[4] || (r0 && c5)))
				rgb = LIGHT_GREY;
			else if (square15 && (arr1[4] || (r1 && c5)))
				rgb = LIGHT_GREY;
			else if (square25 && (arr2[4] || (r2 && c5)))
				rgb = LIGHT_GREY;
			else if (square35 && (arr3[4] || (r3 && c5)))
				rgb = LIGHT_GREY;
			else if (square45 && (arr4[4] || (r4 && c5)))
				rgb = LIGHT_GREY;
			else if (square55 && (arr5[4] || (r5 && c5)))
				rgb = LIGHT_GREY;
			else if (square65 && (arr6[4] || (r6 && c5)))
				rgb = LIGHT_GREY;
			else if (square75 && (arr7[4] || (r7 && c5)))
				rgb = LIGHT_GREY;
			else if (square85 && (arr8[4] || (r8 && c5)))
				rgb = LIGHT_GREY;
			else if (square95 && (arr9[4] || (r9 && c5)))
				rgb = LIGHT_GREY;
			else if (square105 && (arr10[4] || (r10 && c5)))
				rgb = LIGHT_GREY;
			else if (square115 && (arr11[4] || (r11 && c5)))
				rgb = LIGHT_GREY;
			else if (square06 && (arr0[3] || (r0 && c6)))
				rgb = LIGHT_GREY;
			else if (square16 && (arr1[3] || (r1 && c6)))
				rgb = LIGHT_GREY;
			else if (square26 && (arr2[3] || (r2 && c6)))
				rgb = LIGHT_GREY;
			else if (square36 && (arr3[3] || (r3 && c6)))
				rgb = LIGHT_GREY;
			else if (square46 && (arr4[3] || (r4 && c6)))
				rgb = LIGHT_GREY;
			else if (square56 && (arr5[3] || (r5 && c6)))
				rgb = LIGHT_GREY;
			else if (square66 && (arr6[3] || (r6 && c6)))
				rgb = LIGHT_GREY;
			else if (squared76 && (arr7[3] || (r7 && c6)))
				rgb = LIGHT_GREY;
			else if (square86 && (arr8[3] || (r8 && c6)))
				rgb = LIGHT_GREY;
			else if (square96 && (arr9[3] || (r9 && c6)))
				rgb = LIGHT_GREY;
			else if (square106 && (arr10[3] || (r10 && c6)))
				rgb = LIGHT_GREY;
			else if (square116 && (arr11[3] || (r11 && c6)))
				rgb = LIGHT_GREY;
			else if (square07 && (arr0[2] || (r0 && c7)))
				rgb = LIGHT_GREY;
			else if (square17 && (arr1[2] || (r1 && c7)))
				rgb = LIGHT_GREY;
			else if (square27 && (arr2[2] || (r2 && c7)))
				rgb = LIGHT_GREY;
			else if (square37 && (arr3[2] || (r3 && c7)))
				rgb = LIGHT_GREY;
			else if (square47 && (arr4[2] || (r4 && c7)))
				rgb = LIGHT_GREY;
			else if (square57 && (arr5[2] || (r5 && c7)))
				rgb = LIGHT_GREY;
			else if (square67 && (arr6[2] || (r6 && c7)))
				rgb = LIGHT_GREY;
			else if (square77 && (arr7[2] || (r7 && c7)))
				rgb = LIGHT_GREY;
			else if (square87 && (arr8[2] || (r8 && c7)))
				rgb = LIGHT_GREY;
			else if (square97 && (arr9[2] || (r9 && c7)))
				rgb = LIGHT_GREY;
			else if (square107 && (arr10[2] || (r10 && c7)))
				rgb = LIGHT_GREY;
			else if (square117 && (arr11[2] || (r11 && c7)))
				rgb = LIGHT_GREY;
			else if (square08 && (arr0[1] || (r0 && c8)))
				rgb = LIGHT_GREY;
			else if (square18 && (arr1[1] || (r1 && c8)))
				rgb = LIGHT_GREY;
			else if (square28 && (arr2[1] || (r2 && c8)))
				rgb = LIGHT_GREY;
			else if (square38 && (arr3[1] || (r3 && c8)))
				rgb = LIGHT_GREY;
			else if (square48 && (arr4[1] || (r4 && c8)))
				rgb = LIGHT_GREY;
			else if (square58 && (arr5[1] || (r5 && c8)))
				rgb = LIGHT_GREY;
			else if (square68 && (arr6[1] || (r6 && c8)))
				rgb = LIGHT_GREY;
			else if (square78 && (arr7[1] || (r7 && c8)))
				rgb = LIGHT_GREY;
			else if (square88 && (arr8[1] || (r8 && c8)))
				rgb = LIGHT_GREY;
			else if (square98 && (arr9[1] || (r9 && c8)))
				rgb = LIGHT_GREY;
			else if (square108 && (arr10[1] || (r10 && c8)))
				rgb = LIGHT_GREY;
			else if (square118 && (arr11[1] || (r11 && c8)))
				rgb = LIGHT_GREY;
			else if (square09 && (arr0[0] || (r0 && c9)))
				rgb = LIGHT_GREY;
			else if (square19 && (arr1[0] || (r1 && c9)))
				rgb = LIGHT_GREY;
			else if (square29 && (arr2[0] || (r2 && c9)))
				rgb = LIGHT_GREY;
			else if (square39 && (arr3[0] || (r3 && c9)))
				rgb = LIGHT_GREY;
			else if (square49 && (arr4[0] || (r4 && c9)))
				rgb = LIGHT_GREY;
			else if (square59 && (arr5[0] || (r5 && c9)))
				rgb = LIGHT_GREY;
			else if (square69 && (arr6[0] || (r6 && c9)))
				rgb = LIGHT_GREY;
			else if (square79 && (arr7[0] || (r7 && c9)))
				rgb = LIGHT_GREY;
			else if (square89 && (arr8[0] || (r8 && c9)))
				rgb = LIGHT_GREY;
			else if (square99 && (arr9[0] || (r9 && c9)))
				rgb = LIGHT_GREY;
			else if (square109 && (arr10[0] || (r10 && c9)))
				rgb = LIGHT_GREY;
			else if (square119 && (arr11[0] || (r11 && c9)))
				rgb = LIGHT_GREY;
			else if (rectangle)
				rgb = GREY; // game board
			else 
				// if (gen)
					rgb = BLACK; // background color
				// if (move)
				// 	rgb = BLUE;
				// if (clear)
				// 	rgb = GREEN;
		end
	end

	assign rectangle = ((hCount >= 10'd299) && (hCount <= 10'd569)) && ((vCount >= 10'd75) && (vCount <= 10'd401)) ? 1 : 0;

	assign square00 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square10 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square20 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square30 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square40 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square50 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square60 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square70 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square80 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square90 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square100 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square110 = ((hCount >= 10'd300) && (hCount <= 10'd325)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square01 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square11 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square21 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square31 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square41 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square51 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square61 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square71 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square81 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square91 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square101 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square111 = ((hCount >= 10'd327) && (hCount <= 10'd352)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square02 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square12 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square22 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square32 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square42 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square52 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square62 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square72 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square82 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square92 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square102 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square112 = ((hCount >= 10'd354) && (hCount <= 10'd379)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square03 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square13 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square23 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square33 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square43 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square53 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square63 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square73 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square83 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square93 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign squared103 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square113 = ((hCount >= 10'd381) && (hCount <= 10'd406)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square04 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square14 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square24 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square34 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square44 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square54 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square64 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square74 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square84 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square94 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square104 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square114 = ((hCount >= 10'd408) && (hCount <= 10'd433)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square05 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square15 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square25 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square35 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square45 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square55 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square65 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square75 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square85 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square95 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square105 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square115 = ((hCount >= 10'd435) && (hCount <= 10'd460)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square06 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square16 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square26 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square36 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square46 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square56 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square66 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign squared76 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square86 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square96 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square106 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square116 = ((hCount >= 10'd462) && (hCount <= 10'd487)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square07  = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square17 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square27 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square37 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square47 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square57 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square67 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square77 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square87 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square97 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square107 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square117 = ((hCount >= 10'd489) && (hCount <= 10'd512)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square08 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square18 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square28 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square38 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square48 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square58 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square68 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square78 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square88 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square98 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square108 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square118 = ((hCount >= 10'd514) && (hCount <= 10'd1039)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

	assign square09 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square19 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square29 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square39 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square49 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square59 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square69 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square79 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square89 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square99 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square109 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square119 = ((hCount >= 10'd541) && (hCount <= 10'd566)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

endmodule
