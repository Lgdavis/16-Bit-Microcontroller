`timescale 1ns/1ps 
module MDR_tb();
reg [15:0] MDR_Data_from_BUS; 
wire [15:0] MDR_Data_Out; 
reg MDR_En, rst; 

MDR_Out UUT(MDR_Data_from_BUS, MDR_Data_Out, MDR_En, rst);


//cycle enable signal
initial begin
  
rst <= 0;
  MDR_En=0;
     forever #40 MDR_En = ~MDR_En;  
end 

initial begin
  
  MDR_Data_from_BUS <= 16'hCF;  
  #50;
  
  rst <= 1;
  #50;
  
  rst <= 0;
  #50;
  
  MDR_Data_from_BUS <= 16'hAD;  
  #50;
  

 
  
end
endmodule  
