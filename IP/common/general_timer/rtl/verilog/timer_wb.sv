//
// General Purpose Timer Wishbone B4 Wrapper
//
// Description:
//   Wishbone Interface wrapper for the General Timer.
//

module timer_wb (
    input  logic        wb_clk_i,
    input  logic        wb_rst_i,

    // Wishbone Interface
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [31:0] wb_adr_i,
    /* verilator lint_on UNUSEDSIGNAL */
    input  logic [31:0] wb_dat_i,
    input  logic        wb_we_i,
    input  logic        wb_stb_i,
    input  logic        wb_cyc_i,
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [3:0]  wb_sel_i,
    /* verilator lint_on UNUSEDSIGNAL */
    output logic [31:0] wb_dat_o,
    output logic        wb_ack_o,
    output logic        wb_err_o,

    // External IO
    input  logic        ext_meas_i,
    input  logic        capture_i,
    output logic        pwm_o,
    output logic        trigger_o,

    output logic        irq
);

    // Internal Signals
    logic        cs, we, presetn;
    logic [5:0]  addr;
    logic [31:0] rdata;
    
    /* verilator lint_off UNUSEDSIGNAL */
    logic        en, mode, dir, pwm_en, ext_en, cap_en, pre_en, load_cmd;
    /* verilator lint_on UNUSEDSIGNAL */
    logic        core_irq_pulse, capture_stb, core_intr;
    logic [15:0] pre_val;
    logic [31:0] load_val, cmp_val, current_val, capture_val;
    logic        ack_q;

    assign presetn = ~wb_rst_i;
    assign wb_err_o = 1'b0;
    assign wb_dat_o = rdata;
    assign irq      = core_intr;

    assign cs   = wb_stb_i && wb_cyc_i;
    assign we   = wb_we_i;
    assign addr = wb_adr_i[5:0];
    
    assign wb_ack_o = ack_q;

    // ACK Logic (0-wait state, register output)
    always_ff @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ack_q <= 1'b0;
        end else begin
            if (wb_stb_i && wb_cyc_i && !ack_q) begin
                ack_q <= 1'b1;
            end else begin
                ack_q <= 1'b0;
            end
        end
    end

    // Register Instantiation
    timer_regs u_timer_regs (
        .clk(wb_clk_i),
        .rst_n(presetn),
        .cs(cs),
        .we(we),
        .addr(addr),
        .wdata(wb_dat_i),
        .rdata(rdata),
        
        .en(en),
        .mode(mode),
        .dir(dir),
        .pwm_en(pwm_en),
        .ext_en(ext_en),
        .cap_en(cap_en),
        .pre_en(pre_en),
        .pre_val(pre_val),
        .load_val(load_val),
        .cmp_val(cmp_val),
        .load_cmd(load_cmd),
        .current_val(current_val),
        .capture_val(capture_val),
        .capture_stb(capture_stb),
        .core_irq(core_irq_pulse),
        .intr_o(core_intr)
    );
        
    // Core Instantiation
    timer_core u_timer_core (
        .clk        (wb_clk_i),
        .rst_n      (presetn),
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
    
    default clocking cb_wb @(posedge wb_clk_i);
        default input #1step output #0;
        input wb_rst_i, wb_stb_i, wb_cyc_i, wb_ack_o;
    endclocking

    // Property: ACK implies STB and CYC
    property p_wb_ack_valid;
        disable iff (wb_rst_i)
        wb_ack_o |-> (wb_stb_i && wb_cyc_i);
    endproperty
    assert_wb_ack_valid: assert property (p_wb_ack_valid) else $error("WB SVA: ACK asserted without STB/CYC");
    
    // Property: STB implies CYC
    property p_wb_stb_cyc;
        disable iff (wb_rst_i)
        wb_stb_i |-> wb_cyc_i;
    endproperty
    assert_wb_stb_cyc: assert property (p_wb_stb_cyc) else $error("WB SVA: STB asserted without CYC");

    `endif // FORMAL

endmodule
