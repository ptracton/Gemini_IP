-- File: sync_fifo.vhd
-- Description: Synchronous FIFO with configurable width and depth.
-- Author: Gemini-3 AI
-- License: MIT

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sync_fifo is
    generic (
        WIDTH : integer := 32;
        DEPTH : integer := 16
    );
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic; -- Active low reset
        flush    : in  std_logic; -- Synchronous flush
        
        -- Write Interface
        push     : in  std_logic;
        data_in  : in  std_logic_vector(WIDTH-1 downto 0);
        full     : out std_logic;
        
        -- Read Interface
        pop      : in  std_logic;
        data_out : out std_logic_vector(WIDTH-1 downto 0);
        empty    : out std_logic;
        
        -- Status
        level    : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0)
    );
end entity sync_fifo;

architecture rtl of sync_fifo is
    
    -- Constants
    constant ADDR_WIDTH : integer := integer(ceil(log2(real(DEPTH))));
    
    -- Types
    type mem_t is array (0 to DEPTH-1) of std_logic_vector(WIDTH-1 downto 0);
    
    -- Signals
    signal mem    : mem_t := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of mem : signal is "block";
    signal wr_ptr : unsigned(ADDR_WIDTH-1 downto 0);
    signal rd_ptr : unsigned(ADDR_WIDTH-1 downto 0);
    signal count  : unsigned(ADDR_WIDTH downto 0);
    
    signal full_i  : std_logic;
    signal empty_i : std_logic;

begin

    -- Status Logic
    full_i  <= '1' when count = to_unsigned(DEPTH, count'length) else '0';
    empty_i <= '1' when count = 0 else '0';
    
    full    <= full_i;
    empty   <= empty_i;
    level   <= std_logic_vector(count);

    -- Write Logic
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            wr_ptr <= (others => '0');
            wr_ptr <= (others => '0');
        elsif rising_edge(clk) then
            if flush = '1' then
                wr_ptr <= (others => '0');
            elsif push = '1' and full_i = '0' then
                mem(to_integer(wr_ptr)) <= data_in;
                if wr_ptr = DEPTH - 1 then
                    wr_ptr <= (others => '0');
                else
                    wr_ptr <= wr_ptr + 1;
                end if;
            end if;
        end if;
    end process;

    -- Read Logic
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            rd_ptr <= (others => '0');
            rd_ptr <= (others => '0');
        elsif rising_edge(clk) then
            if flush = '1' then
                rd_ptr <= (others => '0');
                data_out <= (others => '0');
            elsif pop = '1' and empty_i = '0' then
                data_out <= mem(to_integer(rd_ptr));
                if rd_ptr = DEPTH - 1 then
                    rd_ptr <= (others => '0');
                else
                    rd_ptr <= rd_ptr + 1;
                end if;
            end if;
        end if;
    end process;

    -- Counter Logic
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if flush = '1' then
                count <= (others => '0');
            else
                if (push = '1' and full_i = '0') and (pop = '1' and empty_i = '0') then
                    count <= count; -- Both push and pop, no change
                elsif push = '1' and full_i = '0' then
                    count <= count + 1;
                elsif pop = '1' and empty_i = '0' then
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

end architecture rtl;
