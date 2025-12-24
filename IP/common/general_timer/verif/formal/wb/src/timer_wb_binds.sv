module timer_wb_binds;
    bind timer_wb wb_props props_wb (
        .clk(wb_clk_i),
        .rst(wb_rst_i),
        .stb(wb_stb_i),
        .cyc(wb_cyc_i),
        .ack(wb_ack_o)
    );
endmodule
