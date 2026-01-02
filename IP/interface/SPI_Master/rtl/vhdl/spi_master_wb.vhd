--------------------------------------------------------------------------------
-- SPI Master Wishbone Wrapper (Enhanced VHDL Version)
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_wb is
    generic (
        ADDR_WIDTH : integer := 32;
        DATA_WIDTH : integer := 32;
        FIFO_DEPTH : integer := 16
    );
    port (
        clk_i   : in  std_logic;
        rst_i   : in  std_logic;

        -- Wishbone Interface
        adr_i   : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        dat_i   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        dat_o   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        we_i    : in  std_logic;
        sel_i   : in  std_logic_vector(3 downto 0);
        stb_i   : in  std_logic;
        cyc_i   : in  std_logic;
        ack_o   : out std_logic;
        err_o   : out std_logic;

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
end entity spi_master_wb;

architecture rtl of spi_master_wb is

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
    
    signal rst_n : std_logic;

begin

    rst_n <= not rst_i;

    -- Wishbone Slave Adapter
    adapter_inst : entity work.wb_slave_adapter
        generic map (
            ADDR_WIDTH => ADDR_WIDTH,
            DATA_WIDTH => DATA_WIDTH
        )
        port map (
            wb_clk_i     => clk_i,
            wb_rst_i     => rst_i,
            wb_adr_i     => adr_i,
            wb_dat_i     => dat_i,
            wb_dat_o     => dat_o,
            wb_we_i      => we_i,
            wb_sel_i     => sel_i,
            wb_stb_i     => stb_i,
            wb_cyc_i     => cyc_i,
            wb_ack_o     => ack_o,
            wb_err_o     => err_o,
            wb_stall_o   => open,
            
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
            clk => clk_i,
            rst_n => rst_n,
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
            clk             => clk_i,
            rst_n           => rst_n,
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
