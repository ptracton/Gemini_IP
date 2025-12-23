//
// General Purpose Timer AXI4-Lite Wrapper
//
// Description:
//   AXI4-Lite Interface wrapper for the General Timer.
//

module timer_axi (
    input  logic        aclk,
    input  logic        aresetn,

    // AXI4-Lite Write Address
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [31:0] awaddr,
    input  logic [2:0]  awprot,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        awvalid,
    output logic        awready,

    // AXI4-Lite Write Data
    input  logic [31:0] wdata,
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [3:0]  wstrb,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        wvalid,
    output logic        wready,

    // AXI4-Lite Write Response
    output logic [1:0]  bresp,
    output logic        bvalid,
    input  logic        bready,

    // AXI4-Lite Read Address
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [31:0] araddr,
    input  logic [2:0]  arprot,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic        arvalid,
    output logic        arready,

    // AXI4-Lite Read Data
    output logic [31:0] rdata,
    output logic [1:0]  rresp,
    output logic        rvalid,
    input  logic        rready,

    // External IO
    input  logic        ext_meas_i,
    input  logic        capture_i,
    output logic        pwm_o,
    output logic        trigger_o,

    // Interrupt
    output logic        irq
);

    // Internal signals
    logic cs, we;
    logic [5:0] addr;
    logic [31:0] reg_rdata;
    
    /* verilator lint_off UNUSEDSIGNAL */
    logic en, mode, dir, pwm_en, ext_en, cap_en, pre_en, load_cmd, core_irq_pulse, capture_stb, core_intr;
    /* verilator lint_on UNUSEDSIGNAL */
    logic [15:0] pre_val;
    logic [31:0] load_val, cmp_val, current_val, capture_val;
    
    // AXI State signals
    // logic aw_en; // Removed unused signal
    // State Machine / Handshaking
    
    // Write Channel
    always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            awready <= 1'b0;
            wready  <= 1'b0;
            bvalid  <= 1'b0;
            bresp   <= 2'b00;
        end else begin
            // Address Handshake
            if (awvalid && !awready) awready <= 1'b1;
            else awready <= 1'b0;
            
            // Data Handshake
            if (wvalid && !wready) wready <= 1'b1;
            else wready <= 1'b0;
            
            // Response Handshake
            if (awready && awvalid && wready && wvalid && !bvalid) begin
                bvalid <= 1'b1;
                bresp  <= 2'b00; // OKAY
            end else if (bready && bvalid) begin
                bvalid <= 1'b0;
            end
        end
    end

    // Read Channel
    always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            arready <= 1'b0;
            rvalid  <= 1'b0;
            rresp   <= 2'b00;
        end else begin
            // Read Address Handshake
            if (arvalid && !arready) arready <= 1'b1;
            else arready <= 1'b0;
            
            // Read Data Handshake
            if (arready && arvalid && !rvalid) begin
                rvalid <= 1'b1;
                rresp  <= 2'b00; // OKAY
            end else if (rready && rvalid) begin
                rvalid <= 1'b0;
            end
        end
    end

    // Address and Data Routing
    /* verilator lint_off UNUSEDSIGNAL */
    logic [31:0] axi_addr;
    /* verilator lint_on UNUSEDSIGNAL */
    always_comb begin
        if (awvalid) axi_addr = awaddr;
        else         axi_addr = araddr;
    end
    
    assign addr   = axi_addr[5:0];
    // CS generation: High when address/data valid handshake occurs for write, or address valid for read
    // Note: This logic assumes single cycle access for registers
    assign cs     = (awready && awvalid && wready && wvalid) || (arready && arvalid); 
    assign we     = (awready && awvalid && wready && wvalid);
    
    // Latch Read Data
    logic [31:0] rdata_q;
    always_ff @(posedge aclk) begin
        if (arready && arvalid) begin
            rdata_q <= reg_rdata;
        end
    end
    assign rdata = rdata_q; 

    // Assign interrupt
    assign irq = core_intr;

    // Instantiate Registers
    timer_regs u_timer_regs (
        .clk        (aclk),
        .rst_n      (aresetn),
        .cs         (cs),
        .we         (we),
        .addr       (addr),
        .wdata      (wdata),
        .rdata      (reg_rdata),
        .en         (en),
        .mode       (mode),
        .dir        (dir),
        .pwm_en     (pwm_en),
        .ext_en     (ext_en),
        .cap_en     (cap_en),
        .pre_en     (pre_en),
        .pre_val    (pre_val),
        .load_val   (load_val),
        .cmp_val    (cmp_val),
        .load_cmd   (load_cmd),
        .current_val(current_val),
        .capture_val(capture_val),
        .capture_stb(capture_stb),
        .core_irq   (core_irq_pulse),
        .intr_o     (core_intr)
    );

    // Instantiate Timer Core
    timer_core u_timer_core (
        .clk        (aclk),
        .rst_n      (aresetn),
        .en         (en),
        .mode       (mode),
        .dir        (dir),
        .pwm_en     (pwm_en),
        .ext_en     (ext_en),
        .pre_en     (pre_en),
        .pre_val    (pre_val),
        .load_val   (load_val),
        .cmp_val    (cmp_val),
        .load_cmd   (load_cmd),
        .ext_meas_i (ext_meas_i),
        .capture_i  (capture_i),
        .current_val(current_val),
        .capture_val(capture_val),
        .capture_stb(capture_stb),
        .pwm_o      (pwm_o),
        .trigger_o  (trigger_o),
        .irq        (core_irq_pulse)
    );

    // -------------------------------------------------------------------------
    // SystemVerilog Assertions (SVA)
    // -------------------------------------------------------------------------
    `ifdef FORMAL
    
    default clocking cb @(posedge aclk);
        default input #1step output #0;
        input aresetn, awvalid, awready, wvalid, wready, bvalid, bready;
        input arvalid, arready, rvalid, rready, awaddr, wdata, araddr;
    endclocking

    // Property: AWVALID Stability (Must stay high until AWREADY)
    property p_awvalid_stable;
        disable iff (!aresetn)
        (awvalid && !awready) |=> (awvalid && $stable(awaddr));
    endproperty
    assert_awvalid_stable: assert property (p_awvalid_stable) else $error("AXI SVA: AWVALID dropped before AWREADY");

    // Property: WVALID Stability
    property p_wvalid_stable;
        disable iff (!aresetn)
        (wvalid && !wready) |=> (wvalid && $stable(wdata));
    endproperty
    assert_wvalid_stable: assert property (p_wvalid_stable) else $error("AXI SVA: WVALID dropped before WREADY");

    // Property: BVALID Handshake (Must stay high until BREADY)
    property p_bvalid_stable;
        disable iff (!aresetn)
        (bvalid && !bready) |=> bvalid;
    endproperty
    assert_bvalid_stable: assert property (p_bvalid_stable) else $error("AXI SVA: BVALID dropped before BREADY");

    // Property: ARVALID Stability
    property p_arvalid_stable;
        disable iff (!aresetn)
        (arvalid && !arready) |=> (arvalid && $stable(araddr));
    endproperty
    assert_arvalid_stable: assert property (p_arvalid_stable) else $error("AXI SVA: ARVALID dropped before ARREADY");

    // Property: RVALID Handshake
    property p_rvalid_stable;
        disable iff (!aresetn)
        (rvalid && !rready) |=> rvalid;
    endproperty
    assert_rvalid_stable: assert property (p_rvalid_stable) else $error("AXI SVA: RVALID dropped before RREADY");

    `endif // FORMAL

endmodule
