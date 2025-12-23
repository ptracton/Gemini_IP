--
-- General Purpose Timer Registers (VHDL-2008)
--
-- Description:
--   Register file for the General Timer.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_regs is
  port (
    clk   : in std_logic;
    rst_n : in std_logic;

    -- Bus Interface
    cs    : in std_logic;
    we    : in std_logic;
    addr  : in std_logic_vector(5 downto 0);
    wdata : in std_logic_vector(31 downto 0);
    rdata : out std_logic_vector(31 downto 0);

    -- Core Interface
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

    -- System
    intr_o : out std_logic
  );
end entity timer_regs;

architecture rtl of timer_regs is
  -- Register Addresses
  constant ADDR_CTRL    : unsigned(5 downto 0) := "000000"; -- 0x00
  constant ADDR_LOAD    : unsigned(5 downto 0) := "000100"; -- 0x04
  constant ADDR_VAL     : unsigned(5 downto 0) := "001000"; -- 0x08
  constant ADDR_PRE     : unsigned(5 downto 0) := "001100"; -- 0x0C
  constant ADDR_INT_EN  : unsigned(5 downto 0) := "010000"; -- 0x10
  constant ADDR_INT_STS : unsigned(5 downto 0) := "010100"; -- 0x14
  constant ADDR_CMP     : unsigned(5 downto 0) := "011000"; -- 0x18
  constant ADDR_CAP     : unsigned(5 downto 0) := "011100"; -- 0x1C

  -- Registers
  signal reg_ctrl    : std_logic_vector(31 downto 0);
  signal reg_load    : std_logic_vector(31 downto 0);
  signal reg_pre     : std_logic_vector(31 downto 0);
  signal reg_int_en  : std_logic_vector(31 downto 0);
  signal reg_int_sts : std_logic_vector(31 downto 0);
  signal reg_cmp     : std_logic_vector(31 downto 0);
  signal reg_cap     : std_logic_vector(31 downto 0);

begin

  -- Control Assignments
  en     <= reg_ctrl(0);
  mode   <= reg_ctrl(1);
  pre_en <= reg_ctrl(2);
  dir    <= reg_ctrl(3);
  pwm_en <= reg_ctrl(4);
  ext_en <= reg_ctrl(5);
  cap_en <= reg_ctrl(6);

  pre_val <= reg_pre(15 downto 0);
  cmp_val <= reg_cmp;

  load_cmd <= '1' when (cs = '1' and we = '1' and unsigned(addr) = ADDR_LOAD) else
    '0';

  -- Bypass reg_load when writing
  load_val <= wdata when (cs = '1' and we = '1' and unsigned(addr) = ADDR_LOAD) else
    reg_load;

  -- Interrupt Output
  intr_o <= (reg_int_sts(0) and reg_int_en(0)) or (reg_int_sts(1) and reg_int_en(1));

  -- Read Logic
  process (cs, addr, reg_ctrl, reg_load, current_val, reg_pre, reg_int_en, reg_int_sts, reg_cmp, reg_cap)
  begin
    rdata <= (others => '0');
    if cs = '1' then
      case unsigned(addr) is
        when ADDR_CTRL    => rdata    <= reg_ctrl;
        when ADDR_LOAD    => rdata    <= reg_load;
        when ADDR_VAL     => rdata     <= current_val;
        when ADDR_PRE     => rdata     <= reg_pre;
        when ADDR_INT_EN  => rdata  <= reg_int_en;
        when ADDR_INT_STS => rdata <= reg_int_sts;
        when ADDR_CMP     => rdata     <= reg_cmp;
        when ADDR_CAP     => rdata     <= reg_cap;
        when others => rdata       <= (others => '0');
      end case;
    end if;
  end process;

  -- Write Logic
  process (clk, rst_n)
  begin
    if rst_n = '0' then
      reg_ctrl    <= (others => '0');
      reg_load    <= (others => '0');
      reg_pre     <= (others => '0');
      reg_cmp     <= (others => '0');
      reg_cap     <= (others => '0');
      reg_int_en  <= (others => '0');
      reg_int_sts <= (others => '0');
    elsif rising_edge(clk) then

      -- Sticky Status
      if core_irq = '1' then
        reg_int_sts(0) <= '1';
      end if;
      if capture_stb = '1' then
        reg_int_sts(1) <= '1';
      end if;

      -- Capture Update
      if capture_stb = '1' and cap_en = '1' then
        reg_cap <= capture_val;
      end if;

      if cs = '1' and we = '1' then
        case unsigned(addr) is
          when ADDR_CTRL    => reg_ctrl     <= wdata;
          when ADDR_LOAD    => reg_load     <= wdata;
          when ADDR_PRE     => reg_pre       <= wdata;
          when ADDR_CMP     => reg_cmp       <= wdata;
          when ADDR_INT_EN  => reg_int_en <= wdata;
          when ADDR_INT_STS =>
            if wdata(0) = '1' then
              reg_int_sts(0) <= '0';
            end if;
            if wdata(1) = '1' then
              reg_int_sts(1) <= '0';
            end if;
          when others => null;
        end case;
      end if;
    end if;
  end process;

end architecture rtl;
