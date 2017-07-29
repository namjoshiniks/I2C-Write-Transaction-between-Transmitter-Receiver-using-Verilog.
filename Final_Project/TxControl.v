module TxControl(Addr,Data,Write,Size,Burst);
  input[3:0] Addr;
  input[31:0] Data;
  input Write;
  output[31:0] Burst;
  output[31:0] Size; 
  reg[31:0] Burst;
  reg[31:0] Size;
  reg[31:0] SizeReg;
  reg[31:0] BurstReg;
  
  always@(*)
  begin
    if(Write==1)
      begin
        if(Addr==4'b0010)
          begin
            BurstReg = Data;
          end
          
          if(Addr==4'b0100)
          begin
            SizeReg = Data * 8;
          end

           
      end
      
    else if(Write==0)
      begin
        Burst = BurstReg;
        Size = SizeReg;
      end

      end 
 endmodule
  
  


