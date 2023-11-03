module cla16(
    input [15:0] a,
    input [15:0] b,
    input ci,
    output [15:0] s,
    output co,
    output po,
    output go
    );
    
wire [3:1] c;
wire [3:0] p;
wire [3:0] g;

cla4 cla_u0 (.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(), .po(p[0]), .go(g[0]));
cla4 cla_u1 (.a(a[7:4]), .b(b[7:4]), .ci(c[1]), .s(s[7:4]), .co(), .po(p[1]), .go(g[1]));
cla4 cla_u2 (.a(a[11:8]), .b(b[11:8]), .ci(c[2]), .s(s[11:8]), .co(), .po(p[2]), .go(g[2]));
cla4 cla_u3 (.a(a[15:12]), .b(b[15:12]), .ci(c[3]), .s(s[15:12]), .co(), .po(p[3]), .go(g[3]));

cll cll_u1 (.ci(ci), .p(p), .g(g), .c(c), .co(co), .po(po), .go(go));

endmodule

