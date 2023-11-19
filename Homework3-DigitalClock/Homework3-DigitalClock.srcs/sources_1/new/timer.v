module timer(
input clk_6mhz,
input rst,
input clock_en,
input [5:0] digit,//바꿀 숫자
input up, down, timer_en,
output reg [3:0] sec0, sec1, min0, min1, hrs0, hrs1,
output reg timer_trigger
    );
wire sec0_udf, sec1_udf, min0_udf, min1_udf, hrs0_udf, hrs1_udf;
//underflow
// assign sec0_udf =                                                        (sec0 == 9) ? 1'b1 : 1'b0;
// assign sec1_udf =                                             (sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
// assign min0_udf =                                  (min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
// assign min1_udf =                       (min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
// assign hrs0_udf =            (hrs0 == 9&&min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
// assign hrs1_udf = (hrs1 == 2&&hrs0 == 3&&min1 == 5&&min0 == 9&&sec1 == 5&&sec0 == 9) ? 1'b1 : 1'b0;
assign sec0_udf =                                                        (sec0 == 0) ? 1'b1 : 1'b0;
assign sec1_udf =                                             (sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
assign min0_udf =                                  (min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
assign min1_udf =                       (min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
assign hrs0_udf =            (hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
assign hrs1_udf = (hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;

assign hrs1_remain =   (hrs1 > 0) ? 1'b1 : 1'b0;
assign hrs0_remain =   (hrs1 > 0||hrs0 > 0) ? 1'b1 : 1'b0;
assign min1_remain =   (hrs1 > 0||hrs0 > 0||min1 > 0) ? 1'b1 : 1'b0;
assign min0_remain =   (hrs1 > 0||hrs0 > 0||min1 > 0||min0 > 0) ? 1'b1 : 1'b0;
assign sec1_remain =   (hrs1 > 0||hrs0 > 0||min1 > 0||min0 > 0||sec1 > 0) ? 1'b1 : 1'b0;

//assign timer_trigger = (hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
always @(*) begin
    if(hrs1_udf) timer_trigger=1'b1;
    else timer_trigger=1'b0;
end

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
    //else if(timer_trigger) sec0 <= 0;
    else if(timer_en&&clock_en) begin
        if(hrs1_udf) begin end
        else if(sec0==0&&sec1_remain)sec0 <= 9;
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
    //else if(sec0_remain) sec1 <= 0;
    else if(timer_en&&clock_en) begin
        if(sec1==0&&min0_remain)sec1 <= 5;
        else if(sec0_udf) sec1 <= sec1 - 1;
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
        else if(sec1_udf)min0 <= min0 - 1;
    end
    //else if(sec1_remain) min0 <= 0;
    else if(timer_en&&clock_en) begin
        if(min0==0&&min1_remain)min0 <= 9;
        else if(sec1_udf) min0 <= min0 - 1;
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
    //else if(min0_remain) min1 <= 0;
    else if(timer_en&&clock_en) begin
        if(min1==0&&hrs0_remain)min1 <= 5;
        else if(min0_udf) min1 <= min1 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//Xh:XX:XX
    if (rst)
        hrs0 <= 4'b0;
    else if (digit[1]&&up) begin
        if(hrs0==9)hrs0 <= 0;
        else hrs0 <= hrs0 + 1;
    end
    else if(digit[1]&&down) begin
        if(hrs0==0)hrs0 <= 0;
        else hrs0 <= hrs0 - 1;
    end
    //else if(min1_remain) hrs0 <= 0;
    else if(timer_en&&clock_en) begin
        if(hrs0==0&&hrs1_remain)hrs0 <= 9;
        else if(min1_udf) hrs0 <= hrs0 - 1;
    end
end
always @(posedge clk_6mhz or posedge rst) begin//hX:XX:XX
    if (rst)
        hrs1 <= 4'b0;
    else if (digit[0]&&up)begin
        if(hrs1==9)hrs1 <= 0;
        else hrs1 <= hrs1 + 1;
    end
    else if(digit[0]&&down) begin
        if(hrs1==0)hrs1 <= 0;
        else hrs1 <= hrs1 - 1;
    end
    //else if(hrs0_remain) hrs1 <= 0;
    else if(timer_en&&clock_en) begin
        if(hrs1==0)hrs1 <= 0;
        else if(hrs0_udf) hrs1 <= hrs1 - 1;
    end
end

// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
//     if (rst)
//         sec0 <= 4'b0;
//     else if (digit[5]&&up) begin
//         if(sec0==9)sec0 <= 0;
//         else sec0 <= sec0 + 1;
//     end
//     else if(digit[5]&&down) begin
//         if(sec0==0)sec0 <= 0;
//         else sec0 <= sec0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
//     if (rst)
//         sec1 <= 4'b0;
//     else if (digit[4]&&up) begin
//         if(sec1==5)sec1 <= 0;
//         else sec1 <= sec1 + 1;
//     end
//     else if(digit[4]&&down) begin
//         if(sec1==0)sec1 <= 0;
//         else sec1 <= sec1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
//     if (rst)
//         min0 <= 4'b0;
//     else if (digit[3]&&up) begin
//         if(min0==9)min0 <= 0;
//         else min0 <= min0 + 1;
//     end
//     else if(digit[3]&&down) begin
//         if(min0==0)min0 <= 0;
//         else if(sec1_udf)min0 <= min0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         min1 <= 4'b0;
//     else if (digit[2]&&up) begin
//         if(min1==5)min1 <= 0;
//         else min1 <= min1 + 1;
//     end
//     else if(digit[2]&&down) begin
//         if(min1==0)min1 <= 0;
//         else min1 <= min1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//Xh:XX:XX
//     if (rst)
//         hrs0 <= 4'b0;
//     else if (digit[1]&&up) begin
//         if(hrs0==9)hrs0 <= 0;
//         else hrs0 <= hrs0 + 1;
//     end
//     else if(digit[1]&&down) begin
//         if(hrs0==0)hrs0 <= 0;
//         else hrs0 <= hrs0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//hX:XX:XX
//     if (rst)
//         hrs1 <= 4'b0;
//     else if (digit[0]&&up)begin
//         if(hrs1==9)hrs1 <= 0;
//         else hrs1 <= hrs1 + 1;
//     end
//     else if(digit[0]&&down) begin
//         if(hrs1==0)hrs1 <= 0;
//         else hrs1 <= hrs1 - 1;
//     end
// end


// // assign hrs1_remain =   (hrs1 == 0) ? 1'b1 : 1'b0;
// // assign min1_remain =   (hrs1 == 0&&hrs0 == 0) ? 1'b1 : 1'b0;
// // assign min0_remain =   (hrs1 == 0&&hrs0 == 0&&min1 == 0) ? 1'b1 : 1'b0;
// // assign sec1_remain =   (hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0) ? 1'b1 : 1'b0;
// // assign sec0_remain =   (hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0) ? 1'b1 : 1'b0;
// //assign timer_trigger = (hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) ? 1'b1 : 1'b0;
// always @(*)begin
//     if(hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) timer_trigger=1'b1;
//     else timer_trigger=1'b0;
// end

// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
//     if (rst)
//         sec0 <= 4'b0;
//     else if (digit[5]&&up) begin
//         if(sec0==9)sec0 <= 0;
//         else sec0 <= sec0 + 1;
//     end
//     else if(digit[5]&&down) begin
//         if(sec0==0)sec0 <= 0;
//         else sec0 <= sec0 - 1;
//     end
//     //else if(timer_trigger) sec0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(sec0==0)sec0 <= 9;
//         else sec0 <= sec0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
//     if (rst)
//         sec1 <= 4'b0;
//     else if (digit[4]&&up) begin
//         if(sec1==5)sec1 <= 0;
//         else sec1 <= sec1 + 1;
//     end
//     else if(digit[4]&&down) begin
//         if(sec1==0)sec1 <= 0;
//         else sec1 <= sec1 - 1;
//     end
//     //else if(sec0_remain) sec1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(sec1==0)sec1 <= 5;
//         else if(sec0_udf) sec1 <= sec1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
//     if (rst)
//         min0 <= 4'b0;
//     else if (digit[3]&&up) begin
//         if(min0==9)min0 <= 0;
//         else min0 <= min0 + 1;
//     end
//     else if(digit[3]&&down) begin
//         if(min0==0)min0 <= 0;
//         else if(sec1_udf)min0 <= min0 - 1;
//     end
//     //else if(sec1_remain) min0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(min0==0)min0 <= 9;
//         else if(sec1_udf) min0 <= min0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         min1 <= 4'b0;
//     else if (digit[2]&&up) begin
//         if(min1==5)min1 <= 0;
//         else min1 <= min1 + 1;
//     end
//     else if(digit[2]&&down) begin
//         if(min1==0)min1 <= 0;
//         else min1 <= min1 - 1;
//     end
//     //else if(min0_remain) min1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(min1==0)min1 <= 5;
//         else if(min0_udf) min1 <= min1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//Xh:XX:XX
//     if (rst)
//         hrs0 <= 4'b0;
//     else if (digit[1]&&up) begin
//         if(hrs0==9)hrs0 <= 0;
//         else hrs0 <= hrs0 + 1;
//     end
//     else if(digit[1]&&down) begin
//         if(hrs0==0)hrs0 <= 0;
//         else hrs0 <= hrs0 - 1;
//     end
//     //else if(min1_remain) hrs0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(hrs0==0)hrs0 <= 9;
//         else if(min1_udf) hrs0 <= hrs0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//hX:XX:XX
//     if (rst)
//         hrs1 <= 4'b0;
//     else if (digit[0]&&up)begin
//         if(hrs1==9)hrs1 <= 0;
//         else hrs1 <= hrs1 + 1;
//     end
//     else if(digit[0]&&down) begin
//         if(hrs1==0)hrs1 <= 0;
//         else hrs1 <= hrs1 - 1;
//     end
//     //else if(hrs0_remain) hrs1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(hrs1==0)hrs1 <= 0;
//         else if(hrs0_udf) hrs1 <= hrs1 - 1;
//     end
// end



// always @(*)begin
//     if(hrs1 == 0&&hrs0 == 0&&min1 == 0&&min0 == 0&&sec1 == 0&&sec0 == 0) timer_trigger=1'b1;
//     else timer_trigger=1'b0;
// end

// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:Xs
//     if (rst)
//         sec0 <= 4'b0;
//     else if (digit[5]&&up) begin
//         if(sec0==9)sec0 <= 0;
//         else sec0 <= sec0 + 1;
//     end
//     else if(digit[5]&&down) begin
//         if(sec0==0)sec0 <= 0;
//         else sec0 <= sec0 - 1;
//     end
//     //else if(timer_trigger) sec0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(sec0==0)sec0 <= 9;
//         else sec0 <= sec0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:XX:sX
//     if (rst)
//         sec1 <= 4'b0;
//     else if (digit[4]&&up) begin
//         if(sec1==5)sec1 <= 0;
//         else sec1 <= sec1 + 1;
//     end
//     else if(digit[4]&&down) begin
//         if(sec1==0)sec1 <= 0;
//         else sec1 <= sec1 - 1;
//     end
//     //else if(sec0_remain) sec1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(sec1==0)sec1 <= 5;
//         else if(sec0==0) sec1 <= sec1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:Xm:XX
//     if (rst)
//         min0 <= 4'b0;
//     else if (digit[3]&&up) begin
//         if(min0==9)min0 <= 0;
//         else min0 <= min0 + 1;
//     end
//     else if(digit[3]&&down) begin
//         if(min0==0)min0 <= 0;
//         else min0 <= min0 - 1;
//     end
//     //else if(sec1_remain) min0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(min0==0)min0 <= 9;
//         else if(sec1==0) min0 <= min0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//XX:mX:XX
//     if (rst)
//         min1 <= 4'b0;
//     else if (digit[2]&&up) begin
//         if(min1==5)min1 <= 0;
//         else min1 <= min1 + 1;
//     end
//     else if(digit[2]&&down) begin
//         if(min1==0)min1 <= 0;
//         else min1 <= min1 - 1;
//     end
//     //else if(min0_remain) min1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(min1==0)min1 <= 5;
//         else if(min0==0) min1 <= min1 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//Xh:XX:XX
//     if (rst)
//         hrs0 <= 4'b0;
//     else if (digit[1]&&up) begin
//         if(hrs0==5)hrs0 <= 0;
//         else hrs0 <= hrs0 + 1;
//     end
//     else if(digit[1]&&down) begin
//         if(hrs0==0)hrs0 <= 0;
//         else hrs0 <= hrs0 - 1;
//     end
//     //else if(min1_remain) hrs0 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(hrs0==0)hrs0 <= 9;
//         else if(min1==0) hrs0 <= hrs0 - 1;
//     end
// end
// always @(posedge clk_6mhz or posedge rst) begin//hX:XX:XX
//     if (rst)
//         hrs1 <= 4'b0;
//     else if (digit[0]&&up)begin
//         if(hrs1==2)hrs1 <= 0;
//         else hrs1 <= hrs1 + 1;
//     end
//     else if(digit[0]&&down) begin
//         if(hrs1==0)hrs1 <= 0;
//         else hrs1 <= hrs1 - 1;
//     end
//     //else if(hrs0_remain) hrs1 <= 0;
//     else if(timer_en&&clock_en) begin
//         if(hrs1==0)hrs1 <= 0;
//         else if(hrs0==0) hrs1 <= hrs1 - 1;
//     end
// end
endmodule



//always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         sec0  <= 4'b0;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//         else begin
//             if (sec0 == 0 && sec1 == 0) begin
//                 if (min0 == 0 && min1 == 0) begin
//                     if (hrs0 == 0 && hrs1 == 0) begin
//                     // Counter has reached 00:00:00, do not decrement further
//                     end 
//                     else begin
//                         sec0 <= 9;
//                     end
//                 end 
//                 else begin
//                     // Decrement minutes and reset seconds
//                     sec0 <= 9;
//                 end
//             end 
//             else begin
//                 // Decrement seconds
//                 if (sec1 == 5) begin
//                     sec0 <= sec0 - 1;
//                 end
//             end
//         end
//     end
// end

// always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         sec1  <= 4'b0;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//         else begin
//             if (sec0 == 0 && sec1 == 0) begin
//                 if (min0 == 0 && min1 == 0) begin
//                     if (hrs0 == 0 && hrs1 == 0) begin
//                     // Counter has reached 00:00:00, do not decrement further
//                     end 
//                     else begin
//                     // Decrement hours, reset minutes and seconds
//                     sec1 <= 5;
//                     end
//                 end 
//                 else begin
//                     // Decrement minutes and reset seconds
//                     sec1 <= 5;
//                 end
//             end 
//             else begin
//                 // Decrement seconds
//                 sec1 <= sec1 - 1;
//             end
//         end
//     end
// end

// always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         min0  <= 4'b0;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//         else begin
//             if (sec0 == 0 && sec1 == 0) begin
//                 if (min0 == 0 && min1 == 0) begin
//                     if (hrs0 == 0 && hrs1 == 0) begin
//                     // Counter has reached 00:00:00, do not decrement further
//                     end 
//                     else begin
//                     // Decrement hours, reset minutes and seconds
//                     min0 <= 9;
//                     end
//                 end 
//             end 
//         end
//     end
// end

// always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         min1  <= 4'b0;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//         else begin
//             if (sec0 == 0 && sec1 == 0) begin
//                 if (min0 == 0 && min1 == 0) begin
//                     if (hrs0 == 0 && hrs1 == 0) begin
//                     // Counter has reached 00:00:00, do not decrement further
//                     end 
//                     else begin
//                     // Decrement hours, reset minutes and seconds
//                     min1 <= 5;
//                     end
//                 end 
//                 else begin
//                     // Decrement minutes and reset seconds
//                     min1 <= min1 - 1;
//                 end
//             end 
//         end
//     end
// end

// always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         hrs0  <= 4'b0;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//     end
// end

// always @(posedge clock_en or posedge rst) begin
//     if (rst) begin
//         hrs1  <= 4'b1;
//     end 
//     else begin
//         if (sec0 == 0 && sec1 == 0 && min0 == 0 && min1 == 0 && hrs0 == 0 && hrs1 == 0) begin
//         // Counter has reached 00:00:00, do not decrement further
//         end 
//         else begin
//             if (sec0 == 0 && sec1 == 0) begin
//                 if (min0 == 0 && min1 == 0) begin
//                     if (hrs0 == 0 && hrs1 == 0) begin
//                     // Counter has reached 00:00:00, do not decrement further
//                     end 
//                     else begin
//                     // Decrement hours, reset minutes and seconds
//                     hrs1 <= hrs1 - 1;
//                     end
//                 end
//             end 
//         end
//     end
// end