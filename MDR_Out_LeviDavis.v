module MDR_Out(MDR_Data_from_BUS, MDR_Data_Out, MDR_from_BUS_En, rst);
input [15:0] MDR_Data_from_BUS; 
output reg [15:0] MDR_Data_Out; 
input MDR_from_BUS_En, rst; 


//Register Out Functionality
always @(posedge MDR_from_BUS_En, rst) 
begin
 if(rst)
  MDR_Data_Out <= 1'b0; 
  
 else
  if (MDR_from_BUS_En)
    MDR_Data_Out <= MDR_Data_from_BUS;
  else
    MDR_Data_Out <= MDR_Data_Out;      
end 

endmodule 
