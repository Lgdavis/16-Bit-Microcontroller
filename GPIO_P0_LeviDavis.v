module GPIO_P0(GPIO_0_in, GPIO_0_out_to_TRI, GPIO_0_En, rst, GPIO_0_out_Tri_EN, GPIO_0_out_to_BUS, GPIO_To_Periph, GPIO_0_Periph_TRI_En);
input [15:0] GPIO_0_in; 
output reg [15:0] GPIO_0_out_to_BUS, GPIO_0_out_to_TRI, GPIO_To_Periph; 

input GPIO_0_En, GPIO_0_out_Tri_EN, GPIO_0_Periph_TRI_En,rst; 


//BUS Out Functionality
always @(GPIO_0_En or rst) 
begin
 if(rst)
  GPIO_0_out_to_TRI <= 1'b0; 
 else 
  if (GPIO_0_En)  
  GPIO_0_out_to_TRI <= GPIO_0_in;
        
end 

//Tristate buffer functionality:
always @ (GPIO_0_out_Tri_EN, GPIO_0_out_to_TRI)
    begin   
      if (GPIO_0_out_Tri_EN)
        GPIO_0_out_to_BUS <= GPIO_0_out_to_TRI;
      else 
        GPIO_0_out_to_BUS <= 16'bz;
  end



//Register Out Functionality
always @(GPIO_0_Periph_TRI_En, rst) 
begin
if (GPIO_0_Periph_TRI_En)  
 if(rst)
  GPIO_To_Periph <= 16'b0; 
 else
    GPIO_To_Periph <= GPIO_0_in;    
else  
  GPIO_To_Periph <= 16'bZ;  
end 


endmodule 
