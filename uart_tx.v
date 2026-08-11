module uart_tx #(
    parameter CLKS_PER_BIT = 16
)(
    input  wire       clk,
    input  wire       rst,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    output reg        tx,
    output reg        tx_busy
);

    reg [3:0] bit_index;
    reg [15:0] clk_count;
    reg [9:0] tx_shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx         <= 1'b1;
            tx_busy    <= 1'b0;
            bit_index  <= 0;
            clk_count  <= 0;
            tx_shift   <= 10'b1111111111;
        end
        else begin
            if (tx_start && !tx_busy) begin
                // Start bit + 8 data bits + stop bit
                tx_shift  <= {1'b1, tx_data, 1'b0};
                tx_busy   <= 1'b1;
                bit_index <= 0;
                clk_count <= 0;
                tx        <= 1'b0;
            end
            else if (tx_busy) begin
                if (clk_count == CLKS_PER_BIT-1) begin
                    clk_count <= 0;

                    if (bit_index == 9) begin
                        tx       <= 1'b1;
                        tx_busy  <= 1'b0;
                    end
                    else begin
                        bit_index <= bit_index + 1;
                        tx        <= tx_shift[bit_index + 1];
                    end
                end
                else begin
                    clk_count <= clk_count + 1;
                end
            end
        end
    end

endmodule