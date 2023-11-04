module uart_tx (
    input clk, //클럭->115200으로 동작하게 해야 함
    input rst, //리셋->IDLE돼야 함
    input uart_tx_en, //전송 버튼, debouncer입력으로
    input [7:0] uart_tx_data, //송신할 8비트 data 
    output reg tx_busy, //idle 상태가 아닐 때 '1'
    output reg uart_txd //송신 데이터
);
reg [3:0] c_state, n_state;
wire uart_start_pulse;
wire change_state_en;

reg [9:0] o;
parameter   SIZE = 868;
//100MHz = 10ns -> 115200[bit/s] => [ns/bit] => 8680.555ns/10ns = 868 clk
parameter   IDLE=4'b0, START=4'b1, 
            BIT0=4'd2, BIT1=4'd3, BIT2=4'd4, BIT3=4'd5, 
            BIT4=4'd6, BIT5=4'd7, BIT6=4'd8, BIT7=4'd9,
            STOP=4'd10;

assign change_state_en = (o == SIZE-1) ? 1'b1 : 1'b0;
always @(*) begin
    case (c_state)
        IDLE:   begin if(uart_start_pulse) n_state=START;else n_state=IDLE; end
        START:  begin if(change_state_en)  n_state=BIT0; else n_state=START;end
        BIT0:   begin if(change_state_en)  n_state=BIT1; else n_state=BIT0; end
        BIT1:   begin if(change_state_en)  n_state=BIT2; else n_state=BIT1; end
        BIT2:   begin if(change_state_en)  n_state=BIT3; else n_state=BIT2; end
        BIT3:   begin if(change_state_en)  n_state=BIT4; else n_state=BIT3; end
        BIT4:   begin if(change_state_en)  n_state=BIT5; else n_state=BIT4; end
        BIT5:   begin if(change_state_en)  n_state=BIT6; else n_state=BIT5; end
        BIT6:   begin if(change_state_en)  n_state=BIT7; else n_state=BIT6; end
        BIT7:   begin if(change_state_en)  n_state=STOP; else n_state=BIT7; end
        default:begin if(change_state_en)  n_state=IDLE; else n_state=STOP; end//STOP
    endcase
end

always @(*) begin
    case (c_state)
        IDLE:   begin uart_txd=1'b1;            tx_busy=1'b0; end
        START:  begin uart_txd=1'b0;            tx_busy=1'b1; end
        BIT0:   begin uart_txd=uart_tx_data[0]; tx_busy=1'b1; end
        BIT1:   begin uart_txd=uart_tx_data[1]; tx_busy=1'b1; end
        BIT2:   begin uart_txd=uart_tx_data[2]; tx_busy=1'b1; end
        BIT3:   begin uart_txd=uart_tx_data[3]; tx_busy=1'b1; end
        BIT4:   begin uart_txd=uart_tx_data[4]; tx_busy=1'b1; end
        BIT5:   begin uart_txd=uart_tx_data[5]; tx_busy=1'b1; end
        BIT6:   begin uart_txd=uart_tx_data[6]; tx_busy=1'b1; end
        BIT7:   begin uart_txd=uart_tx_data[7]; tx_busy=1'b1; end
        default:begin uart_txd=1'b1;            tx_busy=1'b1; end//STOP
    endcase
end

always @(posedge clk, posedge rst) begin
    if(rst) c_state <= IDLE;
    else    c_state <= n_state;
end

always @(posedge clk or posedge rst) begin
    if(rst) o <= 0;
    else if(o == SIZE-1) o <= 0;
    else if(uart_start_pulse) o <= 0;
    else o <= o + 1;
end

//assign uart_start_pulse = uart_tx_en; //for simulation
debounce debounce_inst (clk, rst, uart_tx_en, , uart_start_pulse); //for kit
endmodule