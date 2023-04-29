module IR(IR_In, IR_En, rst, IR_out);
input [15:0] IR_In; 
 
input IR_En, rst; 
output reg [15:0] IR_out;

//Register Out Functionality
always @(IR_En or rst) 
begin
 if(rst)
  IR_out <= 1'b0; 
  
 else  
  IR_out <= IR_In;
        
end 
endmodule 