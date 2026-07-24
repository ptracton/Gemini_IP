--------------------------------------------------------------------------------
-- Module Name: spi_slave_wb
-- Description:
--    Wishbone B4 Wrapper for the SPI Slave IP (VHDL-2008).
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity spi_slave_wb is
    port (
        -- SPI Interface
        spi_clk   : in  std_logic;
        spi_cs_n  : in  std_logic;
        spi_mosi  : in  std_logic;
        spi_miso  : out std_logic;

        -- Wishbone Master Interface
        wb_clk_i  : in  std_logic;
        wb_rst_i  : in  std_logic; -- Active High
        wb_cyc_o  : out std_logic;
        wb_stb_o  : out std_logic;
        wb_we_o   : out std_logic;
        wb_addr_o : out std_logic_vector(31 downto 0);
        wb_data_o : out std_logic_vector(31 downto 0);
        wb_sel_o  : out std_logic_vector(3 downto 0);
        wb_ack_i  : in  std_logic;
        wb_data_i : in  std_logic_vector(31 downto 0)
    );
end entity spi_slave_wb;

architecture rtl of spi_slave_wb is

    -- Component Declaration
    component spi_slave_core is
        port (
            spi_clk     : in  std_logic;
            spi_cs_n    : in  std_logic;
            spi_mosi    : in  std_logic;
            spi_miso    : out std_logic;
            sys_clk     : in  std_logic;
            sys_rst_n   : in  std_logic;
            bus_req_o   : out std_logic;
            bus_addr_o  : out std_logic_vector(31 downto 0);
            bus_we_o    : out std_logic;
            bus_wdata_o : out std_logic_vector(31 downto 0);
            bus_be_o    : out std_logic_vector(3 downto 0);
            bus_size_o  : out std_logic_vector(1 downto 0);
            bus_ack_i   : in  std_logic;
            bus_rdata_i : in  std_logic_vector(31 downto 0)
        );
    end component;

    signal sys_rst_n : std_logic;
    signal core_req  : std_logic;
    
    -- Unused
    signal core_size : std_logic_vector(1 downto 0);

begin

    sys_rst_n <= not wb_rst_i;
    
    wb_cyc_o <= core_req;
    wb_stb_o <= core_req;

    u_core : spi_slave_core
    port map (
        spi_clk     => spi_clk,
        spi_cs_n    => spi_cs_n,
        spi_mosi    => spi_mosi,
        spi_miso    => spi_miso,

        sys_clk     => wb_clk_i,
        sys_rst_n   => sys_rst_n,

        bus_req_o   => core_req,
        bus_addr_o  => wb_addr_o,
        bus_we_o    => wb_we_o,
        bus_wdata_o => wb_data_o,
        bus_be_o    => wb_sel_o,
        bus_size_o  => core_size,
        
        bus_ack_i   => wb_ack_i,
        bus_rdata_i => wb_data_i
    );

end architecture;
