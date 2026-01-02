class uart_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(uart_scoreboard)

  // UART Analysis Ports
  uvm_analysis_export #(uart_seq_item) uart_tx_export;
  uvm_analysis_export #(uart_seq_item) uart_rx_export;

  // Bus Analysis Ports (Generic if possible, but UVM is strict)
  // We declare for all, connect what is needed.
  uvm_analysis_export #(apb_seq_item) apb_export;
  uvm_analysis_export #(axi_seq_item) axi_export;
  uvm_analysis_export #(wb_seq_item) wb_export;

  // FIFOs
  uvm_tlm_analysis_fifo #(uart_seq_item) uart_tx_fifo;
  uvm_tlm_analysis_fifo #(uart_seq_item) uart_rx_fifo;
  uvm_tlm_analysis_fifo #(apb_seq_item) apb_fifo;
  uvm_tlm_analysis_fifo #(axi_seq_item) axi_fifo;
  uvm_tlm_analysis_fifo #(wb_seq_item) wb_fifo;

  string bus_type;

  // Registers (Mirror)
  // Simple verification: Check data

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uart_tx_fifo = new("uart_tx_fifo", this);
    uart_rx_fifo = new("uart_rx_fifo", this);
    apb_fifo = new("apb_fifo", this);
    axi_fifo = new("axi_fifo", this);
    wb_fifo = new("wb_fifo", this);

    uart_tx_export = new("uart_tx_export", this);
    uart_rx_export = new("uart_rx_export", this);
    apb_export = new("apb_export", this);
    axi_export = new("axi_export", this);
    wb_export = new("wb_export", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    uart_tx_export.connect(uart_tx_fifo.analysis_export);
    uart_rx_export.connect(uart_rx_fifo.analysis_export);
    apb_export.connect(apb_fifo.analysis_export);
    axi_export.connect(axi_fifo.analysis_export);
    wb_export.connect(wb_fifo.analysis_export);
  endfunction

  task run_phase(uvm_phase phase);
    fork
      process_bus();
      process_uart_tx();
      process_uart_rx();
    join
  endtask

  task process_bus();
    if (bus_type == "APB") process_apb();
    else if (bus_type == "AXI") process_axi();
    else if (bus_type == "WB") process_wb();
  endtask

  task process_apb();
    apb_seq_item item;
    forever begin
      apb_fifo.get(item);
      `uvm_info("SCB", $sformatf(
                "APB Transaction: Addr=%0h Data=%0h Write=%0b", item.addr, item.data, item.write),
                UVM_HIGH)

      // Logic:
      // Write to 0x00 -> Expect UART TX
      if (item.write && item.addr[7:0] == 8'h00) begin
        `uvm_info("SCB", "APB Write to DR detected. Expecting UART TX.", UVM_MEDIUM)
        // In a real scoreboard, we push expectation to a queue/comparator
      end
      // Read from 0x00 -> Check against received UART RX data (which we might have prefetched)
    end
  endtask

  task process_uart_tx();
    uart_seq_item item;
    forever begin
      uart_tx_fifo.get(item);
      `uvm_info("SCB", $sformatf("UART TX Observed: %0h", item.data), UVM_MEDIUM)
      // Verify against pending expectation from Bus Write
    end
  endtask

  task process_uart_rx();
    uart_seq_item item;
    forever begin
      uart_rx_fifo.get(item);
      `uvm_info("SCB", $sformatf("UART RX Observed: %0h", item.data), UVM_MEDIUM)
      // Store for future Bus Read
    end
  endtask

  task process_axi();
    axi_seq_item item;
    forever begin
      axi_fifo.get(item);
      `uvm_info("SCB", $sformatf(
                "AXI Transaction: Addr=%0h Data=%0h Write=%0b", item.addr, item.data, item.write),
                UVM_HIGH)
      if (item.write && item.addr[7:0] == 8'h00) begin
        `uvm_info("SCB", "AXI Write to DR detected. Expecting UART TX.", UVM_MEDIUM)
      end
    end
  endtask

  task process_wb();
    wb_seq_item item;
    forever begin
      wb_fifo.get(item);
      `uvm_info("SCB", $sformatf(
                "WB Transaction: Addr=%0h Data=%0h Write=%0b", item.addr, item.data, item.we),
                UVM_HIGH)
      if (item.we && item.addr[7:0] == 8'h00) begin
        `uvm_info("SCB", "WB Write to DR detected. Expecting UART TX.", UVM_MEDIUM)
      end
    end
  endtask

endclass : uart_scoreboard
