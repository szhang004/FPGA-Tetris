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

reg [9:0] arr[11:0];

assign {q_lost, q_clear, q_move, q_blockgen, q_ini} = state;

integer i;
always @(*)
begin
    arr0 <= {arr[0][0], arr[1][0], arr[2][0], arr[3][0], arr[4][0], arr[5][0], arr[6][0], arr[7][0], arr[8][0], arr[9][0]};
    arr1 <= {arr[0][1], arr[1][1], arr[2][1], arr[3][1], arr[4][1], arr[5][1], arr[6][1], arr[7][1], arr[8][1], arr[9][1]};
    arr2 <= {arr[0][2], arr[1][2], arr[2][2], arr[3][2], arr[4][2], arr[5][2], arr[6][2], arr[7][2], arr[8][2], arr[9][2]};
    arr3 <= {arr[0][3], arr[1][3], arr[2][3], arr[3][3], arr[4][3], arr[5][3], arr[6][3], arr[7][3], arr[8][3], arr[9][3]};
    arr4 <= {arr[0][4], arr[1][4], arr[2][4], arr[3][4], arr[4][4], arr[5][4], arr[6][4], arr[7][4], arr[8][4], arr[9][4]};
    arr5 <= {arr[0][5], arr[1][5], arr[2][5], arr[3][5], arr[4][5], arr[5][5], arr[6][5], arr[7][5], arr[8][5], arr[9][5]};
    arr6 <= {arr[0][6], arr[1][6], arr[2][6], arr[3][6], arr[4][6], arr[5][6], arr[6][6], arr[7][6], arr[8][6], arr[9][6]};
    arr7 <= {arr[0][7], arr[1][7], arr[2][7], arr[3][7], arr[4][7], arr[5][7], arr[6][7], arr[7][7], arr[8][7], arr[9][7]};
    arr8 <= {arr[0][8], arr[1][8], arr[2][8], arr[3][8], arr[4][8], arr[5][8], arr[6][8], arr[7][8], arr[8][8], arr[9][8]};
    arr9 <= {arr[0][9], arr[1][9], arr[2][9], arr[3][9], arr[4][9], arr[5][9], arr[6][9], arr[7][9], arr[8][9], arr[9][9]};
    arr10 <= {arr[0][10], arr[1][10], arr[2][10], arr[3][10], arr[4][10], arr[5][10], arr[6][10], arr[7][10], arr[8][10], arr[9][10]};
    arr11 <= {arr[0][11], arr[1][11], arr[2][11], arr[3][11], arr[4][11], arr[5][11], arr[6][11], arr[7][11], arr[8][11], arr[9][11]};

end

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

                  for(i = 0; i < 12; i = i + 1)
                  begin
                    arr[i] <= 10'd0000000000;
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
                    arr[9-x1][y1] <= 1;
                    arr[9-x2][y2] <= 1;
                    arr[9-x3][y3] <= 1;
                    arr[9-x4][y4] <= 1;
                end

              end    
            CLEAR  :
              begin
                if (arr[0][10] && arr[1][10] && arr[2][10] && arr[3][10] && arr[4][10] && arr[5][10] && arr[6][10] && arr[7][10] && arr[8][10] && arr[9][10])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                  end
                  score <= score + 10;
                end
                else if (arr[0][9] && arr[1][9] && arr[2][9] && arr[3][9] && arr[4][9] && arr[5][9] && arr[6][9] && arr[7][9] && arr[8][9] && arr[9][9])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                  end
                    score <= score + 10;
                end
                else if (arr[0][8] && arr[1][8] && arr[2][8] && arr[3][8] && arr[4][8] && arr[5][8] && arr[6][8] && arr[7][8] && arr[8][8] && arr[9][8])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                  end
                    score <= score + 10;
                end
                else if (arr[0][7] && arr[1][7] && arr[2][7] && arr[3][7] && arr[4][7] && arr[5][7] && arr[6][7] && arr[7][7] && arr[8][7] && arr[9][7])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][7];
                  end
                    score <= score + 10;
                end
                else if (arr[0][6] && arr[1][6] && arr[2][6] && arr[3][6] && arr[4][6] && arr[5][6] && arr[6][6] && arr[7][6] && arr[8][6] && arr[9][6])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                  end
                    score <= score + 10;
                end
                else if (arr[0][5] && arr[1][5] && arr[2][5] && arr[3][5] && arr[4][5] && arr[5][5] && arr[6][5] && arr[7][5] && arr[8][5] && arr[9][5])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                  end
                    score <= score + 10;
                end
                else if (arr[0][4] && arr[1][4] && arr[2][4] && arr[3][4] && arr[4][4] && arr[5][4] && arr[6][4] && arr[7][4] && arr[8][4] && arr[9][4])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                    arr[i][4] <= arr[i][5];
                  end
                    score <= score + 10;
                end
                else if (arr[0][3] && arr[1][3] && arr[2][3] && arr[3][3] && arr[4][3] && arr[5][3] && arr[6][3] && arr[7][3] && arr[8][3] && arr[9][3])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                    arr[i][4] <= arr[i][5];
                    arr[i][3] <= arr[i][4];
                  end
                    score <= score + 10;
                end
                else if (arr[0][2] && arr[1][2] && arr[2][2] && arr[3][2] && arr[4][2] && arr[5][2] && arr[6][2] && arr[7][2] && arr[8][2] && arr[9][2])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                    arr[i][4] <= arr[i][5];
                    arr[i][3] <= arr[i][4];
                    arr[i][2] <= arr[i][3];
                  end
                    score <= score + 10;
                end
                else if (arr[0][10] && arr[1][10] && arr[2][1] && arr[3][1] && arr[4][1] && arr[5][1] && arr[6][1] && arr[7][1] && arr[8][1] && arr[9][1])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                    arr[i][4] <= arr[i][5];
                    arr[i][3] <= arr[i][4];
                    arr[i][2] <= arr[i][3];
                    arr[i][1] <= arr[i][2];
                  end
                    score <= score + 10;
                end
                else if (arr[0][0] && arr[1][0] && arr[2][0] && arr[3][0] && arr[4][0] && arr[5][0] && arr[6][0] && arr[7][0] && arr[8][0] && arr[9][0])
                begin
                  for (i = 0; i < 10; i = i + 1) begin
                    arr[i][10] <= arr[i][11];
                    arr[i][9] <= arr[i][10];
                    arr[i][8] <= arr[i][9];
                    arr[i][7] <= arr[i][8];
                    arr[i][6] <= arr[i][7];
                    arr[i][5] <= arr[i][6];
                    arr[i][4] <= arr[i][5];
                    arr[i][3] <= arr[i][4];
                    arr[i][2] <= arr[i][3];
                    arr[i][1] <= arr[i][2];
                    arr[i][0] <= arr[i][1];
                  end
                    score <= score + 10;
                end
                else
                begin
                    state <= BLOCKGEN;
                end
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