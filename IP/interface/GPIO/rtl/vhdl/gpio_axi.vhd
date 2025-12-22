--------------------------------------------------------------------------------
-- Module: gpio_axi
-- Description: AXI4-Lite Wrapper for Professional-Grade GPIO IP (VHDL).
--
-- How it operates:
-- This module provides a VHDL implementation of the AXI4-Lite slave interface.
-- It translates AXI bus signals into internal register accesses for the 
-- GPIO logic. It instantiates the common VHDL register block and the
-- multi-bit GPIO bit wrapper.
--
-- Author: Gemini-3 AI
-- License: MIT
--------------------------------------------------------------------------------

-- gpio_axi.vhd
--
-- VHDL AXI4-Lite Slave Adapter for GPIO IP.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gpio_axi is
  generic (
    NUM_BITS : integer := 32
  );
  port (
    -- AXI4-Lite Interface
    s_axi_aclk    : in std_logic;
    s_axi_aresetn : in std_logic;

    -- Write Address Channel
    s_axi_awaddr  : in std_logic_vector(31 downto 0);
    s_axi_awprot  : in std_logic_vector(2 downto 0);
    s_axi_awvalid : in std_logic;
    s_axi_awready : out std_logic;

    -- Write Data Channel
    s_axi_wdata  : in std_logic_vector(31 downto 0);
    s_axi_wstrb  : in std_logic_vector(3 downto 0);
    s_axi_wvalid : in std_logic;
    s_axi_wready : out std_logic;

    -- Write Response Channel
    s_axi_bresp  : out std_logic_vector(1 downto 0);
    s_axi_bvalid : out std_logic;
    s_axi_bready : in std_logic;

    -- Read Address Channel
    s_axi_araddr  : in std_logic_vector(31 downto 0);
    s_axi_arprot  : in std_logic_vector(2 downto 0);
    s_axi_arvalid : in std_logic;
    s_axi_arready : out std_logic;

    -- Read Data Channel
    s_axi_rdata  : out std_logic_vector(31 downto 0);
    s_axi_rresp  : out std_logic_vector(1 downto 0);
    s_axi_rvalid : out std_logic;
    s_axi_rready : in std_logic;

    -- GPIO Pins
    io : inout std_logic_vector(NUM_BITS - 1 downto 0);

    -- Interrupt Output
    intr : out std_logic
  );
end entity gpio_axi;

architecture rtl of gpio_axi is
  -- Internal Bus Signals
  signal reg_addr  : std_logic_vector(31 downto 0);
  signal reg_wdata : std_logic_vector(31 downto 0);
  signal reg_rdata : std_logic_vector(31 downto 0);
  signal reg_we    : std_logic;
  signal reg_re    : std_logic;
  signal reg_be    : std_logic_vector(3 downto 0);
  signal reg_ack   : std_logic;

  signal reg_data_o : std_logic_vector(NUM_BITS - 1 downto 0);
  signal reg_dir    : std_logic_vector(NUM_BITS - 1 downto 0);
  signal gpio_i     : std_logic_vector(NUM_BITS - 1 downto 0);

  -- Physical Config Signals
  signal open_drain   : std_logic_vector(NUM_BITS - 1 downto 0);
  signal pull_up_en   : std_logic_vector(NUM_BITS - 1 downto 0);
  signal pull_down_en : std_logic_vector(NUM_BITS - 1 downto 0);

  signal aw_en     : std_logic := '1';
  signal s_awready : std_logic := '0';
  signal s_wready  : std_logic := '0';
  signal s_bvalid  : std_logic := '0';
  signal s_arready : std_logic := '0';
  signal s_rvalid  : std_logic := '0';

begin

  s_axi_awready <= s_awready;
  s_axi_wready  <= s_wready;
  s_axi_bvalid  <= s_bvalid;
  s_axi_arready <= s_arready;
  s_axi_rvalid  <= s_rvalid;

  -- AXI Logic
  process (s_axi_aclk, s_axi_aresetn)
  begin
    if s_axi_aresetn = '0' then
      s_awready <= '0';
      aw_en     <= '1';
    elsif rising_edge(s_axi_aclk) then
      if s_awready = '0' and s_axi_awvalid = '1' and s_axi_wvalid = '1' and aw_en = '1' then
        s_awready <= '1';
        aw_en     <= '0';
      elsif s_axi_bready = '1' and s_bvalid = '1' then
        aw_en     <= '1';
        s_awready <= '0';
      else
        s_awready <= '0';
      end if;
    end if;
  end process;

  process (s_axi_aclk, s_axi_aresetn)
  begin
    if s_axi_aresetn = '0' then
      s_wready <= '0';
    elsif rising_edge(s_axi_aclk) then
      if s_wready = '0' and s_axi_wvalid = '1' and s_axi_awvalid = '1' and aw_en = '1' then
        s_wready <= '1';
      else
        s_wready <= '0';
      end if;
    end if;
  end process;

  reg_we   <= s_wready and s_axi_wvalid and s_awready and s_axi_awvalid;
  reg_addr <= s_axi_awaddr when reg_we = '1' else
    s_axi_araddr;
  reg_wdata <= s_axi_wdata;
  reg_be    <= s_axi_wstrb;

  process (s_axi_aclk, s_axi_aresetn)
  begin
    if s_axi_aresetn = '0' then
      s_bvalid    <= '0';
      s_axi_bresp <= "00";
    elsif rising_edge(s_axi_aclk) then
      if s_awready = '1' and s_axi_awvalid = '1' and s_wready = '1' and s_axi_wvalid = '1' and s_bvalid = '0' then
        s_bvalid    <= '1';
        s_axi_bresp <= "00";
      elsif s_axi_bready = '1' and s_bvalid = '1' then
        s_bvalid <= '0';
      end if;
    end if;
  end process;

  process (s_axi_aclk, s_axi_aresetn)
  begin
    if s_axi_aresetn = '0' then
      s_arready <= '0';
    elsif rising_edge(s_axi_aclk) then
      if s_arready = '0' and s_axi_arvalid = '1' then
        s_arready <= '1';
      else
        s_arready <= '0';
      end if;
    end if;
  end process;

  reg_re <= s_arready and s_axi_arvalid;

  process (s_axi_aclk, s_axi_aresetn)
  begin
    if s_axi_aresetn = '0' then
      s_rvalid    <= '0';
      s_axi_rresp <= "00";
    elsif rising_edge(s_axi_aclk) then
      if s_arready = '1' and s_axi_arvalid = '1' and s_rvalid = '0' then
        s_rvalid    <= '1';
        s_axi_rresp <= "00";
      elsif s_axi_rready = '1' and s_rvalid = '1' then
        s_rvalid <= '0';
      end if;
    end if;
  end process;

  s_axi_rdata <= reg_rdata;

  -- Register Block
  u_gpio_regs : entity work.gpio_regs
    generic map(NUM_BITS => NUM_BITS)
    port map
    (
      clk          => s_axi_aclk,
      reset_n      => s_axi_aresetn,
      addr         => reg_addr,
      wdata        => reg_wdata,
      rdata        => reg_rdata,
      we           => reg_we,
      re           => reg_re,
      be           => reg_be,
      ack          => reg_ack,
      reg_data_o   => reg_data_o,
      reg_dir      => reg_dir,
      gpio_i       => gpio_i,
      open_drain   => open_drain,
      pull_up_en   => pull_up_en,
      pull_down_en => pull_down_en,
      intr         => intr
    );

  -- IO Wrapper
  u_gpio_wrapper : entity work.gpio_wrapper
    generic map(NUM_BITS => NUM_BITS)
    port map
    (
      clk          => s_axi_aclk,
      reset_n      => s_axi_aresetn,
      o            => reg_data_o,
      oe           => reg_dir,
      i            => gpio_i,
      open_drain   => open_drain,
      pull_up_en   => pull_up_en,
      pull_down_en => pull_down_en,
      io           => io
    );

end architecture rtl;
