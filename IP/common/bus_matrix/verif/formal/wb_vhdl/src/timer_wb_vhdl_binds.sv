module bus_matrix_wb_vhdl_binds;
    bind bus_matrix_wb wb_props props_wb (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .adr_i(adr_i),
        .dat_i(dat_i),
        .we_i(we_i),
        .sel_i(sel_i),
        .stb_i(stb_i),
        .cyc_i(cyc_i),
        .dat_o(dat_o),
        .ack_o(ack_o)
    );
endmodule
