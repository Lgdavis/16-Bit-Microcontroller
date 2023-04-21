`timescale 1ns / 1ps  

module ALU_tb;

 reg[15:0] ALU_In1,ALU_In2;                              // 16-Bit inputs
 reg[2:0] ALU_Sel;                                      // ALU Mode Selector
 reg ALU_In1_En; 
 reg ALU_In2_En;
 reg ALU_Out_En;
 wire [15:0]ALU_Out_to_TRI;
 wire [15:0]ALU_In1_RegOut;
 wire [15:0]ALU_In2_RegOut;
 wire [15:0]ALU_Result; 
 reg BUS_Tri_En;   // Input/output latch enables and ALU to BUS tristate enable
 reg rst;                                              // Reset
 wire[15:0] OUT_to_BUS;                                 //Output to Bus


 integer i;
 ALU UUT(
            .ALU_In1(ALU_In1),
            .ALU_In2(ALU_In2),      // 16-bit Inputs                 
            .ALU_Sel(ALU_Sel),              // ALU Mode Selector
            .ALU_In1_En(ALU_In1_En),           // Input1 latch enable
            .ALU_In2_En(ALU_In2_En),           // Input2 latch enable 
            .ALU_Out_En(ALU_Out_En),           // Output latch enable 
            .BUS_Tri_En(BUS_Tri_En),            // Tristate enable (ALU result to BUS)
            .rst(rst),
            .OUT_to_BUS(OUT_to_BUS),
            .ALU_Out_to_TRI(ALU_Out_to_TRI),
            .ALU_In1_RegOut(ALU_In1_RegOut),
            .ALU_In2_RegOut(ALU_In2_RegOut),
            .ALU_Result(ALU_Result)
     );
    initial begin
      
      ALU_In1_En = 0'b1;           // latch inputs 1 and 2
      ALU_In2_En = 0'b1;   
      
      
      //   ******* might be some problems here with enabling output before assigning an input        
      ALU_Out_En = 0'b1;           // Output latch enable 
      BUS_Tri_En = 0'b1;           // enable tristate buffer to transmit result to bus     
      
      
      
      rst = 0'b0;                     //reset at beginning and hold
      #10;
      
      rst = 1;                     //clear rst 
      
      ALU_In1 = 8'h4C;
      ALU_In2 = 8'h2A;
      ALU_Sel = 4'h0; 
      #10;
      
      for (i=0;i<=5;i=i+1) begin
       ALU_Sel = ALU_Sel + 1'b1;  //change to next alu mode and delay
       #10;
      end
      
      
      begin
      //------------------------------------------------------      
      //need to test clearing the latches and tristate buffer.
      //------------------------------------------------------
      
      ALU_Sel = 4'h0;             //set to add
      rst = 1'b0;
      #10;                         //reset to test 
      rst = 1'b1;
      #10;                        //testing enables of input registers
      
      //ALU_In1_En test at 100ns
      ALU_In1_En = 0'b0;          //disable input register one
      #5;
      ALU_In1 = 0'h0;            //change  value input register 1
      #5;                         //wait 
      
      
     
      ALU_In1_En = 0'b1;          //enable input register1 and check for update @110 ns
      #5;
      
      ALU_In1 = 8'h4C;            //put input register back to orig. value
      #5;
       
       
      //ALU_In2_En test
      ALU_In2_En = 0'b0;          //disable input register 2
      #5;
      ALU_In2 = 0'h0;            //change  value input register 2
      #5;                         //wait 
      
      ALU_In2_En = 0'b1;          //enable input register 2 and check for update
      #10;     
      
      // go back to original values
      ALU_In1 = 8'h4C;
      ALU_In2 = 8'h2A;      
      #10;
      
      
      
      
      
      //ALU_Out_En test
      ALU_Out_En = 0'b0;          //disable output register @ 150ns
      #5;
      ALU_Sel = 4'h1;             //set to sub @ 155ns
      #5;
      ALU_Out_En = 0'b1;          //enable output register @ 160ns
      #5;

      
      //Tristate Buffer Test
      BUS_Tri_En = 0'b0;          //disable tri state buffer @ 165ns
      #5;                         //check for Z
      
      ALU_Sel = 4'h2;             //set to AND @ 170ns
      #5;
      
       BUS_Tri_En = 0'b1;         //enable tri state buffer @ 175ns
      #5;                         //check for OUT_to_BUS   
      #60;                        //for waveform snip
      
      //------------******debugged to here*******-------------------
    end
      

 end 
endmodule

