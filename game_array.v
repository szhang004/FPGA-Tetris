// ----------------------------------------------------------------------
//
//  File name: game_array.v
//  Ported to Nexys 4: 
//  Date: April 10, 2024 (changed 4-bit divider to 8-bit divider, added SCEN signle step control)
// ------------------------------------------------------------------------
module game_array (
    input Clk, 
    input Start, 
    input Reset, 
    input bottom_flag, 
    input top_flag, 
    input [31:0] block,
    output reg [4:0] state,
    output gen_flag, 
    output reg [9:0][11:0] arr, 
    output q_blockgen, 
    output q_move, 
    output q_clear, 
    output q_lost,
    output q_ini, 
    output reg [7:0] score);

//location of block
// square 1: x- 31-28, y- 27-24, square 2: x- 23-20, y- 19-16
// square 3: x- 15-12, y- 11-8, square 4: x- 7-4, y- 3-0

assign {q_lost, q_clear, q_move, q_blockgen, q_ini} = state;
integer i, j;

localparam
LOST = 5'b10000, CLEAR = 5'b01000, MOVE = 5'b00100, BLOCKGEN = 5'b00010, INI = 5'b00001;

always @(posedge Clk, posedge Reset) 

  begin  : CU_n_DU
    if (Reset)
       begin
            state <= INI;
            score <= 8'bXXXX_XXXX;

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
                  arr <= {0};
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
                    arr[block[31:28]][block[27:24]] <= 1;
                    arr[block[23:20]][block[19:16]] <= 1;
                    arr[block[15:12]][block[11:8]] <= 1;
                    arr[block[7:4]][block[3:0]] <= 1;
                end

              end    
            CLEAR  :
              begin
                if (arr[10][0]*arr[10][1]*arr[10][2]*arr[10][3]*arr[10][4]*arr[10][5]*arr[10][6]*arr[10][7]*arr[10][8]*arr[10][9] == 1)
                begin
                    arr[10] <= arr[11];
                    score <= score + 5;
                end
                else if (arr[9][0]*arr[9][1]*arr[9][2]*arr[9][3]*arr[9][4]*arr[9][5]*arr[9][6]*arr[9][7]*arr[9][8]*arr[9][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    score <= score + 5;
                end
                else if (arr[8][0]*arr[8][1]*arr[8][2]*arr[8][3]*arr[8][4]*arr[8][5]*arr[8][6]*arr[8][7]*arr[8][8]*arr[8][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    score <= score + 5;
                end
                else if (arr[7][0]*arr[7][1]*arr[7][2]*arr[7][3]*arr[7][4]*arr[7][5]*arr[7][6]*arr[7][7]*arr[7][8]*arr[7][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[7];
                    score <= score + 5;
                end
                else if (arr[6][0]*arr[6][1]*arr[6][2]*arr[6][3]*arr[6][4]*arr[6][5]*arr[16][6]*arr[6][7]*arr[6][8]*arr[6][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    score <= score + 5;
                end
                else if (arr[5][0]*arr[5][1]*arr[5][2]*arr[5][3]*arr[5][4]*arr[5][5]*arr[5][6]*arr[5][7]*arr[5][8]*arr[5][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    score <= score + 5;
                end
                else if (arr[4][0]*arr[4][1]*arr[4][2]*arr[4][3]*arr[4][4]*arr[4][5]*arr[4][6]*arr[4][7]*arr[4][8]*arr[4][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    arr[4] <= arr[5];
                    score <= score + 5;
                end
                else if (arr[3][0]*arr[3][1]*arr[3][2]*arr[3][3]*arr[3][4]*arr[3][5]*arr[3][6]*arr[3][7]*arr[3][8]*arr[3][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    arr[4] <= arr[5];
                    arr[3] <= arr[4];
                    score <= score + 5;
                end
                else if (arr[2][0]*arr[2][1]*arr[2][2]*arr[2][3]*arr[2][4]*arr[2][5]*arr[2][6]*arr[2][7]*arr[2][8]*arr[2][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    arr[4] <= arr[5];
                    arr[3] <= arr[4];
                    arr[2] <= arr[3];
                    score <= score + 5;
                end
                else if (arr[1][0]*arr[1][1]*arr[1][2]*arr[1][3]*arr[1][4]*arr[1][5]*arr[1][6]*arr[1][7]*arr[1][8]*arr[1][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    arr[4] <= arr[5];
                    arr[3] <= arr[4];
                    arr[2] <= arr[3];
                    arr[1] <= arr[2];
                    score <= score + 5;
                end
                else if (arr[0][0]*arr[0][1]*arr[0][2]*arr[0][3]*arr[0][4]*arr[0][5]*arr[0][6]*arr[0][7]*arr[0][8]*arr[0][9] == 1)
                begin
                    arr[10] <= arr[11];
                    arr[9] <= arr[10];
                    arr[8] <= arr[9];
                    arr[7] <= arr[8];
                    arr[6] <= arr[7];
                    arr[5] <= arr[6];
                    arr[4] <= arr[5];
                    arr[3] <= arr[4];
                    arr[2] <= arr[3];
                    arr[1] <= arr[2];
                    arr[0] <= arr[1];
                    score <= score + 5;
                end
                begin
                    state <= BLOCKGEN;
                end
              end
      endcase
    end 
  end
 
assign gen_flag = (state == BLOCKGEN) ;

endmodule  // divider_timing