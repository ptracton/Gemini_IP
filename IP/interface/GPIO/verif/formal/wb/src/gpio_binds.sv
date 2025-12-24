module gpio_binds;
    bind gpio_regs gpio_regs_props #(
        .NUM_BITS(32)
    ) props (
        .clk(clk),
        .reset_n(reset_n),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata),
        .we(we),
        .re(re),
        .ack(ack),
        .reg_data_o(reg_data_o),
        .reg_dir(reg_dir)
    );
    
    bind gpio_wb wb_props props_if (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_stb_i(wb_stb_i),
        .wb_ack_o(wb_ack_o)
    );
endmodule
