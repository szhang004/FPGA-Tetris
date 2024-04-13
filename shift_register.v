
module shift_reg (Clk, reset, preset, D, Q);

    input Clk, reset, preset;
    input D;
    output reg Q;

    initial begin
        Q = 1'b0;
    end

    always @(posedge Clk, posedge reset, posedge preset)
    begin
        if (reset)
            Q <= 1'b0;
        else if (preset)
            Q <= 1'b1;
        else   
            Q <= D;
    end

endmodule


module reg_chain (Clk, reset, preset, Q, In);

    input [11:0] Clk;
    input [11:0] reset;
    input [11:0] preset;
    output [11:0] Q; 
    input wire In;

    shift_reg r0(.Clk(Clk[0]), .reset(reset[0]), .preset(preset[0]), .D(Q[1]), .Q(Q[0]));
    shift_reg r1(.Clk(Clk[1]), .reset(reset[1]), .preset(preset[1]), .D(Q[2]), .Q(Q[1]));
    shift_reg r2(.Clk(Clk[2]), .reset(reset[2]), .preset(preset[2]), .D(Q[3]), .Q(Q[2]));
    shift_reg r3(.Clk(Clk[3]), .reset(reset[3]), .preset(preset[3]), .D(Q[4]), .Q(Q[3]));
    shift_reg r4(.Clk(Clk[4]), .reset(reset[4]), .preset(preset[4]), .D(Q[5]), .Q(Q[4]));
    shift_reg r5(.Clk(Clk[5]), .reset(reset[5]), .preset(preset[5]), .D(Q[6]), .Q(Q[5]));
    shift_reg r6(.Clk(Clk[6]), .reset(reset[6]), .preset(preset[6]), .D(Q[7]), .Q(Q[6]));
    shift_reg r7(.Clk(Clk[7]), .reset(reset[7]), .preset(preset[7]), .D(Q[8]), .Q(Q[7]));
    shift_reg r8(.Clk(Clk[8]), .reset(reset[8]), .preset(preset[8]), .D(Q[9]), .Q(Q[8]));
    shift_reg r9(.Clk(Clk[9]), .reset(reset[9]), .preset(preset[9]), .D(Q[10]), .Q(Q[9]));
    shift_reg r10(.Clk(Clk[10]), .reset(reset[10]), .preset(preset[10]), .D(Q[11]), .Q(Q[10]));
    shift_reg r11(.Clk(Clk[11]), .reset(reset[11]), .preset(preset[11]), .D(In), .Q(Q[11]));

    assign In = 0;

    // initial begin
    //     Q = 12'b000000000000;
    // end

endmodule
