//-------------------------------------------------------------------------------
// File: bus_matrix_binds.sv
// Description: Formal Binds for Bus Matrix IP
//-------------------------------------------------------------------------------

module bus_matrix_axi_bind;
    bind bus_matrix_axi axi_matrix_props #(
        .N_MASTERS(N_MASTERS),
        .M_SLAVES(M_SLAVES)
    ) props_axi (
        .aclk(aclk),
        .aresetn(aresetn),
        .awvalid_i(awvalid_i),
        .awready_o(awready_o),
        .awprot_i(awprot_i),
        .arvalid_i(arvalid_i),
        .arready_o(arready_o),
        .arprot_i(arprot_i),
        .slave_aw_gnt_vector(slave_aw_gnt_vector),
        .slave_ar_gnt_vector(slave_ar_gnt_vector),
        .region_secures('0) // Placeholder or bound if internal
    );
endmodule

module bus_matrix_ahb_bind;
    bind bus_matrix_ahb ahb_matrix_props #(
        .N_MASTERS(N_MASTERS),
        .M_SLAVES(M_SLAVES)
    ) props_ahb (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSEL_i('0), // Not directly used in props yet
        .HTRANS_i(HTRANS_i),
        .HREADYOUT_o(HREADYOUT_o),
        .slave_gnt_vector_addr(slave_gnt_vector_addr)
    );
endmodule

module bus_matrix_wb_bind;
    bind bus_matrix_wb wb_matrix_props #(
        .N_MASTERS(N_MASTERS),
        .M_SLAVES(M_SLAVES)
    ) props_wb (
        .clk(clk),
        .rst_n(rst_n),
        .wb_cyc_i(wb_cyc_i),
        .wb_stb_i(wb_stb_i),
        .wb_ack_o(wb_ack_o),
        .slave_gnt_vector(slave_gnt_vector)
    );
endmodule
