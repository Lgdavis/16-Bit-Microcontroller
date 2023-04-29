`timescale 1ns/1ps 
module MAR_tb();
reg [15:0] MAR_Address_from_BUS; 
wire [15:0] MAR_Address_Out; 
reg MAR_En, rst; 

MAR UUT(MAR_Address_from_BUS, MAR_Address_Out, MAR_En, rst);


//cycle enable signal
initial begin
  
rst <= 0;
  MAR_En=0;
     forever #40 MAR_En = ~MAR_En;  
end 

initial begin
  
  MAR_Address_from_BUS <= 16'hCF;  
  #50;
  
  rst <= 1;
  #50;
  
  rst <= 0;
  #50;
  
  MAR_Address_from_BUS <= 16'hAD;  
  #50;
  

 
  
end
endmodule  