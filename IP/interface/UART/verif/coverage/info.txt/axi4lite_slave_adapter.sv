//      // verilator_coverage annotation
        //------------------------------------------------------------------------------
        // File: axi4lite_slave_adapter.sv
        // Description: Generic AXI4-Lite Slave Adapter.
        // Converts AXI4-Lite transactions into a simple native register bus.
        //
        // Author: Gemini-3 AI
        // License: MIT
        //------------------------------------------------------------------------------
        
        module axi4lite_slave_adapter #(
            parameter int ADDR_WIDTH = 32,
            parameter int DATA_WIDTH = 32
        ) (
            // AXI4-Lite Interface
%000000     input logic aclk,
%000000     input logic aresetn,
        
            // Write Address Channel
%000000     input  logic [ADDR_WIDTH-1:0] s_axi_awaddr,
            // verilator lint_off UNUSEDSIGNAL
%000000     input  logic [           2:0] s_axi_awprot,
            // verilator lint_on UNUSEDSIGNAL
%000000     input  logic                  s_axi_awvalid,
%000000     output logic                  s_axi_awready,
        
            // Write Data Channel
%000000     input  logic [    DATA_WIDTH-1:0] s_axi_wdata,
%000000     input  logic [(DATA_WIDTH/8)-1:0] s_axi_wstrb,
%000000     input  logic                      s_axi_wvalid,
%000000     output logic                      s_axi_wready,
        
            // Write Response Channel
%000000     output logic [1:0] s_axi_bresp,
%000000     output logic       s_axi_bvalid,
%000000     input  logic       s_axi_bready,
        
            // Read Address Channel
%000000     input  logic [ADDR_WIDTH-1:0] s_axi_araddr,
            // verilator lint_off UNUSEDSIGNAL
%000000     input  logic [           2:0] s_axi_arprot,
            // verilator lint_on UNUSEDSIGNAL
%000000     input  logic                  s_axi_arvalid,
%000000     output logic                  s_axi_arready,
        
            // Read Data Channel
%000000     output logic [DATA_WIDTH-1:0] s_axi_rdata,
%000000     output logic [           1:0] s_axi_rresp,
%000000     output logic                  s_axi_rvalid,
%000000     input  logic                  s_axi_rready,
        
            // Native Register Bus
%000000     output logic [    ADDR_WIDTH-1:0] reg_addr,
%000000     output logic [    DATA_WIDTH-1:0] reg_wdata,
%000000     input  logic [    DATA_WIDTH-1:0] reg_rdata,
%000000     output logic                      reg_we,
%000000     output logic                      reg_re,
%000000     output logic [(DATA_WIDTH/8)-1:0] reg_be
        );
        
          // Internal State
%000000   logic aw_en;
        
          // Write Address & Data Handshake
%000000   always_ff @(posedge aclk or negedge aresetn) begin
%000000     if (!aresetn) begin
%000000       s_axi_awready <= 1'b0;
%000000       aw_en <= 1'b1;
%000000     end else begin
%000000       if (~s_axi_awready && s_axi_awvalid && s_axi_wvalid && aw_en) begin
%000000         s_axi_awready <= 1'b1;
%000000         aw_en <= 1'b0;
%000000       end else if (s_axi_bready && s_axi_bvalid) begin
%000000         aw_en <= 1'b1;
%000000         s_axi_awready <= 1'b0;
%000000       end else begin
%000000         s_axi_awready <= 1'b0;
              end
            end
          end
        
%000000   always_ff @(posedge aclk or negedge aresetn) begin
%000000     if (!aresetn) begin
%000000       s_axi_wready <= 1'b0;
%000000     end else begin
%000000       if (~s_axi_wready && s_axi_wvalid && s_axi_awvalid && aw_en) begin
%000000         s_axi_wready <= 1'b1;
%000000       end else begin
%000000         s_axi_wready <= 1'b0;
              end
            end
          end
        
          // Write Response
%000000   always_ff @(posedge aclk or negedge aresetn) begin
%000000     if (!aresetn) begin
%000000       s_axi_bvalid <= 1'b0;
%000000       s_axi_bresp  <= 2'b0;
%000000     end else begin
%000000       if (s_axi_awready && s_axi_awvalid && s_axi_wready && s_axi_wvalid && ~s_axi_bvalid) begin
%000000         s_axi_bvalid <= 1'b1;
%000000         s_axi_bresp  <= 2'b0;
%000000       end else if (s_axi_bready && s_axi_bvalid) begin
%000000         s_axi_bvalid <= 1'b0;
              end
            end
          end
        
          // Read Address Handshake
%000000   always_ff @(posedge aclk or negedge aresetn) begin
%000000     if (!aresetn) begin
%000000       s_axi_arready <= 1'b0;
%000000     end else begin
%000000       if (~s_axi_arready && s_axi_arvalid && ~s_axi_rvalid) begin
%000000         s_axi_arready <= 1'b1;
%000000       end else begin
%000000         s_axi_arready <= 1'b0;
              end
            end
          end
        
          // Read Data & Response
%000000   logic [DATA_WIDTH-1:0] rdata_reg;
        
%000000   always_ff @(posedge aclk or negedge aresetn) begin
%000000     if (!aresetn) begin
%000000       s_axi_rvalid <= 1'b0;
%000000       s_axi_rresp  <= 2'b0;
%000000       rdata_reg    <= '0;
%000000     end else begin
%000000       if (s_axi_arready && s_axi_arvalid && ~s_axi_rvalid) begin
%000000         s_axi_rvalid <= 1'b1;
%000000         s_axi_rresp  <= 2'b0;
%000000         rdata_reg    <= reg_rdata; // Capture data from slave
%000000       end else if (s_axi_rready && s_axi_rvalid) begin
%000000         s_axi_rvalid <= 1'b0;
              end
            end
          end
        
          // Output Assignments (Native Bus)
          assign reg_we    = s_axi_wready && s_axi_wvalid && s_axi_awready && s_axi_awvalid;
%000000   assign reg_addr  = reg_we ? s_axi_awaddr : s_axi_araddr;
          assign reg_wdata = s_axi_wdata;
          assign reg_be    = s_axi_wstrb;
          assign reg_re    = s_axi_arready && s_axi_arvalid;
        
          // Read Data Output
          assign s_axi_rdata = rdata_reg;
        
        endmodule
        
