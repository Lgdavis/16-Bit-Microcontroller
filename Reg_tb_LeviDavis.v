`timescale 1ns/1ps                           //Change Reg numbers as needed to test
module Reg_tb();
wire [15:0] Reg0_in, Reg0_out_to_TRI;
wire [15:0] Reg0_out_to_BUS;
reg rst, Reg0_En, Reg0_out_Tri_EN;



Reg0 UUT(Reg0_in, Reg0_out_to_TRI, Reg0_En, rst, Reg0_out_Tri_EN, Reg0_out_to_BUS);  //Change Reg numbers as needed to test

assign Reg0_in = 16'b1;


initial begin 
 rst<=1;
 Reg0_out_Tri_EN <= 1;
 
 Reg0_En <= 0;
 #100;
 
 Reg0_En <= 1;
 #100;
 
 rst <= 0;
 
 Reg0_En <= 0;
 #100;
 
 Reg0_En <= 1;
 #100;
  
 
 Reg0_En <= 0;
 #100;
 
 Reg0_En <= 1;
 #100;

 Reg0_En <= 0;
 #100;
 
 Reg0_out_Tri_EN <= 0;
 #100;
 
  end 
endmodule 