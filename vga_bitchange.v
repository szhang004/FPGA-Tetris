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

	wire [9:0] square0;
	wire [9:0] square1;
	wire [9:0] square2;
	wire [9:0] square3;
	wire [9:0] square4;
	wire [9:0] square5;
	wire [9:0] square6;
	wire [9:0] square7;
	wire [9:0] square8;
	wire [9:0] square9;
	wire [9:0] square10;
	wire [9:0] square11;
	reg [9:0] arr [11:0];

	wire rectangle;
	
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
	
	always@ (*) // paint a white box on a red background
	begin
		if (square0[0]  && arr[0][0])
			rgb = LIGHT_GREY;
		else if (ssquare1[0]  && arr[0][1])
			rgb = LIGHT_GREY;
		else if (square2[0]  && arr[0][2])
			rgb = LIGHT_GREY;
		else if (square3[0]  && arr[0][3])
			rgb = LIGHT_GREY;
		else if (square4[0]  && arr[0][4])
			rgb = LIGHT_GREY;
		else if (square5[0]  && arr[0][5])
			rgb = LIGHT_GREY;
		else if (square6[0]  && arr[0][6])
			rgb = LIGHT_GREY;
		else if (square7[0]  && arr[0][7])
			rgb = LIGHT_GREY;
		else if (square8[0]  && arr[0][8])
			rgb = LIGHT_GREY;
		else if (square9[0]  && arr[0][9])
			rgb = LIGHT_GREY;
		else if (square10[0]  && arr[0][10])
			rgb = LIGHT_GREY;
		else if (square11[0]  && arr[0][11])
			rgb = LIGHT_GREY;
		else if (square0[1]  && arr[1][0])
			rgb = LIGHT_GREY;
		else if (square1[1]  && arr[1][1])
			rgb = LIGHT_GREY;
		else if (square2[1]  && arr[1][2])
			rgb = LIGHT_GREY;
		else if (square3[1]  && arr[1][3])
			rgb = LIGHT_GREY;
		else if (square4[1]  && arr[1][4])
			rgb = LIGHT_GREY;
		else if (square5[1]  && arr[1][5])
			rgb = LIGHT_GREY;
		else if (square6[1]  && arr[1][6])
			rgb = LIGHT_GREY;
		else if (square7[1]  && arr[1][7])
			rgb = LIGHT_GREY;
		else if (square8[1]  && arr[1][8])
			rgb = LIGHT_GREY;
		else if (square9[1]  && arr[1][9])
			rgb = LIGHT_GREY;
		else if (square10[1]  && arr[1][10])
			rgb = LIGHT_GREY;
		else if (square11[1]  && arr[1][11])
			rgb = LIGHT_GREY;
		else if (square0[2]  && arr[2][0])
			rgb = LIGHT_GREY;
		else if (square1[2]  && arr[2][1])
			rgb = LIGHT_GREY;
		else if (square2[2]  && arr[2][2])
			rgb = LIGHT_GREY;
		else if (square3[2]  && arr[2][3])
			rgb = LIGHT_GREY;
		else if (square4[2]  && arr[2][4])
			rgb = LIGHT_GREY;
		else if (square5[2]  && arr[2][5])
			rgb = LIGHT_GREY;
		else if (square6[2]  && arr[2][6])
			rgb = LIGHT_GREY;
		else if (square7[2]  && arr[2][7])
			rgb = LIGHT_GREY;
		else if (square8[2]  && arr[2][8])
			rgb = LIGHT_GREY;
		else if (square9[2]  && arr[2][9])
			rgb = LIGHT_GREY;
		else if (square10[2]  && arr[2][10])
			rgb = LIGHT_GREY;
		else if (square11[2]  && arr[2][11])
			rgb = LIGHT_GREY;
		else if (square0[3]  && arr[3][0])
			rgb = LIGHT_GREY;
		else if (square1[3]  && arr[3][1])
			rgb = LIGHT_GREY;
		else if (square2[3]  && arr[3][2])
			rgb = LIGHT_GREY;
		else if (square3[3]  && arr[3][3])
			rgb = LIGHT_GREY;
		else if (square4[3]  && arr[3][4])
			rgb = LIGHT_GREY;
		else if (square5[3]  && arr[3][5])
			rgb = LIGHT_GREY;
		else if (square6[3]  && arr[3][6])
			rgb = LIGHT_GREY;
		else if (square7[3]  && arr[3][7])
			rgb = LIGHT_GREY;
		else if (square8[3]  && arr[3][8])
			rgb = LIGHT_GREY;
		else if (square9[3]  && arr[3][9])
			rgb = LIGHT_GREY;
		else if (square10[3]  && arr[3][10])
			rgb = LIGHT_GREY;
		else if (square11[3]  && arr[3][11])
			rgb = LIGHT_GREY;
		else if (square0[4]  && arr[4][0])
			rgb = LIGHT_GREY;
		else if (square1[4]  && arr[4][1])
			rgb = LIGHT_GREY;
		else if (square2[4]  && arr[4][2])
			rgb = LIGHT_GREY;
		else if (square3[4]  && arr[4][3])
			rgb = LIGHT_GREY;
		else if (square4[4]  && arr[4][4])
			rgb = LIGHT_GREY;
		else if (square5[4]  && arr[4][5])
			rgb = LIGHT_GREY;
		else if (square6[4]  && arr[4][6])
			rgb = LIGHT_GREY;
		else if (square7[4]  && arr[4][7])
			rgb = LIGHT_GREY;
		else if (square8[4]  && arr[4][8])
			rgb = LIGHT_GREY;
		else if (square9[4]  && arr[4][9])
			rgb = LIGHT_GREY;
		else if (square10[4]  && arr[4][10])
			rgb = LIGHT_GREY;
		else if (square11[4]  && arr[4][11])
			rgb = LIGHT_GREY;
		else if (square0[5]  && arr[5][0])
			rgb = LIGHT_GREY;
		else if (square1[5]  && arr[5][1])
			rgb = LIGHT_GREY;
		else if (square2[5]  && arr[5][2])
			rgb = LIGHT_GREY;
		else if (square3[5]  && arr[5][3])
			rgb = LIGHT_GREY;
		else if (square4[5]  && arr[5][4])
			rgb = LIGHT_GREY;
		else if (square5[5]  && arr[5][5])
			rgb = LIGHT_GREY;
		else if (square6[5]  && arr[5][6])
			rgb = LIGHT_GREY;
		else if (square7[5]  && arr[5][7])
			rgb = LIGHT_GREY;
		else if (square8[5]  && arr[5][8])
			rgb = LIGHT_GREY;
		else if (square9[5]  && arr[5][9])
			rgb = LIGHT_GREY;
		else if (square10[5]  && arr[5][10])
			rgb = LIGHT_GREY;
		else if (square11[5]  && arr[5][11])
			rgb = LIGHT_GREY;
		else if (square0[6]  && arr[6][0])
			rgb = LIGHT_GREY;
		else if (square1[6]  && arr[6][1])
			rgb = LIGHT_GREY;
		else if (square2[6]  && arr[6][2])
			rgb = LIGHT_GREY;
		else if (square3[6]  && arr[6][3])
			rgb = LIGHT_GREY;
		else if (square4[6]  && arr[6][4])
			rgb = LIGHT_GREY;
		else if (square5[6]  && arr[6][5])
			rgb = LIGHT_GREY;
		else if (square6[6]  && arr[6][6])
			rgb = LIGHT_GREY;
		else if (square7[6]  && arr[6][7])
			rgb = LIGHT_GREY;
		else if (square8[6]  && arr[6][8])
			rgb = LIGHT_GREY;
		else if (square9[6]  && arr[6][9])
			rgb = LIGHT_GREY;
		else if (square10[6]  && arr[6][10])
			rgb = LIGHT_GREY;
		else if (square11[6]  && arr[6][11])
			rgb = LIGHT_GREY;
		else if (square0[7]  && arr[7][0])
			rgb = LIGHT_GREY;
		else if (square1[7]  && arr[7][1])
			rgb = LIGHT_GREY;
		else if (square2[7]  && arr[7][2])
			rgb = LIGHT_GREY;
		else if (square3[7]  && arr[7][3])
			rgb = LIGHT_GREY;
		else if (square4[7]  && arr[7][4])
			rgb = LIGHT_GREY;
		else if (square5[7]  && arr[7][5])
			rgb = LIGHT_GREY;
		else if (square6[7]  && arr[7][6])
			rgb = LIGHT_GREY;
		else if (square7[7]  && arr[7][7])
			rgb = LIGHT_GREY;
		else if (square8[7]  && arr[7][8])
			rgb = LIGHT_GREY;
		else if (square9[7]  && arr[7][9])
			rgb = LIGHT_GREY;
		else if (square10[7]  && arr[7][10])
			rgb = LIGHT_GREY;
		else if (square11[7]  && arr[7][11])
			rgb = LIGHT_GREY;
		else if (square0[8]  && arr[8][0])
			rgb = LIGHT_GREY;
		else if (square1[8]  && arr[8][1])
			rgb = LIGHT_GREY;
		else if (square2[8]  && arr[8][2])
			rgb = LIGHT_GREY;
		else if (square3[8]  && arr[8][3])
			rgb = LIGHT_GREY;
		else if (square4[8]  && arr[8][4])
			rgb = LIGHT_GREY;
		else if (square5[8]  && arr[8][5])
			rgb = LIGHT_GREY;
		else if (square6[8]  && arr[8][6])
			rgb = LIGHT_GREY;
		else if (square7[8]  && arr[8][7])
			rgb = LIGHT_GREY;
		else if (square8[8]  && arr[8][8])
			rgb = LIGHT_GREY;
		else if (square9[8]  && arr[8][9])
			rgb = LIGHT_GREY;
		else if (square10[8]  && arr[8][10])
			rgb = LIGHT_GREY;
		else if (square11[8]  && arr[8][11])
			rgb = LIGHT_GREY;
		else if (square0[9]  && arr[9][0])
			rgb = LIGHT_GREY;
		else if (square1[9]  && arr[9][1])
			rgb = LIGHT_GREY;
		else if (square2[9]  && arr[9][2])
			rgb = LIGHT_GREY;
		else if (square3[9]  && arr[9][3])
			rgb = LIGHT_GREY;
		else if (square4[9]  && arr[9][4])
			rgb = LIGHT_GREY;
		else if (square5[9]  && arr[9][5])
			rgb = LIGHT_GREY;
		else if (square6[9]  && arr[9][6])
			rgb = LIGHT_GREY;
		else if (square7[9]  && arr[9][7])
			rgb = LIGHT_GREY;
		else if (square8[9]  && arr[9][8])
			rgb = LIGHT_GREY;
		else if (square9[9]  && arr[9][9])
			rgb = LIGHT_GREY;
		else if (square10[9]  && arr[9][10])
			rgb = LIGHT_GREY;
		else if (square11[9]  && arr[9][11])
			rgb = LIGHT_GREY;
		else if (rectangle)
			rgb = GREY; // game board
		else
			rgb = BLACK; // background color
	end

	assign rectangle = ((hCount >= 10'd99) && (hCount <= 10'd369)) && ((vCount >= 10'd77) && (vCount <= 10'd401)) ? 1 : 0;

	genvar i;
	generate
		for(i = 0; i < 10; i = i + 1)
		begin
			assign square0[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 0) && (vCount <= 10'd103 + 10'd27 * 0)) ? 1 : 0;
			assign square1[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 1) && (vCount <= 10'd103 + 10'd27 * 1)) ? 1 : 0;
			assign square2[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 2) && (vCount <= 10'd103 + 10'd27 * 2)) ? 1 : 0;
			assign square3[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 3) && (vCount <= 10'd103 + 10'd27 * 3)) ? 1 : 0;
			assign square4[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 4) && (vCount <= 10'd103 + 10'd27 * 4)) ? 1 : 0;
			assign square5[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 5) && (vCount <= 10'd103 + 10'd27 * 5)) ? 1 : 0;
			assign square6[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 6) && (vCount <= 10'd103 + 10'd27 * 6)) ? 1 : 0;
			assign square7[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 7) && (vCount <= 10'd103 + 10'd27 * 7)) ? 1 : 0;
			assign square8[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 8) && (vCount <= 10'd103 + 10'd27 * 8)) ? 1 : 0;
			assign square9[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 9) && (vCount <= 10'd103 + 10'd27 * 9)) ? 1 : 0;
			assign square10[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 10) && (vCount <= 10'd103 + 10'd27 * 10)) ? 1 : 0;	
			assign square11[i] = ((hCount >= 10'd100 + 10'd27 * i) && (hCount <= 10'd127 + 10'd27 * i)) && ((vCount >= 10'd78 + 10'd27 * 11) && (vCount <= 10'd103 + 10'd27 * 11)) ? 1 : 0;
		end
	endgenerate

endmodule
