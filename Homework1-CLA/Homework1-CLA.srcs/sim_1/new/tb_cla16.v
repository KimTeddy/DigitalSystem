module tb_cla16;
reg [15:0] a, b; 
reg ci; 
wire [15:0] s; 
wire co;
initial begin
    a = 16'h0000;
    b = 16'h0000;
    ci = 1'b0; 
    #100;
    a = 16'hffff;
    b = 16'h0001;
    ci = 1'b0; 
    #100;
    a = 16'hffff;
    b = 16'h0000;
    ci = 1'b1; 
    #100;
    a = 16'h0010;
    b = 16'h0011;
    ci = 1'b1; 
    #100;
    a = 16'h00ff;
    b = 16'hff00;
    ci = 1'b1; 
    #100;
    $stop; 
end
cla16 dut (.a(a), .b(b), .ci(ci), .s(s), .co(co), .po(), .go());
endmodule