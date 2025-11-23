// regfile.v
module regfile (
    input  wire        clk,
    input  wire        we,           // write enable
    input  wire [3:0]  addr_r,       // read address
    input  wire [3:0]  addr_w,       // write address
    input  wire [7:0]  data_in,      // data to write
    output wire [7:0]  data_out      // data read
);
    reg [7:0] regs [0:15];
    integer i;

    // Optional: init all regs to 0
    initial begin
        for (i = 0; i < 16; i = i + 1)
            regs[i] = 8'b0;
    end

    // Synchronous write
    always @(posedge clk) begin
        if (we) begin
            regs[addr_w] <= data_in;
        end
    end

    // Asynchronous read
    assign data_out = regs[addr_r];

endmodule
