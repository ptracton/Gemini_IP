-- uart_wb.vhd
--
-- Wishbone B4 Wrapper for UART IP.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_wb is
    generic (
        DEFAULT_BAUD_DIV : integer := 27
    );
    port (
        -- Wishbone Slave Interface
        wb_clk_i : in  std_logic;
        wb_rst_i : in  std_logic;
        wb_adr_i : in  std_logic_vector(31 downto 0);
        wb_dat_i : in  std_logic_vector(31 downto 0);
        wb_dat_o : out std_logic_vector(31 downto 0);
        wb_we_i  : in  std_logic;
        wb_sel_i : in  std_logic_vector(3 downto 0);
        wb_stb_i : in  std_logic;
        wb_cyc_i : in  std_logic;
        wb_ack_o : out std_logic;
        wb_err_o : out std_logic;

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
end entity uart_wb;

architecture rtl of uart_wb is

    -- Native Register Interface signals
    signal reg_addr  : std_logic_vector(31 downto 0);
    signal reg_wdata : std_logic_vector(31 downto 0);
    signal reg_rdata : std_logic_vector(31 downto 0);
    signal reg_we    : std_logic;
    signal reg_re    : std_logic;
    signal reg_be    : std_logic_vector(3 downto 0);

    signal rst_n : std_logic;

    component wb_slave_adapter is
        generic (
            ADDR_WIDTH : integer := 32;
            DATA_WIDTH : integer := 32
        );
        port (
            wb_clk_i : in  std_logic;
            wb_rst_i : in  std_logic;
            wb_adr_i : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
            wb_dat_i : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            wb_dat_o : out std_logic_vector(DATA_WIDTH-1 downto 0);
            wb_we_i  : in  std_logic;
            wb_sel_i : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
            wb_stb_i : in  std_logic;
            wb_cyc_i : in  std_logic;
            wb_ack_o : out std_logic;
            wb_err_o : out std_logic;
            wb_stall_o : out std_logic;
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

    rst_n <= not wb_rst_i;

    adapter_inst : wb_slave_adapter
        port map (
            wb_clk_i => wb_clk_i,
            wb_rst_i => wb_rst_i,
            wb_adr_i => wb_adr_i,
            wb_dat_i => wb_dat_i,
            wb_dat_o => wb_dat_o,
            wb_we_i  => wb_we_i,
            wb_sel_i => wb_sel_i,
            wb_stb_i => wb_stb_i,
            wb_cyc_i => wb_cyc_i,
            wb_ack_o => wb_ack_o,
            wb_err_o => wb_err_o,
            wb_stall_o => open,
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
            clk        => wb_clk_i,
            rst_n      => rst_n,
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
