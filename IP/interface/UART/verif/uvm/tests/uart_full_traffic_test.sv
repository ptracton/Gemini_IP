`ifndef UART_FULL_TRAFFIC_TEST_SV
`define UART_FULL_TRAFFIC_TEST_SV

// Sequence to drive RXD Line via UART Agent
class uart_rand_seq extends uvm_sequence #(uart_seq_item);
  `uvm_object_utils(uart_rand_seq)

  function new(string name = "uart_rand_seq");
    super.new(name);
  endfunction

  task body();
    repeat (10) begin
      req = uart_seq_item::type_id::create("req");
      start_item(req);
      if (!req.randomize() with {
            delay inside {[1 : 10]};
            error_frame dist {
              0 := 90,
              1 := 10
            };
            error_parity dist {
              0 := 90,
              1 := 10
            };
          }) begin
        `uvm_error("SEQ", "Randomization failed")
      end
      finish_item(req);
    end
  endtask
endclass

class uart_full_traffic_test extends uart_base_test;
  `uvm_component_utils(uart_full_traffic_test)

  uart_rand_seq m_seq;

  function new(string name = "uart_full_traffic_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    bit [31:0] rdata;
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Full Traffic Test...", UVM_LOW)

    // Enable TX and RX (CR = 3)
    apb_write(32'h08, 32'h00000003);

    m_seq = uart_rand_seq::type_id::create("m_seq");

    fork
      // Threat 1: Drive RXD line via UART Agent
      begin
        m_seq.start(m_env.m_uart_agent.sequencer);
      end

      // Thread 2: Drive TX via APB Writes
      begin
        repeat (10) begin
          apb_write(32'h00, $urandom_range(0, 255));
          #100us;  // Spacing for baud rate
        end
      end

      // Thread 3: Read RX via APB Reads (Polling)
      begin
        repeat (20) begin
          #80us;
          apb_read(32'h04, rdata);  // Check Status
          if (rdata[0]) begin  // RX Not Empty
            apb_read(32'h00, rdata);
          end
        end
      end
    join_any  // Limit simulation time if one thread hangs? No, join_any lets us finish if sequence finishes.

    #500us;  // Allow drain

    phase.drop_objection(this);
    `uvm_info("TEST", "Full Traffic Test Complete", UVM_LOW)
  endtask

endclass

`endif
