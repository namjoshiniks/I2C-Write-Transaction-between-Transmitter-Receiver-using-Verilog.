module RxMux(BUF0, BUF1,ValidRXOut, RXOut, selBUF);
input [31:0] BUF0;
input [31:0] BUF1;
input selBUF, ValidRXOut;
output[31:0] RXOut;

reg [31:0] RXOut;

always @ (ValidRXOut)
begin
if (ValidRXOut)
begin
case (selBUF)

1'b1 :begin 
      RXOut= BUF1;
      end
1'b0 : begin 
       RXOut = BUF0;
       end
    endcase
    end
else
RXOut <= 0;
end
endmodule
