module MuxSD(Buf0,Buf1,L1,L0,sel,SDA);
  input Buf0; 
  input Buf1; 
  input L1;
  input L0;
  input [1:0] sel;       
  output SDA;
  reg SDA;   
   
 always@(*)
 begin 
 if(sel==2'b00) 
  SDA = Buf0;
 else if(sel==2'b01) 
  SDA = Buf1;
 else if(sel==2'b10) 
  SDA = L1;
 else if(sel==2'b11)
  SDA = L0;
 
 end
 endmodule

