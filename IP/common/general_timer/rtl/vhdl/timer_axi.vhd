--
-- General Purpose Timer AXI4-Lite Wrapper (VHDL-2008)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_axi is
  port (
    aclk    : in std_logic;
    aresetn : in std_logic;

    -- Write Address Output
    awaddr  : in std_logic_vector(31 downto 0) := (others => '0');
    awprot  : in std_logic_vector(2 downto 0)  := (others => '0');
    awvalid : in std_logic                     := '0';
    awready : out std_logic;

    -- Write Data
    wdata  : in std_logic_vector(31 downto 0) := (others => '0');
    wstrb  : in std_logic_vector(3 downto 0)  := (others => '0');
    wvalid : in std_logic                     := '0';
    wready : out std_logic;

    -- Write Response
    bresp  : out std_logic_vector(1 downto 0);
    bvalid : out std_logic;
    bready : in std_logic := '0';

    -- Read Address
    araddr  : in std_logic_vector(31 downto 0) := (others => '0');
    arprot  : in std_logic_vector(2 downto 0)  := (others => '0');
    arvalid : in std_logic                     := '0';
    arready : out std_logic;

    -- Read Data
    rdata  : out std_logic_vector(31 downto 0);
    rresp  : out std_logic_vector(1 downto 0);
    rvalid : out std_logic;
    rready : in std_logic := '0';

    -- External IO
    ext_meas_i : in std_logic := '0';
    capture_i  : in std_logic := '0';
    pwm_o      : out std_logic;
    trigger_o  : out std_logic;

    -- Interrupt
    irq : out std_logic
  );
end entity timer_axi;

architecture rtl of timer_axi is
  component timer_regs is
    port (
      clk   : in std_logic;
      rst_n : in std_logic;
      cs    : in std_logic;
      we    : in std_logic;
      addr  : in std_logic_vector(5 downto 0);
      wdata : in std_logic_vector(31 downto 0);
      rdata : out std_logic_vector(31 downto 0);

      en       : out std_logic;
      mode     : out std_logic;
      dir      : out std_logic;
      pwm_en   : out std_logic;
      ext_en   : out std_logic;
      cap_en   : out std_logic;
      pre_en   : out std_logic;
      pre_val  : out std_logic_vector(15 downto 0);
      load_val : out std_logic_vector(31 downto 0);
      cmp_val  : out std_logic_vector(31 downto 0);
      load_cmd : out std_logic;

      current_val : in std_logic_vector(31 downto 0);
      capture_val : in std_logic_vector(31 downto 0);
      capture_stb : in std_logic;
      core_irq    : in std_logic;
      intr_o      : out std_logic
    );
  end component timer_regs;

  component timer_core is
    port (
      clk      : in std_logic;
      rst_n    : in std_logic;
      en       : in std_logic;
      mode     : in std_logic;
      dir      : in std_logic;
      pwm_en   : in std_logic;
      ext_en   : in std_logic;
      pre_en   : in std_logic;
      pre_val  : in std_logic_vector(15 downto 0);
      load_val : in std_logic_vector(31 downto 0);
      cmp_val  : in std_logic_vector(31 downto 0);
      load_cmd : in std_logic;

      ext_meas_i : in std_logic;
      capture_i  : in std_logic;

      current_val : out std_logic_vector(31 downto 0);
      capture_val : out std_logic_vector(31 downto 0);
      capture_stb : out std_logic;
      pwm_o       : out std_logic;
      trigger_o   : out std_logic;
      irq         : out std_logic
    );
  end component timer_core;

  -- Internal signals
  signal cs, we    : std_logic                     := '0';
  signal addr      : std_logic_vector(5 downto 0)  := (others => '0');
  signal reg_rdata : std_logic_vector(31 downto 0) := (others => '0');

  signal en, mode, dir, pwm_en, ext_en, cap_en, pre_en, load_cmd : std_logic                     := '0';
  signal core_irq_pulse, capture_stb, core_intr                  : std_logic                     := '0';
  signal pre_val                                                 : std_logic_vector(15 downto 0) := (others => '0');
  signal load_val, cmp_val, current_val, capture_val             : std_logic_vector(31 downto 0) := (others => '0');

  -- AXI State signals
  signal aw_en                                              : std_logic                     := '1';
  signal awready_i, wready_i, bvalid_i, arready_i, rvalid_i : std_logic                     := '0';
  signal bresp_i, rresp_i                                   : std_logic_vector(1 downto 0)  := (others => '0');
  signal rdata_q                                            : std_logic_vector(31 downto 0) := (others => '0');

begin

  -- Register instantiation
  u_timer_regs : timer_regs
  port map
  (
    clk => aclk, rst_n => aresetn,
    cs => cs, we => we, addr => addr,
    wdata => wdata, rdata => reg_rdata,

    en => en, mode => mode, dir => dir,
    pwm_en => pwm_en, ext_en => ext_en, cap_en => cap_en,
    pre_en => pre_en, pre_val => pre_val,
    load_val => load_val, cmp_val => cmp_val,
    load_cmd => load_cmd,

    current_val => current_val, capture_val => capture_val,
    capture_stb => capture_stb, core_irq => core_irq_pulse,
    intr_o => core_intr
  );

  -- Core instantiation
  u_timer_core : timer_core
  port map
  (
    clk => aclk, rst_n => aresetn,
    en => en, mode => mode, dir => dir,
    pwm_en => pwm_en, ext_en => ext_en,
    pre_en => pre_en, pre_val => pre_val,
    load_val => load_val, cmp_val => cmp_val,
    load_cmd => load_cmd,

    ext_meas_i => ext_meas_i, capture_i => capture_i,

    current_val => current_val, capture_val => capture_val,
    capture_stb => capture_stb,
    pwm_o => pwm_o, trigger_o => trigger_o,
    irq         => core_irq_pulse
  );

  irq <= core_intr;

  -- Output mappings
  awready <= awready_i;
  wready  <= wready_i;
  bvalid  <= bvalid_i;
  bresp   <= bresp_i;
  arready <= arready_i;
  rvalid  <= rvalid_i;
  rresp   <= rresp_i;
  rdata   <= rdata_q;

  -- Write Address Logic
  process (aclk, aresetn)
  begin
    if aresetn = '0' then
      awready_i <= '0';
      aw_en     <= '1';
    elsif rising_edge(aclk) then
      if awready_i = '0' and awvalid = '1' and wvalid = '1' and aw_en = '1' then
        awready_i <= '1';
        aw_en     <= '0';
      elsif bready = '1' and bvalid_i = '1' then
        awready_i <= '0';
        aw_en     <= '1';
      else
        awready_i <= '0';
      end if;
    end if;
  end process;

  -- Write Data Logic
  process (aclk, aresetn)
  begin
    if aresetn = '0' then
      wready_i <= '0';
    elsif rising_edge(aclk) then
      if wready_i = '0' and wvalid = '1' and awvalid = '1' and aw_en = '1' then
        wready_i <= '1';
      else
        wready_i <= '0';
      end if;
    end if;
  end process;

  -- Write Response Logic
  process (aclk, aresetn)
  begin
    if aresetn = '0' then
      bvalid_i <= '0';
      bresp_i  <= "00";
    elsif rising_edge(aclk) then
      if awready_i = '1' and awvalid = '1' and bvalid_i = '0' and wready_i = '1' and wvalid = '1' then
        bvalid_i <= '1';
        bresp_i  <= "00";
      elsif bready = '1' and bvalid_i = '1' then
        bvalid_i <= '0';
      end if;
    end if;
  end process;

  -- Read Channel Logic
  process (aclk, aresetn)
  begin
    if aresetn = '0' then
      arready_i <= '0';
      rvalid_i  <= '0';
      rresp_i   <= "00";
    elsif rising_edge(aclk) then
      -- ARReady
      if arready_i = '0' and arvalid = '1' then
        arready_i <= '1';
      else
        arready_i <= '0';
      end if;

      -- RValid
      if arready_i = '1' and arvalid = '1' and rvalid_i = '0' then
        rvalid_i <= '1';
        rresp_i  <= "00";
      elsif rvalid_i = '1' and rready = '1' then
        rvalid_i <= '0';
      end if;
    end if;
  end process;

  -- Latch Read Data
  process (aclk, aresetn)
  begin
    if aresetn = '0' then
      rdata_q <= (others => '0');
    elsif rising_edge(aclk) then
      if arready_i = '1' and arvalid = '1' then
        rdata_q <= reg_rdata;
      end if;
    end if;
  end process;

  -- Internal Mapping
  addr <= awaddr(5 downto 0) when awvalid = '1' else
    araddr(5 downto 0);
  cs <= (wready_i and wvalid) or (arready_i and arvalid);
  we <= (wready_i and wvalid);

end architecture rtl;
