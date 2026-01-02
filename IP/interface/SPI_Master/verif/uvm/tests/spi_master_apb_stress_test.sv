`ifndef SPI_MASTER_APB_STRESS_TEST_SV
`define SPI_MASTER_APB_STRESS_TEST_SV

// Define the Sequence first
class spi_master_apb_stress_seq extends uvm_sequence #(apb_seq_item);
  `uvm_object_utils(spi_master_apb_stress_seq)

  function new(string name = "spi_master_apb_stress_seq");
    super.new(name);
  endfunction

  task body();
    apb_seq_item req;

    // 1. Random Valid Accesses
    repeat (50) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      if (!req.randomize() with {
            addr inside {32'h00, 32'h04, 32'h08, 32'h0C, 32'h10, 32'h14, 32'h18};
            strb inside {4'hF, 4'h1, 4'h2, 4'h4, 4'h8, 4'h3, 4'hC};
          })
        `uvm_error("APB_STRESS", "Randomization failed");
      finish_item(req);
    end

    // 2. Out of Bounds Accesses
    repeat (20) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      if (!req.randomize() with {
            !(addr inside {32'h00, 32'h04, 32'h08, 32'h0C, 32'h10, 32'h14, 32'h18});
            addr < 32'h1000;
          })
        `uvm_error("APB_STRESS", "Randomization failed");
      finish_item(req);
    end

    // 3. Back-to-Back Bursts
    repeat (20) begin
      req = apb_seq_item::type_id::create("req");
      start_item(req);
      assert (req.randomize());
      finish_item(req);
    end
  endtask
endclass

// Define the Test
class spi_master_apb_stress_test extends spi_master_base_test;
  `uvm_component_utils(spi_master_apb_stress_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    spi_master_apb_stress_seq seq;

    phase.raise_objection(this);
    `uvm_info("APB_STRESS", "Starting APB Stress Test", UVM_LOW);

    seq = spi_master_apb_stress_seq::type_id::create("seq");
    seq.start(env.apb_ag.sequencer);

    #1000;
    `uvm_info("APB_STRESS", "APB Stress Test Complete", UVM_LOW);
    phase.drop_objection(this);
  endtask

endclass

`endif
