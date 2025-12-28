--------------------------------------------------------------------------------
-- File: sync_fifo_wb.vhd
-- Description: Wishbone Wrapper for Synchronous FIFO IP.
--
-- Author: Gemini-3 AI
-- License: MIT
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sync_fifo_wb is
    generic (
        ADDR_WIDTH : integer := 32;
        DATA_WIDTH : integer := 32;
        FIFO_DEPTH : integer := 16;
        FWFT_MODE  : boolean := true
    );
    port (
        wb_clk_i : in std_logic;
        wb_rst_i : in std_logic;

        -- Wishbone Interface
        wb_adr_i : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        wb_dat_i : in std_logic_vector(DATA_WIDTH - 1 downto 0);
        wb_dat_o : out std_logic_vector(DATA_WIDTH - 1 downto 0);
        wb_we_i  : in std_logic;
        wb_stb_i : in std_logic;
        wb_cyc_i : in std_logic;
        wb_sel_i : in std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
        wb_ack_o   : out std_logic;
        wb_err_o   : out std_logic;
        wb_stall_o : out std_logic
    );
end entity sync_fifo_wb;

architecture rtl of sync_fifo_wb is

    -- Components
    component wb_slave_adapter is
        generic (
            ADDR_WIDTH : integer;
            DATA_WIDTH : integer
        );
        port (
            wb_clk_i : in std_logic;
            wb_rst_i : in std_logic;
            wb_adr_i : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
            wb_dat_i : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            wb_dat_o : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            wb_we_i  : in std_logic;
            wb_stb_i : in std_logic;
            wb_cyc_i : in std_logic;
            wb_sel_i : in std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
            wb_ack_o   : out std_logic;
            wb_err_o   : out std_logic;
            wb_stall_o : out std_logic;

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
    signal reg_re_d  : std_logic;

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
    
    signal addr_offset : std_logic_vector(3 downto 0);
    
    signal rst_n_internal : std_logic;

begin

    rst_n_internal <= not wb_rst_i;

    u_wb_adapter : wb_slave_adapter
    generic map (
        ADDR_WIDTH => ADDR_WIDTH,
        DATA_WIDTH => DATA_WIDTH
    )
    port map (
        wb_clk_i   => wb_clk_i,
        wb_rst_i   => wb_rst_i,
        wb_adr_i   => wb_adr_i,
        wb_dat_i   => wb_dat_i,
        wb_dat_o   => wb_dat_o,
        wb_we_i    => wb_we_i,
        wb_stb_i   => wb_stb_i,
        wb_cyc_i   => wb_cyc_i,
        wb_sel_i   => wb_sel_i,
        wb_ack_o   => wb_ack_o,
        wb_err_o   => wb_err_o,
        wb_stall_o => wb_stall_o,
        reg_addr   => reg_addr,
        reg_wdata  => reg_wdata,
        reg_rdata  => reg_rdata,
        reg_we     => reg_we,
        reg_re     => reg_re,
        reg_be     => reg_be
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
    process (wb_clk_i, wb_rst_i)
    begin
        if wb_rst_i = '1' then
            reg_re_d <= '0';
        elsif rising_edge(wb_clk_i) then
            reg_re_d <= reg_re;
        end if;
    end process;
    
    fifo_pop <= '1' when (reg_re = '1' and reg_re_d = '0' and addr_offset = ADDR_DATA) else '0';
    
    -- Latch Read Data
    process (wb_clk_i, wb_rst_i)
    begin
        if wb_rst_i = '1' then
            reg_rdata <= (others => '0');
        elsif rising_edge(wb_clk_i) then
            if (reg_re = '1' and reg_re_d = '0') then
                if addr_offset = ADDR_DATA then
                    reg_rdata <= fifo_data_out;
                elsif addr_offset = ADDR_STATUS then
                    reg_rdata <= (others => '0');
                    reg_rdata(0) <= fifo_empty;
                    reg_rdata(1) <= fifo_full;
                    reg_rdata(2) <= fifo_almost_empty;
                    reg_rdata(3) <= fifo_almost_full;
                    reg_rdata(4) <= fifo_overflow;
                    reg_rdata(5) <= fifo_underflow;
                    reg_rdata(31 downto 16) <= std_logic_vector(resize(unsigned(fifo_level), 16));
                elsif addr_offset = ADDR_MAX_LEVEL then
                     reg_rdata <= (others => '0');
                     reg_rdata(31 downto 0) <= std_logic_vector(resize(unsigned(fifo_max_level), 32));
                end if;
            end if;
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
        clk      => wb_clk_i,
        rst_n    => rst_n_internal,
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
