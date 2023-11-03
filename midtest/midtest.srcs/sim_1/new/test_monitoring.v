module test_monitoring;
reg [3:0] a, b, c;
wire [10:0] o;

initial begin
a=4'b1111;
b=4'b1111;
c=4'b1111;
#100
a=4'b1100;
b=4'b1100;
c=4'b1100;
#100
$stop
end

testtest u0 (a,b,c,o);

endmodule

