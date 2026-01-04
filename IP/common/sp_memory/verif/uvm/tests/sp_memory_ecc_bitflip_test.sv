/*
 * File: sp_memory_ecc_bitflip_test.sv
 * Description: Test for ECC and Parity error detection using HDL deposit
 */
class sp_memory_ecc_bitflip_test extends sp_memory_base_test;
  `uvm_component_utils(sp_memory_ecc_bitflip_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    sp_memory_axi_write_seq write_seq;
    sp_memory_axi_read_seq read_seq;
    virtual sp_memory_if mem_vif;
    logic [31:0] data;
    string path;

    if (!uvm_config_db#(virtual sp_memory_if)::get(this, "", "vif", mem_vif)) begin
      `uvm_fatal("TEST", "Could not get virtual interface")
    end

    phase.raise_objection(this);
    `uvm_info("TEST", "Starting ECC Bit-flip Injection Test", UVM_LOW);

    if (m_env.bus_type != "AXI") begin
      `uvm_warning("TEST", "ECC Bit-flip Test currently implemented for AXI only")
    end else begin
      path = "tb_top.dut.core.mem[0]";

      // 1. Write clean data
      write_seq = sp_memory_axi_write_seq::type_id::create("write_seq");
      write_seq.addr = 32'h0;
      write_seq.data = 32'hAAAA_BBBB;
      write_seq.start(m_env.m_axi_agent.sequencer);

      // 2. Inject Single Bit Error (SBE)
      `uvm_info("TEST", "Injecting Single Bit Error via HDL Deposit", UVM_LOW);
      data = 32'hAAAA_BBBB ^ 32'h0000_0001;  // Flip bit 0
      if (!uvm_hdl_deposit(path, data)) begin
        `uvm_error("TEST", $sformatf("Failed to deposit value to %s", path));
      end

      // 3. Read and expect ECC Single Error
      read_seq = sp_memory_axi_read_seq::type_id::create("read_seq");
      read_seq.addr = 32'h0;
      read_seq.start(m_env.m_axi_agent.sequencer);

      #100ns;
      if (mem_vif.err_ecc_single !== 1) begin
        `uvm_error("TEST", "ECC Single Error NOT detected!");
      end else begin
        `uvm_info("TEST", "ECC Single Error detected successfully", UVM_LOW);
      end

      // 4. Inject Double Bit Error (DBE)
      `uvm_info("TEST", "Injecting Double Bit Error via HDL Deposit", UVM_LOW);
      data = 32'hAAAA_BBBB ^ 32'h0000_0003;  // Flip bits 0 and 1
      if (!uvm_hdl_deposit(path, data)) begin
        `uvm_error("TEST", $sformatf("Failed to deposit value to %s", path));
      end

      // 5. Read and expect ECC Double Error
      read_seq = sp_memory_axi_read_seq::type_id::create("read_seq");
      read_seq.addr = 32'h0;
      read_seq.start(m_env.m_axi_agent.sequencer);

      #100ns;
      if (mem_vif.err_ecc_double !== 1) begin
        `uvm_error("TEST", "ECC Double Error NOT detected!");
      end else begin
        `uvm_info("TEST", "ECC Double Error detected successfully", UVM_LOW);
      end
    end

    phase.drop_objection(this);
  endtask
endclass
