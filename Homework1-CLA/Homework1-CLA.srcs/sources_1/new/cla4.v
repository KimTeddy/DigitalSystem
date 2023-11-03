module cla4(
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] s,
    output co,
    output po,
    output go
    );

wire [3:1] c;
wire [3:0] p;
wire [3:0] g;

pfa u0 (.a(a[0]), .b(b[0]), .c(ci),   .p(p[0]), .g(g[0]), .s(s[0]));
pfa u1 (.a(a[1]), .b(b[1]), .c(c[1]), .p(p[1]), .g(g[1]), .s(s[1]));
pfa u2 (.a(a[2]), .b(b[2]), .c(c[2]), .p(p[2]), .g(g[2]), .s(s[2]));
pfa u3 (.a(a[3]), .b(b[3]), .c(c[3]), .p(p[3]), .g(g[3]), .s(s[3]));

cll cll_u0 (.ci(ci), .p(p), .g(g), .c(c), .co(co), .po(po), .go(go));

endmodule

