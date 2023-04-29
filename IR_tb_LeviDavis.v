`timescale 1ns/1ps 
module IR_tb();
reg [15:0] IR_In; 
wire [15:0] IR_out; 
reg IR_En, rst; 

IR UUT(IR_In, IR_En, rst, IR_out);


//cycle enable signal
initial begin
  
rst <= 1;
  IR_En=0;
forever #40 IR_En = ~IR_En;  
end 

initial begin
  
  IR_In <= 16'hCF;  
  #50;
  
  rst <= 0;
  IR_En <= 1;
  #50;
  

  IR_En <= 0;
  #50;
  

  #50;
  

 
  
end
endmodule  
