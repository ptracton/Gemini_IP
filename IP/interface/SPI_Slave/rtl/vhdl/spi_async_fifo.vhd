--------------------------------------------------------------------------------
-- Module Name: spi_async_fifo
-- Description:
--    Asynchronous FIFO for Clock Domain Crossing (CDC) between the SPI domain
--    and the System Bus domain. Uses Gray Code pointers for safe synchronization.
--    VHDL-2008 Implementation.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_async_fifo is
    generic (
        DATA_WIDTH : integer := 32; -- Width of data words
        ADDR_WIDTH : integer := 4   -- FIFO Depth = 2^ADDR_WIDTH
    );
    port (
        -- Write Domain
        wclk   : in  std_logic; -- Write Clock
        wrst_n : in  std_logic; -- Write Reset (Active Low)
        winc   : in  std_logic; -- Write Increment/Enable
        wdata  : in  std_logic_vector(DATA_WIDTH-1 downto 0); -- Write Data
        wfull  : out std_logic; -- Write Full Flag

        -- Read Domain
        rclk   : in  std_logic; -- Read Clock
        rrst_n : in  std_logic; -- Read Reset (Active Low)
        rinc   : in  std_logic; -- Read Increment/Enable
        rdata  : out std_logic_vector(DATA_WIDTH-1 downto 0); -- Read Data
        rempty : out std_logic  -- Read Empty Flag
    );
end entity spi_async_fifo;

architecture rtl of spi_async_fifo is

    constant DEPTH : integer := 2**ADDR_WIDTH;
    
    -- Memory Array
    type mem_type is array (0 to DEPTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal mem : mem_type := (others => (others => '0'));

    -- Pointers
    signal wptr_bin, wptr_gray : unsigned(ADDR_WIDTH downto 0) := (others => '0');
    signal rptr_bin, rptr_gray : unsigned(ADDR_WIDTH downto 0) := (others => '0');
    
    -- Synchronizers
    signal wptr_gray_r1, wptr_gray_r2 : unsigned(ADDR_WIDTH downto 0) := (others => '0');
    signal rptr_gray_r1, rptr_gray_r2 : unsigned(ADDR_WIDTH downto 0) := (others => '0');

    -- Next State Signals
    signal wptr_bin_next, wptr_gray_next : unsigned(ADDR_WIDTH downto 0);
    signal rptr_bin_next, rptr_gray_next : unsigned(ADDR_WIDTH downto 0);

    signal wfull_i, rempty_i : std_logic;

begin

    ----------------------------------------------------------------------------
    -- Pointers Implementation
    ----------------------------------------------------------------------------
    
    -- Binary to Gray Conversion for Write Pointer
    wptr_bin_next <= wptr_bin + 1 when (winc = '1' and wfull_i = '0') else wptr_bin;
    wptr_gray_next <= wptr_bin_next xor ("0" & wptr_bin_next(ADDR_WIDTH downto 1));

    -- Binary to Gray Conversion for Read Pointer
    rptr_bin_next <= rptr_bin + 1 when (rinc = '1' and rempty_i = '0') else rptr_bin;
    rptr_gray_next <= rptr_bin_next xor ("0" & rptr_bin_next(ADDR_WIDTH downto 1));

    ----------------------------------------------------------------------------
    -- Write Domain Logic
    ----------------------------------------------------------------------------
    process(wclk, wrst_n)
    begin
        if wrst_n = '0' then
            wptr_bin  <= (others => '0');
            wptr_gray <= (others => '0');
            rptr_gray_r1 <= (others => '0');
            rptr_gray_r2 <= (others => '0');
        elsif rising_edge(wclk) then
            -- Update Pointers
            wptr_bin  <= wptr_bin_next;
            wptr_gray <= wptr_gray_next;
            
            -- Sync Read Pointer (2-stage)
            rptr_gray_r1 <= rptr_gray;
            rptr_gray_r2 <= rptr_gray_r1;
            
            -- Memory Write
            if (winc = '1') then
                if (wfull_i = '0') then
                    mem(to_integer(wptr_bin(ADDR_WIDTH-1 downto 0))) <= wdata;
                    report "FIFO Write OK. Data=" & to_hstring(wdata);
                else
                    -- report "FIFO Write BLOCKED (Full). W_Gray=" & to_hstring(wptr_gray) & " R_Gray_Sync=" & to_hstring(rptr_gray_r2);
                end if;
            end if;
        end if;
    end process;

    -- Full Flag (Combinational)
    -- Using wptr_gray (Current) instead of wptr_gray_next to avoid Combinational Loop (Full -> Next -> Full)
    wfull_i <= '1' when (wptr_gray = (not rptr_gray_r2(ADDR_WIDTH) & not rptr_gray_r2(ADDR_WIDTH-1) & rptr_gray_r2(ADDR_WIDTH-2 downto 0))) else '0';
    wfull <= wfull_i;

    ----------------------------------------------------------------------------
    -- Read Domain Logic
    ----------------------------------------------------------------------------
    process(rclk, rrst_n)
    begin
        if rrst_n = '0' then
            rptr_bin  <= (others => '0');
            rptr_gray <= (others => '0');
            wptr_gray_r1 <= (others => '0');
            wptr_gray_r2 <= (others => '0');
        elsif rising_edge(rclk) then
            -- Update Pointers
            rptr_bin  <= rptr_bin_next;
            rptr_gray <= rptr_gray_next;
            
            -- Sync Write Pointer (2-stage)
            wptr_gray_r1 <= wptr_gray;
            wptr_gray_r2 <= wptr_gray_r1;
            
            if (rinc = '1' and rempty_i = '0') then
                -- report "FIFO Read OK. Data=" & to_hstring(mem(to_integer(rptr_bin(ADDR_WIDTH-1 downto 0))));
            end if;
        end if;
    end process;

    -- Memory Read (Async)
    rdata <= mem(to_integer(rptr_bin(ADDR_WIDTH-1 downto 0)));
    
    -- Empty Flag (Combinational)
    rempty_i <= '1' when (rptr_gray = wptr_gray_r2) else '0';
    rempty <= rempty_i;

end architecture;
