// ----------------------------------------------------------------------
//
//  File name: game_array.v
//  Ported to Nexys 4: 
//  Date: April 10, 2024 (changed 4-bit divider to 8-bit divider, added SCEN signle step control)
// ------------------------------------------------------------------------
module game_array (
    input Clk, 
    input Ack, 
    input Start, 
    input Reset, 
    input bottom_flag, 
    input top_flag, 
    input [3:0] x1,
    input [3:0] y1,
    input [3:0] x2,
    input [3:0] y2,
    input [3:0] x3,
    input [3:0] y3,
    input [3:0] x4,
    input [3:0] y4,
    output reg [4:0] state,
    output gen_flag, 
    output reg [9:0] arr0, 
    output reg [9:0] arr1, 
    output reg [9:0] arr2, 
    output reg [9:0] arr3, 
    output reg [9:0] arr4, 
    output reg [9:0] arr5, 
    output reg [9:0] arr6, 
    output reg [9:0] arr7, 
    output reg [9:0] arr8, 
    output reg [9:0] arr9, 
    output reg [9:0] arr10, 
    output reg [9:0] arr11, 
    output q_blockgen, 
    output q_move, 
    output q_clear, 
    output q_lost,
    output q_ini, 
    output started,
    output reg [15:0] score);

// reg [9:0] arr[11:0];

assign {q_lost, q_clear, q_move, q_blockgen, q_ini} = state;

integer i;
// always @(*)
// begin
//     arr0 <= {arr[0][0], arr[1][0], arr[2][0], arr[3][0], arr[4][0], arr[5][0], arr[6][0], arr[7][0], arr[8][0], arr[9][0]};
//     arr1 <= {arr[0][1], arr[1][1], arr[2][1], arr[3][1], arr[4][1], arr[5][1], arr[6][1], arr[7][1], arr[8][1], arr[9][1]};
//     arr2 <= {arr[0][2], arr[1][2], arr[2][2], arr[3][2], arr[4][2], arr[5][2], arr[6][2], arr[7][2], arr[8][2], arr[9][2]};
//     arr3 <= {arr[0][3], arr[1][3], arr[2][3], arr[3][3], arr[4][3], arr[5][3], arr[6][3], arr[7][3], arr[8][3], arr[9][3]};
//     arr4 <= {arr[0][4], arr[1][4], arr[2][4], arr[3][4], arr[4][4], arr[5][4], arr[6][4], arr[7][4], arr[8][4], arr[9][4]};
//     arr5 <= {arr[0][5], arr[1][5], arr[2][5], arr[3][5], arr[4][5], arr[5][5], arr[6][5], arr[7][5], arr[8][5], arr[9][5]};
//     arr6 <= {arr[0][6], arr[1][6], arr[2][6], arr[3][6], arr[4][6], arr[5][6], arr[6][6], arr[7][6], arr[8][6], arr[9][6]};
//     arr7 <= {arr[0][7], arr[1][7], arr[2][7], arr[3][7], arr[4][7], arr[5][7], arr[6][7], arr[7][7], arr[8][7], arr[9][7]};
//     arr8 <= {arr[0][8], arr[1][8], arr[2][8], arr[3][8], arr[4][8], arr[5][8], arr[6][8], arr[7][8], arr[8][8], arr[9][8]};
//     arr9 <= {arr[0][9], arr[1][9], arr[2][9], arr[3][9], arr[4][9], arr[5][9], arr[6][9], arr[7][9], arr[8][9], arr[9][9]};
//     arr10 <= {arr[0][10], arr[1][10], arr[2][10], arr[3][10], arr[4][10], arr[5][10], arr[6][10], arr[7][10], arr[8][10], arr[9][10]};
//     arr11 <= {arr[0][11], arr[1][11], arr[2][11], arr[3][11], arr[4][11], arr[5][11], arr[6][11], arr[7][11], arr[8][11], arr[9][11]};

// end

localparam
LOST = 5'b10000, CLEAR = 5'b01000, MOVE = 5'b00100, BLOCKGEN = 5'b00010, INI = 5'b00001;

always @(posedge Clk, posedge Reset) 

  begin 
    if (Reset)
       begin
            state <= INI;
            score <= 16'bXXXX_XXXXX_XXXX_XXXX;

            // arr <= {0};
       end
    else
       begin
         case (state)
            INI : 
              begin
                  // state transitions in the control unit
                  if (Start)
                    state <= BLOCKGEN;

                  score <= 0;

                  for(i = 0; i < 10; i = i + 1)
                  begin
                    arr0 <= 12'd000000000000;
                    arr1 <= 12'd000000000000;
                    arr2 <= 12'd000000000000;
                    arr3 <= 12'd000000000000;
                    arr4 <= 12'd000000000000;
                    arr5 <= 12'd000000000000;
                    arr6 <= 12'd000000000000;
                    arr7 <= 12'd000000000000;
                    arr8 <= 12'd000000000000;
                    arr9 <= 12'd000000000000;
                  end
              end
            BLOCKGEN :
              begin
                    state <= MOVE;
              end 
            MOVE  :
              begin  
                  // state transitions in the control unit
                if (bottom_flag)
                    state <= CLEAR;
                if (top_flag)
                    state <= LOST;
                
                // add block to game_array
                if (bottom_flag)
                begin
                    case (y1)
                      4'd0: arr0[x1] <= 1;
                      4'd1: arr1[x1] <= 1;
                      4'd2: arr2[x1] <= 1; 
                      4'd3: arr3[x1] <= 1;
                      4'd4: arr4[x1] <= 1;
                      4'd5: arr5[x1] <= 1; 
                      4'd6: arr6[x1] <= 1;
                      4'd7: arr7[x1] <= 1;
                      4'd8: arr8[x1] <= 1;
                      4'd9: arr9[x1] <= 1;
                      4'd10: arr10[x1] <= 1;
                      4'd11: arr11[x1] <= 1;
                    endcase
                    case (y2)
                      4'd0: arr0[x2] <= 1;
                      4'd1: arr1[x2] <= 1;
                      4'd2: arr2[x2] <= 1; 
                      4'd3: arr3[x2] <= 1;
                      4'd4: arr4[x2] <= 1;
                      4'd5: arr5[x2] <= 1; 
                      4'd6: arr6[x2] <= 1;
                      4'd7: arr7[x2] <= 1;
                      4'd8: arr8[x2] <= 1;
                      4'd9: arr9[x2] <= 1;
                      4'd10: arr10[x2] <= 1;
                      4'd11: arr11[x2] <= 1;
                    endcase
                    case (y3)
                      4'd0: arr0[x3] <= 1;
                      4'd1: arr1[x3] <= 1;
                      4'd2: arr2[x3] <= 1; 
                      4'd3: arr3[x3] <= 1;
                      4'd4: arr4[x3] <= 1;
                      4'd5: arr5[x3] <= 1; 
                      4'd6: arr6[x3] <= 1;
                      4'd7: arr7[x3] <= 1;
                      4'd8: arr8[x3] <= 1;
                      4'd9: arr9[x3] <= 1;
                      4'd10: arr10[x3] <= 1;
                      4'd11: arr11[x3] <= 1;
                    endcase
                    case (y4)
                      4'd0: arr0[x4] <= 1;
                      4'd1: arr1[x4] <= 1;
                      4'd2: arr2[x4] <= 1; 
                      4'd3: arr3[x4] <= 1;
                      4'd4: arr4[x4] <= 1;
                      4'd5: arr5[x4] <= 1; 
                      4'd6: arr6[x4] <= 1;
                      4'd7: arr7[x4] <= 1;
                      4'd8: arr8[x4] <= 1;
                      4'd9: arr9[x4] <= 1;
                      4'd10: arr10[x4] <= 1;
                      4'd11: arr11[x4] <= 1;
                    endcase
                   
                end

              end    
            CLEAR  :
              begin
                if (arr10 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    score <= score + 10;
                end
                else if (arr9 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    score <= score + 10;
                end
                else if (arr8 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    score <= score + 10;
                end
                else if (arr7 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr7;
                    score <= score + 10;
                end
                else if (arr6 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    score <= score + 10;
                end
                else if (arr5 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    score <= score + 10;
                end
                else if (arr4 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    arr4 <= arr5;
                    score <= score + 10;
                end
                else if (arr3 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    arr4 <= arr5;
                    arr3 <= arr4;
                    score <= score + 10;
                end
                else if (arr2 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    arr4 <= arr5;
                    arr3 <= arr4;
                    arr2 <= arr3;
                    score <= score + 10;
                end
                else if (arr1 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    arr4 <= arr5;
                    arr3 <= arr4;
                    arr2 <= arr3;
                    arr1 <= arr2;
                    score <= score + 10;
                end
                else if (arr0 == 10'b1111111111)
                begin
                    arr10 <= arr11;
                    arr9 <= arr10;
                    arr8 <= arr9;
                    arr7 <= arr8;
                    arr6 <= arr7;
                    arr5 <= arr6;
                    arr4 <= arr5;
                    arr3 <= arr4;
                    arr2 <= arr3;
                    arr1 <= arr2;
                    arr0 <= arr1;
                    score <= score + 10;
                end
                else
                    state <= BLOCKGEN;
              end
            LOST :
              begin
                if (Ack)
                    state <= INI;
              end
      endcase
    end 
  end
 
assign gen_flag = (state == BLOCKGEN) ;
assign started = (state != INI);

endmodule  // divider_timing
