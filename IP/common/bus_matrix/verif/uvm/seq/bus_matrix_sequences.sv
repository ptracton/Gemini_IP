/*
 * File: bus_matrix_sequences.sv
 * Description: Bus Matrix Virtual Sequences (Multi-Master)
 */

class bus_matrix_base_vseq extends uvm_sequence;
  `uvm_object_utils(bus_matrix_base_vseq)

  // Master Sequencers
  uvm_sequencer #(axi_seq_item) axi_sqr_0;
  uvm_sequencer #(axi_seq_item) axi_sqr_1;
  uvm_sequencer #(ahb_seq_item) ahb_sqr_0;
  uvm_sequencer #(ahb_seq_item) ahb_sqr_1;
  uvm_sequencer #(wb_seq_item)  wb_sqr_0;
  uvm_sequencer #(wb_seq_item)  wb_sqr_1;

  function new(string name = "bus_matrix_base_vseq");
    super.new(name);
  endfunction
endclass

class bus_matrix_rand_vseq extends bus_matrix_base_vseq;
  `uvm_object_utils(bus_matrix_rand_vseq)

  function new(string name = "bus_matrix_rand_vseq");
    super.new(name);
  endfunction

  task body();
    axi_rand_seq axi_s0, axi_s1;
    ahb_rand_seq ahb_s0, ahb_s1;
    wb_rand_seq wb_s0, wb_s1;

    axi_s0 = axi_rand_seq::type_id::create("axi_s0");
    axi_s1 = axi_rand_seq::type_id::create("axi_s1");
    ahb_s0 = ahb_rand_seq::type_id::create("ahb_s0");
    ahb_s1 = ahb_rand_seq::type_id::create("ahb_s1");
    wb_s0 = wb_rand_seq::type_id::create("wb_s0");
    wb_s1 = wb_rand_seq::type_id::create("wb_s1");

    // Increase transaction counts for all masters
    axi_s0.count = 250;
    axi_s1.count = 250;
    ahb_s0.count = 250;
    ahb_s1.count = 250;
    wb_s0.count = 250;
    wb_s1.count = 250;

    fork
      axi_s0.start(axi_sqr_0);
      axi_s1.start(axi_sqr_1);
      ahb_s0.start(ahb_sqr_0);
      ahb_s1.start(ahb_sqr_1);
      wb_s0.start(wb_sqr_0);
      wb_s1.start(wb_sqr_1);
    join
  endtask
endclass

class bus_matrix_error_vseq extends bus_matrix_base_vseq;
  `uvm_object_utils(bus_matrix_error_vseq)

  function new(string name = "bus_matrix_error_vseq");
    super.new(name);
  endfunction

  task body();
    axi_seq_item axi_item;
    ahb_seq_item ahb_item;
    wb_seq_item  wb_item;

    // 1. AXI: Access unmapped address (Dec Error)
    axi_item = axi_seq_item::type_id::create("axi_item");
    start_item(axi_item, .sequencer(axi_sqr_0));
    axi_item.write = 1;
    axi_item.addr  = 32'h2000_0000;  // Not in 0x0... or 0x1...
    axi_item.data  = 32'hDEADBEEF;
    finish_item(axi_item);

    // 2. AXI: Access Secure region with Non-Secure transaction (Sec Error)
    axi_item = axi_seq_item::type_id::create("axi_item_sec_err");
    start_item(axi_item, .sequencer(axi_sqr_1));
    axi_item.write = 1;
    axi_item.addr  = 32'h1000_0000;  // Secure region
    axi_item.prot  = 3'b000;  // Non-privileged, Non-secure, Data
    finish_item(axi_item);

    // 3. AHB: Access Secure region with Non-Secure transaction (Sec Error)
    ahb_item = ahb_seq_item::type_id::create("ahb_item");
    start_item(ahb_item, .sequencer(ahb_sqr_0));
    ahb_item.write = 1;
    ahb_item.addr  = 32'h1000_0400;  // Secure region
    ahb_item.prot  = 4'b0000;  // Non-Secure
    finish_item(ahb_item);

    // 4. AHB: Access Secure region with Secure transaction (Success)
    ahb_item = ahb_seq_item::type_id::create("ahb_item_sec");
    start_item(ahb_item, .sequencer(ahb_sqr_0));
    ahb_item.write = 1;
    ahb_item.addr  = 32'h1000_0800;
    ahb_item.prot  = 4'b0010;  // Secure bit [1]=1
    finish_item(ahb_item);

    // 5. WB: Access unmapped address (Dec Error)
    wb_item = wb_seq_item::type_id::create("wb_item_err");
    start_item(wb_item, .sequencer(wb_sqr_0));
    wb_item.we   = 1;
    wb_item.addr = 32'h3000_0000;
    wb_item.data = 32'hCAFEBABE;
    finish_item(wb_item);

    // 6. WB: Secure error (if MASTER_SECURE_MASK is set incorrectly - for now just exercising)
    wb_item = wb_seq_item::type_id::create("wb_item_sec_err");
    start_item(wb_item, .sequencer(wb_sqr_1));
    wb_item.we   = 1;
    wb_item.addr = 32'h1000_0000;
    finish_item(wb_item);
  endtask
endclass

class bus_matrix_contention_vseq extends bus_matrix_base_vseq;
  `uvm_object_utils(bus_matrix_contention_vseq)

  function new(string name = "bus_matrix_contention_vseq");
    super.new(name);
  endfunction

  task body();
    axi_seq_item axi_i0, axi_i1;
    ahb_seq_item ahb_i0, ahb_i1;
    wb_seq_item wb_i0;

    // Force multi-master contention on Slave 0 and Slave 1 with randomized addresses within the regions
    repeat (10) begin
      fork
        begin
          axi_i0 = axi_seq_item::type_id::create("axi_i0");
          if (!axi_i0.randomize() with {
                addr inside {[32'h0000_0000 : 32'h0FFF_FFFF]};
                write == 1;
              })
            `uvm_error("RND", "AXI random fail")
          start_item(axi_i0, .sequencer(axi_sqr_0));
          finish_item(axi_i0);
        end
        begin
          axi_i1 = axi_seq_item::type_id::create("axi_i1");
          if (!axi_i1.randomize() with {
                addr inside {[32'h0000_0000 : 32'h0FFF_FFFF]};
                write == 1;
              })
            `uvm_error("RND", "AXI random fail")
          start_item(axi_i1, .sequencer(axi_sqr_1));
          finish_item(axi_i1);
        end
        begin
          ahb_i0 = ahb_seq_item::type_id::create("ahb_i0");
          if (!ahb_i0.randomize() with {
                addr inside {[32'h1000_0000 : 32'h1FFF_FFFF]};
                write == 1;
                prot == 4'b0010;
              })
            `uvm_error("RND", "AHB random fail")
          start_item(ahb_i0, .sequencer(ahb_sqr_0));
          finish_item(ahb_i0);
        end
        begin
          ahb_i1 = ahb_seq_item::type_id::create("ahb_i1");
          if (!ahb_i1.randomize() with {
                addr inside {[32'h1000_0000 : 32'h1FFF_FFFF]};
                write == 1;
                prot == 4'b0010;
              })
            `uvm_error("RND", "AHB random fail")
          start_item(ahb_i1, .sequencer(ahb_sqr_1));
          finish_item(ahb_i1);
        end
        begin
          wb_i0 = wb_seq_item::type_id::create("wb_i0");
          if (!wb_i0.randomize() with {
                addr inside {[32'h0000_0000 : 32'h0FFF_FFFF]};
                we == 1;
              })
            `uvm_error("RND", "WB random fail")
          start_item(wb_i0, .sequencer(wb_sqr_0));
          finish_item(wb_i0);
        end
        begin
          wb_i0 = wb_seq_item::type_id::create("wb_i1");
          if (!wb_i0.randomize() with {
                addr inside {[32'h0000_0000 : 32'h0FFF_FFFF]};
                we == 1;
              })
            `uvm_error("RND", "WB random fail")
          start_item(wb_i0, .sequencer(wb_sqr_1));
          finish_item(wb_i0);
        end
      join
    end
  endtask
endclass
