module MuxSC_tb();
  reg clk;  
  reg selSC;       
  wire SC;
     
MuxSC MUT1(clk,selSC,SC);

initial begin
clk = 0;

    
#10 selSC = 1'b1;

#10 selSC = 1'b0;

#10 selSC = 1'b1;

#10 selSC = 1'b1;

#10 $stop;

end

endmodule


