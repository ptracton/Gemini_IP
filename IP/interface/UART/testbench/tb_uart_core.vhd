-- tb_uart_core.vhd
--
-- Native VHDL Testbench for UART Core.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_uart_core is
end entity tb_uart_core;

architecture tb of tb_uart_core is

    -- Parameters
    constant CLK_PERIOD : time := 20 ns; -- 50MHz
    constant BAUD_DIV   : integer := 27;

    -- Signals
    signal clk       : std_logic := '0';
    signal rst_n     : std_logic := '0';
    signal uart_rxd  : std_logic := '1';
    signal uart_txd  : std_logic;
    signal uart_rts_n : std_logic;
    signal uart_cts_n : std_logic := '1';
    signal uart_de    : std_logic;
    signal reg_addr  : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_wdata : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_rdata : std_logic_vector(31 downto 0);
    signal reg_we    : std_logic := '0';
    signal reg_re    : std_logic := '0';
    signal reg_be    : std_logic_vector(3 downto 0) := (others => '0');
    signal dma_tx_req : std_logic;
    signal dma_rx_req : std_logic;
    signal intr      : std_logic;

    component uart_core is
        generic (
            DEFAULT_BAUD_DIV : integer := 27;
            FIFO_DEPTH       : integer := 16
        );
        port (
            clk      : in  std_logic;
            rst_n    : in  std_logic;
            uart_rxd : in  std_logic;
            uart_txd : out std_logic;
            uart_rts_n : out std_logic;
            uart_cts_n : in  std_logic;
            uart_de    : out std_logic;
            reg_addr  : in  std_logic_vector(31 downto 0);
            reg_wdata : in  std_logic_vector(31 downto 0);
            reg_rdata : out std_logic_vector(31 downto 0);
            reg_we    : in  std_logic;
            reg_re    : in  std_logic;
            reg_be    : in  std_logic_vector(3 downto 0);
            dma_tx_req : out std_logic;
            dma_rx_req : out std_logic;
            intr     : out std_logic
        );
    end component;

begin

    -- Instantiate DUT
    dut : uart_core
        generic map (
            DEFAULT_BAUD_DIV => BAUD_DIV
        )
        port map (
            clk       => clk,
            rst_n     => rst_n,
            uart_rxd  => uart_rxd,
            uart_txd  => uart_txd,
            uart_rts_n => uart_rts_n,
            uart_cts_n => uart_cts_n,
            uart_de    => uart_de,
            reg_addr  => reg_addr,
            reg_wdata => reg_wdata,
            reg_rdata => reg_rdata,
            reg_we    => reg_we,
            reg_re    => reg_re,
            reg_be    => reg_be,
            dma_tx_req => dma_tx_req,
            dma_rx_req => dma_rx_req,
            intr      => intr
        );

    -- Clock Generation
    clk_gen : process
    begin
        while now < 1 ms loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Loopback
    uart_rxd <= uart_txd;

    -- Test Sequence
    stim_proc : process
        procedure write_reg(addr : in std_logic_vector(31 downto 0); data : in std_logic_vector(31 downto 0)) is
        begin
            wait until rising_edge(clk);
            reg_addr  <= addr;
            reg_wdata <= data;
            reg_we    <= '1';
            reg_be    <= x"F";
            wait until rising_edge(clk);
            reg_we    <= '0';
        end procedure;

        procedure read_reg(addr : in std_logic_vector(31 downto 0); data : out std_logic_vector(31 downto 0)) is
        begin
            wait until rising_edge(clk);
            reg_addr <= addr;
            reg_re   <= '1';
            wait until rising_edge(clk);
            reg_re   <= '0';
            data     := reg_rdata;
        end procedure;

        variable v_data : std_logic_vector(31 downto 0);
        variable v_status : std_logic_vector(31 downto 0);

    begin
        -- Initialize
        rst_n <= '0';
        wait for 100 ns;
        rst_n <= '1';
        wait for 100 ns;

        report "--- Starting UART Core VHDL Test ---";

        -- 1. Configure UART
        write_reg(x"00000008", x"0000000F");
        report "Configured UART: 8N1, TX/RX Enabled, Interrupts Enabled";

        -- 2. Transmit Data
        report "Transmitting 0x5A...";
        write_reg(x"00000000", x"0000005A");

        -- 3. Wait for RX Ready
        loop
            read_reg(x"00000004", v_status);
            exit when v_status(0) = '1';
            wait for 10 us;
        end loop;
        report "RX Ready detected!";

        -- 4. Read Data
        read_reg(x"00000000", v_data);
        report "Received Data: 0x" & to_hstring(v_data(7 downto 0));

        if v_data(7 downto 0) = x"5A" then
            report "PASS: Data matches!";
        else
            report "FAIL: Data mismatch!";
        end if;

        wait for 100 us;
        report "--- UART Core VHDL Test Complete ---";
        wait;
    end process;

end architecture tb;
