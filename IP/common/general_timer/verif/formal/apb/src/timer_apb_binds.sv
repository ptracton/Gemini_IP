module timer_apb_binds;
    bind timer_apb apb_props props_apb (
        .pclk(pclk),
        .presetn(presetn),
        .psel(psel),
        .penable(penable),
        .pready(pready)
    );
endmodule
