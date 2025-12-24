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
    
    bind gpio_axi axi_props props_if (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready)
    );
endmodule
