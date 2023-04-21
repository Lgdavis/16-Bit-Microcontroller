module ALU(
           input [15:0] ALU_In1,ALU_In2,                    // 16-Bit Inputs                 
           input [2:0] ALU_Sel,                                 // ALU Selection
           input ALU_In1_En, ALU_In2_En, ALU_Out_En, BUS_Tri_En, // Input/output latch enables and ALU to BUS tristate enable
           input rst,                                            // Reset                 
           
           
           output reg [15:0] ALU_Out_to_TRI, ALU_In1_RegOut, ALU_In2_RegOut, OUT_to_BUS,                // 16-Bit Outputs     
           output reg [15:0] ALU_Result                               // Result output from ALU operation        
                        
    );
    
//ALU_In1 Register functionality    
always @(rst, ALU_In1_En, ALU_In1, ALU_In2)
    begin
         if (!rst)   
         ALU_In1_RegOut = 4'h0;  
      else  
         if (ALU_In1_En)  
         ALU_In1_RegOut = ALU_In1;  
    end  
     
//ALU_In2 Register functionality    
always @(rst, ALU_In2_En, ALU_In1, ALU_In2)
    begin
         if (!rst)  
         ALU_In2_RegOut = 1'b0;         //if reset,  = 0
      else  
         if (ALU_In2_En)  
         ALU_In2_RegOut = ALU_In2;      //if enable  = input
    end   
  
//ALU Functionality     
    always @(*)
    begin
        case(ALU_Sel)
          
        // ADD  
        4'b000:
           ALU_Result = ALU_In1_RegOut + ALU_In2_RegOut ;
           
        // SUB 
        4'b001:  
           ALU_Result = ALU_In1_RegOut - ALU_In2_RegOut ;
           
        // AND   
        4'b010: 
           ALU_Result = ALU_In1_RegOut & ALU_In2_RegOut;
        
        // OR
        4'b011:
           ALU_Result = ALU_In1_RegOut | ALU_In2_RegOut;
           
        // XOR   
        4'b100:
           ALU_Result = ALU_In1_RegOut ^ ALU_In2_RegOut;
        
        // NOR   
        4'b101:
           ALU_Result = ~(ALU_In1_RegOut | ALU_In2_RegOut);
           
        //XNOR   
        4'b110:                    
           ALU_Result = ~ (ALU_In1_RegOut ^ ALU_In2_RegOut);
           
        // Default to ADD       
        default: ALU_Result = ALU_In1_RegOut + ALU_In2_RegOut ; 
        
        endcase
    end

//ALU_Out Register functionality    
always @(rst, ALU_Out_En, ALU_Result)
    begin
         if (!rst)  
         ALU_Out_to_TRI = 1'b0;  
      else  
         if (ALU_Out_En)  
         ALU_Out_to_TRI = ALU_Result;  
    end   

//ALU_Out Tristate buffer functionality:
always @ (ALU_Out_to_TRI,BUS_Tri_En)
    begin   
      if (BUS_Tri_En)
        OUT_to_BUS = ALU_Result;
      else 
        OUT_to_BUS = 1'bz;
  end

endmodule

