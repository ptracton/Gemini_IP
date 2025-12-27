//-------------------------------------------------------------------------------
// File: bridge_props.sv
// Description: SVA Properties for AHB-APB Bridge
//-------------------------------------------------------------------------------

module bridge_formal_props #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32
)(
    input  logic                  HCLK,
    input  logic                  HRESETn,
    input  logic                  HSEL,
    input  logic [ADDR_WIDTH-1:0] HADDR,
    input  logic [1:0]            HTRANS,
    input  logic                  HWRITE,
    input  logic                  HREADY,
    input  logic                  HREADYOUT,
    input  logic [1:0]            HRESP,
    
    input  logic [ADDR_WIDTH-1:0] PADDR,
    input  logic                  PENABLE,
    input  logic                  PWRITE,
    input  logic                  PSEL,
    input  logic                  PREADY,
    input  logic                  PSLVERR
);

    // --- APB Protocol Properties ---

    always @(posedge HCLK) begin
        if (HRESETn) begin
            // PSEL must stay high until PREADY is high
            if ($past(PSEL && !PREADY)) assert(PSEL);

            // PENABLE must be asserted one cycle after PSEL starts
            if ($past(PSEL && !$past(PSEL))) assert(PENABLE);

            // PENABLE must stay high until PREADY is high
            if ($past(PENABLE && !PREADY)) assert(PENABLE);

            // PADDR and PWRITE must be stable while PSEL is high and !PREADY
            if ($past(PSEL && !PREADY)) begin
                assert($stable(PADDR));
                assert($stable(PWRITE));
            end
        end
    end

    // --- AHB-APB Bridge Specific Properties ---

    always @(posedge HCLK) begin
        if (HRESETn) begin
            // HREADYOUT must be low during ACCESS until PREADY
            if (PENABLE && !PREADY) assert(!HREADYOUT);
            
            // HRESP must be ERROR if PSLVERR is high during ACCESS
            if (PENABLE && PREADY && PSLVERR) assert(HRESP == 2'b01);
        end
    end

    // --- Assumptions for Formal ---
    always @(posedge HCLK) begin
        if (HRESETn) begin
            // AHB protocol assumptions
            if (!PSEL) assume(HREADY);
            
            // Assume PREADY eventually happens (bounded by depth)
            // SMTBMC will find issues if it doesn't happen within 'depth'
        end
    end

endmodule
