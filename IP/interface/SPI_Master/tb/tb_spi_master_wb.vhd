--------------------------------------------------------------------------------
-- SPI Master Wishbone Wrapper Testbench (VHDL)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.wb_bfm_pkg.all;

entity tb_spi_master_wb is
end entity tb_spi_master_wb;

architecture sim of tb_spi_master_wb is

    constant ADDR_WIDTH : integer := 32;
    constant DATA_WIDTH : integer := 32;

    signal clk_i   : std_logic := '0';
    signal rst_i   : std_logic := '1'; -- Active High

    signal adr_i   : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal dat_i   : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal dat_o   : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal we_i    : std_logic;
    signal sel_i   : std_logic_vector(3 downto 0);
    signal stb_i   : std_logic;
    signal cyc_i   : std_logic;
    signal ack_o   : std_logic;
    signal err_o   : std_logic;

    signal spi_sclk : std_logic;
    signal spi_mosi : std_logic;
    signal spi_miso : std_logic;
    signal spi_cs_n : std_logic;

    signal intr       : std_logic;
    signal dma_tx_req : std_logic;
    signal dma_tx_ack : std_logic := '0';
    signal dma_rx_req : std_logic;
    signal dma_rx_ack : std_logic := '0';

    -- Register Offsets
    constant ADDR_DATA : std_logic_vector(31 downto 0) := x"00000000";
    constant ADDR_CR   : std_logic_vector(31 downto 0) := x"00000008";
    constant ADDR_CS   : std_logic_vector(31 downto 0) := x"0000000C";
    constant ADDR_CR1  : std_logic_vector(31 downto 0) := x"00000018";

begin

    dut : entity work.spi_master_wb
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            FIFO_DEPTH => 4
        )
        port map (
            clk_i      => clk_i,
            rst_i      => rst_i,
            adr_i      => adr_i,
            dat_i      => dat_i,
            dat_o      => dat_o,
            we_i       => we_i,
            sel_i      => sel_i,
            stb_i      => stb_i,
            cyc_i      => cyc_i,
            ack_o      => ack_o,
            err_o      => err_o,
            spi_sclk   => spi_sclk,
            spi_mosi   => spi_mosi,
            spi_miso   => spi_miso,
            spi_cs_n   => spi_cs_n,
            intr       => intr,
            dma_tx_req => dma_tx_req,
            dma_tx_ack => dma_tx_ack,
            dma_rx_req => dma_rx_req,
            dma_rx_ack => dma_rx_ack
        );

    -- Clock Generation
    clk_i <= not clk_i after 5 ns;

    -- Loopback
    spi_miso <= spi_mosi;

    -- Test Procedure
    process
        variable read_val : std_logic_vector(31 downto 0);
    begin
        -- Initialize BFM signals
        adr_i <= (others => '0');
        dat_i <= (others => '0');
        we_i  <= '0';
        sel_i <= "1111";
        stb_i <= '0';
        cyc_i <= '0';
        
        -- Reset
        rst_i <= '1';
        wait for 100 ns;
        rst_i <= '0';
        wait for 100 ns;

        report "--- Starting VHDL Wishbone Wrapper Test ---";

        -- Configure CR
        wb_write(ADDR_CR, x"00000401", clk_i, adr_i, dat_i, we_i, cyc_i, stb_i, sel_i, ack_o);

        -- Configure CR1 (32-bit)
        wb_write(ADDR_CR1, x"00000020", clk_i, adr_i, dat_i, we_i, cyc_i, stb_i, sel_i, ack_o);

        -- Select Slave
        wb_write(ADDR_CS, x"00000001", clk_i, adr_i, dat_i, we_i, cyc_i, stb_i, sel_i, ack_o);

        -- Write Data
        report "Writing Data to TX FIFO...";
        wb_write(ADDR_DATA, x"12345678", clk_i, adr_i, dat_i, we_i, cyc_i, stb_i, sel_i, ack_o);

        -- Wait Interrupt
        wait until intr = '1';
        report "Interrupt received!";

        -- Read Data
        report "Reading Data from RX FIFO...";
        wb_read(ADDR_DATA, read_val, clk_i, adr_i, dat_o, we_i, cyc_i, stb_i, sel_i, ack_o);
        
        report "Read Data: " & to_hstring(read_val);
        
        if read_val = x"12345678" then
            report "TEST PASS: Data matched";
        else
            report "TEST FAIL: Data mismatch (" & to_hstring(read_val) & " != 12345678)" severity failure;
        end if;

        report "--- Wishbone Wrapper Test Complete ---";
        std.env.finish;
        wait;
    end process;

end architecture sim;
