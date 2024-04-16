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
	input [9:0][11:0] arr,
	input [9:0] hCount, vCount,
	output reg [11:0] rgb);
	
	parameter BLACK = 12'b0000_0000_0000;
	parameter GREY = 12'b0011_0011_0011;
	parameter LIGHT_GREY = 12'b1010_1010_1010;

	wire [9:0][11:0] squares;
	wire rectangle;
	
	
	always@ (*) // paint a white box on a red background
	begin
		if (squares[0][0]  && arr[0][0])
			rgb = LIGHT_GREY;
		else if (squares[0][1]  && arr[0][1])
			rgb = LIGHT_GREY;
		else if (squares[0][2]  && arr[0][2])
			rgb = LIGHT_GREY;
		else if (squares[0][3]  && arr[0][3])
			rgb = LIGHT_GREY;
		else if (squares[0][4]  && arr[0][4])
			rgb = LIGHT_GREY;
		else if (squares[0][5]  && arr[0][5])
			rgb = LIGHT_GREY;
		else if (squares[0][6]  && arr[0][6])
			rgb = LIGHT_GREY;
		else if (squares[0][7]  && arr[0][7])
			rgb = LIGHT_GREY;
		else if (squares[0][8]  && arr[0][8])
			rgb = LIGHT_GREY;
		else if (squares[0][9]  && arr[0][9])
			rgb = LIGHT_GREY;
		else if (squares[0][10]  && arr[0][10])
			rgb = LIGHT_GREY;
		else if (squares[0][11]  && arr[0][11])
			rgb = LIGHT_GREY;
		else if (squares[1][0]  && arr[1][0])
			rgb = LIGHT_GREY;
		else if (squares[1][1]  && arr[1][1])
			rgb = LIGHT_GREY;
		else if (squares[1][2]  && arr[1][2])
			rgb = LIGHT_GREY;
		else if (squares[1][3]  && arr[1][3])
			rgb = LIGHT_GREY;
		else if (squares[1][4]  && arr[1][4])
			rgb = LIGHT_GREY;
		else if (squares[1][5]  && arr[1][5])
			rgb = LIGHT_GREY;
		else if (squares[1][6]  && arr[1][6])
			rgb = LIGHT_GREY;
		else if (squares[1][7]  && arr[1][7])
			rgb = LIGHT_GREY;
		else if (squares[1][8]  && arr[1][8])
			rgb = LIGHT_GREY;
		else if (squares[1][9]  && arr[1][9])
			rgb = LIGHT_GREY;
		else if (squares[1][10]  && arr[1][10])
			rgb = LIGHT_GREY;
		else if (squares[1][11]  && arr[1][11])
			rgb = LIGHT_GREY;
		else if (squares[2][0]  && arr[2][0])
			rgb = LIGHT_GREY;
		else if (squares[2][1]  && arr[2][1])
			rgb = LIGHT_GREY;
		else if (squares[2][2]  && arr[2][2])
			rgb = LIGHT_GREY;
		else if (squares[2][3]  && arr[2][3])
			rgb = LIGHT_GREY;
		else if (squares[2][4]  && arr[2][4])
			rgb = LIGHT_GREY;
		else if (squares[2][5]  && arr[2][5])
			rgb = LIGHT_GREY;
		else if (squares[2][6]  && arr[2][6])
			rgb = LIGHT_GREY;
		else if (squares[2][7]  && arr[2][7])
			rgb = LIGHT_GREY;
		else if (squares[2][8]  && arr[2][8])
			rgb = LIGHT_GREY;
		else if (squares[2][9]  && arr[2][9])
			rgb = LIGHT_GREY;
		else if (squares[2][10]  && arr[2][10])
			rgb = LIGHT_GREY;
		else if (squares[2][11]  && arr[2][11])
			rgb = LIGHT_GREY;
		else if (squares[3][0]  && arr[3][0])
			rgb = LIGHT_GREY;
		else if (squares[3][1]  && arr[3][1])
			rgb = LIGHT_GREY;
		else if (squares[3][2]  && arr[3][2])
			rgb = LIGHT_GREY;
		else if (squares[3][3]  && arr[3][3])
			rgb = LIGHT_GREY;
		else if (squares[3][4]  && arr[3][4])
			rgb = LIGHT_GREY;
		else if (squares[3][5]  && arr[3][5])
			rgb = LIGHT_GREY;
		else if (squares[3][6]  && arr[3][6])
			rgb = LIGHT_GREY;
		else if (squares[3][7]  && arr[3][7])
			rgb = LIGHT_GREY;
		else if (squares[3][8]  && arr[3][8])
			rgb = LIGHT_GREY;
		else if (squares[3][9]  && arr[3][9])
			rgb = LIGHT_GREY;
		else if (squares[3][10]  && arr[3][10])
			rgb = LIGHT_GREY;
		else if (squares[3][11]  && arr[3][11])
			rgb = LIGHT_GREY;
		else if (squares[4][0]  && arr[4][0])
			rgb = LIGHT_GREY;
		else if (squares[4][1]  && arr[4][1])
			rgb = LIGHT_GREY;
		else if (squares[4][2]  && arr[4][2])
			rgb = LIGHT_GREY;
		else if (squares[4][3]  && arr[4][3])
			rgb = LIGHT_GREY;
		else if (squares[4][4]  && arr[4][4])
			rgb = LIGHT_GREY;
		else if (squares[4][5]  && arr[4][5])
			rgb = LIGHT_GREY;
		else if (squares[4][6]  && arr[4][6])
			rgb = LIGHT_GREY;
		else if (squares[4][7]  && arr[4][7])
			rgb = LIGHT_GREY;
		else if (squares[4][8]  && arr[4][8])
			rgb = LIGHT_GREY;
		else if (squares[4][9]  && arr[4][9])
			rgb = LIGHT_GREY;
		else if (squares[4][10]  && arr[4][10])
			rgb = LIGHT_GREY;
		else if (squares[4][11]  && arr[4][11])
			rgb = LIGHT_GREY;
		else if (squares[5][0]  && arr[5][0])
			rgb = LIGHT_GREY;
		else if (squares[5][1]  && arr[5][1])
			rgb = LIGHT_GREY;
		else if (squares[5][2]  && arr[5][2])
			rgb = LIGHT_GREY;
		else if (squares[5][3]  && arr[5][3])
			rgb = LIGHT_GREY;
		else if (squares[5][4]  && arr[5][4])
			rgb = LIGHT_GREY;
		else if (squares[5][5]  && arr[5][5])
			rgb = LIGHT_GREY;
		else if (squares[5][6]  && arr[5][6])
			rgb = LIGHT_GREY;
		else if (squares[5][7]  && arr[5][7])
			rgb = LIGHT_GREY;
		else if (squares[5][8]  && arr[5][8])
			rgb = LIGHT_GREY;
		else if (squares[5][9]  && arr[5][9])
			rgb = LIGHT_GREY;
		else if (squares[5][10]  && arr[5][10])
			rgb = LIGHT_GREY;
		else if (squares[5][11]  && arr[5][11])
			rgb = LIGHT_GREY;
		else if (squares[6][0]  && arr[6][0])
			rgb = LIGHT_GREY;
		else if (squares[6][1]  && arr[6][1])
			rgb = LIGHT_GREY;
		else if (squares[6][2]  && arr[6][2])
			rgb = LIGHT_GREY;
		else if (squares[6][3]  && arr[6][3])
			rgb = LIGHT_GREY;
		else if (squares[6][4]  && arr[6][4])
			rgb = LIGHT_GREY;
		else if (squares[6][5]  && arr[6][5])
			rgb = LIGHT_GREY;
		else if (squares[6][6]  && arr[6][6])
			rgb = LIGHT_GREY;
		else if (squares[6][7]  && arr[6][7])
			rgb = LIGHT_GREY;
		else if (squares[6][8]  && arr[6][8])
			rgb = LIGHT_GREY;
		else if (squares[6][9]  && arr[6][9])
			rgb = LIGHT_GREY;
		else if (squares[6][10]  && arr[6][10])
			rgb = LIGHT_GREY;
		else if (squares[6][11]  && arr[6][11])
			rgb = LIGHT_GREY;
		else if (squares[7][0]  && arr[7][0])
			rgb = LIGHT_GREY;
		else if (squares[7][1]  && arr[7][1])
			rgb = LIGHT_GREY;
		else if (squares[7][2]  && arr[7][2])
			rgb = LIGHT_GREY;
		else if (squares[7][3]  && arr[7][3])
			rgb = LIGHT_GREY;
		else if (squares[7][4]  && arr[7][4])
			rgb = LIGHT_GREY;
		else if (squares[7][5]  && arr[7][5])
			rgb = LIGHT_GREY;
		else if (squares[7][6]  && arr[7][6])
			rgb = LIGHT_GREY;
		else if (squares[7][7]  && arr[7][7])
			rgb = LIGHT_GREY;
		else if (squares[7][8]  && arr[7][8])
			rgb = LIGHT_GREY;
		else if (squares[7][9]  && arr[7][9])
			rgb = LIGHT_GREY;
		else if (squares[7][10]  && arr[7][10])
			rgb = LIGHT_GREY;
		else if (squares[7][11]  && arr[7][11])
			rgb = LIGHT_GREY;
		else if (rectangle)
			rgb = GREY; // game board
		else
			rgb = BLACK; // background color
	end

	assign rectangle = ((hCount >= 10'd99) && (hCount <= 10'd369)) && ((vCount >= 10'd77) && (vCount <= 10'd401)) ? 1 : 0;

	genvar i, j;
	generate
		for(i = 0; i < 10; i = i + 1)
		begin
			for (j = 0; i < 12; j = j + 1)
			begin 
				assign squares[i][j] = ((hCount >= 10'd100 + 10'd25 * i) && (hCount <= 10'd125 + 10'd25 * i)) && ((vCount >= 10'd78 + 10'd25 * j) && (vCount <= 10'd103 + 10'd25 * j)) ? 1 : 0;	
			end
		end
	endgenerate

endmodule
