module Reg0(Reg0_in, Reg0_out_to_TRI, Reg0_En, rst, Reg0_out_Tri_EN, Reg0_out_to_BUS);
input [15:0] Reg0_in; 
output reg [15:0] Reg0_out_to_BUS, Reg0_out_to_TRI; 

input Reg0_En, Reg0_out_Tri_EN, rst; 


//Register Out Functionality
always @(posedge Reg0_En or posedge rst) 
begin
 if(rst)
  Reg0_out_to_TRI <= 1'b0; 
  
 else  
  Reg0_out_to_TRI <= Reg0_in;
        
end 

//Tristate buffer functionality:
always @ (Reg0_out_Tri_EN, Reg0_out_to_TRI)
    begin   
      if (Reg0_out_Tri_EN)
        Reg0_out_to_BUS <= Reg0_out_to_TRI;
      else 
        Reg0_out_to_BUS <= 16'bz;
  end



endmodule 