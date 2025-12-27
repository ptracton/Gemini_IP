/*
 * File: tb_bus_matrix.sv
 * Description: Bus Matrix UVM Top (With Valid Region Map)
 */

module tb_bus_matrix;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import bus_matrix_pkg::*;
  import bus_matrix_env_pkg::*;
  import axi_agent_pkg::*;
  import ahb_agent_pkg::*;
  import wb_agent_pkg::*;
  import bus_matrix_test_pkg::*;

  // Clock and Reset
  logic clk;
  logic resetn;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    resetn = 0;
    #20 resetn = 1;
  end

  // Memory Map
  localparam region_attr_t [1:0] REGIONS = '{
      '{start_addr: 32'h0000_0000, end_addr: 32'h0FFF_FFFF, secure_only: 1'b0, read_only: 1'b0},
      '{start_addr: 32'h1000_0000, end_addr: 32'h1FFF_FFFF, secure_only: 1'b1, read_only: 1'b0}
  };
  localparam logic [131:0] REGIONS_FLAT = {REGIONS[1], REGIONS[0]};

  // Master Interfaces
  axi_if m_axi_if_0 (
      clk,
      resetn
  );
  axi_if m_axi_if_1 (
      clk,
      resetn
  );
  ahb_if m_ahb_if_0 (
      clk,
      resetn
  );
  ahb_if m_ahb_if_1 (
      clk,
      resetn
  );
  wb_if m_wb_if_0 (
      clk,
      resetn
  );
  wb_if m_wb_if_1 (
      clk,
      resetn
  );

  // Slave Interfaces
  ahb_if s_ahb_if_0 (
      clk,
      resetn
  );
  ahb_if s_ahb_if_1 (
      clk,
      resetn
  );
  axi_if s_axi_if_0 (
      clk,
      resetn
  );
  axi_if s_axi_if_1 (
      clk,
      resetn
  );
  wb_if s_wb_if_0 (
      clk,
      resetn
  );
  wb_if s_wb_if_1 (
      clk,
      resetn
  );

  // AHB Matrix Instance
  bus_matrix_ahb #(
      .N_MASTERS(2),
      .M_SLAVES(2),
      .REGION_MAP_FLAT(REGIONS_FLAT)
  ) dut_ahb (
      .HCLK(clk),
      .HRESETn(resetn),
      // Master Ports
      .HADDR_i({m_ahb_if_1.haddr, m_ahb_if_0.haddr}),
      .HTRANS_i({m_ahb_if_1.htrans, m_ahb_if_0.htrans}),
      .HWRITE_i({m_ahb_if_1.hwrite, m_ahb_if_0.hwrite}),
      .HSIZE_i({m_ahb_if_1.hsize, m_ahb_if_0.hsize}),
      .HBURST_i({m_ahb_if_1.hburst, m_ahb_if_0.hburst}),
      .HSEL_i({m_ahb_if_1.hsel, m_ahb_if_0.hsel}),
      .HWDATA_i({m_ahb_if_1.hwdata, m_ahb_if_0.hwdata}),
      // Returns to Masters
      .HRDATA_o({m_ahb_if_1.hrdata, m_ahb_if_0.hrdata}),
      .HREADYOUT_o({m_ahb_if_1.hready, m_ahb_if_0.hready}),
      .HRESP_o({m_ahb_if_1.hresp, m_ahb_if_0.hresp}),
      .HPROT_i({m_ahb_if_1.hprot, m_ahb_if_0.hprot}),
      // Ports to Slaves
      .HSEL_o({s_ahb_if_1.hsel, s_ahb_if_0.hsel}),
      .HADDR_o({s_ahb_if_1.haddr, s_ahb_if_0.haddr}),
      .HTRANS_o({s_ahb_if_1.htrans, s_ahb_if_0.htrans}),
      .HWRITE_o({s_ahb_if_1.hwrite, s_ahb_if_0.hwrite}),
      .HWDATA_o({s_ahb_if_1.hwdata, s_ahb_if_0.hwdata}),
      .HREADY_i({s_ahb_if_1.hready, s_ahb_if_0.hready}),
      .HRESP_i({s_ahb_if_1.hresp, s_ahb_if_0.hresp}),
      .HRDATA_i({s_ahb_if_1.hrdata, s_ahb_if_0.hrdata})
  );

  // AXI Matrix Instance (Pipelined)
  bus_matrix_axi #(
      .N_MASTERS(2),
      .M_SLAVES(2),
      .REGION_MAP_FLAT(REGIONS_FLAT),
      .INPUT_PIPE_STAGES(1),
      .OUTPUT_PIPE_STAGES(1)
  ) dut_axi (
      .aclk(clk),
      .aresetn(resetn),
      // Master Ports
      .awaddr_i({m_axi_if_1.awaddr, m_axi_if_0.awaddr}),
      .awprot_i({m_axi_if_1.awprot, m_axi_if_0.awprot}),
      .awvalid_i({m_axi_if_1.awvalid, m_axi_if_0.awvalid}),
      .awready_o({m_axi_if_1.awready, m_axi_if_0.awready}),
      .wdata_i({m_axi_if_1.wdata, m_axi_if_0.wdata}),
      .wstrb_i({m_axi_if_1.wstrb, m_axi_if_0.wstrb}),
      .wvalid_i({m_axi_if_1.wvalid, m_axi_if_0.wvalid}),
      .wready_o({m_axi_if_1.wready, m_axi_if_0.wready}),
      .bresp_o({m_axi_if_1.bresp, m_axi_if_0.bresp}),
      .bvalid_o({m_axi_if_1.bvalid, m_axi_if_0.bvalid}),
      .bready_i({m_axi_if_1.bready, m_axi_if_0.bready}),
      .araddr_i({m_axi_if_1.araddr, m_axi_if_0.araddr}),
      .arprot_i({m_axi_if_1.arprot, m_axi_if_0.arprot}),
      .arvalid_i({m_axi_if_1.arvalid, m_axi_if_0.arvalid}),
      .arready_o({m_axi_if_1.arready, m_axi_if_0.arready}),
      .rdata_o({m_axi_if_1.rdata, m_axi_if_0.rdata}),
      .rresp_o({m_axi_if_1.rresp, m_axi_if_0.rresp}),
      .rvalid_o({m_axi_if_1.rvalid, m_axi_if_0.rvalid}),
      .rready_i({m_axi_if_1.rready, m_axi_if_0.rready}),
      // Slave Ports
      .s_awaddr_o({s_axi_if_1.awaddr, s_axi_if_0.awaddr}),
      .s_awvalid_o({s_axi_if_1.awvalid, s_axi_if_0.awvalid}),
      .s_awready_i({s_axi_if_1.awready, s_axi_if_0.awready}),
      .s_wdata_o({s_axi_if_1.wdata, s_axi_if_0.wdata}),
      .s_wvalid_o({s_axi_if_1.wvalid, s_axi_if_0.wvalid}),
      .s_wready_i({s_axi_if_1.wready, s_axi_if_0.wready}),
      .s_bresp_i({s_axi_if_1.bresp, s_axi_if_0.bresp}),
      .s_bvalid_i({s_axi_if_1.bvalid, s_axi_if_0.bvalid}),
      .s_bready_o({s_axi_if_1.bready, s_axi_if_0.bready}),
      .s_araddr_o({s_axi_if_1.araddr, s_axi_if_0.araddr}),
      .s_arvalid_o({s_axi_if_1.arvalid, s_axi_if_0.arvalid}),
      .s_arready_i({s_axi_if_1.arready, s_axi_if_0.arready}),
      .s_rdata_i({s_axi_if_1.rdata, s_axi_if_0.rdata}),
      .s_rresp_i({s_axi_if_1.rresp, s_axi_if_0.rresp}),
      .s_rvalid_i({s_axi_if_1.rvalid, s_axi_if_0.rvalid}),
      .s_rready_o({s_axi_if_1.rready, s_axi_if_0.rready})
  );

  // Wishbone Matrix Instance
  bus_matrix_wb #(
      .N_MASTERS(2),
      .M_SLAVES(2),
      .REGION_MAP_FLAT(REGIONS_FLAT)
  ) dut_wb (
      .clk(clk),
      .rst_n(resetn),
      // Master Ports
      .wb_cyc_i({m_wb_if_1.cyc, m_wb_if_0.cyc}),
      .wb_stb_i({m_wb_if_1.stb, m_wb_if_0.stb}),
      .wb_we_i({m_wb_if_1.we, m_wb_if_0.we}),
      .wb_adr_i({m_wb_if_1.adr, m_wb_if_0.adr}),
      .wb_dat_i({m_wb_if_1.dat_i, m_wb_if_0.dat_i}),
      .wb_sel_i({m_wb_if_1.sel, m_wb_if_0.sel}),
      .wb_ack_o({m_wb_if_1.ack, m_wb_if_0.ack}),
      .wb_dat_o({m_wb_if_1.dat_o, m_wb_if_0.dat_o}),
      .wb_err_o({m_wb_if_1.err, m_wb_if_0.err}),
      // Slave Ports
      .slv_cyc_o({s_wb_if_1.cyc, s_wb_if_0.cyc}),
      .slv_stb_o({s_wb_if_1.stb, s_wb_if_0.stb}),
      .slv_we_o({s_wb_if_1.we, s_wb_if_0.we}),
      .slv_adr_o({s_wb_if_1.adr, s_wb_if_0.adr}),
      .slv_dat_o({s_wb_if_1.dat_i, s_wb_if_0.dat_i}),  // Matrix drives dat_i of slave interface
      .slv_sel_o({s_wb_if_1.sel, s_wb_if_0.sel}),
      .slv_ack_i({s_wb_if_1.ack, s_wb_if_0.ack}),
      .slv_dat_i({s_wb_if_1.dat_o, s_wb_if_0.dat_o}),  // Slaves drive dat_o of interface
      .slv_err_i({s_wb_if_1.err, s_wb_if_0.err})
  );

  initial begin
    // Masters
    uvm_config_db#(virtual ahb_if)::set(null, "*.m_ahb_agent_0.*", "vif", m_ahb_if_0);
    uvm_config_db#(virtual ahb_if)::set(null, "*.m_ahb_agent_1.*", "vif", m_ahb_if_1);
    uvm_config_db#(virtual axi_if)::set(null, "*.m_axi_agent_0.*", "vif", m_axi_if_0);
    uvm_config_db#(virtual axi_if)::set(null, "*.m_axi_agent_1.*", "vif", m_axi_if_1);
    uvm_config_db#(virtual wb_if)::set(null, "*.m_wb_agent_0.*", "vif", m_wb_if_0);
    uvm_config_db#(virtual wb_if)::set(null, "*.m_wb_agent_1.*", "vif", m_wb_if_1);

    // Slaves
    uvm_config_db#(virtual ahb_if)::set(null, "*.s_ahb_agent_0.*", "vif", s_ahb_if_0);
    uvm_config_db#(virtual ahb_if)::set(null, "*.s_ahb_agent_1.*", "vif", s_ahb_if_1);
    uvm_config_db#(virtual axi_if)::set(null, "*.s_axi_agent_0.*", "vif", s_axi_if_0);
    uvm_config_db#(virtual axi_if)::set(null, "*.s_axi_agent_1.*", "vif", s_axi_if_1);
    uvm_config_db#(virtual wb_if)::set(null, "*.s_wb_agent_0.*", "vif", s_wb_if_0);
    uvm_config_db#(virtual wb_if)::set(null, "*.s_wb_agent_1.*", "vif", s_wb_if_1);

    run_test();
  end

  initial begin
    #1000ms;
    `uvm_fatal("TIMEOUT", "Simulation timed out")
  end
endmodule
