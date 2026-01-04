/*
 * File: sp_memory_scoreboard.sv
 * Description: SP Memory Scoreboard with memory model and data integrity checks.
 */

class sp_memory_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(sp_memory_scoreboard)

  uvm_analysis_imp_apb #(apb_seq_item, sp_memory_scoreboard) apb_export;
  uvm_analysis_imp_axi #(axi_seq_item, sp_memory_scoreboard) axi_export;
  uvm_analysis_imp_wb #(wb_seq_item, sp_memory_scoreboard) wb_export;
  uvm_analysis_imp_ahb #(ahb_seq_item, sp_memory_scoreboard) ahb_export;
  uvm_analysis_imp_mem #(sp_memory_seq_item, sp_memory_scoreboard) mem_export;

  // Memory Model (Sparse prediction)
  logic [31:0] memory_model[int];

  // Status inputs from Monitor
  sp_memory_seq_item current_status;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    apb_export = new("apb_export", this);
    axi_export = new("axi_export", this);
    wb_export  = new("wb_export", this);
    ahb_export = new("ahb_export", this);
    mem_export = new("mem_export", this);
  endfunction

  // ------------------------------------------------------------------------
  // Write Implementation (Bus Agents)
  // ------------------------------------------------------------------------
  function void write_apb(apb_seq_item item);
    if (item.write) begin
      do_write(item.addr, item.data, item.strb);
    end else begin
      do_read(item.addr, item.rdata);
    end
  endfunction

  function void write_axi(axi_seq_item item);
    if (item.write) begin
      do_write(item.addr, item.data, item.strb);
    end else begin
      do_read(item.addr, item.rdata);
    end
  endfunction

  function void write_wb(wb_seq_item item);
    if (item.we) begin
      do_write(item.addr, item.data, item.sel);
    end else begin
      do_read(item.addr, item.rdata);
    end
  endfunction

  function void write_ahb(ahb_seq_item item);
    if (item.write) begin
      // AHB usually doesn't have strb in simple item, assume full width or derived
      do_write(item.addr, item.data, 4'hF);
    end else begin
      do_read(item.addr, item.rdata);
    end
  endfunction

  // ------------------------------------------------------------------------
  // Write Implementation (Memory Agent / Sideband)
  // ------------------------------------------------------------------------
  function void write_mem(sp_memory_seq_item item);
    current_status = item;
    // Verify BIST status if enabled?
    if (item.bist_done && item.bist_en) begin
      if (!item.bist_pass) `uvm_error("SCB", "BIST Reported Failure!");
    end
  endfunction

  // ------------------------------------------------------------------------
  // Internal Model
  // ------------------------------------------------------------------------
  function void do_write(logic [31:0] addr, logic [31:0] data, logic [3:0] strb);
    logic [31:0] current_val;
    logic [31:0] word_addr = addr & 32'hFFFFFFFC;  // Align to word

    if (memory_model.exists(word_addr)) begin
      current_val = memory_model[word_addr];
    end else begin
      current_val = 32'h0;
    end

    // Apply byte enables
    if (strb[0]) current_val[7:0] = data[7:0];
    if (strb[1]) current_val[15:8] = data[15:8];
    if (strb[2]) current_val[23:16] = data[23:16];
    if (strb[3]) current_val[31:24] = data[31:24];

    // Gate writes with sleep (if sideband is active)
    if (current_status != null && current_status.sleep) begin
      `uvm_info("SCB", "Skipping Write due to Sleep Mode", UVM_HIGH);
      return;
    end

    memory_model[word_addr] = current_val;
    `uvm_info("SCB", $sformatf("WRITE Pred: Addr=%h Data=%h", word_addr, current_val), UVM_LOW);
  endfunction

  function void do_read(logic [31:0] addr, logic [31:0] data);
    logic [31:0] expected_val;
    logic [31:0] word_addr = addr & 32'hFFFFFFFC;

    if (memory_model.exists(word_addr)) begin
      expected_val = memory_model[word_addr];
    end else begin
      expected_val = 32'h0;  // Default Reset Value
    end

    if (data !== expected_val) begin
      // Don't error if we are injecting errors or if BIST is active (which might overwrite)
      if (current_status == null || (!current_status.bist_en)) begin
        `uvm_error("SCB", $sformatf(
                   "READ Mismatch! Addr=%h Exp=%h Act=%h", word_addr, expected_val, data));
      end
    end else begin
      `uvm_info("SCB", $sformatf("READ Match: Addr=%h Data=%h", word_addr, data), UVM_LOW);
    end
  endfunction

endclass
