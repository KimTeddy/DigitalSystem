module uart_tx_tb;
    reg       clk           ;
    reg       rst           ;
    reg       uart_tx_en    ;
    reg [7:0] uart_tx_data  ;
    wire      tx_busy       ;
    wire      uart_txd      ;

    // Instantiate the uart_tx module
    uart_tx u1(
        .tx_busy      (tx_busy)     ,
        .uart_txd     (uart_txd)    ,
        .clk          (clk)         ,
        .rst          (rst)         ,
        .uart_tx_en   (uart_tx_en)  ,
        .uart_tx_data (uart_tx_data)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test scenarios
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        uart_tx_en = 0;
        uart_tx_data = 0;

        #10 rst = 1; // Reset the module
        #10 rst = 0;

        // Scenario 1: Transmit 0x55
        #10 uart_tx_data = 8'h55;
             uart_tx_en = 1;
        #10 uart_tx_en = 0;

        // Scenario 2: Transmit 0xAA
        #1500 uart_tx_data = 8'hAA;
              uart_tx_en = 1;
        #10  uart_tx_en = 0;

        // Scenario 3: Transmit 0x00
        #1500 uart_tx_data = 8'h00;
              uart_tx_en = 1;
        #10  uart_tx_en = 0;

        // Scenario 4: Transmit 0xFF
        #1500 uart_tx_data = 8'hFF;
              uart_tx_en = 1;
        #10  uart_tx_en = 0;

        // Scenario 5: Transmit 0x80
        #1500 uart_tx_data = 8'h80;
              uart_tx_en = 1;
        #10  uart_tx_en = 0;

        $finish; // End the simulation
    end

endmodule
