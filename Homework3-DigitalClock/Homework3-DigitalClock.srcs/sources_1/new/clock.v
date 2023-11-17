module clock(
input clk_6mhz,
input rst,
input clock_en,
input [5:0] digit,//바꿀 숫자
input up, down,
output reg [3:0] sec0, sec1, min0, min1, hrs0, hrs1
    );

assign sec0_ovf =                                                        (sec0 == 9) ? 1'b1 : 1'b0;
assign sec1_ovf =                                             (sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
assign min0_ovf =                                  (min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
assign min1_ovf =                       (min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
assign hrs0_ovf =            (hrs0 == 9&&min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
assign hrs1_ovf = (hrs1 == 2&&hrs0 == 3&&min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;

always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
    if (rst)
        sec0 <= 4'b0;
    else if (clock_en) begin
        if(sec0==9)sec0 <= 0;
        else sec0 <= sec0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
    if (rst)
        sec1 <= 4'b0;
    else if (clock_en&&sec0_ovf) begin
        if(sec1==5)sec1 <= 0;
        else sec1 <= sec1 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
    if (rst)
        min0 <= 4'b0;
    else if (clock_en&&sec1_ovf) begin
        if(min0==9)min0 <= 0;
        else min0 <= min0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
    if (rst)
        min1 <= 4'b0;
    else if (clock_en&&min0_ovf) begin
        if(min1==5)min1 <= 0;
        else min1 <= min1 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
    if (rst)
        hrs0 <= 4'b0;
    else if (clock_en&&min1_ovf) begin
        if(hrs0==9||hrs1_ovf)hrs0 <= 0;
        else hrs0 <= hrs0 + 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
    if (rst)
        hrs1 <= 4'b0;
    else if (clock_en&&hrs0_ovf) begin
        if(hrs1!=2) hrs1 <= hrs1 + 1;
    end
    else if (clock_en&&hrs1_ovf) begin
        if(hrs1==2) hrs1 <= 0;
    end
end
endmodule
// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
//     if (rst)
//         sec0 <= 4'b0;
//     else if (clock_en) begin
//         if(sec0==9)sec0 <= 0;
//         else sec0 <= sec0 + 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
//     if (rst)
//         sec1 <= 4'b0;
//     else if (sec0_ovf) begin
//         if(sec1==5)sec1 <= 0;
//         else sec1 <= sec1 + 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
//     if (rst)
//         min0 <= 4'b0;
//     else if (sec1_ovf) begin
//         if(min0==9)min0 <= 0;
//         else min0 <= min0 + 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         min1 <= 4'b0;
//     else if (min0_ovf) begin
//         if(min1==5)min1 <= 0;
//         else min1 <= min1 + 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         hrs0 <= 4'b0;
//     else if (min1_ovf) begin
//         if(hrs0==5)hrs0 <= 0;
//         else hrs0 <= hrs0 + 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         hrs1 <= 4'b0;
//     else if (hrs0_ovf) begin
//         if(hrs1==5)hrs1 <= 0;
//         else hrs1 <= hrs1 + 1;
//     end
// end
// endmodule
