module add4(a,b,ci,s,co);
    input [3:0] a,b;
    input ci;
    output [3:0] s;
    output co;
    wire [3:1] c;
    
    fa u0 (a[0],b[0],ci,s[0],c[1]);
    fa u1 (a[1],b[1],c[1],s[1],c[2]);
    fa u2 (a[2],b[2],c[2],s[2],c[3]);
    fa u3 (a[3],b[3],c[3],s[3],co);
endmodule
