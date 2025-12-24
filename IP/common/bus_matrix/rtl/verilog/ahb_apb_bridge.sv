module ahb_apb_bridge #(
    parameter int ADDR_WIDTH = 32,
    parameter int DATA_WIDTH = 32
)(
    input  logic                  HCLK,
    input  logic                  HRESETn,
    
    // AHB Slave Interface
    input  logic                  HSEL,
    input  logic [ADDR_WIDTH-1:0] HADDR,
    input  logic [1:0]            HTRANS,
    input  logic                  HWRITE,
    input  logic [2:0]            HSIZE,
    input  logic [2:0]            HBURST,
    input  logic [3:0]            HPROT,
    input  logic [DATA_WIDTH-1:0] HWDATA,
    input  logic                  HREADY,
    output logic                  HREADYOUT,
    output logic [1:0]            HRESP,
    output logic [DATA_WIDTH-1:0] HRDATA,
    
    // APB Master Interface
    output logic [ADDR_WIDTH-1:0] PADDR,
    output logic                  PENABLE,
    output logic                  PWRITE,
    output logic [DATA_WIDTH-1:0] PWDATA,
    output logic [3:0]            PSTRB, // Optional
    output logic [2:0]            PPROT,
    output logic                  PSEL,
    input  logic [DATA_WIDTH-1:0] PRDATA,
    input  logic                  PREADY,
    input  logic                  PSLVERR
);

    // Finite State Machine
    typedef enum logic [1:0] {
        IDLE,
        SETUP,
        ACCESS
    } state_t;
    
    state_t state, next_state;
    
    // Internal Registers for address phase capture
    logic [ADDR_WIDTH-1:0] addr_reg;
    logic                  write_reg;
    
    // State Sequential Logic
    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            state <= IDLE;
            addr_reg <= '0;
            write_reg <= '0;
        end else begin
            state <= next_state;
            
            // Capture Address Phase
            if (HSEL && HREADY && HTRANS[1] && state == IDLE) begin
                addr_reg <= HADDR;
                write_reg <= HWRITE;
            end
        end
    end
    
    // Next State Logic
    always_comb begin
        next_state = state;
        case (state)
            IDLE: begin
                if (HSEL && HREADY && HTRANS[1]) begin // NONSEQ or SEQ
                    next_state = SETUP;
                end
            end
            SETUP: begin
                next_state = ACCESS;
            end
            ACCESS: begin
                if (PREADY) begin
                    if (HSEL && HTRANS[1]) begin
                        next_state = SETUP; // Back-to-back transfer
                    end else begin
                        next_state = IDLE;
                    end
                end
            end
            default: next_state = IDLE;
        endcase
    end
    
    // Output Logic
    assign PSEL    = (state == SETUP) || (state == ACCESS);
    assign PENABLE = (state == ACCESS);
    assign PADDR   = addr_reg;
    assign PWRITE  = write_reg;
    assign PWDATA  = HWDATA; // Valid during data phase (SETUP/ACCESS)
    assign PPROT   = 3'b001; // Normal, Secure, Data (Simplified)
    assign PSTRB   = 4'b1111; // Assuming full word
    
    // AHB Outputs
    // HREADYOUT is low during ACCESS until PREADY is high
    assign HREADYOUT = (state == ACCESS) ? PREADY : 1'b1; // Idle and Setup are 0-wait
    assign HRDATA    = PRDATA;
    assign HRESP     = (state == ACCESS) && PSLVERR ? 2'b01 : 2'b00; // ERROR or OKAY

endmodule
