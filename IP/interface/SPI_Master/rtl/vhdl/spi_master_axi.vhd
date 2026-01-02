--------------------------------------------------------------------------------
-- SPI Master AXI4-Lite Wrapper (Enhanced VHDL Version)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_axi is
    generic (
        ADDR_WIDTH : integer := 32;
        DATA_WIDTH : integer := 32;
        FIFO_DEPTH : integer := 16
    );
    port (
        aclk    : in  std_logic;
        aresetn : in  std_logic;

        -- AXI4-Lite Interface
        awaddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        awprot  : in  std_logic_vector(2 downto 0);
        awvalid : in  std_logic;
        awready : out std_logic;
        wdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        wstrb   : in  std_logic_vector(DATA_WIDTH/8-1 downto 0);
        wvalid  : in  std_logic;
        wready  : out std_logic;
        bresp   : out std_logic_vector(1 downto 0);
        bvalid  : out std_logic;
        bready  : in  std_logic;
        araddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        arprot  : in  std_logic_vector(2 downto 0);
        arvalid : in  std_logic;
        arready : out std_logic;
        rdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        rresp   : out std_logic_vector(1 downto 0);
        rvalid  : out std_logic;
        rready  : in  std_logic;

        -- SPI Interface
        spi_sclk : out std_logic;
        spi_mosi : out std_logic;
        spi_miso : in  std_logic;
        spi_cs_n : out std_logic;

        -- Status & Handshaking
        intr       : out std_logic;
        dma_tx_req : out std_logic;
        dma_tx_ack : in  std_logic;
        dma_rx_req : out std_logic;
        dma_rx_ack : in  std_logic
    );
end entity spi_master_axi;

architecture rtl of spi_master_axi is

    -- Core Signals
    signal tx_data         : std_logic_vector(31 downto 0);
    signal tx_push         : std_logic;
    signal tx_full         : std_logic;
    signal tx_almost_full  : std_logic;

    signal rx_data         : std_logic_vector(31 downto 0);
    signal rx_pop          : std_logic;
    signal rx_empty        : std_logic;
    signal rx_almost_empty : std_logic;

    signal busy            : std_logic;
    signal done_intr       : std_logic;

    -- Configuration Signals
    signal enable    : std_logic;
    signal cpol      : std_logic;
    signal cpha      : std_logic;
    signal lsb_first : std_logic;
    signal loopback  : std_logic;
    signal clk_div   : std_logic_vector(7 downto 0);
    signal word_len  : std_logic_vector(5 downto 0);

    -- Native Bus Signals
    signal reg_we    : std_logic;
    signal reg_re    : std_logic;
    signal reg_addr  : std_logic_vector(31 downto 0);
    signal reg_wdata : std_logic_vector(31 downto 0);
    signal reg_rdata : std_logic_vector(31 downto 0);

begin

    -- AXI Slave Adapter
    adapter_inst : entity work.axi4lite_slave_adapter
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            aclk           => aclk,
            aresetn        => aresetn,
            s_axi_awaddr   => awaddr,
            s_axi_awprot   => awprot,
            s_axi_awvalid  => awvalid,
            s_axi_awready  => awready,
            s_axi_wdata    => wdata,
            s_axi_wstrb    => wstrb,
            s_axi_wvalid   => wvalid,
            s_axi_wready   => wready,
            s_axi_bresp    => bresp,
            s_axi_bvalid   => bvalid,
            s_axi_bready   => bready,
            s_axi_araddr   => araddr,
            s_axi_arprot   => arprot,
            s_axi_arvalid  => arvalid,
            s_axi_arready  => arready,
            s_axi_rdata    => rdata,
            s_axi_rresp    => rresp,
            s_axi_rvalid   => rvalid,
            s_axi_rready   => rready,
            
            reg_we    => reg_we,
            reg_re    => reg_re,
            reg_addr  => reg_addr,
            reg_wdata => reg_wdata,
            reg_rdata => reg_rdata,
            reg_be    => open
        );

    -- Register Module
    regs_inst : entity work.spi_master_registers
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            clk => aclk,
            rst_n => aresetn,
            reg_we => reg_we,
            reg_re => reg_re,
            reg_addr => reg_addr,
            reg_wdata => reg_wdata,
            reg_rdata => reg_rdata,

            rx_data => rx_data,
            tx_full => tx_full,
            tx_almost_full => tx_almost_full,
            rx_empty => rx_empty,
            rx_almost_empty => rx_almost_empty,
            busy => busy,
            done_intr => done_intr,

            tx_data => tx_data,
            tx_push => tx_push,
            rx_pop => rx_pop,
            cpol => cpol,
            cpha => cpha,
            clk_div => clk_div,
            word_len => word_len,
            lsb_first => lsb_first,
            loopback => loopback,
            enable => enable,

            spi_cs_n => spi_cs_n,
            intr => intr,
            dma_tx_req => dma_tx_req,
            dma_rx_req => dma_rx_req
        );

    -- SPI Core
    core_inst : entity work.spi_master_core
        generic map (
            FIFO_DEPTH => FIFO_DEPTH
        )
        port map (
            clk             => aclk,
            rst_n           => aresetn,
            sclk            => spi_sclk,
            mosi            => spi_mosi,
            miso            => spi_miso,
            tx_data         => tx_data,
            tx_push         => tx_push,
            tx_full         => tx_full,
            tx_almost_full  => tx_almost_full,
            rx_data         => rx_data,
            rx_pop          => rx_pop,
            rx_empty        => rx_empty,
            rx_almost_empty => rx_almost_empty,
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

end architecture rtl;
