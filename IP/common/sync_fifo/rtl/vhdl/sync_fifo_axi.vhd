--------------------------------------------------------------------------------
-- File: sync_fifo_axi.vhd
-- Description: AXI4-Lite Wrapper for Synchronous FIFO IP.
--
-- Author: Gemini-3 AI
-- License: MIT
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sync_fifo_axi is
    generic (
        ADDR_WIDTH : integer := 32;
        DATA_WIDTH : integer := 32;
        FIFO_DEPTH : integer := 16;
        FWFT_MODE  : boolean := true
    );
    port (
        aclk    : in std_logic;
        aresetn : in std_logic;

        -- AXI4-Lite Interface
        s_axi_awaddr  : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        s_axi_awprot  : in std_logic_vector(2 downto 0);
        s_axi_awvalid : in std_logic;
        s_axi_awready : out std_logic;
        s_axi_wdata   : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        s_axi_wstrb   : in std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
        s_axi_wvalid  : in std_logic;
        s_axi_wready  : out std_logic;
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in std_logic;
        s_axi_araddr  : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        s_axi_arprot  : in std_logic_vector(2 downto 0);
        s_axi_arvalid : in std_logic;
        s_axi_arready : out std_logic;
        s_axi_rdata   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in std_logic
    );
end entity sync_fifo_axi;

architecture rtl of sync_fifo_axi is

    -- Components
    component axi4lite_slave_adapter is
        generic (
            ADDR_WIDTH : integer;
            DATA_WIDTH : integer
        );
        port (
            aclk    : in std_logic;
            aresetn : in std_logic;
            s_axi_awaddr  : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
            s_axi_awprot  : in std_logic_vector(2 downto 0);
            s_axi_awvalid : in std_logic;
            s_axi_awready : out std_logic;
            s_axi_wdata   : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            s_axi_wstrb   : in std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
            s_axi_wvalid  : in std_logic;
            s_axi_wready  : out std_logic;
            s_axi_bresp   : out std_logic_vector(1 downto 0);
            s_axi_bvalid  : out std_logic;
            s_axi_bready  : in std_logic;
            s_axi_araddr  : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
            s_axi_arprot  : in std_logic_vector(2 downto 0);
            s_axi_arvalid : in std_logic;
            s_axi_arready : out std_logic;
            s_axi_rdata   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            s_axi_rresp   : out std_logic_vector(1 downto 0);
            s_axi_rvalid  : out std_logic;
            s_axi_rready  : in std_logic;
            reg_addr  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
            reg_wdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            reg_rdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            reg_we    : out std_logic;
            reg_re    : out std_logic;
            reg_be    : out std_logic_vector((DATA_WIDTH/8) - 1 downto 0)
        );
    end component;

    component sync_fifo is
        generic (
            WIDTH : integer;
            DEPTH : integer;
            FWFT_MODE : boolean;
            ALMOST_FULL_THRESH : integer;
            ALMOST_EMPTY_THRESH : integer
        );
        port (
            clk      : in  std_logic;
            rst_n    : in  std_logic;
            flush    : in  std_logic;
            push     : in  std_logic;
            data_in  : in  std_logic_vector(WIDTH-1 downto 0);
            full     : out std_logic;
            almost_full : out std_logic;
            overflow : out std_logic;
            pop      : in  std_logic;
            data_out : out std_logic_vector(WIDTH-1 downto 0);
            empty    : out std_logic;
            almost_empty : out std_logic;
            underflow : out std_logic;
            level    : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0);
            max_level : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0)
        );
    end component;

    -- Constants
    constant ADDR_DATA      : std_logic_vector(3 downto 0) := x"0";
    constant ADDR_STATUS    : std_logic_vector(3 downto 0) := x"4";
    constant ADDR_CONTROL   : std_logic_vector(3 downto 0) := x"8";
    constant ADDR_MAX_LEVEL : std_logic_vector(3 downto 0) := x"C";

    -- Signals
    signal reg_addr  : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal reg_wdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal reg_rdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal reg_we    : std_logic;
    signal reg_re    : std_logic;
    signal reg_be    : std_logic_vector((DATA_WIDTH/8) - 1 downto 0);

    signal fifo_flush        : std_logic;
    signal fifo_push         : std_logic;
    signal fifo_data_in      : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal fifo_full         : std_logic;
    signal fifo_almost_full  : std_logic;
    signal fifo_overflow     : std_logic;
    
    signal fifo_pop          : std_logic;
    signal fifo_data_out     : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal fifo_empty        : std_logic;
    signal fifo_almost_empty : std_logic;
    signal fifo_underflow    : std_logic;
    
    constant LEVEL_WIDTH : integer := integer(ceil(log2(real(FIFO_DEPTH)))) + 1;
    signal fifo_level        : std_logic_vector(LEVEL_WIDTH - 1 downto 0);
    signal fifo_max_level    : std_logic_vector(LEVEL_WIDTH - 1 downto 0);
    
    signal addr_offset  : std_logic_vector(3 downto 0);
    signal reg_re_d     : std_logic;
    signal stored_rdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal internal_rdata : std_logic_vector(DATA_WIDTH - 1 downto 0);

begin

    u_axi_adapter : axi4lite_slave_adapter
    generic map (
        ADDR_WIDTH => ADDR_WIDTH,
        DATA_WIDTH => DATA_WIDTH
    )
    port map (
        aclk    => aclk,
        aresetn => aresetn,
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
        reg_addr  => reg_addr,
        reg_wdata => reg_wdata,
        reg_rdata => reg_rdata,
        reg_we    => reg_we,
        reg_re    => reg_re,
        reg_be    => reg_be
    );
    
    addr_offset <= reg_addr(3 downto 0);

    -- Write Logic
    process (reg_we, addr_offset, reg_wdata)
    begin
        fifo_push <= '0';
        fifo_flush <= '0';
        fifo_data_in <= reg_wdata;
        
        if reg_we = '1' then
            if addr_offset = ADDR_DATA then
                fifo_push <= '1';
            elsif addr_offset = ADDR_CONTROL then
                fifo_flush <= reg_wdata(0);
            end if;
        end if;
    end process;
    
    -- Read Logic
    process (aclk, aresetn)
    begin
        if aresetn = '0' then
            reg_re_d <= '0';
            stored_rdata <= (others => '0');
        elsif rising_edge(aclk) then
            reg_re_d <= reg_re;
            -- Latch data on reg_re's first cycle
            if reg_re = '1' and reg_re_d = '0' then
                stored_rdata <= internal_rdata;
            end if;
        end if;
    end process;
    
    -- FIFO Pop: 1-cycle pulse
    fifo_pop <= '1' when (reg_re = '1' and reg_re_d = '0' and addr_offset = ADDR_DATA) else '0';
    
    -- Drive register bus from LATCED data
    reg_rdata <= stored_rdata;


    process (addr_offset, fifo_data_out, fifo_empty, fifo_full, fifo_almost_empty, fifo_almost_full, fifo_overflow, fifo_underflow, fifo_level, fifo_max_level)
    begin
        internal_rdata <= (others => '0');
        
        if addr_offset = ADDR_DATA then
            internal_rdata <= fifo_data_out;
        elsif addr_offset = ADDR_STATUS then
            internal_rdata(0) <= fifo_empty;
            internal_rdata(1) <= fifo_full;
            internal_rdata(2) <= fifo_almost_empty;
            internal_rdata(3) <= fifo_almost_full;
            internal_rdata(4) <= fifo_overflow;
            internal_rdata(5) <= fifo_underflow;
            internal_rdata(31 downto 16) <= std_logic_vector(resize(unsigned(fifo_level), 16));
        elsif addr_offset = ADDR_MAX_LEVEL then
             internal_rdata(31 downto 0) <= std_logic_vector(resize(unsigned(fifo_max_level), 32));
        end if;
    end process;

    u_fifo : sync_fifo
    generic map (
        WIDTH => DATA_WIDTH,
        DEPTH => FIFO_DEPTH,
        FWFT_MODE => FWFT_MODE,
        ALMOST_FULL_THRESH => FIFO_DEPTH - 1,
        ALMOST_EMPTY_THRESH => 1
    )
    port map (
        clk      => aclk,
        rst_n    => aresetn,
        flush    => fifo_flush,
        push     => fifo_push,
        data_in  => fifo_data_in,
        full     => fifo_full,
        almost_full => fifo_almost_full,
        overflow => fifo_overflow,
        pop      => fifo_pop,
        data_out => fifo_data_out,
        empty    => fifo_empty,
        almost_empty => fifo_almost_empty,
        underflow => fifo_underflow,
        level    => fifo_level,
        max_level => fifo_max_level
    );

end architecture rtl;
