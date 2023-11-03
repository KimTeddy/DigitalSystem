module tb_mul4;
reg [3:0] a, b; 
wire [7:0] p; 

initial begin
    a = 4'b0000;
    b = 4'b0000;
    #100;
    a = 4'b0010;
    b = 4'b0011;
    #200;
    a = 4'b0011;
    b = 4'b1100;
    #200;
    $stop; 
end
mul4 dut(a, b, p); 
endmodule
