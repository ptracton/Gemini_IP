--------------------------------------------------------------------------------
-- Module Name: spi_slave_axi
-- Description:
--    AXI4-Lite Master Wrapper for the SPI Slave IP (VHDL-2008).
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_slave_axi is
    port (
        -- SPI Interface
        spi_clk   : in  std_logic;
        spi_cs_n  : in  std_logic;
        spi_mosi  : in  std_logic;
        spi_miso  : out std_logic;

        -- AXI4-Lite Master Interface
        aclk      : in  std_logic;
        aresetn   : in  std_logic; -- Active Low

        -- Write Address Channel
        m_axi_awaddr  : out std_logic_vector(31 downto 0);
        m_axi_awprot  : out std_logic_vector(2 downto 0);
        m_axi_awvalid : out std_logic;
        m_axi_awready : in  std_logic;

        -- Write Data Channel
        m_axi_wdata   : out std_logic_vector(31 downto 0);
        m_axi_wstrb   : out std_logic_vector(3 downto 0);
        m_axi_wvalid  : out std_logic;
        m_axi_wready  : in  std_logic;

        -- Write Response Channel
        m_axi_bresp   : in  std_logic_vector(1 downto 0);
        m_axi_bvalid  : in  std_logic;
        m_axi_bready  : out std_logic;

        -- Read Address Channel
        m_axi_araddr  : out std_logic_vector(31 downto 0);
        m_axi_arprot  : out std_logic_vector(2 downto 0);
        m_axi_arvalid : out std_logic;
        m_axi_arready : in  std_logic;

        -- Read Data Channel
        m_axi_rdata   : in  std_logic_vector(31 downto 0);
        m_axi_rresp   : in  std_logic_vector(1 downto 0);
        m_axi_rvalid  : in  std_logic;
        m_axi_rready  : out std_logic
    );
end entity spi_slave_axi;

architecture rtl of spi_slave_axi is

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

    type axi_state_t is (IDLE, WAIT_REQ, WADDR, WDATA_CH, WRESP, RADDR, RDATA_CH);
    signal state : axi_state_t;

begin

    m_axi_awprot <= "000";
    m_axi_arprot <= "000";

    u_core : spi_slave_core
    port map (
        spi_clk     => spi_clk,
        spi_cs_n    => spi_cs_n,
        spi_mosi    => spi_mosi,
        spi_miso    => spi_miso,
        sys_clk     => aclk,
        sys_rst_n   => aresetn,
        bus_req_o   => bus_req,
        bus_addr_o  => bus_addr,
        bus_we_o    => bus_we,
        bus_wdata_o => bus_wdata,
        bus_be_o    => bus_be,
        bus_size_o  => bus_size,
        bus_ack_i   => bus_ack,
        bus_rdata_i => bus_rdata
    );

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            state <= IDLE;
            m_axi_awaddr  <= (others => '0');
            m_axi_awvalid <= '0';
            m_axi_wdata   <= (others => '0');
            m_axi_wstrb   <= (others => '0');
            m_axi_wvalid  <= '0';
            m_axi_bready  <= '0';
            m_axi_araddr  <= (others => '0');
            m_axi_arvalid <= '0';
            m_axi_rready  <= '0';
            bus_ack       <= '0';
            bus_rdata     <= (others => '0');
        elsif rising_edge(aclk) then
            bus_ack <= '0';
            m_axi_awvalid <= m_axi_awvalid;
            m_axi_wvalid <= m_axi_wvalid;
            m_axi_arvalid <= m_axi_arvalid;
            m_axi_bready <= m_axi_bready;
            m_axi_rready <= m_axi_rready;
            
            case state is
                when IDLE =>
                    if bus_req = '1' then
                        state <= WAIT_REQ;
                    end if;

                when WAIT_REQ =>
                    if bus_we = '1' then
                        state <= WADDR;
                        m_axi_awaddr <= bus_addr;
                        m_axi_awvalid <= '1';
                        m_axi_wdata <= bus_wdata;
                        m_axi_wstrb <= bus_be;
                        m_axi_wvalid <= '1';
                    else
                        state <= RADDR;
                        m_axi_araddr <= bus_addr;
                        m_axi_arvalid <= '1';
                    end if;
                
                when WADDR =>
                    if m_axi_awready = '1' then m_axi_awvalid <= '0'; end if;
                    if m_axi_wready = '1'  then m_axi_wvalid  <= '0'; end if;
                    
                    if (m_axi_awready = '1' or m_axi_awvalid = '0') and 
                       (m_axi_wready = '1' or m_axi_wvalid = '0') then
                        state <= WRESP;
                        m_axi_bready <= '1';
                    end if;
                
                when WRESP =>
                    if m_axi_bvalid = '1' then
                        m_axi_bready <= '0';
                        bus_ack <= '1';
                        state <= IDLE;
                    end if;
                
                when RADDR =>
                    if m_axi_arready = '1' then
                        m_axi_arvalid <= '0';
                        state <= RDATA_CH;
                        m_axi_rready <= '1';
                    end if;
                
                when RDATA_CH =>
                    if m_axi_rvalid = '1' then
                        m_axi_rready <= '0';
                        bus_rdata <= m_axi_rdata;
                        bus_ack <= '1';
                        state <= IDLE;
                    end if;
                
                when others => state <= IDLE;
            end case;
        end if;
    end process;

end architecture;
