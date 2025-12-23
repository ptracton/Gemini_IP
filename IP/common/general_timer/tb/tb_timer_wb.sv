//
// Native Testbench for Timer Wishbone Wrapper
//

module tb_timer_wb;

    logic        wb_clk_i;
    logic        wb_rst_i;
    logic [31:0] wb_adr_i;
    logic [31:0] wb_dat_i;
    logic        wb_we_i;
    logic        wb_stb_i;
    logic        wb_cyc_i;
    logic [3:0]  wb_sel_i;
    logic [31:0] wb_dat_o;
    logic        wb_ack_o;
    logic        wb_err_o;
    logic        irq;

    logic        ext_meas_i;
    logic        capture_i;
    logic        pwm_o;
    logic        trigger_o;

    // Clock
    initial begin
        wb_clk_i = 0;
        forever #5 wb_clk_i = ~wb_clk_i;
    end

    // DUT
    timer_wb dut (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_adr_i(wb_adr_i),
        .wb_dat_i(wb_dat_i),
        .wb_we_i(wb_we_i),
        .wb_stb_i(wb_stb_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_sel_i(wb_sel_i),
        .wb_dat_o(wb_dat_o),
        .wb_ack_o(wb_ack_o),
        .wb_err_o(wb_err_o),
        .ext_meas_i(ext_meas_i),
        .capture_i(capture_i),
        .pwm_o(pwm_o),
        .trigger_o(trigger_o),
        .irq(irq)
    );

    // WB Write Task
    task wb_write(input [31:0] addr, input [31:0] data);
        begin
            @(posedge wb_clk_i);
            wb_adr_i <= addr;
            wb_dat_i <= data;
            wb_we_i  <= 1;
            wb_stb_i <= 1;
            wb_cyc_i <= 1;
            wb_sel_i <= 4'hF;
            
            wait(wb_ack_o);
            @(posedge wb_clk_i);
            wb_stb_i <= 0;
            wb_cyc_i <= 0;
            wb_we_i  <= 0;
        end
    endtask

    // WB Read Task
    task wb_read(input [31:0] addr, output [31:0] data);
        begin
            @(posedge wb_clk_i);
            wb_adr_i <= addr;
            wb_we_i  <= 0;
            wb_stb_i <= 1;
            wb_cyc_i <= 1;
            wb_sel_i <= 4'hF;
            
            wait(wb_ack_o);
            data = wb_dat_o;
            @(posedge wb_clk_i);
            wb_stb_i <= 0;
            wb_cyc_i <= 0;
        end
    endtask

    localparam ADDR_CTRL    = 32'h00;
    localparam ADDR_LOAD    = 32'h04;
    localparam ADDR_INT_EN  = 32'h10;
    localparam ADDR_CMP     = 32'h18;
    
    logic [31:0] read_val;

    initial begin
        $dumpfile("dump_wb.vcd");
        $dumpvars(0, tb_timer_wb);

        wb_rst_i = 1;
        wb_stb_i = 0;
        wb_cyc_i = 0;
        wb_we_i  = 0;
        ext_meas_i = 0;
        capture_i = 0;
        
        repeat(10) @(posedge wb_clk_i);
        wb_rst_i = 0;
        repeat(10) @(posedge wb_clk_i);

        $display("TEST 1: WB Register R/W");
        wb_write(ADDR_LOAD, 32'hFEEDFACE);
        wb_read(ADDR_LOAD, read_val);
        
        if (read_val !== 32'hFEEDFACE) $error("WB Read Mismatch: Got %h", read_val);
        else $display("WB Read LOAD: PASS");

        // Test CMP R/W
        wb_write(ADDR_CMP, 32'hBAADF00D);
        wb_read(ADDR_CMP, read_val);
        if (read_val !== 32'hBAADF00D) $error("WB Read CMP Mismatch: Got %h", read_val);
        else $display("WB Read CMP: PASS");

        $display("TEST 2: Timer via WB");
        wb_write(ADDR_LOAD, 32'd20);
        wb_write(ADDR_INT_EN, 32'd1);
        wb_write(ADDR_CTRL, 32'd1);

        wait(irq == 1);
        $display("WB Interrupt Received");

        $display("WB TESTS PASSED");
        $finish;
    end

endmodule
