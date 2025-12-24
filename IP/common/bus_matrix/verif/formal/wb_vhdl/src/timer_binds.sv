//-------------------------------------------------------------------------------
// File: bus_matrix_binds.sv
// Description: Bind file for formal verification of Bus Matrix IP
//-------------------------------------------------------------------------------

module bus_matrix_binds;

    // Bind properties to bus_matrix_core
    bind bus_matrix_core bus_matrix_core_props props_core (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .mode(mode),
        .dir(dir),
        .pre_en(pre_en),
        .pre_val(pre_val),
        .load_val(load_val),
        .load_cmd(load_cmd),
        .counter(counter),
        .tick(tick),
        .irq(irq),
        .trigger_o(trigger_o),
        .capture_re(capture_re),
        .capture_stb(capture_stb),
        .capture_val(capture_val),
        .pwm_en(pwm_en),
        .cmp_val(cmp_val),
        .pwm_o(pwm_o)
    );

    // Bind properties to bus_matrix_regs
    bind bus_matrix_regs bus_matrix_regs_props props_regs (
        .clk(clk),
        .rst_n(rst_n),
        .cs(cs),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata),
        .reg_ctrl(reg_ctrl),
        .reg_load(reg_load),
        .current_val(current_val)
    );

    // Note: Bus interface props will be bound in specific SBY tasks 
    // to match individual top levels (bus_matrix_axi, bus_matrix_apb, bus_matrix_wb)

endmodule
