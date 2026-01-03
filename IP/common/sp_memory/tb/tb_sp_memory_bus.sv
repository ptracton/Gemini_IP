/*
 * File: tb_sp_memory_bus.sv
 * Description: Native SystemVerilog Testbench for sp_memory Bus Wrappers
 *              Supports: APB, WB, AHB, AXI via macros.
 */

`timescale 1ns / 1ps

module tb_sp_memory_bus;

  parameter int WIDTH = 32;
  parameter int DEPTH = 256;
  parameter string TECHNOLOGY = "GENERIC";

  logic clk;
  logic rst_n;

  // Generic arrays for checker
  logic [WIDTH-1:0] read_data;

  // Clock Gen
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

`ifdef BUS_TYPE_APB
  // -------------------------------------------------------------------------
  // APB4 Interface
  // -------------------------------------------------------------------------
  logic [         31:0] paddr;
  logic                 psel;
  logic                 penable;
  logic                 pwrite;
  logic [    WIDTH-1:0] pwdata;
  logic [(WIDTH/8)-1:0] pstrb;
  logic [          2:0] pprot;
  logic                 pready;
  logic [    WIDTH-1:0] prdata;
  logic                 pslverr;

  sp_memory_apb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) dut (
      .pclk(clk),
      .presetn(rst_n),
      .paddr(paddr),
      .psel(psel),
      .penable(penable),
      .pwrite(pwrite),
      .pwdata(pwdata),
      .pstrb(pstrb),
      .pprot(pprot),
      .pready(pready),
      .prdata(prdata),
      .pslverr(pslverr),
      .sleep(1'b0),
      .bist_en(1'b0),
      .bist_done(),
      .bist_pass(),
      .err_parity(),
      .err_ecc_single(),
      .err_ecc_double()
  );

  task bus_init;
    psel = 0;
    penable = 0;
    pwrite = 0;
    paddr = 0;
    pwdata = 0;
    pstrb = 0;
    pprot = 0;
  endtask

  task bus_write(input logic [31:0] addr, input logic [WIDTH-1:0] data,
                 input logic [(WIDTH/8)-1:0] strb);
    @(posedge clk);
    paddr <= addr;
    pwdata <= data;
    pstrb <= strb;
    pwrite <= 1;
    psel <= 1;
    penable <= 0;  // Setup
    @(posedge clk);
    penable <= 1;  // Access
    begin : w_wait
      // Wait for pready if needed (wrapper is 0 pull, but standard says wait)
      if (!pready) @(posedge clk);
    end
    @(posedge clk);
    psel <= 0;
    penable <= 0;
    pwrite <= 0;
  endtask

  task bus_read(input logic [31:0] addr, output logic [WIDTH-1:0] data);
    @(posedge clk);
    paddr <= addr;
    pwrite <= 0;
    psel <= 1;
    penable <= 0;  // Setup
    @(posedge clk);
    penable <= 1;  // Access
    @(posedge clk);
    // Wait for pready
    // Wait for pready
    while (!pready) begin
      @(posedge clk);
    end
    data = prdata;
    psel <= 0;
    penable <= 0;
  endtask

`elsif BUS_TYPE_WB
  // -------------------------------------------------------------------------
  // Wishbone B4 Interface
  // -------------------------------------------------------------------------
  logic [31:0] adr_i;
  logic [WIDTH-1:0] dat_i;
  logic [(WIDTH/8)-1:0] sel_i;
  logic we_i;
  logic cyc_i;
  logic stb_i;
  logic [WIDTH-1:0] dat_o;
  logic ack_o;
  logic rst_i;
  assign rst_i = ~rst_n;

  sp_memory_wb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) dut (
      .clk_i(clk),
      .rst_i(rst_i),
      .adr_i(adr_i),
      .dat_i(dat_i),
      .sel_i(sel_i),
      .we_i(we_i),
      .cyc_i(cyc_i),
      .stb_i(stb_i),
      .dat_o(dat_o),
      .ack_o(ack_o),
      .err_o(),
      .sleep(1'b0),
      .bist_en(1'b0),
      .bist_done(),
      .bist_pass(),
      .err_parity(),
      .err_ecc_single(),
      .err_ecc_double()
  );

  task bus_init;
    adr_i = 0;
    dat_i = 0;
    sel_i = 0;
    we_i  = 0;
    cyc_i = 0;
    stb_i = 0;
  endtask

  task bus_write(input logic [31:0] addr, input logic [WIDTH-1:0] data,
                 input logic [(WIDTH/8)-1:0] strb);
    @(posedge clk);
    adr_i <= addr;
    dat_i <= data;
    sel_i <= strb;
    we_i  <= 1;
    cyc_i <= 1;
    stb_i <= 1;
    @(posedge clk);
    while (!ack_o) begin
      @(posedge clk);
    end
    cyc_i <= 0;
    stb_i <= 0;
    we_i  <= 0;
  endtask

  task bus_read(input logic [31:0] addr, output logic [WIDTH-1:0] data);
    @(posedge clk);
    adr_i <= addr;
    we_i  <= 0;
    cyc_i <= 1;
    stb_i <= 1;
    sel_i <= '1;  // Read full width usually
    @(posedge clk);
    while (!ack_o) begin
      @(posedge clk);
    end
    data = dat_o;
    cyc_i <= 0;
    stb_i <= 0;
  endtask

`elsif BUS_TYPE_AHB
  // -------------------------------------------------------------------------
  // AHB-Lite Interface
  // -------------------------------------------------------------------------
  logic hsel;
  logic [31:0] haddr;
  logic [1:0] htrans;
  logic hwrite;
  logic [2:0] hsize;
  logic [2:0] hburst;
  logic [3:0] hprot;
  logic [WIDTH-1:0] hwdata;
  logic hreadyout;
  wire hready;
  assign hready = hreadyout;
  logic hresp;
  logic [WIDTH-1:0] hrdata;

  sp_memory_ahb #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) dut (
      .hclk(clk),
      .hresetn(rst_n),
      .hsel(hsel),
      .haddr(haddr),
      .htrans(htrans),
      .hwrite(hwrite),
      .hsize(hsize),
      .hburst(hburst),
      .hprot(hprot),
      .hwdata(hwdata),
      .hready(hready),
      .hreadyout(hreadyout),
      .hresp(hresp),
      .hrdata(hrdata),
      .sleep(1'b0),
      .bist_en(1'b0),
      .bist_done(),
      .bist_pass(),
      .err_parity(),
      .err_ecc_single(),
      .err_ecc_double()
  );

  task bus_init;
    hsel   = 0;
    haddr  = 0;
    htrans = 0;
    hwrite = 0;
    hsize  = 2;
    hburst = 0;
    hprot  = 0;
    hwdata = 0;
  endtask

  task bus_write(input logic [31:0] addr, input logic [WIDTH-1:0] data,
                 input logic [(WIDTH/8)-1:0] strb);
    // Address Phase
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    haddr  <= addr;
    hwrite <= 1;
    htrans <= 2'b10;  // NONSEQ
    hsel   <= 1;

    // Data Phase
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    hwdata <= data;
    haddr  <= 0;
    htrans <= 0;
    hsel   <= 0;
    hwrite <= 0;

    // Confirm Data Phase completion
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    hwdata <= 0;
  endtask

  task bus_read(input logic [31:0] addr, output logic [WIDTH-1:0] data);
    // Address Phase
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    haddr  <= addr;
    hwrite <= 0;
    htrans <= 2'b10;
    hsel   <= 1;

    // Data Phase
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    haddr  <= 0;
    htrans <= 0;
    hsel   <= 0;

    // Wait for end of data phase to sample
    @(posedge clk);
    while (!hreadyout) begin
      @(posedge clk);
    end
    data = hrdata;
  endtask

`elsif BUS_TYPE_AXI
  // -------------------------------------------------------------------------
  // AXI4-Lite Interface
  // -------------------------------------------------------------------------
  logic [31:0] awaddr;
  logic awvalid, awready;
  logic [WIDTH-1:0] wdata;
  logic [(WIDTH/8)-1:0] wstrb;
  logic wvalid, wready;
  logic [1:0] bresp;
  logic bvalid, bready;
  logic [31:0] araddr;
  logic arvalid, arready;
  logic [WIDTH-1:0] rdata_axi;
  logic [1:0] rresp;
  logic rvalid, rready;

  sp_memory_axi #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH),
      .TECHNOLOGY(TECHNOLOGY)
  ) dut (
      .aclk(clk),
      .aresetn(rst_n),
      .awaddr(awaddr),
      .awlen(8'b0),
      .awsize(3'b010),
      .awburst(2'b01),
      .awvalid(awvalid),
      .awready(awready),
      .awprot(3'b0),
      .wdata(wdata),
      .wstrb(wstrb),
      .wlast(1'b1),
      .wvalid(wvalid),
      .wready(wready),
      .bresp(bresp),
      .bvalid(bvalid),
      .bready(bready),
      .araddr(araddr),
      .arlen(8'b0),
      .arsize(3'b010),
      .arburst(2'b01),
      .arvalid(arvalid),
      .arready(arready),
      .arprot(3'b0),
      .rdata(rdata_axi),
      .rresp(rresp),
      .rlast(),
      .rvalid(rvalid),
      .rready(rready),
      .sleep(1'b0),
      .bist_en(1'b0),
      .bist_done(),
      .bist_pass(),
      .err_parity(),
      .err_ecc_single(),
      .err_ecc_double()
  );

  task bus_init;
    awaddr  = 0;
    awvalid = 0;
    wdata   = 0;
    wstrb   = 0;
    wvalid  = 0;
    bready  = 0;
    araddr  = 0;
    arvalid = 0;
    rready  = 0;
  endtask

  task bus_write(input logic [31:0] addr, input logic [WIDTH-1:0] data,
                 input logic [(WIDTH/8)-1:0] strb);
    // Simple non-overlapped write
    @(posedge clk);
    awaddr  <= addr;
    awvalid <= 1;
    wdata   <= data;
    wstrb   <= strb;
    wvalid  <= 1;
    bready  <= 1;

    fork
      begin : wait_aw
        @(posedge clk);
        while (!awready) begin
          @(posedge clk);
        end
        awvalid <= 0;
      end
      begin : wait_w
        @(posedge clk);
        while (!wready) begin
          @(posedge clk);
        end
        wvalid <= 0;
      end
    join

    while (!bvalid) begin
      @(posedge clk);
    end
    bready <= 0;
  endtask

  task bus_read(input logic [31:0] addr, output logic [WIDTH-1:0] data);
    @(posedge clk);
    araddr  <= addr;
    arvalid <= 1;
    rready  <= 1;

    @(posedge clk);
    while (!arready) begin
      @(posedge clk);
    end
    arvalid <= 0;

    while (!rvalid) begin
      @(posedge clk);
    end
    data = rdata_axi;
    rready <= 0;
  endtask

`endif

  // -------------------------------------------------------------------------
  // Main Test Sequence (Generic)
  // -------------------------------------------------------------------------
  task check(input logic [WIDTH-1:0] expected, input logic [WIDTH-1:0] actual, input string msg);
    if (expected !== actual) begin
      $display("ERROR: %s, Exp=0x%x Got=0x%x", msg, expected, actual);
      $finish;
    end else begin
      $display("PASS: %s, Got=0x%x", msg, actual);
    end
  endtask

  logic [WIDTH-1:0] pattern1;
  logic [WIDTH-1:0] pattern2;

  initial begin
    pattern1 = {(WIDTH / 32) {32'hDEADBEEF}};
    pattern2 = {(WIDTH / 32) {32'hCAFEBABE}};

    bus_init();
    rst_n = 0;
    repeat (5) @(posedge clk);
    rst_n = 1;
    repeat (5) @(posedge clk);

    $display("Starting Native Bus Test...");

    // 1. Basic Write
    $display("Test 1: Write Word to 0x10");
    bus_write(32'h10, pattern1, '1);

    // 2. Read Back
    $display("Test 2: Read Word from 0x10");
    bus_read(32'h10, read_data);
    check(pattern1, read_data, "Read 0x10");

    // 3. Write Another
    $display("Test 3: Write to 0x20");
    bus_write(32'h20, pattern2, '1);

    bus_read(32'h20, read_data);
    check(pattern2, read_data, "Read 0x20");

    // 4. Verify First Data Integrity
    bus_read(32'h10, read_data);
    check(pattern1, read_data, "Read 0x10 Again");

    $display("ALL TESTS PASSED.");
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sp_memory_bus);
  end

endmodule
