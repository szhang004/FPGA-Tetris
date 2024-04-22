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
	input lost,
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

	wire b00,b10,b20,b30,b40,b50,b60,b70,b80,b90,b100,b110;
	wire b01,b11,b21,b31,b41,b51,b61,b71,b81,b91,b101,b111;
	wire b02,b12,b22,b32,b42,b52,b62,b72,b82,b92,b102,b112;
	wire b03,b13,b23,b33,b43,b53,b63,b73,b83,b93,b103,b113;
	wire b04,b14,b24,b34,b44,b54,b64,b74,b84,b94,b104,b114;
	wire b05,b15,b25,b35,b45,b55,b65,b75,b85,b95,b105,b115;
	wire b06,b16,b26,b36,b46,b56,b66,b76,b86,b96,b106,b116;
	wire b07,b17,b27,b37,b47,b57,b67,b77,b87,b97,b107,b117;
	wire b08,b18,b28,b38,b48,b58,b68,b78,b88,b98,b108,b118;
	wire b09,b19,b29,b39,b49,b59,b69,b79,b89,b99,b109,b119;

	assign b00 = ((x1==0) && (y1==0)) || ((x2==0) && (y2==0)) ||((x3==0) && (y3==0)) || ((x4==0) && (y4==0));
	assign b10 = ((x1==0) && (y1==1)) || ((x2==0) && (y2==1)) ||((x3==0) && (y3==1)) || ((x4==0) && (y4==1));
	assign b20 = ((x1==0) && (y1==2)) || ((x2==0) && (y2==2)) ||((x3==0) && (y3==2)) || ((x4==0) && (y4==2));
	assign b30 = ((x1==0) && (y1==3)) || ((x2==0) && (y2==3)) ||((x3==0) && (y3==3)) || ((x4==0) && (y4==3));
	assign b40 = ((x1==0) && (y1==4)) || ((x2==0) && (y2==4)) ||((x3==0) && (y3==4)) || ((x4==0) && (y4==4));
	assign b50 = ((x1==0) && (y1==5)) || ((x2==0) && (y2==5)) ||((x3==0) && (y3==5)) || ((x4==0) && (y4==5));
	assign b60 = ((x1==0) && (y1==6)) || ((x2==0) && (y2==6)) ||((x3==0) && (y3==6)) || ((x4==0) && (y4==6));
	assign b70 = ((x1==0) && (y1==7)) || ((x2==0) && (y2==7)) ||((x3==0) && (y3==7)) || ((x4==0) && (y4==7));
	assign b80 = ((x1==0) && (y1==8)) || ((x2==0) && (y2==8)) ||((x3==0) && (y3==8)) || ((x4==0) && (y4==8));
	assign b90 = ((x1==0) && (y1==9)) || ((x2==0) && (y2==9)) ||((x3==0) && (y3==9)) || ((x4==0) && (y4==9));
	assign b100 = ((x1==0) && (y1==10)) || ((x2==0) && (y2==10)) ||((x3==0) && (y3==10)) || ((x4==0) && (y4==10));
	assign b110 = ((x1==0) && (y1==11)) || ((x2==0) && (y2==11)) ||((x3==0) && (y3==11)) || ((x4==0) && (y4==11));

	assign b01 = ((x1==1) && (y1==0)) || ((x2==1) && (y2==0)) ||((x3==1) && (y3==0)) || ((x4==1) && (y4==0));
	assign b11 = ((x1==1) && (y1==1)) || ((x2==1) && (y2==1)) ||((x3==1) && (y3==1)) || ((x4==1) && (y4==1));
	assign b21 = ((x1==1) && (y1==2)) || ((x2==1) && (y2==2)) ||((x3==1) && (y3==2)) || ((x4==1) && (y4==2));
	assign b31 = ((x1==1) && (y1==3)) || ((x2==1) && (y2==3)) ||((x3==1) && (y3==3)) || ((x4==1) && (y4==3));
	assign b41 = ((x1==1) && (y1==4)) || ((x2==1) && (y2==4)) ||((x3==1) && (y3==4)) || ((x4==1) && (y4==4));
	assign b51 = ((x1==1) && (y1==5)) || ((x2==1) && (y2==5)) ||((x3==1) && (y3==5)) || ((x4==1) && (y4==5));
	assign b61 = ((x1==1) && (y1==6)) || ((x2==1) && (y2==6)) ||((x3==1) && (y3==6)) || ((x4==1) && (y4==6));
	assign b71 = ((x1==1) && (y1==7)) || ((x2==1) && (y2==7)) ||((x3==1) && (y3==7)) || ((x4==1) && (y4==7));
	assign b81 = ((x1==1) && (y1==8)) || ((x2==1) && (y2==8)) ||((x3==1) && (y3==8)) || ((x4==1) && (y4==8));
	assign b91 = ((x1==1) && (y1==9)) || ((x2==1) && (y2==9)) ||((x3==1) && (y3==9)) || ((x4==1) && (y4==9));
	assign b101 = ((x1==1) && (y1==10)) || ((x2==1) && (y2==10)) ||((x3==1) && (y3==10)) || ((x4==1) && (y4==10));
	assign b111 = ((x1==1) && (y1==11)) || ((x2==1) && (y2==11)) ||((x3==1) && (y3==11)) || ((x4==1) && (y4==11));

	assign b02 = ((x1==2) && (y1==0)) || ((x2==2) && (y2==0)) ||((x3==2) && (y3==0)) || ((x4==2) && (y4==0));
	assign b12 = ((x1==2) && (y1==1)) || ((x2==2) && (y2==1)) ||((x3==2) && (y3==1)) || ((x4==2) && (y4==1));
	assign b22 = ((x1==2) && (y1==2)) || ((x2==2) && (y2==2)) ||((x3==2) && (y3==2)) || ((x4==2) && (y4==2));
	assign b32 = ((x1==2) && (y1==3)) || ((x2==2) && (y2==3)) ||((x3==2) && (y3==3)) || ((x4==2) && (y4==3));
	assign b42 = ((x1==2) && (y1==4)) || ((x2==2) && (y2==4)) ||((x3==2) && (y3==4)) || ((x4==2) && (y4==4));
	assign b52 = ((x1==2) && (y1==5)) || ((x2==2) && (y2==5)) ||((x3==2) && (y3==5)) || ((x4==2) && (y4==5));
	assign b62 = ((x1==2) && (y1==6)) || ((x2==2) && (y2==6)) ||((x3==2) && (y3==6)) || ((x4==2) && (y4==6));
	assign b72 = ((x1==2) && (y1==7)) || ((x2==2) && (y2==7)) ||((x3==2) && (y3==7)) || ((x4==2) && (y4==7));
	assign b82 = ((x1==2) && (y1==8)) || ((x2==2) && (y2==8)) ||((x3==2) && (y3==8)) || ((x4==2) && (y4==8));
	assign b92 = ((x1==2) && (y1==9)) || ((x2==2) && (y2==9)) ||((x3==2) && (y3==9)) || ((x4==2) && (y4==9));
	assign b102 = ((x1==2) && (y1==10)) || ((x2==2) && (y2==10)) ||((x3==2) && (y3==10)) || ((x4==2) && (y4==10));
	assign b112 = ((x1==2) && (y1==11)) || ((x2==2) && (y2==11)) ||((x3==2) && (y3==11)) || ((x4==2) && (y4==11));

	assign b03 = ((x1==3) && (y1==0)) || ((x2==3) && (y2==0)) ||((x3==3) && (y3==0)) || ((x4==3) && (y4==0));
	assign b13 = ((x1==3) && (y1==1)) || ((x2==3) && (y2==1)) ||((x3==3) && (y3==1)) || ((x4==3) && (y4==1));
	assign b23 = ((x1==3) && (y1==2)) || ((x2==3) && (y2==2)) ||((x3==3) && (y3==2)) || ((x4==3) && (y4==2));
	assign b33 = ((x1==3) && (y1==3)) || ((x2==3) && (y2==3)) ||((x3==3) && (y3==3)) || ((x4==3) && (y4==3));
	assign b43 = ((x1==3) && (y1==4)) || ((x2==3) && (y2==4)) ||((x3==3) && (y3==4)) || ((x4==3) && (y4==4));
	assign b53 = ((x1==3) && (y1==5)) || ((x2==3) && (y2==5)) ||((x3==3) && (y3==5)) || ((x4==3) && (y4==5));
	assign b63 = ((x1==3) && (y1==6)) || ((x2==3) && (y2==6)) ||((x3==3) && (y3==6)) || ((x4==3) && (y4==6));
	assign b73 = ((x1==3) && (y1==7)) || ((x2==3) && (y2==7)) ||((x3==3) && (y3==7)) || ((x4==3) && (y4==7));
	assign b83 = ((x1==3) && (y1==8)) || ((x2==3) && (y2==8)) ||((x3==3) && (y3==8)) || ((x4==3) && (y4==8));
	assign b93 = ((x1==3) && (y1==9)) || ((x2==3) && (y2==9)) ||((x3==3) && (y3==9)) || ((x4==3) && (y4==9));
	assign b103 = ((x1==3) && (y1==10)) || ((x2==3) && (y2==10)) ||((x3==3) && (y3==10)) || ((x4==3) && (y4==10));
	assign b113 = ((x1==3) && (y1==11)) || ((x2==3) && (y2==11)) ||((x3==3) && (y3==11)) || ((x4==3) && (y4==11));

	assign b04 = ((x1==4) && (y1==0)) || ((x2==4) && (y2==0)) ||((x3==4) && (y3==0)) || ((x4==4) && (y4==0));
	assign b14 = ((x1==4) && (y1==1)) || ((x2==4) && (y2==1)) ||((x3==4) && (y3==1)) || ((x4==4) && (y4==1));
	assign b24 = ((x1==4) && (y1==2)) || ((x2==4) && (y2==2)) ||((x3==4) && (y3==2)) || ((x4==4) && (y4==2));
	assign b34 = ((x1==4) && (y1==3)) || ((x2==4) && (y2==3)) ||((x3==4) && (y3==3)) || ((x4==4) && (y4==3));
	assign b44 = ((x1==4) && (y1==4)) || ((x2==4) && (y2==4)) ||((x3==4) && (y3==4)) || ((x4==4) && (y4==4));
	assign b54 = ((x1==4) && (y1==5)) || ((x2==4) && (y2==5)) ||((x3==4) && (y3==5)) || ((x4==4) && (y4==5));
	assign b64 = ((x1==4) && (y1==6)) || ((x2==4) && (y2==6)) ||((x3==4) && (y3==6)) || ((x4==4) && (y4==6));
	assign b74 = ((x1==4) && (y1==7)) || ((x2==4) && (y2==7)) ||((x3==4) && (y3==7)) || ((x4==4) && (y4==7));
	assign b84 = ((x1==4) && (y1==8)) || ((x2==4) && (y2==8)) ||((x3==4) && (y3==8)) || ((x4==4) && (y4==8));
	assign b94 = ((x1==4) && (y1==9)) || ((x2==4) && (y2==9)) ||((x3==4) && (y3==9)) || ((x4==4) && (y4==9));
	assign b104 = ((x1==4) && (y1==10)) || ((x2==4) && (y2==10)) ||((x3==4) && (y3==10)) || ((x4==4) && (y4==10));
	assign b114 = ((x1==4) && (y1==11)) || ((x2==4) && (y2==11)) ||((x3==4) && (y3==11)) || ((x4==4) && (y4==11));

	assign b05 = ((x1==5) && (y1==0)) || ((x2==5) && (y2==0)) ||((x3==5) && (y3==0)) || ((x4==5) && (y4==0));
	assign b15 = ((x1==5) && (y1==1)) || ((x2==5) && (y2==1)) ||((x3==5) && (y3==1)) || ((x4==5) && (y4==1));
	assign b25 = ((x1==5) && (y1==2)) || ((x2==5) && (y2==2)) ||((x3==5) && (y3==2)) || ((x4==5) && (y4==2));
	assign b35 = ((x1==5) && (y1==3)) || ((x2==5) && (y2==3)) ||((x3==5) && (y3==3)) || ((x4==5) && (y4==3));
	assign b45 = ((x1==5) && (y1==4)) || ((x2==5) && (y2==4)) ||((x3==5) && (y3==4)) || ((x4==5) && (y4==4));
	assign b55 = ((x1==5) && (y1==5)) || ((x2==5) && (y2==5)) ||((x3==5) && (y3==5)) || ((x4==5) && (y4==5));
	assign b65 = ((x1==5) && (y1==6)) || ((x2==5) && (y2==6)) ||((x3==5) && (y3==6)) || ((x4==5) && (y4==6));
	assign b75 = ((x1==5) && (y1==7)) || ((x2==5) && (y2==7)) ||((x3==5) && (y3==7)) || ((x4==5) && (y4==7));
	assign b85 = ((x1==5) && (y1==8)) || ((x2==5) && (y2==8)) ||((x3==5) && (y3==8)) || ((x4==5) && (y4==8));
	assign b95 = ((x1==5) && (y1==9)) || ((x2==5) && (y2==9)) ||((x3==5) && (y3==9)) || ((x4==5) && (y4==9));
	assign b105 = ((x1==5) && (y1==10)) || ((x2==5) && (y2==10)) ||((x3==5) && (y3==10)) || ((x4==5) && (y4==10));
	assign b115 = ((x1==5) && (y1==11)) || ((x2==5) && (y2==11)) ||((x3==5) && (y3==11)) || ((x4==5) && (y4==11));

	assign b06 = ((x1==6) && (y1==0)) || ((x2==6) && (y2==0)) ||((x3==6) && (y3==0)) || ((x4==6) && (y4==0));
	assign b16 = ((x1==6) && (y1==1)) || ((x2==6) && (y2==1)) ||((x3==6) && (y3==1)) || ((x4==6) && (y4==1));
	assign b26 = ((x1==6) && (y1==2)) || ((x2==6) && (y2==2)) ||((x3==6) && (y3==2)) || ((x4==6) && (y4==2));
	assign b36 = ((x1==6) && (y1==3)) || ((x2==6) && (y2==3)) ||((x3==6) && (y3==3)) || ((x4==6) && (y4==3));
	assign b46 = ((x1==6) && (y1==4)) || ((x2==6) && (y2==4)) ||((x3==6) && (y3==4)) || ((x4==6) && (y4==4));
	assign b56 = ((x1==6) && (y1==5)) || ((x2==6) && (y2==5)) ||((x3==6) && (y3==5)) || ((x4==6) && (y4==5));
	assign b66 = ((x1==6) && (y1==6)) || ((x2==6) && (y2==6)) ||((x3==6) && (y3==6)) || ((x4==6) && (y4==6));
	assign b76 = ((x1==6) && (y1==7)) || ((x2==6) && (y2==7)) ||((x3==6) && (y3==7)) || ((x4==6) && (y4==7));
	assign b86 = ((x1==6) && (y1==8)) || ((x2==6) && (y2==8)) ||((x3==6) && (y3==8)) || ((x4==6) && (y4==8));
	assign b96 = ((x1==6) && (y1==9)) || ((x2==6) && (y2==9)) ||((x3==6) && (y3==9)) || ((x4==6) && (y4==9));
	assign b106 = ((x1==6) && (y1==10)) || ((x2==6) && (y2==10)) ||((x3==6) && (y3==10)) || ((x4==6) && (y4==10));
	assign b116 = ((x1==6) && (y1==11)) || ((x2==6) && (y2==11)) ||((x3==6) && (y3==11)) || ((x4==6) && (y4==11));

	assign b07 = ((x1==7) && (y1==0)) || ((x2==7) && (y2==0)) ||((x3==7) && (y3==0)) || ((x4==7) && (y4==0));
	assign b17 = ((x1==7) && (y1==1)) || ((x2==7) && (y2==1)) ||((x3==7) && (y3==1)) || ((x4==7) && (y4==1));
	assign b27 = ((x1==7) && (y1==2)) || ((x2==7) && (y2==2)) ||((x3==7) && (y3==2)) || ((x4==7) && (y4==2));
	assign b37 = ((x1==7) && (y1==3)) || ((x2==7) && (y2==3)) ||((x3==7) && (y3==3)) || ((x4==7) && (y4==3));
	assign b47 = ((x1==7) && (y1==4)) || ((x2==7) && (y2==4)) ||((x3==7) && (y3==4)) || ((x4==7) && (y4==4));
	assign b57 = ((x1==7) && (y1==5)) || ((x2==7) && (y2==5)) ||((x3==7) && (y3==5)) || ((x4==7) && (y4==5));
	assign b67 = ((x1==7) && (y1==6)) || ((x2==7) && (y2==6)) ||((x3==7) && (y3==6)) || ((x4==7) && (y4==6));
	assign b77 = ((x1==7) && (y1==7)) || ((x2==7) && (y2==7)) ||((x3==7) && (y3==7)) || ((x4==7) && (y4==7));
	assign b87 = ((x1==7) && (y1==8)) || ((x2==7) && (y2==8)) ||((x3==7) && (y3==8)) || ((x4==7) && (y4==8));
	assign b97 = ((x1==7) && (y1==9)) || ((x2==7) && (y2==9)) ||((x3==7) && (y3==9)) || ((x4==7) && (y4==9));
	assign b107 = ((x1==7) && (y1==10)) || ((x2==7) && (y2==10)) ||((x3==7) && (y3==10)) || ((x4==7) && (y4==10));
	assign b117 = ((x1==7) && (y1==11)) || ((x2==7) && (y2==11)) ||((x3==7) && (y3==11)) || ((x4==7) && (y4==11));

	assign b08 = ((x1==8) && (y1==0)) || ((x2==8) && (y2==0)) ||((x3==8) && (y3==0)) || ((x4==8) && (y4==0));
	assign b18 = ((x1==8) && (y1==1)) || ((x2==8) && (y2==1)) ||((x3==8) && (y3==1)) || ((x4==8) && (y4==1));
	assign b28 = ((x1==8) && (y1==2)) || ((x2==8) && (y2==2)) ||((x3==8) && (y3==2)) || ((x4==8) && (y4==2));
	assign b38 = ((x1==8) && (y1==3)) || ((x2==8) && (y2==3)) ||((x3==8) && (y3==3)) || ((x4==8) && (y4==3));
	assign b48 = ((x1==8) && (y1==4)) || ((x2==8) && (y2==4)) ||((x3==8) && (y3==4)) || ((x4==8) && (y4==4));
	assign b58 = ((x1==8) && (y1==5)) || ((x2==8) && (y2==5)) ||((x3==8) && (y3==5)) || ((x4==8) && (y4==5));
	assign b68 = ((x1==8) && (y1==6)) || ((x2==8) && (y2==6)) ||((x3==8) && (y3==6)) || ((x4==8) && (y4==6));
	assign b78 = ((x1==8) && (y1==7)) || ((x2==8) && (y2==7)) ||((x3==8) && (y3==7)) || ((x4==8) && (y4==7));
	assign b88 = ((x1==8) && (y1==8)) || ((x2==8) && (y2==8)) ||((x3==8) && (y3==8)) || ((x4==8) && (y4==8));
	assign b98 = ((x1==8) && (y1==9)) || ((x2==8) && (y2==9)) ||((x3==8) && (y3==9)) || ((x4==8) && (y4==9));
	assign b108 = ((x1==8) && (y1==10)) || ((x2==8) && (y2==10)) ||((x3==8) && (y3==10)) || ((x4==8) && (y4==10));
	assign b118 = ((x1==8) && (y1==11)) || ((x2==8) && (y2==11)) ||((x3==8) && (y3==11)) || ((x4==8) && (y4==11));

	assign b09 = ((x1==9) && (y1==0)) || ((x2==9) && (y2==0)) ||((x3==9) && (y3==0)) || ((x4==9) && (y4==0));
	assign b19 = ((x1==9) && (y1==1)) || ((x2==9) && (y2==1)) ||((x3==9) && (y3==1)) || ((x4==9) && (y4==1));
	assign b29 = ((x1==9) && (y1==2)) || ((x2==9) && (y2==2)) ||((x3==9) && (y3==2)) || ((x4==9) && (y4==2));
	assign b39 = ((x1==9) && (y1==3)) || ((x2==9) && (y2==3)) ||((x3==9) && (y3==3)) || ((x4==9) && (y4==3));
	assign b49 = ((x1==9) && (y1==4)) || ((x2==9) && (y2==4)) ||((x3==9) && (y3==4)) || ((x4==9) && (y4==4));
	assign b59 = ((x1==9) && (y1==5)) || ((x2==9) && (y2==5)) ||((x3==9) && (y3==5)) || ((x4==9) && (y4==5));
	assign b69 = ((x1==9) && (y1==6)) || ((x2==9) && (y2==6)) ||((x3==9) && (y3==6)) || ((x4==9) && (y4==6));
	assign b79 = ((x1==9) && (y1==7)) || ((x2==9) && (y2==7)) ||((x3==9) && (y3==7)) || ((x4==9) && (y4==7));
	assign b89 = ((x1==9) && (y1==8)) || ((x2==9) && (y2==8)) ||((x3==9) && (y3==8)) || ((x4==9) && (y4==8));
	assign b99 = ((x1==9) && (y1==9)) || ((x2==9) && (y2==9)) ||((x3==9) && (y3==9)) || ((x4==9) && (y4==9));
	assign b109 = ((x1==9) && (y1==10)) || ((x2==9) && (y2==10)) ||((x3==9) && (y3==10)) || ((x4==9) && (y4==10));
	assign b119 = ((x1==9) && (y1==11)) || ((x2==9) && (y2==11)) ||((x3==9) && (y3==11)) || ((x4==9) && (y4==11));
	

	always@ (*) 
	begin
		if (~bright)
			rgb = BLACK; // force black if not bright
		else
		begin
			if (square00 && (arr0[0] || b00) && (move || clear || lost))
				rgb = LIGHT_GREY;
			else if (square10 && (arr1[0] || b10))
				rgb = LIGHT_GREY;
			else if (square20 && (arr2[0] || b20))
				rgb = LIGHT_GREY;
			else if (square30 && (arr3[0] || b30))
				rgb = LIGHT_GREY;
			else if (square40 && (arr4[0] || b40))
				rgb = LIGHT_GREY;
			else if (square50 && (arr5[0] || b50))
				rgb = LIGHT_GREY;
			else if (square60 && (arr6[0] || b60))
				rgb = LIGHT_GREY;
			else if (square70 && (arr7[0] || b70))
				rgb = LIGHT_GREY;
			else if (square80 && (arr8[0] || b80))
				rgb = LIGHT_GREY;
			else if (square90 && (arr9[0] || b90))
				rgb = LIGHT_GREY;
			else if (square100 && (arr10[0] || b100))
				rgb = LIGHT_GREY;
			else if (square110 && (arr11[0] || b110))
				rgb = LIGHT_GREY;
			else if (square01 && (arr0[1] || b01))
				rgb = LIGHT_GREY;
			else if (square11 && (arr1[1] || b11))
				rgb = LIGHT_GREY;
			else if (square21 && (arr2[1] || b21))
				rgb = LIGHT_GREY;
			else if (square31 && (arr3[1] || b31))
				rgb = LIGHT_GREY;
			else if (square41 && (arr4[1] || b41))
				rgb = LIGHT_GREY;
			else if (square51 && (arr5[1] || b51))
				rgb = LIGHT_GREY;
			else if (square61 && (arr6[1] || b61))
				rgb = LIGHT_GREY;
			else if (square71 && (arr7[1] || b71))
				rgb = LIGHT_GREY;
			else if (square81 && (arr8[1] || b81))
				rgb = LIGHT_GREY;
			else if (square91 && (arr9[1] || b91))
				rgb = LIGHT_GREY;
			else if (square101 && (arr10[1] || b101))
				rgb = LIGHT_GREY;
			else if (square111 && (arr11[1] || b111))
				rgb = LIGHT_GREY;
			else if (square02 && (arr0[2] || b02))
				rgb = LIGHT_GREY;
			else if (square12 && (arr1[2] || b12))
				rgb = LIGHT_GREY;
			else if (square22 && (arr2[2] || b22))
				rgb = LIGHT_GREY;
			else if (square32 && (arr3[2] || b32))
				rgb = LIGHT_GREY;
			else if (square42 && (arr4[2] || b42))
				rgb = LIGHT_GREY;
			else if (square52 && (arr5[2] || b52))
				rgb = LIGHT_GREY;
			else if (square62 && (arr6[2] || b62))
				rgb = LIGHT_GREY;
			else if (square72 && (arr7[2] || b72))
				rgb = LIGHT_GREY;
			else if (square82 && (arr8[2] || b82))
				rgb = LIGHT_GREY;
			else if (square92 && (arr9[2] || b92))
				rgb = LIGHT_GREY;
			else if (square102 && (arr10[2] || b102))
				rgb = LIGHT_GREY;
			else if (square112 && (arr11[2] || b112))
				rgb = LIGHT_GREY;
			else if (square03 && (arr0[3] || b03))
				rgb = LIGHT_GREY;
			else if (square13 && (arr1[3] || b13))
				rgb = LIGHT_GREY;
			else if (square23 && (arr2[3] || b23))
				rgb = LIGHT_GREY;
			else if (square33 && (arr3[3] || b33))
				rgb = LIGHT_GREY;
			else if (square43 && (arr4[3] || b43))
				rgb = LIGHT_GREY;
			else if (square53 && (arr5[3] || b53))
				rgb = LIGHT_GREY;
			else if (square63 && (arr6[3] || b63))
				rgb = LIGHT_GREY;
			else if (square73 && (arr7[3] || b73))
				rgb = LIGHT_GREY;
			else if (square83 && (arr8[3] || b83))
				rgb = LIGHT_GREY;
			else if (square93 && (arr9[3] || b93))
				rgb = LIGHT_GREY;
			else if (squared103 && (arr10[3] || b103))
				rgb = LIGHT_GREY;
			else if (square113 && (arr11[3] || b113))
				rgb = LIGHT_GREY;
			else if (square04 && (arr0[4] || b04))
				rgb = LIGHT_GREY;
			else if (square14 && (arr1[4] || b14))
				rgb = LIGHT_GREY;
			else if (square24 && (arr2[4] || b24))
				rgb = LIGHT_GREY;
			else if (square34 && (arr3[4] || b34))
				rgb = LIGHT_GREY;
			else if (square44 && (arr4[4] || b44))
				rgb = LIGHT_GREY;
			else if (square54 && (arr5[4] || b54))
				rgb = LIGHT_GREY;
			else if (square64 && (arr6[4] || b64))
				rgb = LIGHT_GREY;
			else if (square74 && (arr7[4] || b74))
				rgb = LIGHT_GREY;
			else if (square84 && (arr8[4] || b84))
				rgb = LIGHT_GREY;
			else if (square94 && (arr9[4] || b94))
				rgb = LIGHT_GREY;
			else if (square104 && (arr10[4] || b104))
				rgb = LIGHT_GREY;
			else if (square114 && (arr11[4] || b114))
				rgb = LIGHT_GREY;
			else if (square05 && (arr0[5] || b05))
				rgb = LIGHT_GREY;
			else if (square15 && (arr1[5] || b15))
				rgb = LIGHT_GREY;
			else if (square25 && (arr2[5] || b25))
				rgb = LIGHT_GREY;
			else if (square35 && (arr3[5] || b35))
				rgb = LIGHT_GREY;
			else if (square45 && (arr4[5] || b45))
				rgb = LIGHT_GREY;
			else if (square55 && (arr5[5] || b55))
				rgb = LIGHT_GREY;
			else if (square65 && (arr6[5] || b65))
				rgb = LIGHT_GREY;
			else if (square75 && (arr7[5] || b75))
				rgb = LIGHT_GREY;
			else if (square85 && (arr8[5] || b85))
				rgb = LIGHT_GREY;
			else if (square95 && (arr9[5] || b95))
				rgb = LIGHT_GREY;
			else if (square105 && (arr10[5] || b105))
				rgb = LIGHT_GREY;
			else if (square115 && (arr11[5] || b115))
				rgb = LIGHT_GREY;
			else if (square06 && (arr0[6] || b06))
				rgb = LIGHT_GREY;
			else if (square16 && (arr1[6] || b16))
				rgb = LIGHT_GREY;
			else if (square26 && (arr2[6] || b26))
				rgb = LIGHT_GREY;
			else if (square36 && (arr3[6] || b36))
				rgb = LIGHT_GREY;
			else if (square46 && (arr4[6] || b46))
				rgb = LIGHT_GREY;
			else if (square56 && (arr5[6] || b56))
				rgb = LIGHT_GREY;
			else if (square66 && (arr6[6] || b66))
				rgb = LIGHT_GREY;
			else if (squared76 && (arr7[6] || b76))
				rgb = LIGHT_GREY;
			else if (square86 && (arr8[6] || b86))
				rgb = LIGHT_GREY;
			else if (square96 && (arr9[6] || b96))
				rgb = LIGHT_GREY;
			else if (square106 && (arr10[6] || b106))
				rgb = LIGHT_GREY;
			else if (square116 && (arr11[6] || b116))
				rgb = LIGHT_GREY;
			else if (square07 && (arr0[7] || b07))
				rgb = LIGHT_GREY;
			else if (square17 && (arr1[7] || b17))
				rgb = LIGHT_GREY;
			else if (square27 && (arr2[7] || b27))
				rgb = LIGHT_GREY;
			else if (square37 && (arr3[7] || b37))
				rgb = LIGHT_GREY;
			else if (square47 && (arr4[7] || b47))
				rgb = LIGHT_GREY;
			else if (square57 && (arr5[7] || b57))
				rgb = LIGHT_GREY;
			else if (square67 && (arr6[7] || b67))
				rgb = LIGHT_GREY;
			else if (square77 && (arr7[7] || b77))
				rgb = LIGHT_GREY;
			else if (square87 && (arr8[7] || b87))
				rgb = LIGHT_GREY;
			else if (square97 && (arr9[7] || b97))
				rgb = LIGHT_GREY;
			else if (square107 && (arr10[7] || b107))
				rgb = LIGHT_GREY;
			else if (square117 && (arr11[7] || b117))
				rgb = LIGHT_GREY;
			else if (square08 && (arr0[8] || b08))
				rgb = LIGHT_GREY;
			else if (square18 && (arr1[8] || b18))
				rgb = LIGHT_GREY;
			else if (square28 && (arr2[8] || b28))
				rgb = LIGHT_GREY;
			else if (square38 && (arr3[8] || b38))
				rgb = LIGHT_GREY;
			else if (square48 && (arr4[8] || b48))
				rgb = LIGHT_GREY;
			else if (square58 && (arr5[8] || b58))
				rgb = LIGHT_GREY;
			else if (square68 && (arr6[8] || b68))
				rgb = LIGHT_GREY;
			else if (square78 && (arr7[8] || b78))
				rgb = LIGHT_GREY;
			else if (square88 && (arr8[8] || b88))
				rgb = LIGHT_GREY;
			else if (square98 && (arr9[8] || b98))
				rgb = LIGHT_GREY;
			else if (square108 && (arr10[8] || b108))
				rgb = LIGHT_GREY;
			else if (square118 && (arr11[8] || b118))
				rgb = LIGHT_GREY;
			else if (square09 && (arr0[9] || b09))
				rgb = LIGHT_GREY;
			else if (square19 && (arr1[9] || b19))
				rgb = LIGHT_GREY;
			else if (square29 && (arr2[9] || b29))
				rgb = LIGHT_GREY;
			else if (square39 && (arr3[9] || b39))
				rgb = LIGHT_GREY;
			else if (square49 && (arr4[9] || b49))
				rgb = LIGHT_GREY;
			else if (square59 && (arr5[9] || b59))
				rgb = LIGHT_GREY;
			else if (square69 && (arr6[9] || b69))
				rgb = LIGHT_GREY;
			else if (square79 && (arr7[9] || b79))
				rgb = LIGHT_GREY;
			else if (square89 && (arr8[9] || b89))
				rgb = LIGHT_GREY;
			else if (square99 && (arr9[9] || b99))
				rgb = LIGHT_GREY;
			else if (square109 && (arr10[9] || b109))
				rgb = LIGHT_GREY;
			else if (square119 && (arr11[9] || b119))
				rgb = LIGHT_GREY;
			else if (rectangle)
				rgb = GREY; // game board
			else 
				if (lost)
					rgb = 12'b1100_0000_000;
				else
					rgb = BLACK; // background color
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

	assign square08 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd373) && (vCount <= 10'd400 - 10'd27 * 0)) ? 1 : 0;
	assign square18 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd346) && (vCount <= 10'd400 - 10'd27 * 1)) ? 1 : 0;
	assign square28 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd319) && (vCount <= 10'd400 - 10'd27 * 2)) ? 1 : 0;
	assign square38 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd292) && (vCount <= 10'd400 - 10'd27 * 3)) ? 1 : 0;
	assign square48 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd265) && (vCount <= 10'd400 - 10'd27 * 4)) ? 1 : 0;
	assign square58 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd238) && (vCount <= 10'd400 - 10'd27 * 5)) ? 1 : 0;
	assign square68 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd211) && (vCount <= 10'd400 - 10'd27 * 6)) ? 1 : 0;
	assign square78 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd184) && (vCount <= 10'd400 - 10'd27 * 7)) ? 1 : 0;
	assign square88 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd157) && (vCount <= 10'd400 - 10'd27 * 8)) ? 1 : 0;
	assign square98 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd130) && (vCount <= 10'd400 - 10'd27 * 9)) ? 1 : 0;
	assign square108 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd103) && (vCount <= 10'd400 - 10'd27 * 10)) ? 1 : 0;	
	assign square118 = ((hCount >= 10'd514) && (hCount <= 10'd539)) && ((vCount >= 10'd76) && (vCount <= 10'd400 - 10'd27 * 11)) ? 1 : 0;

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
