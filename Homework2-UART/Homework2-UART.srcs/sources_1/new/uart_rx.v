module uart_rx (
    input clk,
    input rst,
    input uart_rxd, //수신 데이터
    output rx_busy,	//idle 상태가 아닐때 '1'
    output [7:0] uart_rx_data //수신한 8비트 data
);




endmodule