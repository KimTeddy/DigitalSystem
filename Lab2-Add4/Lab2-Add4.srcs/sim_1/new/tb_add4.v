module tb_add4;
reg [3:0] a, b; 
reg ci; 
wire [3:0] s; 
wire co;
initial begin
    a = 4'b0000;
    b = 4'b0000;
    ci = 1'b0; 
    #100;
    a = 4'b0010;
    b = 4'b0011;
    #200;
    a = 4'b0011;
    b = 4'b1100;
    #200;
    $stop; 
end
add4 dut(a, b, ci, s, co); 
endmodule
