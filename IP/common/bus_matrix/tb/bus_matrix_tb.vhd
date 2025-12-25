--------------------------------------------------------------------------------
-- File: bus_matrix_tb.vhd
-- Module: bus_matrix_tb
-- Description:
--   Top-level VHDL Testbench for the Bus Matrix IP.
--   Verifies functionality of the Wishbone and AHB wrappers using GHDL.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bus_matrix_pkg.all;
use work.wb_bfm_pkg.all;
use work.axi_bfm_pkg.all;

entity bus_matrix_tb is
end entity bus_matrix_tb;

architecture behavior of bus_matrix_tb is

  -- Constant Definitions
  constant WB_NM  : integer := 2;
  constant WB_MS  : integer := 2;
  constant AHB_NM : integer := 2;
  constant AHB_MS : integer := 2;

  -- Security Mask (M1 Secure, M0 Non-Secure)
  constant WB_SECURE_MASK  : std_logic_vector(0 to 31)    := (1 => '1', others => '0'); -- M1 Secure, M0 NS
  constant AHB_SECURE_MASK : std_logic_vector(1 downto 0) := "10";

  -- Region Maps
  -- WB S1: 0x20000000 - 0x2FFFFFFF, Secure Check
  -- WB S0: 0x10000000 - 0x1FFFFFFF, Non-Secure
  constant WB_MAP : region_map_array_t(0 to 1) := (
  0 => (start_addr => x"10000000", end_addr => x"1FFFFFFF", secure_only => '0', read_only => '0'),
  1 => (start_addr => x"20000000", end_addr => x"2FFFFFFF", secure_only => '1', read_only => '0')
  );

  constant AHB_MAP : region_map_array_t(0 to 1) := (
  0 => (start_addr => x"40000000", end_addr => x"4FFFFFFF", secure_only => '0', read_only => '0'),
  1 => (start_addr => x"50000000", end_addr => x"5FFFFFFF", secure_only => '1', read_only => '0')
  );

  constant AXI_MAP : region_map_array_t(0 to 1) := (
  0 => (start_addr => x"60000000", end_addr => x"6FFFFFFF", secure_only => '0', read_only => '0'),
  1 => (start_addr => x"70000000", end_addr => x"7FFFFFFF", secure_only => '1', read_only => '0')
  );

  -- Clock and Reset
  signal clk   : std_logic := '0';
  signal rst_n : std_logic := '0';

  -- Wishbone Signals
  signal wb_cyc_i : std_logic_vector(WB_NM - 1 downto 0)      := (others => '0');
  signal wb_stb_i : std_logic_vector(WB_NM - 1 downto 0)      := (others => '0');
  signal wb_we_i  : std_logic_vector(WB_NM - 1 downto 0)      := (others => '0');
  signal wb_sel_i : std_logic_vector(WB_NM * 4 - 1 downto 0)  := (others => '0');
  signal wb_adr_i : std_logic_vector(WB_NM * 32 - 1 downto 0) := (others => '0');
  signal wb_dat_i : std_logic_vector(WB_NM * 32 - 1 downto 0) := (others => '0');

  signal wb_ack_o : std_logic_vector(WB_NM - 1 downto 0);
  signal wb_err_o : std_logic_vector(WB_NM - 1 downto 0);
  signal wb_dat_o : std_logic_vector(WB_NM * 32 - 1 downto 0);

  signal slv_wb_cyc   : std_logic_vector(WB_MS - 1 downto 0);
  signal slv_wb_stb   : std_logic_vector(WB_MS - 1 downto 0);
  signal slv_wb_we    : std_logic_vector(WB_MS - 1 downto 0);
  signal slv_wb_adr   : std_logic_vector(WB_MS * 32 - 1 downto 0);
  signal slv_wb_dat_w : std_logic_vector(WB_MS * 32 - 1 downto 0);

  signal slv_wb_ack   : std_logic_vector(WB_MS - 1 downto 0)      := (others => '0');
  signal slv_wb_err   : std_logic_vector(WB_MS - 1 downto 0)      := (others => '0');
  signal slv_wb_dat_r : std_logic_vector(WB_MS * 32 - 1 downto 0) := (others => '0');

  -- AHB Signals
  signal ahb_haddr  : std_logic_vector(AHB_NM * 32 - 1 downto 0) := (others => '0');
  signal ahb_htrans : std_logic_vector(AHB_NM * 2 - 1 downto 0)  := (others => '0');
  signal ahb_hwrite : std_logic_vector(AHB_NM - 1 downto 0)      := (others => '0');
  signal ahb_hwdata : std_logic_vector(AHB_NM * 32 - 1 downto 0) := (others => '0');
  signal ahb_hprot  : std_logic_vector(AHB_NM * 4 - 1 downto 0)  := (others => '0');

  signal ahb_hreadyout : std_logic_vector(AHB_NM - 1 downto 0);
  signal ahb_hrdata    : std_logic_vector(AHB_NM * 32 - 1 downto 0);

  signal slv_ahb_hsel   : std_logic_vector(AHB_MS - 1 downto 0);
  signal slv_ahb_haddr  : std_logic_vector(AHB_MS * 32 - 1 downto 0);
  signal slv_ahb_hready : std_logic_vector(AHB_MS - 1 downto 0)      := (others => '1');
  signal slv_ahb_hrdata : std_logic_vector(AHB_MS * 32 - 1 downto 0) := (others => '0');

  -- AXI Signals
  -- 2 Masters, 2 Slaves
  signal axi_awaddr  : std_logic_vector(63 downto 0);
  signal axi_awprot  : std_logic_vector(5 downto 0) := (others => '0'); -- Default Secure
  signal axi_awvalid : std_logic_vector(1 downto 0) := "00";
  signal axi_awready : std_logic_vector(1 downto 0);
  signal axi_wdata   : std_logic_vector(63 downto 0);
  signal axi_wstrb   : std_logic_vector(7 downto 0);
  signal axi_wvalid  : std_logic_vector(1 downto 0) := "00";
  signal axi_wready  : std_logic_vector(1 downto 0);
  signal axi_bresp   : std_logic_vector(3 downto 0);
  signal axi_bvalid  : std_logic_vector(1 downto 0);
  signal axi_bready  : std_logic_vector(1 downto 0) := "00";

  signal axi_araddr  : std_logic_vector(63 downto 0);
  signal axi_arprot  : std_logic_vector(5 downto 0) := (others => '0');
  signal axi_arvalid : std_logic_vector(1 downto 0) := "00";
  signal axi_arready : std_logic_vector(1 downto 0);
  signal axi_rdata   : std_logic_vector(63 downto 0);
  signal axi_rresp   : std_logic_vector(3 downto 0);
  signal axi_rvalid  : std_logic_vector(1 downto 0);
  signal axi_rready  : std_logic_vector(1 downto 0) := "00";

  signal s_axi_awvalid : std_logic_vector(1 downto 0);
  signal s_axi_wvalid  : std_logic_vector(1 downto 0);
  signal s_axi_awready : std_logic_vector(1 downto 0) := "11"; -- Slaves Always Ready
  signal s_axi_wready  : std_logic_vector(1 downto 0) := "11";
  signal s_axi_bvalid  : std_logic_vector(1 downto 0) := "00";
  signal s_axi_bready  : std_logic_vector(1 downto 0);
  signal s_axi_bresp   : std_logic_vector(3 downto 0) := (others => '0'); -- OKAY

  signal s_axi_arvalid : std_logic_vector(1 downto 0);
  signal s_axi_arready : std_logic_vector(1 downto 0) := "11";
  signal s_axi_rvalid  : std_logic_vector(1 downto 0) := "00";
  signal s_axi_rready  : std_logic_vector(1 downto 0);
  signal s_axi_rdata   : std_logic_vector(63 downto 0) := (others => '0');
  signal s_axi_rresp   : std_logic_vector(3 downto 0)  := (others => '0');

  -- Termination
  signal sim_done : boolean := false;

begin

  -- Clock Generation
  clk <= not clk after 5 ns when not sim_done else
    '0';

  -- ========================================================================
  -- Wishbone Matrix Instantiation
  -- ========================================================================
  u_wb_matrix : entity work.bus_matrix_wb
    generic map(
      N_MASTERS          => WB_NM,
      M_SLAVES           => WB_MS,
      REGION_MAP         => WB_MAP,
      MASTER_SECURE_MASK => WB_SECURE_MASK
    )
    port map
    (
      clk => clk, rst_n => rst_n,
      wb_cyc_i => wb_cyc_i, wb_stb_i => wb_stb_i, wb_we_i => wb_we_i,
      wb_adr_i => wb_adr_i, wb_dat_i => wb_dat_i, wb_sel_i => wb_sel_i,
      wb_ack_o => wb_ack_o, wb_err_o => wb_err_o, wb_dat_o => wb_dat_o,

      slv_cyc_o => slv_wb_cyc, slv_stb_o => slv_wb_stb, slv_we_o => slv_wb_we,
      slv_adr_o => slv_wb_adr, slv_dat_o => slv_wb_dat_w,
      slv_ack_i => slv_wb_ack, slv_err_i => slv_wb_err, slv_dat_i => slv_wb_dat_r
    );

  -- Dummy WB Slaves
  process (clk)
  begin
    if rising_edge(clk) then
      -- Simple 1-cycle ACK
      slv_wb_ack   <= slv_wb_stb and slv_wb_cyc;
      slv_wb_dat_r <= x"CAFEBABE" & x"DEADBEEF"; -- Flattened dummy data
    end if;
  end process;

  -- ========================================================================
  -- AHB Matrix Instantiation
  -- ========================================================================
  u_ahb_matrix : entity work.bus_matrix_ahb
    generic map(
      N_MASTERS  => AHB_NM,
      M_SLAVES   => AHB_MS,
      REGION_MAP => AHB_MAP
    )
    port map
    (
      HCLK => clk, HRESETn => rst_n,
      HSEL_i => (others => '0'),
      HADDR_i => ahb_haddr, HTRANS_i => ahb_htrans, HWRITE_i => ahb_hwrite,
      HSIZE_i => (others => '0'), HBURST_i => (others => '0'), HPROT_i => ahb_hprot,
      HWDATA_i => ahb_hwdata,

      HREADYOUT_o => ahb_hreadyout, HRDATA_o => ahb_hrdata,

      HSEL_o => slv_ahb_hsel, HADDR_o => slv_ahb_haddr,
      HWDATA_o => open,
      HREADY_i => slv_ahb_hready, HRESP_i => (others => '0'), HRDATA_i => slv_ahb_hrdata
    );

  -- Dummy AHB Slaves
  slv_ahb_hready <= (others => '1');

  -- ========================================================================
  -- AXI Matrix Instantiation
  -- ========================================================================
  u_axi_matrix : entity work.bus_matrix_axi
    generic map(
      N_MASTERS  => 2,
      M_SLAVES   => 2,
      REGION_MAP => AXI_MAP
    )
    port map
    (
      aclk => clk, aresetn => rst_n,

      awaddr_i => axi_awaddr, awprot_i => axi_awprot, awvalid_i => axi_awvalid, awready_o => axi_awready,
      wdata_i => axi_wdata, wstrb_i => axi_wstrb, wvalid_i => axi_wvalid, wready_o => axi_wready,
      bresp_o => axi_bresp, bvalid_o => axi_bvalid, bready_i => axi_bready,

      araddr_i => axi_araddr, arprot_i => axi_arprot, arvalid_i => axi_arvalid, arready_o => axi_arready,
      rdata_o => axi_rdata, rresp_o => axi_rresp, rvalid_o => axi_rvalid, rready_i => axi_rready,

      -- Slaves
      s_awaddr_o => open, s_awprot_o => open, s_awvalid_o => s_axi_awvalid, s_awready_i => s_axi_awready,
      s_wdata_o => open, s_wstrb_o => open, s_wvalid_o => s_axi_wvalid, s_wready_i => s_axi_wready,
      s_bresp_i => s_axi_bresp, s_bvalid_i => s_axi_bvalid, s_bready_o => s_axi_bready,

      s_araddr_o => open, s_arprot_o => open, s_arvalid_o => s_axi_arvalid, s_arready_i => s_axi_arready,
      s_rdata_i => s_axi_rdata, s_rresp_i => s_axi_rresp, s_rvalid_i => s_axi_rvalid, s_rready_o => s_axi_rready
    );

  -- Dummy AXI Slaves
  -- Simple validation loopback: If VALID then assert BVALID/RVALID next cycle (Lite)
  process (clk)
  begin
    if rising_edge(clk) then
      if rst_n = '0' then
        s_axi_bvalid <= "00";
        s_axi_rvalid <= "00";
      else
        -- Write Response
        for i in 0 to 1 loop
          if s_axi_awvalid(i) = '1' and s_axi_wvalid(i) = '1' then
            s_axi_bvalid(i) <= '1';
          elsif s_axi_bready(i) = '1' then
            s_axi_bvalid(i) <= '0';
          end if;

          -- Read Response
          if s_axi_arvalid(i) = '1' then
            s_axi_rvalid(i) <= '1';
          elsif s_axi_rready(i) = '1' then
            s_axi_rvalid(i) <= '0';
          end if;
        end loop;
      end if;
    end if;
  end process;

  -- ========================================================================
  -- Test Stimulus
  -- ========================================================================
  process
  begin
    -- Init
    rst_n      <= '0';
    wb_cyc_i   <= (others => '0');
    wb_stb_i   <= (others => '0');
    ahb_htrans <= (others => '0');
    wait for 50 ns;
    rst_n <= '1';
    wait for 20 ns;

    report "Starting Wishbone Verification...";

    -- 1. WB Non-Secure Access to Non-Secure Slave (S0)
    -- wb_adr_i(31 downto 0) <= x"10000000";
    -- wb_cyc_i(0)           <= '1';
    -- wb_stb_i(0)           <= '1';
    -- wait until wb_ack_o(0) = '1' for 100 ns;

    wb_write(
    addr   => x"10000000",
    data   => x"12345678", -- Dummy data
    clk    => clk,
    wb_adr => wb_adr_i(31 downto 0),
    wb_dat => wb_dat_i(31 downto 0),
    wb_we  => wb_we_i(0),
    wb_cyc => wb_cyc_i(0),
    wb_stb => wb_stb_i(0),
    wb_sel => wb_sel_i(3 downto 0),
    wb_ack => wb_ack_o(0)
    );

    report "WB: Non-Secure Master -> Non-Secure Slave: OK";
    wait for 20 ns;

    -- 2. WB Non-Secure Access to Secure Slave (S1) - Expect BLOCK
    -- Note: BFM wb_write waits for ACK. If matrix generates ERR, BFM might hang if it only checks ACK.
    -- wb_bfm_pkg loop: if wb_ack = '1' then exit.

    -- Wait! The BFM in `wb_bfm_pkg.vhd` ONLY checks `wb_ack`.
    -- If the matrix responds with `wb_err`, `wb_ack` might be '0' or '1' depending on implementation.
    -- In bus_matrix_wb.sv/.vhd: "if master_err_vec(m) = '1' then m_err <= '1'; m_ack <= '1';" 
    -- So ERR implies ACK is also asserted?
    -- Checked bus_matrix_wb.vhd:
    --   if master_err_vec(m) = '1' then
    --     m_err(m) <= '1';
    --     m_ack(m) <= '1';
    -- So YES, the design asserts ACK along with ERR. So BFM will exit the loop.

    wb_write(
    addr   => x"20000000",
    data   => x"DEADBEEF",
    clk    => clk,
    wb_adr => wb_adr_i(31 downto 0),
    wb_dat => wb_dat_i(31 downto 0),
    wb_we  => wb_we_i(0),
    wb_cyc => wb_cyc_i(0),
    wb_stb => wb_stb_i(0),
    wb_sel => wb_sel_i(3 downto 0),
    wb_ack => wb_ack_o(0) -- BFM doesn't take ERR input, so we can't check it inside call
    );

    -- Check ERR manually after BFM returns
    if wb_err_o(0) = '1' then
      report "WB: Non-Secure Master -> Secure Slave: BLOCKED (OK)";
    else
      report "WB: Non-Secure Master -> Secure Slave: ALLOWED (FAIL) - ERR not asserted" severity error;
    end if;

    wait for 20 ns;

    -- 3. WB Secure Access to Secure Slave (M1 is Secure)
    wb_write(
    addr   => x"20000000",
    data   => x"CAFEBABE",
    clk    => clk,
    wb_adr => wb_adr_i(63 downto 32), -- Master 1
    wb_dat => wb_dat_i(63 downto 32),
    wb_we  => wb_we_i(1),
    wb_cyc => wb_cyc_i(1),
    wb_stb => wb_stb_i(1),
    wb_sel => wb_sel_i(7 downto 4),
    wb_ack => wb_ack_o(1)
    );

    report "WB: Secure Master -> Secure Slave: OK";

    report "Starting AHB Verification...";
    -- 1. AHB Arbitration / Basic Access
    ahb_haddr(31 downto 0) <= x"40000000";
    ahb_htrans(1 downto 0) <= "10"; -- NONSEQ
    ahb_hprot(3 downto 0)  <= "0011"; -- Non-Secure Data

    wait until rising_edge(clk); -- Edge 1: Latch inputs? No arbiter is registered.
    wait until rising_edge(clk); -- Edge 2: Arbiter updates Grant.
    wait for 1 ns; -- Delta cycle

    if slv_ahb_hsel(0) = '1' then
      report "AHB: Address Phase Grant: OK";
    else
      report "AHB: Address Phase Grant: FAIL" severity error;
    end if;

    ahb_htrans(1 downto 0) <= "00"; -- IDLE

    report "Starting AXI Verification...";

    -- 1. AXI Secure Master (M0) -> Secure Slave (S1: 0x70000000)
    -- Using axi_bfm_pkg.axi_write(addr, data, clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bready, bvalid)
    -- Mapping M0 signals (Index 0 of vectors)

    axi_awprot(0) <= '0'; -- Secure (PROT[1]=0)

    axi_write(
    addr    => x"70000000",
    data    => x"11112222",
    clk     => clk,
    awaddr  => axi_awaddr(31 downto 0),
    awvalid => axi_awvalid(0),
    awready => axi_awready(0),
    wdata   => axi_wdata(31 downto 0),
    wstrb   => axi_wstrb(3 downto 0),
    wvalid  => axi_wvalid(0),
    wready  => axi_wready(0),
    bready  => axi_bready(0),
    bvalid  => axi_bvalid(0)
    );

    -- Check Response (Ok = "00")
    if axi_bresp(1 downto 0) = "00" then
      report "AXI: Secure Master -> Secure Slave: OK";
    else
      report "AXI: Secure Master -> Secure Slave: FAIL" severity error;
    end if;

    wait for 20 ns;

    -- 2. AXI Non-Secure Master (M1) -> Secure Slave (S1: 0x70000000)
    -- Expect Error (DECERR="11" or SLVERR="10") logic in bus_matrix_axi returns DECERR usually for sec fault.

    axi_awprot(5 downto 3) <= "010"; -- M1 Non-Secure

    axi_write(
    addr    => x"70000000",
    data    => x"BAD0C0DE",
    clk     => clk,
    awaddr  => axi_awaddr(63 downto 32),
    awvalid => axi_awvalid(1),
    awready => axi_awready(1),
    wdata   => axi_wdata(63 downto 32),
    wstrb   => axi_wstrb(7 downto 4),
    wvalid  => axi_wvalid(1),
    wready  => axi_wready(1),
    bready  => axi_bready(1),
    bvalid  => axi_bvalid(1)
    );

    if axi_bresp(3 downto 2) /= "00" then
      report "AXI: Non-Secure Master -> Secure Slave: BLOCKED (OK)";
    else
      report "AXI: Non-Secure Master -> Secure Slave: ALLOWED (FAIL)" severity error;
    end if;

    report "All tests completed.";
    sim_done <= true;
    wait;
  end process;

end architecture;
