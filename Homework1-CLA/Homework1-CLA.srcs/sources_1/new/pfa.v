module pfa(
    input a,
    input b,
    input c,
    output p,
    output g,
    output s
    );
    assign p=a^b;
    assign g=a&b;
    assign s=p^c;

endmodule