--------------------------------------------------------------------------------
-- SPI Master Register Interface
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_registers is
    generic (
        ADDR_WIDTH : integer := 32;
        DATA_WIDTH : integer := 32
    );
    port (
        clk     : in  std_logic;
        rst_n   : in  std_logic;

        -- Register Bus Interface
        reg_we    : in  std_logic;
        reg_re    : in  std_logic;
        reg_addr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        reg_wdata : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        reg_rdata : out std_logic_vector(DATA_WIDTH-1 downto 0);

        -- Status Inputs from Core
        rx_data         : in  std_logic_vector(31 downto 0);
        tx_full         : in  std_logic;
        tx_almost_full  : in  std_logic;
        rx_empty        : in  std_logic;
        rx_almost_empty : in  std_logic;
        busy            : in  std_logic;
        done_intr       : in  std_logic;

        -- Control Outputs to Core
        tx_data   : out std_logic_vector(31 downto 0);
        tx_push   : out std_logic;
        rx_pop    : out std_logic;
        cpol      : out std_logic;
        cpha      : out std_logic;
        clk_div   : out std_logic_vector(7 downto 0);
        word_len  : out std_logic_vector(5 downto 0);
        lsb_first : out std_logic;
        loopback  : out std_logic;
        enable    : out std_logic;

        -- External Outputs
        spi_cs_n   : out std_logic;
        intr       : out std_logic;
        dma_tx_req : out std_logic;
        dma_rx_req : out std_logic
    );
end entity spi_master_registers;

architecture rtl of spi_master_registers is

    -- Register Offsets
    constant ADDR_DATA      : std_logic_vector(7 downto 0) := x"00";
    constant ADDR_SR        : std_logic_vector(7 downto 0) := x"04";
    constant ADDR_CR        : std_logic_vector(7 downto 0) := x"08";
    constant ADDR_CS        : std_logic_vector(7 downto 0) := x"0C";
    constant ADDR_FIFO_CTRL : std_logic_vector(7 downto 0) := x"10";
    constant ADDR_FIFO_STAT : std_logic_vector(7 downto 0) := x"14";
    constant ADDR_CR1       : std_logic_vector(7 downto 0) := x"18";

    -- Internal Registers
    signal reg_cr        : std_logic_vector(31 downto 0);
    signal reg_cr1       : std_logic_vector(31 downto 0);
    signal reg_cs        : std_logic_vector(31 downto 0);
    signal reg_fifo_ctrl : std_logic_vector(31 downto 0);

begin

    -- Control Outputs Assignments
    enable    <= reg_cr(0);
    cpol      <= reg_cr(1);
    cpha      <= reg_cr(2);
    clk_div   <= reg_cr(15 downto 8);
    lsb_first <= reg_cr1(8);
    loopback  <= reg_cr1(9);
    
    word_len <= reg_cr1(5 downto 0) when reg_cr1(5 downto 0) /= "000000" else "001000";

    -- Data/FIFO Control
    tx_data <= reg_wdata;
    
    tx_push <= '1' when (reg_we = '1' and reg_addr(7 downto 0) = ADDR_DATA) else '0';
    rx_pop  <= '1' when (reg_re = '1' and reg_addr(7 downto 0) = ADDR_DATA) else '0';

    -- Write Logic
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg_cr        <= x"00000400"; -- Default div=4
            reg_cr1       <= x"00000008"; -- Default 8-bit
            reg_cs        <= x"00000001";
            reg_fifo_ctrl <= (others => '0');
        elsif rising_edge(clk) then
            if reg_we = '1' then
                case reg_addr(7 downto 0) is
                    when ADDR_CR        => reg_cr <= reg_wdata;
                    when ADDR_CR1       => reg_cr1 <= reg_wdata;
                    when ADDR_CS        => reg_cs <= reg_wdata;
                    when ADDR_FIFO_CTRL => reg_fifo_ctrl <= reg_wdata;
                    when others         => null;
                end case;
            end if;
        end if;
    end process;

    -- Read Logic
    process(reg_addr, rx_data, reg_cr, reg_cr1, reg_cs, reg_fifo_ctrl, rx_almost_empty, tx_almost_full, rx_empty, busy, tx_full)
    begin
        reg_rdata <= (others => '0');
        case reg_addr(7 downto 0) is
            when ADDR_DATA      => reg_rdata <= rx_data;
            when ADDR_SR        => reg_rdata <= (3 => rx_almost_empty, 2 => tx_almost_full, 1 => rx_empty, 0 => busy, others => '0');
            when ADDR_CR        => reg_rdata <= reg_cr;
            when ADDR_CR1       => reg_rdata <= reg_cr1;
            when ADDR_CS        => reg_rdata <= reg_cs;
            when ADDR_FIFO_STAT => reg_rdata <= (0 => tx_full, others => '0');
            when ADDR_FIFO_CTRL => reg_rdata <= reg_fifo_ctrl;
            when others         => reg_rdata <= (others => '0');
        end case;
    end process;

    -- External Signals
    spi_cs_n   <= reg_cs(0);
    intr       <= done_intr;
    dma_tx_req <= not tx_almost_full;
    dma_rx_req <= not rx_empty;

end architecture rtl;
