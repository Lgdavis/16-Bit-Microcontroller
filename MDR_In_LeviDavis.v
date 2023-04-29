module MDR_In(MDR_Data_to_BUS, MDR_from_MEM, MDR_from_MEM_En,  MDR_Data_to_TRI, MDR_Data_toBus_TRI_En, rst);
input [15:0] MDR_from_MEM; 
output reg [15:0] MDR_Data_to_BUS,  MDR_Data_to_TRI; 
input MDR_from_MEM_En,MDR_Data_toBus_TRI_En, rst; 


//Register Out Functionality
always @(posedge MDR_from_MEM_En, rst) 
begin
 if(rst)
  MDR_Data_to_TRI <= 1'b0; 
  
 else
  if (MDR_from_MEM_En)
    MDR_Data_to_TRI <= MDR_from_MEM;      
end 



//Tristate buffer functionality:
always @ (MDR_Data_toBus_TRI_En, MDR_Data_to_TRI)
    begin   
      if (MDR_Data_toBus_TRI_En)
        MDR_Data_to_BUS <= MDR_Data_to_TRI;
      else 
        MDR_Data_to_BUS <= 16'bz;
  end

endmodule 

