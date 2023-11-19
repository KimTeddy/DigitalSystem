module stopwatch(
input clk_6mhz,
input rst,
input clock_en_m,
input stopwatch_en,
//input start, stop,
output reg [3:0] msec0, msec1, sec0, sec1, min0, min1
    );
// reg stopwatch_en;

// always @(*)begin
//     if(start)       stopwatch_en=1'b1;
//     else if(stop)   stopwatch_en=1'b0;
//     else            stopwatch_en=1'b0;
// end

assign msec0_ovf=                                                         (msec0 == 9) ? 1'b1 : 1'b0;
assign msec1_ovf=                                             (msec1 == 5&&msec0 == 9) ? 1'b1 : 1'b0;
assign sec0_ovf =                                  (sec0 == 9&&msec1 == 5&&msec0 == 9) ? 1'b1 : 1'b0;
assign sec1_ovf =                       (sec1 == 5&&sec0 == 9&&msec1 == 5&&msec0 == 9) ? 1'b1 : 1'b0;
assign min0_ovf =            (min0 == 9&&sec1 == 5&&sec0 == 9&&msec1 == 5&&msec0 == 9) ? 1'b1 : 1'b0;
assign min1_ovf = (min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9&&msec1 == 5&&msec0 == 9) ? 1'b1 : 1'b0;

always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
    if (rst)
        msec0 <= 4'b0;
    else if (clock_en_m&&stopwatch_en) begin
        if(msec0==9)msec0 <= 0;
        else msec0 <= msec0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
    if (rst)
        msec1 <= 4'b0;
    else if (clock_en_m&&msec0_ovf&&stopwatch_en) begin
        if(msec1==5)msec1 <= 0;
        else msec1 <= msec1 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:Xs:XX
    if (rst)
        sec0 <= 4'b0;
    else if (clock_en_m&&msec1_ovf&&stopwatch_en) begin
        if(sec0==9)sec0 <= 0;
        else sec0 <= sec0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:sX:XX
    if (rst)
        sec1 <= 4'b0;
    else if (clock_en_m&&sec0_ovf&&stopwatch_en) begin
        if(sec1==5)sec1 <= 0;
        else sec1 <= sec1 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//Xm:XX:XX
    if (rst)
        min0 <= 4'b0;
    else if (clock_en_m&&sec1_ovf&&stopwatch_en) begin
        if(min0==9)min0 <= 0;
        else min0 <= min0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//mX:XX:XX
    if (rst)
        min1 <= 4'b0;
    else if (clock_en_m&&min0_ovf&&stopwatch_en) begin
        if(min1==5)min1 <= 0;
        else min1 <= min1 + 1;
    end
end
endmodule