--------------------------------------------------------------------------------
-- SPI Master APB Wrapper Testbench (VHDL)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.apb_bfm_pkg.all;

entity tb_spi_master_apb is
end entity tb_spi_master_apb;

architecture sim of tb_spi_master_apb is

    constant ADDR_WIDTH : integer := 32;
    constant DATA_WIDTH : integer := 32;

    signal pclk    : std_logic := '0';
    signal presetn : std_logic := '0';

    signal paddr   : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal pmel    : std_logic; -- Typo protection, usually psel
    signal psel    : std_logic; 
    signal penable : std_logic;
    signal pwrite  : std_logic;
    signal pwdata  : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal pstrb   : std_logic_vector(3 downto 0);
    signal pprot   : std_logic_vector(2 downto 0);
    signal pready  : std_logic;
    signal prdata  : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal pslverr : std_logic;

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
    constant ADDR_SR   : std_logic_vector(31 downto 0) := x"00000004";
    constant ADDR_CR   : std_logic_vector(31 downto 0) := x"00000008";
    constant ADDR_CS   : std_logic_vector(31 downto 0) := x"0000000C";
    constant ADDR_CR1  : std_logic_vector(31 downto 0) := x"00000018";

begin

    dut : entity work.spi_master_apb
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            FIFO_DEPTH => 4
        )
        port map (
            pclk       => pclk,
            presetn    => presetn,
            paddr      => paddr,
            psel       => psel,
            penable    => penable,
            pwrite     => pwrite,
            pwdata     => pwdata,
            pstrb      => pstrb,
            pprot      => pprot,
            pready     => pready,
            prdata     => prdata,
            pslverr    => pslverr,
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
    pclk <= not pclk after 5 ns;

    -- Loopback
    spi_miso <= spi_mosi;

    -- Test Procedure
    process
        variable read_val : std_logic_vector(31 downto 0);
    begin
        -- Initialize BFM signals (optional, BFM drives them)
        pstrb <= x"0";
        pprot <= (others => '0');
        
        -- Reset
        presetn <= '0';
        wait for 100 ns;
        presetn <= '1';
        wait for 100 ns;

        report "--- Starting VHDL APB Wrapper Test ---";

        -- 1. Configure Control Register (Enable)
        apb_write(ADDR_CR, x"00000401", pclk, paddr, pwdata, pwrite, psel, penable, pstrb, pready);

        -- 2. Configure CR1 (32-bit)
        apb_write(ADDR_CR1, x"00000020", pclk, paddr, pwdata, pwrite, psel, penable, pstrb, pready);

        -- 3. Select Slave
        apb_write(ADDR_CS, x"00000001", pclk, paddr, pwdata, pwrite, psel, penable, pstrb, pready);

        -- 4. Write Data
        report "Writing Data to TX FIFO...";
        apb_write(ADDR_DATA, x"DEADBEEF", pclk, paddr, pwdata, pwrite, psel, penable, pstrb, pready);

        -- 5. Wait for Interrupt
        wait until intr = '1';
        report "Interrupt received!";

        -- 6. Read Data
        report "Reading Data from RX FIFO...";
        apb_read(ADDR_DATA, read_val, pclk, paddr, prdata, pwrite, psel, penable, pready);
        
        report "Read Data: " & to_hstring(read_val);
        
        if read_val = x"DEADBEEF" then
            report "TEST PASS: Data matched";
        else
            report "TEST FAIL: Data mismatch (" & to_hstring(read_val) & " != DEADBEEF)" severity failure;
        end if;

        report "--- APB Wrapper Test Complete ---";
        std.env.finish;
        wait;
    end process;

end architecture sim;
