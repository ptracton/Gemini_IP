--------------------------------------------------------------------------------
-- SPI Master Core Native Testbench (Enhanced)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_master_core is
end entity tb_spi_master_core;

architecture sim of tb_spi_master_core is

    signal clk             : std_logic := '0';
    signal rst_n           : std_logic := '0';

    signal sclk            : std_logic;
    signal mosi            : std_logic;
    signal miso            : std_logic := '0';

    signal tx_data         : std_logic_vector(31 downto 0) := (others => '0');
    signal tx_push         : std_logic := '0';
    signal tx_full         : std_logic;
    
    signal rx_data         : std_logic_vector(31 downto 0);
    signal rx_pop          : std_logic := '0';
    signal rx_empty        : std_logic;

    signal cpol            : std_logic := '0';
    signal cpha            : std_logic := '0';
    signal clk_div         : std_logic_vector(7 downto 0) := x"04";
    signal word_len        : std_logic_vector(5 downto 0) := "001000";
    signal lsb_first       : std_logic := '0';
    signal loopback        : std_logic := '1';
    signal enable          : std_logic := '0';
    
    signal busy            : std_logic;
    signal done_intr       : std_logic;

begin

    dut : entity work.spi_master_core
        generic map (
            FIFO_DEPTH => 4
        )
        port map (
            clk             => clk,
            rst_n           => rst_n,
            sclk            => sclk,
            mosi            => mosi,
            miso            => miso,
            tx_data         => tx_data,
            tx_push         => tx_push,
            tx_full         => tx_full,
            tx_almost_full  => open,
            rx_data         => rx_data,
            rx_pop          => rx_pop,
            rx_empty        => rx_empty,
            rx_almost_empty => open,
            cpol            => cpol,
            cpha            => cpha,
            clk_div         => clk_div,
            word_len        => word_len,
            lsb_first       => lsb_first,
            loopback        => loopback,
            enable          => enable,
            busy            => busy,
            done_intr       => done_intr
        );

    -- Clock Generation
    clk <= not clk after 5 ns;

    -- Loopback in HW mode
    miso <= mosi when loopback = '1' else '0';

    -- Test Procedure
    process
        procedure test_transfer(data : std_logic_vector(31 downto 0); len : integer; lsb : std_logic) is
        begin
            report "Transfer: len=" & integer'image(len) & ", lsb=" & std_logic'image(lsb) & ", data=" & to_hstring(data);
            word_len <= std_logic_vector(to_unsigned(len, 6));
            lsb_first <= lsb;
            
            tx_data <= data;
            tx_push <= '1';
            wait until rising_edge(clk);
            tx_push <= '0';
            
            wait until done_intr = '1';
            wait until rx_empty = '0';
            wait until rising_edge(clk);
            
            report "Received: " & to_hstring(rx_data);
            rx_pop <= '1';
            wait until rising_edge(clk);
            rx_pop <= '0';
            wait until rising_edge(clk);
        end procedure;

    begin
        -- Reset
        rst_n <= '0';
        wait for 100 ns;
        rst_n <= '1';
        wait for 100 ns;
        enable <= '1';
        wait for 20 ns;

        -- Mode 0, 8-bit
        test_transfer(x"000000A5", 8, '0');

        -- Mode 0, 16-bit
        test_transfer(x"00001234", 16, '0');

        -- Mode 0, 32-bit
        test_transfer(x"DEADBEEF", 32, '0');

        -- LSB First, 12-bit
        test_transfer(x"00000ABC", 12, '1');

        report "Enhanced VHDL SPI Core Test Complete";
        std.env.finish;
        wait;
    end process;

end architecture sim;
