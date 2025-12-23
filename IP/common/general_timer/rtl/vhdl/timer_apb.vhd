--
-- General Purpose Timer APB4 Wrapper (VHDL-2008)
--

library ieee;
use ieee.std_logic_1164.all;

entity timer_apb is
  port (
    pclk    : in std_logic;
    presetn : in std_logic;

    paddr   : in std_logic_vector(31 downto 0) := (others => '0');
    pprot   : in std_logic_vector(2 downto 0)  := (others => '0');
    psel    : in std_logic                     := '0';
    penable : in std_logic                     := '0';
    pwrite  : in std_logic                     := '0';
    pwdata  : in std_logic_vector(31 downto 0) := (others => '0');
    pstrb   : in std_logic_vector(3 downto 0)  := (others => '0');
    pready  : out std_logic;
    prdata  : out std_logic_vector(31 downto 0);
    pslverr : out std_logic;

    -- External IO
    ext_meas_i : in std_logic := '0';
    capture_i  : in std_logic := '0';
    pwm_o      : out std_logic;
    trigger_o  : out std_logic;

    irq : out std_logic
  );
end entity timer_apb;

architecture rtl of timer_apb is
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

  signal cs, we : std_logic                     := '0';
  signal addr   : std_logic_vector(5 downto 0)  := (others => '0');
  signal rdata  : std_logic_vector(31 downto 0) := (others => '0');

  signal en, mode, dir, pwm_en, ext_en, cap_en, pre_en, load_cmd : std_logic                     := '0';
  signal core_irq_pulse, capture_stb, core_intr                  : std_logic                     := '0';
  signal pre_val                                                 : std_logic_vector(15 downto 0) := (others => '0');
  signal load_val, cmp_val, current_val, capture_val             : std_logic_vector(31 downto 0) := (others => '0');

begin
  pready  <= '1';
  pslverr <= '0';
  prdata  <= rdata;
  irq     <= core_intr;

  cs   <= psel and penable;
  we   <= pwrite;
  addr <= paddr(5 downto 0);

  u_timer_regs : timer_regs
  port map
  (
    clk => pclk, rst_n => presetn,
    cs => cs, we => we, addr => addr,
    wdata => pwdata, rdata => rdata,

    en => en, mode => mode, dir => dir,
    pwm_en => pwm_en, ext_en => ext_en, cap_en => cap_en,
    pre_en => pre_en, pre_val => pre_val,
    load_val => load_val, cmp_val => cmp_val,
    load_cmd => load_cmd,

    current_val => current_val, capture_val => capture_val,
    capture_stb => capture_stb, core_irq => core_irq_pulse,
    intr_o => core_intr
  );

  u_timer_core : timer_core
  port map
  (
    clk => pclk, rst_n => presetn,
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
end architecture rtl;
