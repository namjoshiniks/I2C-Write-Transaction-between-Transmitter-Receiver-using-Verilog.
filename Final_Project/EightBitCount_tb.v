module EightEightBitCount_tb();
  
  reg LoadEightBitCount;
  reg DecEightBitCount;
  reg Reset;
  wire [31:0]EightBitCount;
  //reg Count;
  
  reg clk;
  EightBitCounter MUT(LoadEightBitCount,DecEightBitCount,EightBitCount,Reset,clk);
  
  always
  #50 clk = ~clk;
  
  initial begin
  clk = 1'b0;
  LoadEightBitCount = 1'b0;
  Reset = 1'b0;
  DecEightBitCount = 1'b0;
  
  @(posedge clk) //1
  begin
  Reset = 1'b1;  
 LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b0;
  end
  
  @(posedge clk) //2
  begin  
  Reset = 1'b0;  
  LoadEightBitCount = 1'b1;
  DecEightBitCount = 1'b0;
  end
  
  @(posedge clk) //3
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //4
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end

@(posedge clk) //5
  begin
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //6
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
 DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //7
  begin
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
 DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //8
  begin
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //9
  begin  
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //10
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b1;
  DecEightBitCount= 1'b0;
  end
  
  @(posedge clk) //11
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //12
  begin 
  Reset = 1'b0;  
  LoadEightBitCount = 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  @(posedge clk) //13
  begin 
  Reset = 1'b0;  
  LoadEightBitCount= 1'b0;
  DecEightBitCount = 1'b1;
  end
  
  
  
end
endmodule
