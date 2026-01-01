-- uart_axi.vhd
--
-- AXI4-Lite Wrapper for UART IP.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_axi is
    generic (
        DEFAULT_BAUD_DIV : integer := 27
    );
    port (
        -- AXI4-Lite Slave Interface
        s_axi_aclk    : in  std_logic;
        s_axi_aresetn : in  std_logic;
        s_axi_awaddr  : in  std_logic_vector(31 downto 0);
        s_axi_awprot  : in  std_logic_vector(2 downto 0);
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;
        s_axi_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;
        s_axi_araddr  : in  std_logic_vector(31 downto 0);
        s_axi_arprot  : in  std_logic_vector(2 downto 0);
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;
        s_axi_rdata   : out std_logic_vector(31 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;

        -- UART Physical Interface
        uart_rxd   : in  std_logic;
        uart_txd   : out std_logic;
        uart_rts_n : out std_logic;
        uart_cts_n : in  std_logic;
        uart_de    : out std_logic;

        -- DMA Handshake
        dma_tx_req : out std_logic;
        dma_rx_req : out std_logic;

        -- Interrupt
        intr     : out std_logic
    );
end entity uart_axi;

architecture rtl of uart_axi is

    -- Native Register Interface signals
    signal reg_addr  : std_logic_vector(31 downto 0);
    signal reg_wdata : std_logic_vector(31 downto 0);
    signal reg_rdata : std_logic_vector(31 downto 0);
    signal reg_we    : std_logic;
    signal reg_re    : std_logic;
    signal reg_be    : std_logic_vector(3 downto 0);

    component axi4lite_slave_adapter is
        generic (
            ADDR_WIDTH : integer := 32;
            DATA_WIDTH : integer := 32
        );
        port (
            aclk          : in  std_logic;
            aresetn       : in  std_logic;
            s_axi_awaddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
            s_axi_awprot  : in  std_logic_vector(2 downto 0);
            s_axi_awvalid : in  std_logic;
            s_axi_awready : out std_logic;
            s_axi_wdata   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            s_axi_wstrb   : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
            s_axi_wvalid  : in  std_logic;
            s_axi_wready  : out std_logic;
            s_axi_bresp   : out std_logic_vector(1 downto 0);
            s_axi_bvalid  : out std_logic;
            s_axi_bready  : in  std_logic;
            s_axi_araddr  : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
            s_axi_arprot  : in  std_logic_vector(2 downto 0);
            s_axi_arvalid : in  std_logic;
            s_axi_arready : out std_logic;
            s_axi_rdata   : out std_logic_vector(DATA_WIDTH-1 downto 0);
            s_axi_rresp   : out std_logic_vector(1 downto 0);
            s_axi_rvalid  : out std_logic;
            s_axi_rready  : in  std_logic;
            reg_addr      : out std_logic_vector(ADDR_WIDTH-1 downto 0);
            reg_wdata     : out std_logic_vector(DATA_WIDTH-1 downto 0);
            reg_rdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            reg_we        : out std_logic;
            reg_re        : out std_logic;
            reg_be        : out std_logic_vector((DATA_WIDTH/8)-1 downto 0)
        );
    end component;

    component uart_core is
        generic (
            DEFAULT_BAUD_DIV : integer := 27;
            FIFO_DEPTH       : integer := 16
        );
        port (
            clk      : in  std_logic;
            rst_n    : in  std_logic;

            uart_rxd   : in  std_logic;
            uart_txd   : out std_logic;
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

    adapter_inst : axi4lite_slave_adapter
        port map (
            aclk          => s_axi_aclk,
            aresetn       => s_axi_aresetn,
            s_axi_awaddr  => s_axi_awaddr,
            s_axi_awprot  => s_axi_awprot,
            s_axi_awvalid => s_axi_awvalid,
            s_axi_awready => s_axi_awready,
            s_axi_wdata   => s_axi_wdata,
            s_axi_wstrb   => s_axi_wstrb,
            s_axi_wvalid  => s_axi_wvalid,
            s_axi_wready  => s_axi_wready,
            s_axi_bresp   => s_axi_bresp,
            s_axi_bvalid  => s_axi_bvalid,
            s_axi_bready  => s_axi_bready,
            s_axi_araddr  => s_axi_araddr,
            s_axi_arprot  => s_axi_arprot,
            s_axi_arvalid => s_axi_arvalid,
            s_axi_arready => s_axi_arready,
            s_axi_rdata   => s_axi_rdata,
            s_axi_rresp   => s_axi_rresp,
            s_axi_rvalid  => s_axi_rvalid,
            s_axi_rready  => s_axi_rready,
            reg_addr      => reg_addr,
            reg_wdata     => reg_wdata,
            reg_rdata     => reg_rdata,
            reg_we        => reg_we,
            reg_re        => reg_re,
            reg_be        => reg_be
        );

    core_inst : uart_core
        generic map (
            DEFAULT_BAUD_DIV => DEFAULT_BAUD_DIV
        )
        port map (
            clk        => s_axi_aclk,
            rst_n      => s_axi_aresetn,
            uart_rxd   => uart_rxd,
            uart_txd   => uart_txd,
            uart_rts_n => uart_rts_n,
            uart_cts_n => uart_cts_n,
            uart_de    => uart_de,
            reg_addr   => reg_addr,
            reg_wdata  => reg_wdata,
            reg_rdata  => reg_rdata,
            reg_we     => reg_we,
            reg_re     => reg_re,
            reg_be     => reg_be,
            dma_tx_req => dma_tx_req,
            dma_rx_req => dma_rx_req,
            intr       => intr
        );

end architecture rtl;
