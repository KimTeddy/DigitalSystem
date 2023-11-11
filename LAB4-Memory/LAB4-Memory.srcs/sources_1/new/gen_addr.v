module gen_addr(input clk, input rst, output reg [2:0] addr);
    
always @(posedge clk or posedge rst) 
begin
    if (rst) addr <= 3'b0; 
    else addr <= addr + 1'b1;
end

endmodule
