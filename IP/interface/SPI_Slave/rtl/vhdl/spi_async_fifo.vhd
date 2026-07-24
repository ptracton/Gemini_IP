--------------------------------------------------------------------------------
-- Module Name: spi_async_fifo
-- Description:
--    Asynchronous FIFO for Clock Domain Crossing (CDC).
--    Uses Gray code pointers for safer synchronization.
--    VHDL-2008 Implementation.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_async_fifo is
    generic (
        DATA_WIDTH : integer := 32;
        ADDR_WIDTH : integer := 4;
        NAME       : string := "FIFO"
    );
    port (
        -- Write Domain
        wclk   : in  std_logic;
        wrst_n : in  std_logic;
        winc   : in  std_logic;
        wdata  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        wfull  : out std_logic;

        -- Read Domain
        rclk   : in  std_logic;
        rrst_n : in  std_logic;
        rinc   : in  std_logic;
        rdata  : out std_logic_vector(DATA_WIDTH-1 downto 0);
        rempty : out std_logic
    );
end entity spi_async_fifo;

architecture rtl of spi_async_fifo is

    -- FIFO Memory
    type mem_type is array (0 to (2**ADDR_WIDTH)-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal mem : mem_type := (others => (others => '0'));

    -- Pointers
    signal wptr_bin, wptr_bin_next   : unsigned(ADDR_WIDTH downto 0) := (others => '0');
    signal rptr_bin, rptr_bin_next   : unsigned(ADDR_WIDTH downto 0) := (others => '0');
    signal wptr_gray, wptr_gray_next : std_logic_vector(ADDR_WIDTH downto 0) := (others => '0');
    signal rptr_gray, rptr_gray_next : std_logic_vector(ADDR_WIDTH downto 0) := (others => '0');

    -- Synchronizers
    signal wptr_gray_r1, wptr_gray_r2 : std_logic_vector(ADDR_WIDTH downto 0) := (others => '0');
    signal rptr_gray_r1, rptr_gray_r2 : std_logic_vector(ADDR_WIDTH downto 0) := (others => '0');
    
    signal wfull_i : std_logic;
    signal rempty_i : std_logic;

begin

    -- -------------------------------------------------------------------------
    -- Write Domain Logic
    -- -------------------------------------------------------------------------
    wptr_bin_next  <= wptr_bin + 1 when (winc = '1' and wfull_i = '0') else wptr_bin;
    wptr_gray_next <= std_logic_vector(wptr_bin_next xor ("0" & wptr_bin_next(ADDR_WIDTH downto 1)));

    process(wclk, wrst_n)
    begin
        if wrst_n = '0' then
            wptr_bin  <= (others => '0');
            wptr_gray <= (others => '0');
        elsif rising_edge(wclk) then
            wptr_bin  <= wptr_bin_next;
            wptr_gray <= wptr_gray_next;
            if (winc = '1' and wfull_i = '0') then
                mem(to_integer(wptr_bin(ADDR_WIDTH-1 downto 0))) <= wdata;
                -- report NAME & " Write: Addr=" & integer'image(to_integer(wptr_bin(ADDR_WIDTH-1 downto 0))) & " Data=" & to_hstring(wdata);
            end if;
        end if;
    end process;

    -- Synchronize Read Pointer into Write Domain
    process(wclk, wrst_n)
    begin
        if wrst_n = '0' then
            rptr_gray_r1 <= (others => '0');
            rptr_gray_r2 <= (others => '0');
        elsif rising_edge(wclk) then
            rptr_gray_r1 <= rptr_gray;
            rptr_gray_r2 <= rptr_gray_r1;
        end if;
    end process;

    -- wfull logic (Current pointers to avoid combinatorial loops)
    wfull_i <= '1' when (wptr_gray = (not rptr_gray_r2(ADDR_WIDTH downto ADDR_WIDTH-1)) & rptr_gray_r2(ADDR_WIDTH-2 downto 0)) else '0';
    wfull   <= wfull_i;

    -- -------------------------------------------------------------------------
    -- Read Domain Logic
    -- -------------------------------------------------------------------------
    rptr_bin_next  <= rptr_bin + 1 when (rinc = '1' and rempty_i = '0') else rptr_bin;
    rptr_gray_next <= std_logic_vector(rptr_bin_next xor ("0" & rptr_bin_next(ADDR_WIDTH downto 1)));

    rdata <= mem(to_integer(rptr_bin(ADDR_WIDTH-1 downto 0)));

    process(rclk, rrst_n)
    begin
        if rrst_n = '0' then
            rptr_bin  <= (others => '0');
            rptr_gray <= (others => '0');
        elsif rising_edge(rclk) then
            rptr_bin  <= rptr_bin_next;
            rptr_gray <= rptr_gray_next;
            if rinc = '1' and rempty_i = '0' then
                -- report NAME & " Read: Addr=" & integer'image(to_integer(rptr_bin(ADDR_WIDTH-1 downto 0))) & " Data=" & to_hstring(mem(to_integer(rptr_bin(ADDR_WIDTH-1 downto 0))));
            end if;
        end if;
    end process;

    -- Synchronize Write Pointer into Read Domain
    process(rclk, rrst_n)
    begin
        if rrst_n = '0' then
            wptr_gray_r1 <= (others => '0');
            wptr_gray_r2 <= (others => '0');
        elsif rising_edge(rclk) then
            wptr_gray_r1 <= wptr_gray;
            wptr_gray_r2 <= wptr_gray_r1;
        end if;
    end process;

    -- rempty logic
    rempty_i <= '1' when (rptr_gray = wptr_gray_r2) else '0';
    rempty   <= rempty_i;

end architecture;
