-- File: tb_sync_fifo.vhd
-- Description: Native VHDL Testbench for Sync FIFO
-- Author: Gemini-3 AI

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use std.env.all;

entity tb_sync_fifo is
end entity tb_sync_fifo;

architecture msg of tb_sync_fifo is
    
    -- Constants
    constant WIDTH : integer := 8;
    constant DEPTH : integer := 4;
    constant CLK_PERIOD : time := 10 ns;
    
    -- Signals
    signal clk      : std_logic := '0';
    signal rst_n    : std_logic := '0';
    signal flush    : std_logic := '0';
    signal push     : std_logic := '0';
    signal data_in  : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal full     : std_logic;
    signal pop      : std_logic := '0';
    signal data_out : std_logic_vector(WIDTH-1 downto 0);
    signal empty    : std_logic;
    signal level    : std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0);
    
begin

    -- DUT
    dut: entity work.sync_fifo
    generic map (
        WIDTH => WIDTH,
        DEPTH => DEPTH
    )
    port map (
        clk      => clk,
        rst_n    => rst_n,
        flush    => flush,
        push     => push,
        data_in  => data_in,
        full     => full,
        pop      => pop,
        data_out => data_out,
        empty    => empty,
        level    => level
    );

    -- Clock
    clk <= not clk after CLK_PERIOD/2;

    -- Stimulus
    process
    begin
        -- Assert Reset
        rst_n <= '0';
        wait for CLK_PERIOD * 2;
        rst_n <= '1';
        wait for CLK_PERIOD * 2;
        
        report "Test Started: Sync FIFO";
        
        -- Test 1: Fill FIFO
        report "Test 1: Fill FIFO";
        for i in 0 to DEPTH-1 loop
            wait until rising_edge(clk);
            if full = '1' then
                report "Error: FIFO Full prematurely" severity error;
            end if;
            push <= '1';
            data_in <= std_logic_vector(to_unsigned(i, WIDTH));
        end loop;
        wait until rising_edge(clk);
        push <= '0';
        
        wait until rising_edge(clk);
        assert full = '1' report "Error: FIFO should be Full" severity error;
        
        -- Test 2: Drain FIFO
        report "Test 2: Drain FIFO";
        for i in 0 to DEPTH-1 loop
            wait until rising_edge(clk);
            if empty = '1' then
                report "Error: FIFO Empty prematurely" severity error;
            end if;
            pop <= '1';
            
            -- Check data with 1 cycle latency if needed, but in simple TB we check after pop pulse?
            -- Data comes out 1 cycle after pop assertion (in my RTL).
            wait until rising_edge(clk);
            pop <= '0';
            assert to_integer(unsigned(data_out)) = i report "Error: Data Mismatch" severity error;
        end loop;
        
        wait until rising_edge(clk);
        assert empty = '1' report "Error: FIFO should be Empty" severity error;

        report "Test Finished";
        finish; -- VHDL-2008
        wait;
    end process;

end architecture msg;
