module MAR(MAR_Address_from_BUS, MAR_Address_Out, MAR_En, rst);
input [15:0] MAR_Address_from_BUS; 
output reg [15:0] MAR_Address_Out; 
input MAR_En, rst; 


//Register Out Functionality
always @(posedge MAR_En, rst) 
begin
 if(rst)
  MAR_Address_Out <= 1'b0; 
  
 else
  if (MAR_En)
    MAR_Address_Out <= MAR_Address_from_BUS;     
end 

endmodule 
