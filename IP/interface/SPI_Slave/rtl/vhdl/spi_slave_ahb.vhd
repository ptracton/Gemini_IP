--------------------------------------------------------------------------------
-- Module Name: spi_slave_ahb
-- Description:
--    AHB Master Wrapper for the SPI Slave IP (VHDL-2008).
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_slave_ahb is
    port (
        -- SPI Interface
        spi_clk   : in  std_logic;
        spi_cs_n  : in  std_logic;
        spi_mosi  : in  std_logic;
        spi_miso  : out std_logic;

        -- AHB Master Interface
        hclk      : in  std_logic;
        hresetn   : in  std_logic; -- Active Low
        haddr     : out std_logic_vector(31 downto 0);
        hburst    : out std_logic_vector(2 downto 0);
        hmastlock : out std_logic;
        hprot     : out std_logic_vector(3 downto 0);
        hsize     : out std_logic_vector(2 downto 0);
        htrans    : out std_logic_vector(1 downto 0);
        hwdata    : out std_logic_vector(31 downto 0);
        hwrite    : out std_logic;
        hrdata    : in  std_logic_vector(31 downto 0);
        hready    : in  std_logic;
        hresp     : in  std_logic
    );
end entity spi_slave_ahb;

architecture rtl of spi_slave_ahb is

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

    signal bus_req   : std_logic;
    signal bus_addr  : std_logic_vector(31 downto 0);
    signal bus_we    : std_logic;
    signal bus_wdata : std_logic_vector(31 downto 0);
    signal bus_be    : std_logic_vector(3 downto 0);
    signal bus_size  : std_logic_vector(1 downto 0);
    signal bus_ack   : std_logic;
    signal bus_rdata : std_logic_vector(31 downto 0);

    type ahb_state_t is (IDLE, WAIT_REQ, ADDR_PHASE, DATA_PHASE);
    signal state : ahb_state_t;
    
    signal we_buf    : std_logic;
    signal wdata_buf : std_logic_vector(31 downto 0);

begin

    hburst    <= "000"; -- SINGLE
    hmastlock <= '0';
    hprot     <= "0011";

    u_core : spi_slave_core
    port map (
        spi_clk     => spi_clk,
        spi_cs_n    => spi_cs_n,
        spi_mosi    => spi_mosi,
        spi_miso    => spi_miso,
        sys_clk     => hclk,
        sys_rst_n   => hresetn,
        bus_req_o   => bus_req,
        bus_addr_o  => bus_addr,
        bus_we_o    => bus_we,
        bus_wdata_o => bus_wdata,
        bus_be_o    => bus_be,
        bus_size_o  => bus_size,
        bus_ack_i   => bus_ack,
        bus_rdata_i => bus_rdata
    );

    process(hclk, hresetn)
    begin
        if hresetn = '0' then
            state <= IDLE;
            htrans <= "00";
            haddr  <= (others => '0');
            hwrite <= '0';
            hsize  <= "010";
            hwdata <= (others => '0');
            bus_ack   <= '0';
            bus_rdata <= (others => '0');
            we_buf    <= '0';
            wdata_buf <= (others => '0');
        elsif rising_edge(hclk) then
            bus_ack <= '0';
            
            case state is
                when IDLE =>
                    if bus_req = '1' then
                        state <= WAIT_REQ;
                    end if;
                    htrans <= "00";

                when WAIT_REQ =>
                    state <= ADDR_PHASE;
                    haddr <= bus_addr;
                    hwrite <= bus_we;
                    htrans <= "10"; -- NONSEQ
                    hsize  <= '0' & bus_size;
                    we_buf <= bus_we;
                    wdata_buf <= bus_wdata;
                
                when ADDR_PHASE =>
                    if hready = '1' then
                        state <= DATA_PHASE;
                        htrans <= "00"; -- Post-transaction IDLE
                        if we_buf = '1' then
                            hwdata <= wdata_buf;
                        end if;
                    end if;
                
                when DATA_PHASE =>
                    if hready = '1' then
                        bus_rdata <= hrdata;
                        bus_ack <= '1';
                        state <= IDLE;
                    end if;
                
                when others => state <= IDLE;
            end case;
        end if;
    end process;

end architecture;
