module clk_divider (
    input clk_in, 
    output reg clk_out);

reg[31:0] count=32'd0;
parameter DIVISOR = 32'd100000000/8;

//clk_out = clk_in / DIVISOR

always @(posedge clk_in) begin

   if(count == DIVISOR/2-1) begin
       count <= 0; 
       clk_out <= ~clk_out; 
   end 
   else count <= count + 1; 
end
endmodule
