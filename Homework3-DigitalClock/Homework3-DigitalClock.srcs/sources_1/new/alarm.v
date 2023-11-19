module clock(
input clk_6mhz,
input rst,
input clock_en,
input [5:0] digit,//바꿀 숫자
input up, down,
input [3:0] sec0_0, sec1_0, min0_0, min1_0, hrs0_0, hrs1_0,
output reg [3:0] sec0, sec1, min0, min1, hrs0, hrs1
    );



always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
    if (rst)
        sec0 <= 4'b0;
    else if (digit[5]&&up) begin
        if(sec0==9)sec0 <= 0;
        else sec0 <= sec0 + 1;
    end
    else if(digit[5]&&down) begin
        if(sec0==0)sec0 <= 0;
        else sec0 <= sec0 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
    if (rst)
        sec1 <= 4'b0;
    else if (digit[4]&&up) begin
        if(sec1==5)sec1 <= 0;
        else sec1 <= sec1 + 1;
    end
    else if(digit[4]&&down) begin
        if(sec1==0)sec1 <= 0;
        else sec1 <= sec1 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
    if (rst)
        min0 <= 4'b0;
    else if (digit[3]&&up) begin
        if(min0==9)min0 <= 0;
        else min0 <= min0 + 1;
    end
    else if(digit[3]&&down) begin
        if(min0==0)min0 <= 0;
        else min0 <= min0 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
    if (rst)
        min1 <= 4'b0;
    else if (digit[2]&&up) begin
        if(min1==5)min1 <= 0;
        else min1 <= min1 + 1;
    end
    else if(digit[2]&&down) begin
        if(min1==0)min1 <= 0;
        else min1 <= min1 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//Xh:XX:XX
    if (rst)
        hrs0 <= 4'b0;
    else if(hrs1==2&&hrs0>3)hrs0 <= 3;
    else if(digit[1]&&up)begin
        if(hrs0==9||hrs1==2&&hrs0==3)hrs0 <= 0;
        else hrs0 <= hrs0 + 1;
    end
    else if(digit[1]&&down) begin
        if(hrs0==0)hrs0 <= 0;
        else hrs0 <= hrs0 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//hX:XX:XX
    if (rst)
        hrs1 <= 4'b0;
    else if(digit[0]&&up)begin
        if(hrs1==2)hrs1 <= 0;
        else hrs1 <= hrs1 + 1;
    end
    else if(digit[0]&&down) begin
        if(hrs1==0)hrs1 <= 0;
        else hrs1 <= hrs1 - 1;
    end
end
endmodule