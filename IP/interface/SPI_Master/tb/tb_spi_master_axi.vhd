--------------------------------------------------------------------------------
-- SPI Master AXI Wrapper Testbench (VHDL)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.axi_bfm_pkg.all;

entity tb_spi_master_axi is
end entity tb_spi_master_axi;

architecture sim of tb_spi_master_axi is

    constant ADDR_WIDTH : integer := 32;
    constant DATA_WIDTH : integer := 32;

    signal aclk    : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal awaddr  : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal awprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal awvalid : std_logic;
    signal awready : std_logic;
    signal wdata   : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal wstrb   : std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    signal wvalid  : std_logic;
    signal wready  : std_logic;
    signal bresp   : std_logic_vector(1 downto 0);
    signal bvalid  : std_logic;
    signal bready  : std_logic;
    signal araddr  : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal arprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal arvalid : std_logic;
    signal arready : std_logic;
    signal rdata   : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal rresp   : std_logic_vector(1 downto 0);
    signal rvalid  : std_logic;
    signal rready  : std_logic;

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

    dut : entity work.spi_master_axi
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH,
            FIFO_DEPTH => 4
        )
        port map (
            aclk       => aclk,
            aresetn    => aresetn,
            awaddr     => awaddr,
            awprot     => awprot,
            awvalid    => awvalid,
            awready    => awready,
            wdata      => wdata,
            wstrb      => wstrb,
            wvalid     => wvalid,
            wready     => wready,
            bresp      => bresp,
            bvalid     => bvalid,
            bready     => bready,
            araddr     => araddr,
            arprot     => arprot,
            arvalid    => arvalid,
            arready    => arready,
            rdata      => rdata,
            rresp      => rresp,
            rvalid     => rvalid,
            rready     => rready,
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
    aclk <= not aclk after 5 ns;

    -- Loopback
    spi_miso <= spi_mosi;

    -- Test Procedure
    process
        variable read_val : std_logic_vector(31 downto 0);
    begin
        -- Initialize
        aresetn <= '0';
        wait for 100 ns;
        aresetn <= '1';
        wait for 100 ns;

        report "--- Starting VHDL AXI Wrapper Test ---";

        -- Configure CR
        axi_write(ADDR_CR, x"00000401", aclk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bready, bvalid);

        -- Configure CR1 (32-bit)
        axi_write(ADDR_CR1, x"00000020", aclk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bready, bvalid);

        -- Select Slave
        axi_write(ADDR_CS, x"00000001", aclk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bready, bvalid);

        -- Write Data
        report "Writing Data to TX FIFO...";
        axi_write(ADDR_DATA, x"CAFEBABE", aclk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bready, bvalid);

        -- Wait Interrupt
        wait until intr = '1';
        report "Interrupt received!";

        -- Read Data
        report "Reading Data from RX FIFO...";
        axi_read(ADDR_DATA, read_val, aclk, araddr, arvalid, arready, rready, rvalid, rdata);
        
        report "Read Data: " & to_hstring(read_val);
        
        if read_val = x"CAFEBABE" then
            report "TEST PASS: Data matched";
        else
            report "TEST FAIL: Data mismatch (" & to_hstring(read_val) & " != CAFEBABE)" severity failure;
        end if;

        report "--- AXI Wrapper Test Complete ---";
        std.env.finish;
        wait;
    end process;

end architecture sim;
