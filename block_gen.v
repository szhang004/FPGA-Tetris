// ----------------------------------------------------------------------
//
//  File name: game_array.v
//  Ported to Nexys 4: 
//  Date: April 10, 2024 (changed 4-bit divider to 8-bit divider, added SCEN signle step control)
// ------------------------------------------------------------------------
module block_gen 
(
    input Clk, 
    input Ack, 
    input Reset, 
    input gen_flag, 
    input SCEN_U,
    input SCEN_D,
    input SCEN_L,
    input SCEN_R,
    input [9:0][11:0] arr, 
    output bottom_flag, 
    output reg top_flag, 
    output reg [3:0] x1,
    output reg [3:0] y1,
    output reg [3:0] x2,
    output reg [3:0] y2,
    output reg [3:0] x3,
    output reg [3:0] y3,
    output reg [3:0] x4,
    output reg [3:0] y4,
    output reg [3:0] state,
    output q_blockgen,
    output q_wait, 
    output q_move,
    output q_ini);

assign {q_blockgen, q_move, q_wait, q_ini} = state;
reg [3:0] center_x;
reg [3:0] center_y;
reg [1:0] clk_count;

localparam
BLOCKGEN = 4'b1000, MOVE = 4'b0100, WAIT = 4'b0010, INI = 4'b0001;
integer L_LEFT = 0;
integer L_RIGHT = 1;
integer SQUARE = 2;
integer LINE = 3;
integer T = 4;
integer shape;

assign bottom_flag = (state == WAIT);

always @(posedge Clk, posedge Reset) 

  begin  
    if (Reset)
       begin
            state <= INI;
            center_x <= 4'bXXXX;
            center_y <= 4'bXXXX;
            clk_count <= 2'bXX;
       end
    else
       begin
         (* full_case, parallel_case *)
         case (state)
            INI : 
              begin
                  // state transitions in the control unit
                  center_x <= 5;
                  center_y <= 11; // (5,11)
                  clk_count <= 0;

                  top_flag <= 0;

                  if (gen_flag)
                      state <= BLOCKGEN;

              end

            BLOCKGEN : 
              begin
                state <= MOVE;

                shape = $random % 5;
                case (shape)
                    L_LEFT: 
                        {x1, y1, x2, y2, x3, y3, x4, y4} <= {4'd4, 4'd10, 4'd4, 4'd11, 4'd5, 4'd11, 4'd6, 4'd11};
                    L_RIGHT:
                        {x1, y1, x2, y2, x3, y3, x4, y4} <= {4'd4, 4'd11, 4'd5, 4'd11, 4'd6, 4'd11, 4'd6, 4'd10};
                    SQUARE:
                        {x1, y1, x2, y2, x3, y3, x4, y4} <= {4'd5, 4'd10, 4'd5, 4'd11, 4'd6, 4'd11, 4'd6, 4'd10};
                    LINE:
                        {x1, y1, x2, y2, x3, y3, x4, y4} <= {4'd4, 4'd11, 4'd5, 4'd11, 4'd6, 4'd11, 4'd7, 4'd11};
                    T:
                        {x1, y1, x2, y2, x3, y3, x4, y4} <= {4'd5, 4'd11, 4'd6, 4'd11, 4'd6, 4'd10, 4'd7, 4'd11};
                endcase
              end

            MOVE :
              begin
                if (SCEN_U) // rotate
                begin
                    if (center_x < 8 && center_x > 1)
                    begin
                        x1 <= center_x + y1 - center_y;
                        x2 <= center_x + y2 - center_y;
                        x3 <= center_x + y3 - center_y;
                        x4 <= center_x + y4 - center_y;
                        x1 <= center_y + x1 - center_x;
                        x2 <= center_y + x2 - center_x;
                        x3 <= center_y + x3 - center_x;
                        x4 <= center_y + x4 - center_x;
                    end
                end
                if (SCEN_R)  // move right
                begin
                    if (x1 != 9 & x2 != 9 & x3 != 9 & x4 != 9)
                    begin
                        x1 <= x1 + 1;
                        x2 <= x2 + 1;
                        x3 <= x3 + 1;
                        x4 <= x4 + 1;
                        center_x <= center_x + 1;
                    end
                end
                if (SCEN_L)  // move left
                begin
                    if (x1 != 0 & x2 != 0 & x3 != 0 & x4 != 0)
                    begin
                        x1 <= x1 - 1;
                        x2 <= x2 - 1;
                        x3 <= x3 - 1;
                        x4 <= x4 - 1;
                        center_x <= center_x - 1;
                    end
                end
                if (SCEN_D) // drop
                begin
                    
                end 

                clk_count <= clk_count + 1;
                if (clk_count == 3)
                begin
                    clk_count = 0;
                    if (y1 == 0 || y2 == 0 || y3 == 0 || y4 == 0 || 
                        arr[x1][y1-1] == 1 || arr[x2][y2-1] == 1 || arr[x3][y3-1] == 1 || arr[x4][y4-1] == 1)
                    begin
                        if (y1 == 11 || y2 == 11 || y3 == 11 || y4 == 11)
                            top_flag <= 1;
                        state <= WAIT;
                    end
                    else
                    begin
                        y1 <= y1 - 1;
                        y2 <= y2 - 1;
                        y3 <= y3 - 1;
                        y4 <= y4 - 1;
                        center_y <= center_y - 1;
                    end
                end
              end

            WAIT  :
              begin  
                  // state transitions in the control unit
                  if (Ack & top_flag)
                    state <= INI;
                  if (gen_flag)
                    state <= BLOCKGEN;
              end    
            
      endcase
    end 
  end

endmodule  // divider_timing
