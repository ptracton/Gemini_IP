library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ahb_apb_bridge is
  generic (
    ADDR_WIDTH : integer := 32;
    DATA_WIDTH : integer := 32
  );
  port (
    HCLK    : in std_logic;
    HRESETn : in std_logic;

    -- AHB Slave Interface
    HSEL      : in std_logic;
    HADDR     : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    HTRANS    : in std_logic_vector(1 downto 0);
    HWRITE    : in std_logic;
    HSIZE     : in std_logic_vector(2 downto 0);
    HBURST    : in std_logic_vector(2 downto 0);
    HPROT     : in std_logic_vector(3 downto 0);
    HWDATA    : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    HREADY    : in std_logic;
    HREADYOUT : out std_logic;
    HRESP     : out std_logic_vector(1 downto 0);
    HRDATA    : out std_logic_vector(DATA_WIDTH - 1 downto 0);

    -- APB Master Interface
    PADDR   : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
    PENABLE : out std_logic;
    PWRITE  : out std_logic;
    PWDATA  : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    PSTRB   : out std_logic_vector(3 downto 0);
    PPROT   : out std_logic_vector(2 downto 0);
    PSEL    : out std_logic;
    PRDATA  : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    PREADY  : in std_logic;
    PSLVERR : in std_logic
  );
end entity ahb_apb_bridge;

architecture rtl of ahb_apb_bridge is

  type state_t is (IDLE, SETUP, ACCESS_PHASE);
  signal state, next_state : state_t;

  signal addr_reg  : std_logic_vector(ADDR_WIDTH - 1 downto 0);
  signal write_reg : std_logic;

begin

  process (HCLK, HRESETn)
  begin
    if HRESETn = '0' then
      state     <= IDLE;
      addr_reg  <= (others => '0');
      write_reg <= '0';
    elsif rising_edge(HCLK) then
      state <= next_state;

      if HSEL = '1' and HREADY = '1' and HTRANS(1) = '1' and state = IDLE then
        addr_reg  <= HADDR;
        write_reg <= HWRITE;
      end if;
    end if;
  end process;

  process (state, HSEL, HREADY, HTRANS, PREADY)
  begin
    next_state <= state;
    case state is
      when IDLE =>
        if HSEL = '1' and HREADY = '1' and HTRANS(1) = '1' then
          next_state <= SETUP;
        end if;

      when SETUP =>
        next_state <= ACCESS_PHASE;

      when ACCESS_PHASE =>
        if PREADY = '1' then
          if HSEL = '1' and HTRANS(1) = '1' then
            next_state <= SETUP;
          else
            next_state <= IDLE;
          end if;
        end if;

      when others =>
        next_state <= IDLE;
    end case;
  end process;

  -- Output Logic
  PSEL <= '1' when (state = SETUP or state = ACCESS_PHASE) else
    '0';
  PENABLE <= '1' when (state = ACCESS_PHASE) else
    '0';
  PADDR  <= addr_reg;
  PWRITE <= write_reg;
  PWDATA <= HWDATA;
  PPROT  <= "001";
  PSTRB  <= "1111";

  HREADYOUT <= PREADY when (state = ACCESS_PHASE) else
    '1';
  HRDATA <= PRDATA;
  HRESP  <= "01" when (state = ACCESS_PHASE and PSLVERR = '1') else
    "00";

end architecture rtl;
