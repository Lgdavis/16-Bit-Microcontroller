`timescale 1ns/1ps                           //Change Reg numbers as needed to test
module MDR_In_tb();
wire [15:0] MDR_from_MEM, MDR_Data_to_TRI;
wire [15:0] MDR_Data_to_BUS;
reg rst, MDR_from_MEM_En, MDR_Data_toBus_TRI_En;



MDR_In UUT(MDR_Data_to_BUS, MDR_from_MEM, MDR_from_MEM_En,  MDR_Data_to_TRI, MDR_Data_toBus_TRI_En, rst);  //Change Reg numbers as needed to test

assign MDR_from_MEM = 15'b1; 


initial begin 
  
  
 
  
  
 rst<=1;
 MDR_from_MEM_En <= 1; //turn from mem en on
 MDR_Data_toBus_TRI_En<= 0;

 #100
 MDR_from_MEM_En <= 0;
 #100;
 
 MDR_from_MEM_En <= 1;
 #100;
 
 rst <= 0;
 
 MDR_from_MEM_En <= 0;
 #100;
 
 MDR_from_MEM_En <= 1;
 #100;
 
 MDR_from_MEM_En <= 0;
 #100;  
  
 MDR_Data_toBus_TRI_En<= 1;
 #100;
  
 MDR_Data_toBus_TRI_En<= 0;
 #100; 
 
 #100;
 
  end 
endmodule 