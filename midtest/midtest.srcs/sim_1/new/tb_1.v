module tb_1;
reg [3:0] a, b, c;
wire [11:0] o;
wire [10:0] z;

assign z={a,b,c};

initial begin
a=4'b1111;
b=4'b1111;
c=4'b1111;
#100;
a=4'b1100;
b=4'b1100;
c=4'b1100;
#100;
$stop;
end

initial begin
    //$monitor(o);
    $monitor("value=%b",z);
end

testtest u0 (a,b,c,o);

endmodule
