--
-- General Purpose Timer Wishbone Wrapper (VHDL-2008)
--

library ieee;
use ieee.std_logic_1164.all;

entity timer_wb is
  port (
    wb_clk_i : in std_logic;
    wb_rst_i : in std_logic;
    wb_adr_i : in std_logic_vector(31 downto 0);
    wb_dat_i : in std_logic_vector(31 downto 0);
    wb_we_i  : in std_logic;
    wb_stb_i : in std_logic;
    wb_cyc_i : in std_logic;
    wb_sel_i : in std_logic_vector(3 downto 0);
    wb_dat_o : out std_logic_vector(31 downto 0);
    wb_ack_o : out std_logic;
    wb_err_o : out std_logic;

    -- External IO
    ext_meas_i : in std_logic;
    capture_i  : in std_logic;
    pwm_o      : out std_logic;
    trigger_o  : out std_logic;

    irq : out std_logic
  );
end entity timer_wb;

architecture rtl of timer_wb is
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

  signal cs, we, presetn                                         : std_logic;
  signal addr                                                    : std_logic_vector(5 downto 0);
  signal rdata                                                   : std_logic_vector(31 downto 0);
  signal en, mode, dir, pwm_en, ext_en, cap_en, pre_en, load_cmd : std_logic;
  signal core_irq_pulse, capture_stb, core_intr                  : std_logic;
  signal pre_val                                                 : std_logic_vector(15 downto 0);
  signal load_val, cmp_val, current_val, capture_val             : std_logic_vector(31 downto 0);
  signal ack_q                                                   : std_logic;

begin

  presetn  <= not wb_rst_i;
  wb_err_o <= '0';
  wb_dat_o <= rdata;
  irq      <= core_intr;

  cs       <= wb_stb_i and wb_cyc_i;
  we       <= wb_we_i;
  addr     <= wb_adr_i(5 downto 0);
  wb_ack_o <= ack_q;

  process (wb_clk_i, wb_rst_i)
  begin
    if wb_rst_i = '1' then
      ack_q <= '0';
    elsif rising_edge(wb_clk_i) then
      if wb_stb_i = '1' and wb_cyc_i = '1' and ack_q = '0' then
        ack_q <= '1';
      else
        ack_q <= '0';
      end if;
    end if;
  end process;

  u_timer_regs : timer_regs
  port map
  (
    clk => wb_clk_i, rst_n => presetn,
    cs => cs, we => we, addr => addr,
    wdata => wb_dat_i, rdata => rdata,

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
    clk => wb_clk_i, rst_n => presetn,
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
