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
        DEPTH : integer := 16;
        FWFT_MODE : boolean := false;
        ALMOST_FULL_THRESH : integer := 15;
        ALMOST_EMPTY_THRESH : integer := 1
    );
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic; -- Active low reset
        flush    : in  std_logic; -- Synchronous flush
        
        -- Write Interface
        push     : in  std_logic;
        data_in  : in  std_logic_vector(WIDTH-1 downto 0);
        full     : out std_logic;
        almost_full : out std_logic;
        overflow : out std_logic;
        
        -- Read Interface
        pop      : in  std_logic;
        data_out : out std_logic_vector(WIDTH-1 downto 0);
        empty    : out std_logic;
        almost_empty : out std_logic;
        underflow : out std_logic;
        
        -- Status
        level    : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0);
        max_level : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0)
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
    signal max_count : unsigned(ADDR_WIDTH downto 0);

begin

    -- Status Logic
    full_i  <= '1' when count = to_unsigned(DEPTH, count'length) else '0';
    empty_i <= '1' when count = 0 else '0';
    
    full    <= full_i;
    empty   <= empty_i;
    level   <= std_logic_vector(count);
    max_level <= std_logic_vector(max_count);
    
    almost_full <= '1' when count >= to_unsigned(ALMOST_FULL_THRESH, count'length) else '0';
    almost_empty <= '1' when count <= to_unsigned(ALMOST_EMPTY_THRESH, count'length) else '0';

    -- Write Logic
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            wr_ptr <= (others => '0');
            overflow <= '0';
        elsif rising_edge(clk) then
            if flush = '1' then
                wr_ptr <= (others => '0');
                overflow <= '0';
            else
                if push = '1' and full_i = '1' then
                    overflow <= '1';
                end if;
                
                if push = '1' and full_i = '0' then
                    mem(to_integer(wr_ptr)) <= data_in;
                    if wr_ptr = DEPTH - 1 then
                        wr_ptr <= (others => '0');
                    else
                        wr_ptr <= wr_ptr + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- Read Logic
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            rd_ptr <= (others => '0');
            underflow <= '0';
        elsif rising_edge(clk) then
            if flush = '1' then
                rd_ptr <= (others => '0');
                underflow <= '0';
            else
                if pop = '1' and empty_i = '1' then
                    underflow <= '1';
                end if;
                
                if pop = '1' and empty_i = '0' then
                    if rd_ptr = DEPTH - 1 then
                        rd_ptr <= (others => '0');
                    else
                        rd_ptr <= rd_ptr + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    -- Data Output Logic
    gen_fwft: if FWFT_MODE generate
        data_out <= mem(to_integer(rd_ptr));
    end generate gen_fwft;
    
    gen_standard: if not FWFT_MODE generate
        process (clk, rst_n)
        begin
            if rst_n = '0' then
                data_out <= (others => '0');
            elsif rising_edge(clk) then
                if flush = '1' then
                     data_out <= (others => '0');
                elsif pop = '1' and empty_i = '0' then
                    data_out <= mem(to_integer(rd_ptr));
                end if;
            end if; 
        end process;
    end generate gen_standard;

    -- Counter Logic & Max Level
    process (clk, rst_n)
        variable v_next_count : unsigned(ADDR_WIDTH downto 0);
    begin
        if rst_n = '0' then
            count <= (others => '0');
            max_count <= (others => '0');
        elsif rising_edge(clk) then
            if flush = '1' then
                count <= (others => '0');
                max_count <= (others => '0');
            else
                v_next_count := count;
                
                if (push = '1' and full_i = '0') and (pop = '1' and empty_i = '0') then
                    v_next_count := count;
                elsif push = '1' and full_i = '0' then
                    v_next_count := count + 1;
                elsif pop = '1' and empty_i = '0' then
                    v_next_count := count - 1;
                end if;
                
                count <= v_next_count;
                if v_next_count > max_count then
                    max_count <= v_next_count;
                end if;
            end if;
        end if;
    end process;

end architecture rtl;
