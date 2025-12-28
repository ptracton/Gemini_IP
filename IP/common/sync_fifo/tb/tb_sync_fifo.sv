/*
 * File: tb_sync_fifo.sv
 * Description: Native SystemVerilog Testbench for Sync FIFO
 */

module tb_sync_fifo;

  // Parameters
  localparam WIDTH = 8;
  localparam DEPTH = 4;
  localparam CLK_PERIOD = 10;

  // Signals
  logic clk;
  logic rst_n;
  logic flush;
  logic push;
  logic [WIDTH-1:0] data_in;
  logic full;
  logic pop;
  logic [WIDTH-1:0] data_out;
  logic empty;
  logic [$clog2(DEPTH):0] level;

  // DUT Instantiation
  sync_fifo #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .flush(flush),
      .push(push),
      .data_in(data_in),
      .full(full),
      .pop(pop),
      .data_out(data_out),
      .empty(empty),
      .level(level)
  );

  // Clock Generation
  always #(CLK_PERIOD / 2) clk = ~clk;

  // Test Procedure
  initial begin
    // Initialize
    clk = 0;
    rst_n = 0;
    flush = 0;
    push = 0;
    pop = 0;
    data_in = 0;

    // Reset
    #(CLK_PERIOD * 2);
    rst_n = 1;
    #(CLK_PERIOD * 2);

    $display("Test Started: Sync FIFO DEPTH=%0d", DEPTH);

    // Test 1: Fill FIFO
    $display("Test 1: Fill FIFO");
    for (int i = 0; i < DEPTH; i++) begin
      if (full) begin
        $error("Error: FIFO Full prematurely at index %0d", i);
      end
      @(posedge clk);
      push <= 1;
      data_in <= i;
      @(posedge clk);
      push <= 0;
    end

    // Check Full
    @(posedge clk);
    if (!full) $error("Error: FIFO should be Full");
    if (empty) $error("Error: FIFO should not be Empty");
    if (level != DEPTH) $error("Error: Level mismatch. Expected %0d, Got %0d", DEPTH, level);

    // Test 2: Drain FIFO
    $display("Test 2: Drain FIFO");
    for (int i = 0; i < DEPTH; i++) begin
      if (empty) begin
        $error("Error: FIFO Empty prematurely at index %0d", i);
      end
      @(posedge clk);
      pop <= 1;
      @(posedge clk);
      pop <= 0;
      // Data available now (latency 1 from internal read)
      #1;  // Delay to sample updated data
      if (data_out !== i)
        $error("Error: Data Mismatch at index %0d. Exp: %0h, Got: %0h", i, i, data_out);
    end

    // Check Empty
    @(posedge clk);
    if (!empty) $error("Error: FIFO should be Empty");
    if (full) $error("Error: FIFO should not be Full");
    if (level != 0) $error("Error: Level mismatch. Expected 0, Got %0d", level);

    $display("Test Finished");
    $finish;
  end

endmodule
