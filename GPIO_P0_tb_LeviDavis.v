`timescale 1ns/1ps                           //Change Reg numbers as needed to test
module GPIO_P0_tb();
wire [15:0] GPIO_0_in, GPIO_0_out_to_TRI;
wire [15:0] GPIO_0_out_to_BUS, GPIO_To_Periph;
reg rst, GPIO_0_En, GPIO_0_out_Tri_EN, GPIO_0_Periph_TRI_En;

GPIO_P0 UUT(GPIO_0_in, GPIO_0_out_to_TRI, GPIO_0_En, rst, GPIO_0_out_Tri_EN, GPIO_0_out_to_BUS, GPIO_To_Periph, GPIO_0_Periph_TRI_En);  //Change Reg numbers as needed to test

assign GPIO_0_in = 16'b1;


initial begin 
 rst<=1;
 GPIO_0_Periph_TRI_En <=0;
 GPIO_0_out_Tri_EN <= 1;
 
 GPIO_0_En <= 0;
 #100;
 
 GPIO_0_En <= 1;
 #100;
 
 rst <= 0;
 
 GPIO_0_En <= 0;
 #100;
 
 GPIO_0_En <= 1;
 #100;
  
 
 GPIO_0_out_Tri_EN <= 0;
 #100;
 
 GPIO_0_Periph_TRI_En <= 1;
 #100;
 
 GPIO_0_Periph_TRI_En <= 0;
 #100;
 
  end 
endmodule 
