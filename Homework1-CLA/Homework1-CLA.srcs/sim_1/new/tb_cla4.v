module tb_cla4;
reg [3:0] a, b; 
reg ci; 
wire [3:0] s; 
wire co;
initial begin
    a = 4'b0000;
    b = 4'b0000;
    ci = 1'b0; 
    #100;
    a = 4'b1111;
    b = 4'b0001;
    ci = 1'b0; 
    #100;
    a = 4'b0010;
    b = 4'b0011;
    ci = 1'b1; 
    #100;
    a = 4'b0011;
    b = 4'b1101;
    ci = 1'b0; 
    #100;
    a = 4'b0011;
    b = 4'b1100;
    ci = 1'b0; 
    #100;
    a = 4'b1111;
    b = 4'b0000;
    ci = 1'b1; 
    #100;
    $stop; 
end
cla4 dut (.a(a), .b(b), .ci(ci), .s(s), .co(co), .po(), .go());
endmodule