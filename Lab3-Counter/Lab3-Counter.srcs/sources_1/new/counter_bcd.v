module counter(
    input clk,
    input rst,
    input en, 
    output reg [3:0] o
    );

   always @(posedge clk or posedge rst) begin
      if (rst)
         o <= 4'b0;
      else if (en) begin
         if(o==9)o <= 0;
         else o <= o + 1;
      end
   end
endmodule
