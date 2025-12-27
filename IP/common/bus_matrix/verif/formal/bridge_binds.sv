//-------------------------------------------------------------------------------
// File: bridge_binds.sv
// Description: Formal Binds for AHB-APB Bridge
//-------------------------------------------------------------------------------

module bridge_formal_bind;
    bind ahb_apb_bridge bridge_formal_props #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) props_inst (
        .*
    );
endmodule
