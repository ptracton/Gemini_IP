//
// General Purpose Timer APB4 Wrapper
//
// Description:
//   APB4 Interface wrapper for the General Timer.
//   Bridges APB bus signals to the generic internal register interface.
//

module timer_apb (
    input  logic        pclk,
    input  logic        presetn,

    // APB Interface
    /* verilator lint_off UNUSEDSIGNAL */
    input  logic [31:0] paddr,
    input  logic [2:0]  pprot,
    input  logic        psel,
    input  logic        penable,
    input  logic        pwrite,
    input  logic [31:0] pwdata,
    input  logic [3:0]  pstrb,
    /* verilator lint_on UNUSEDSIGNAL */
    output logic        pready,
    output logic [31:0] prdata,
    output logic        pslverr,

    // External IO
    input  logic        ext_meas_i,
    input  logic        capture_i,
    output logic        pwm_o,
    output logic        trigger_o,

    output logic        irq
);

    // Internal Signals
    logic        cs, we;
    logic [5:0]  addr;
    logic [31:0] rdata;
    
    // Core/Reg Interconnect
    logic        en, mode, dir, pwm_en, ext_en, pre_en, load_cmd;
    logic [15:0] pre_val;
    logic [31:0] load_val, cmp_val, current_val, capture_val;
    logic        core_irq_pulse, capture_stb;
    
    /* verilator lint_off UNUSEDSIGNAL */
    logic        unused_cap_en;
    /* verilator lint_on UNUSEDSIGNAL */
    logic        core_intr;

    assign pready  = 1'b1; // Zero-wait state
    assign pslverr = 1'b0;
    assign prdata  = rdata;
    assign irq     = core_intr;
    
    assign cs   = psel && penable;
    assign we   = pwrite;
    assign addr = paddr[5:0];

    // Register Block Instantiation
    timer_regs u_timer_regs (
        .clk(pclk),
        .rst_n(presetn),
        .cs(cs),
        .we(we),
        .addr(addr),
        .wdata(pwdata),
        .rdata(rdata),
        
        .en(en),
        .mode(mode),
        .dir(dir),
        .pwm_en(pwm_en),
        .ext_en(ext_en),
        .cap_en(unused_cap_en),
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
        .clk(pclk),
        .rst_n(presetn),
        
        .en(en),
        .mode(mode),
        .dir(dir),
        .pwm_en(pwm_en),
        .ext_en(ext_en),
        .pre_en(pre_en),
        .pre_val(pre_val),
        .load_val(load_val),
        .cmp_val(cmp_val),
        .load_cmd(load_cmd),
        
        .ext_meas_i(ext_meas_i),
        .capture_i(capture_i),
        
        .current_val(current_val),
        .capture_val(capture_val),
        .capture_stb(capture_stb),
        .pwm_o(pwm_o),
        .trigger_o(trigger_o),
        .irq(core_irq_pulse)
    );

endmodule

