module mode_changer(rst, mode_change_trigger, mode);
input rst;
input mode_change_trigger;
output reg [1:0] mode; // 0:clock, 1:timer, 2:stopwatch, 3:alarm

reg [3:0] c_state;
reg [3:0] n_state;

parameter CLOCK = 2'd0, TIMER = 2'd1, STOPWATCH = 2'd2, ALARM = 2'd3;

always @(*) begin
    case(c_state)
        CLOCK:      begin n_state=TIMER;    end
        TIMER:      begin n_state=STOPWATCH;end
        STOPWATCH:  begin n_state=ALARM;    end
        ALARM:      begin n_state=CLOCK;    end
        default:    begin n_state=CLOCK;    end
    endcase
end

always @(posedge mode_change_trigger, posedge rst)begin
    if(rst) c_state <= CLOCK;
    else    c_state <= n_state;
end

always @(*) begin
    case(c_state)
        CLOCK:      begin mode=CLOCK;     end
        TIMER:      begin mode=TIMER;     end
        STOPWATCH:  begin mode=STOPWATCH; end
        ALARM:      begin mode=ALARM;     end
        default:    begin mode=CLOCK;     end
    endcase
end

endmodule
