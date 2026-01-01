-- uart_apb.vhd
--
-- APB4 Wrapper for UART IP.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_apb is
    generic (
        DEFAULT_BAUD_DIV : integer := 27
    );
    port (
        -- APB Slave Interface
        pclk    : in  std_logic;
        presetn : in  std_logic;
        paddr   : in  std_logic_vector(31 downto 0);
        pprot   : in  std_logic_vector(2 downto 0);
        psel    : in  std_logic;
        penable : in  std_logic;
        pwrite  : in  std_logic;
        pwdata  : in  std_logic_vector(31 downto 0);
        pstrb   : in  std_logic_vector(3 downto 0);
        pready  : out std_logic;
        prdata  : out std_logic_vector(31 downto 0);
        pslverr : out std_logic;

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
end entity uart_apb;

architecture rtl of uart_apb is

    -- Native Register Interface signals
    signal reg_addr  : std_logic_vector(31 downto 0);
    signal reg_wdata : std_logic_vector(31 downto 0);
    signal reg_rdata : std_logic_vector(31 downto 0);
    signal reg_we    : std_logic;
    signal reg_re    : std_logic;
    signal reg_be    : std_logic_vector(3 downto 0);

    component apb_slave_adapter is
        generic (
            ADDR_WIDTH : integer := 32;
            DATA_WIDTH : integer := 32
        );
        port (
            pclk    : in  std_logic;
            presetn : in  std_logic;
            psel    : in  std_logic;
            penable : in  std_logic;
            paddr   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
            pwrite  : in  std_logic;
            pwdata  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            pready  : out std_logic;
            prdata  : out std_logic_vector(DATA_WIDTH-1 downto 0);
            pslverr : out std_logic;
            reg_addr  : out std_logic_vector(ADDR_WIDTH-1 downto 0);
            reg_wdata : out std_logic_vector(DATA_WIDTH-1 downto 0);
            reg_rdata : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            reg_we    : out std_logic;
            reg_re    : out std_logic;
            reg_be    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0)
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

    adapter_inst : apb_slave_adapter
        port map (
            pclk    => pclk,
            presetn => presetn,
            psel    => psel,
            penable => penable,
            paddr   => paddr,
            pwrite  => pwrite,
            pwdata  => pwdata,
            pready  => pready,
            prdata  => prdata,
            pslverr => pslverr,
            reg_addr => reg_addr,
            reg_wdata=> reg_wdata,
            reg_rdata=> reg_rdata,
            reg_we   => reg_we,
            reg_re   => reg_re,
            reg_be   => reg_be
        );

    core_inst : uart_core
        generic map (
            DEFAULT_BAUD_DIV => DEFAULT_BAUD_DIV
        )
        port map (
            clk        => pclk,
            rst_n      => presetn,
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
