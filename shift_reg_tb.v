
// `timescale 1ns / 1ps

// module shift_reg_tb;

// 	// Inputs
// 	reg [11:0] Clk;
// 	reg [11:0] reset;
// 	reg [11:0] preset;
//     reg [11:0] clk_en;
// 	wire In;

// 	// Outputs
// 	reg [11:0] Q;

    
// 	// change 3.0 (check part3.do file - 
// 	// replaced line 5 from part3.do with part2.do and increased run time
// 	// change 3.1
// 	//integer file_results;
	
// 	// Instantiate the Unit Under Test (UUT)
// 	shift_chain test (
// 		.Clk(Clk), 
// 		.reset(reset), 
//         .In(In),
//         .preset(preset),
//         .Q(Q),
// 	);
		
//     initial begin
//         begin: CLOCK_GENERATOR
//             Clk = 0;
//             forever begin
//                 #5 Clk = ~ Clk;
//             end
//         end
//     end
//     initial begin
//         #0 Reset = 0;
//         #20 Reset = 1;
//         #20 Reset = 0;
//     end
    
//     /*-------- clock counter --------*/
//     integer clk_cnt, start_clk_cnt, clocks_taken;
//     always @(posedge Clk) begin
//         if(Reset) begin
//             clk_cnt = 0;
//         end
//         else begin
//             clk_cnt = clk_cnt + 1;
//         end
//     end
    
//     // change 3.2 (next 3 lines)
//     initial begin
//         file_results = $fopen("ee354_GCD_part3_output.txt", "w");
//     end
    
//     initial begin
//         // Initialize Inputs
//         Q = 12b'000000000000; 

//         // Wait 100 ns for global reset to finish
//         #103;
//             // stimulus-1 GCD(36, 24)	
//         //change 2.2 (next 5 lines)
//         for (hr = 2; hr <= 63; hr = hr+1)
//             begin
//             for (min = 2; min <= 63; min = min+1)
//                 APPLY_STIMULUS (hr,min);
//             end
        
//         //change 3.3
//         $fclose(file_results);
//     end
    
//     task APPLY_STIMULUS;
//         input [7:0] Ain_value;
//         input [7:0] Bin_value;
//         begin
//             Ain = Ain_value;
//             Bin = Bin_value;
//             @(posedge Clk);									
            
//             // generate a Start pulse
//             Start = 1;
//             @(posedge Clk);	
//             Start = 0;

//             wait(q_Sub);
//             start_clk_cnt = clk_cnt;
                
//             wait(q_Done);
//             clocks_taken = clk_cnt - start_clk_cnt;

//             // generate and Ack pulse
//             #5;
//             Ack = 1;
//             @(posedge Clk);		
//             Ack = 0;
//             // change 3.2 (next 2 lines)
//             $fdisplay(file_results,"Ain: %d Bin: %d, GCD: %d", Ain, Bin, AB_GCD);
//             $fdisplay(file_results,"It took %d clock(s) to compute the GCD", clocks_taken);
//             #20;										
//         end
//     endtask
	
	
// 	always @(*)
// 		begin
// 			case ({q_I, q_Sub, q_Mult, q_Done})    // Note the concatenation operator {}
// 				4'b1000: state_string = "q_I   ";  // ****** TODO ******
// 				4'b0100: state_string = "q_Sub ";  // Fill-in the three lines
// 				4'b0010: state_string = "q_Mult";
// 				4'b0001: state_string = "q_Done";			
// 			endcase
// 		end
 
      
// endmodule


`timescale 1ns / 1ps

module shift_reg_tb;

    // Testbench Signals
    reg [11:0] Clk;
    reg [11:0] reset;
    reg [11:0] preset;
    wire [11:0] Q;
    reg In;

    // Instantiate the Unit Under Test (UUT)
    reg_chain uut (
        .Clk(Clk),
        .reset(reset),
        .preset(preset),
        .Q(Q),
    );

    // Clock Generation for each shift register
    initial begin
        // Initialize all clocks to 0
        Clk = 12'b000000000000;
        forever begin
            #10 Clk[0] = ~Clk[0];
             Clk[1] = ~Clk[1];
             Clk[2] = ~Clk[2];
             Clk[3] = ~Clk[3];
             Clk[4] = ~Clk[4];
             Clk[5] = ~Clk[5];
             Clk[6] = ~Clk[6];
             Clk[7] = ~Clk[7];
             Clk[8] = ~Clk[8];
             Clk[9] = ~Clk[9];
             Clk[10] = ~Clk[10];
             Clk[11] = ~Clk[11];
        end
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        reset = 12'b111111111111;  // Initially assert reset
        preset = 12'b000000000000;

        #100; // Wait for 100 ns for global reset to finish

        reset = 12'b000000000000;  // De-assert reset
        // In = 1;  // Set input to 1

        // Apply presets asynchronously
        #150 preset = 12'b101010101010; // Set alternating preset
        #10 preset = 12'b000000000000; // Remove preset

        // In = 0;  // Change input
        // #100 In = 1;  // Change input
        // #100 In = 0;  // Change input

        #500 $finish;  // End simulation
    end

    // Monitor Outputs
    initial begin
        $monitor("Time = %t : Q = %b, In = %b, Reset = %b, Preset = %b", $time, Q, In, reset, preset);
    end

endmodule