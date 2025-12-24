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
    
    bind gpio_apb apb_props props_if (
        .pclk(pclk),
        .presetn(presetn),
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .pready(pready)
    );
endmodule
