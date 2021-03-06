module EightBitRxCounter_tb();

reg LoadBitCount, DecCount, SCL;
wire [2:0] RxBitCount;
EightBitRxCounter mycount(LoadBitCount,DecCount,RxBitCount, SCL);


always
  #50 SCL = ~SCL;
  
  initial begin
  SCL = 1'b0;
  LoadBitCount = 1'b0;
  //Reset = 1'b0;
  DecCount = 1'b0;
  
  @(posedge SCL) //1
  begin
  //Reset = 1'b1;  
 LoadBitCount = 1'b0;
  DecCount = 1'b0;
  end
  
  @(posedge SCL) //2
  begin  
  //Reset = 1'b0;  
  LoadBitCount = 1'b1;
  DecCount = 1'b0;
  end
  
  @(posedge SCL) //3
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //4
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end

@(posedge SCL) //5
  begin
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //6
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
 DecCount = 1'b1;
  end
  
  @(posedge SCL) //7
  begin
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
 DecCount = 1'b1;
  end
  
  @(posedge SCL) //8
  begin
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //9
  begin  
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //10
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b1;
  DecCount= 1'b0;
  end
  
  @(posedge SCL) //11
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //12
  begin 
  //Reset = 1'b0;  
  LoadBitCount = 1'b0;
  DecCount = 1'b1;
  end
  
  @(posedge SCL) //13
  begin 
  //Reset = 1'b0;  
  LoadBitCount= 1'b0;
  DecCount = 1'b1;
  end
  
  
  
end
endmodule