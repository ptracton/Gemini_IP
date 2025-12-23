//
// Native Testbench for Timer AXI Wrapper
//

module tb_timer_axi;

    logic        aclk;
    logic        aresetn;
    logic [31:0] awaddr;
    logic [2:0]  awprot;
    logic        awvalid;
    logic        awready;
    logic [31:0] wdata;
    logic [3:0]  wstrb;
    logic        wvalid;
    logic        wready;
    logic [1:0]  bresp;
    logic        bvalid;
    logic        bready;
    logic [31:0] araddr;
    logic [2:0]  arprot;
    logic        arvalid;
    logic        arready;
    logic [31:0] rdata;
    logic [1:0]  rresp;
    logic        rvalid;
    logic        rready;
    logic        irq;

    logic        ext_meas_i;
    logic        capture_i;
    logic        pwm_o;
    logic        trigger_o;

    // Clock
    initial begin
        aclk = 0;
        forever #5 aclk = ~aclk;
    end

    // DUT
    timer_axi dut (
        .aclk(aclk),
        .aresetn(aresetn),
        .awaddr(awaddr),
        .awprot(awprot),
        .awvalid(awvalid),
        .awready(awready),
        .wdata(wdata),
        .wstrb(wstrb),
        .wvalid(wvalid),
        .wready(wready),
        .bresp(bresp),
        .bvalid(bvalid),
        .bready(bready),
        .araddr(araddr),
        .arprot(arprot),
        .arvalid(arvalid),
        .arready(arready),
        .rdata(rdata),
        .rresp(rresp),
        .rvalid(rvalid),
        .rready(rready),
        .ext_meas_i(ext_meas_i),
        .capture_i(capture_i),
        .pwm_o(pwm_o),
        .trigger_o(trigger_o),
        .irq(irq)
    );

    // AXI Write Task (Simple)
    task axi_write(input [31:0] addr, input [31:0] data);
        begin
            @(posedge aclk);
            awaddr  <= addr;
            awvalid <= 1;
            wdata   <= data;
            wvalid  <= 1;
            wstrb   <= 4'hF;
            bready  <= 1; // Auto-ack response
            
            // Wait for address acceptance
            wait(awready);
            @(posedge aclk);
            awvalid <= 0;
            
            // Wait for data acceptance
            wait(wready);
            @(posedge aclk);
            wvalid <= 0;
            
            // Wait for response
            wait(bvalid);
            @(posedge aclk);
            bready <= 0;
        end
    endtask

    // AXI Read Task
    task axi_read(input [31:0] addr, output [31:0] data);
        begin
            @(posedge aclk);
            araddr  <= addr;
            arvalid <= 1;
            rready  <= 1;
            
            wait(arready);
            @(posedge aclk);
            arvalid <= 0;
            
            wait(rvalid);
            data = rdata;
            @(posedge aclk);
            rready <= 0;
        end
    endtask

    // Offsets
    localparam ADDR_CTRL    = 32'h00;
    localparam ADDR_LOAD    = 32'h04;
    localparam ADDR_INT_EN  = 32'h10;
    localparam ADDR_CMP     = 32'h18;
    
    logic [31:0] read_val;

    initial begin
        $dumpfile("dump_axi.vcd");
        $dumpvars(0, tb_timer_axi);

        aresetn = 0;
        awvalid = 0;
        awaddr  = 0;
        awprot  = 0;
        wvalid  = 0;
        wdata   = 0;
        wstrb   = 0;
        bready  = 0;
        arvalid = 0;
        araddr  = 0;
        arprot  = 0;
        rready  = 0;
        ext_meas_i = 0;
        capture_i = 0;
        
        repeat(10) @(posedge aclk);
        aresetn = 1;
        repeat(10) @(posedge aclk);

        $display("TEST 1: AXI Register R/W");
        axi_write(ADDR_LOAD, 32'hCAFEBABE);
        axi_read(ADDR_LOAD, read_val);
        
        if (read_val !== 32'hCAFEBABE) $error("AXI Read Mismatch: Got %h", read_val);
        else $display("AXI Read LOAD: PASS");

        // Test CMP R/W
        axi_write(ADDR_CMP, 32'h12345678);
        axi_read(ADDR_CMP, read_val);
        if (read_val !== 32'h12345678) $error("AXI Read CMP Mismatch: Got %h", read_val);
        else $display("AXI Read CMP: PASS");

        $display("TEST 2: Timer via AXI");
        axi_write(ADDR_LOAD, 32'd15);
        axi_write(ADDR_INT_EN, 32'd1);
        axi_write(ADDR_CTRL, 32'd1);

        wait(irq == 1);
        $display("AXI Interrupt Received");

        $display("AXI TESTS PASSED");
        $finish;
    end

endmodule
