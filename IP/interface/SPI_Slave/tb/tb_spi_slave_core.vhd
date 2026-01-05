--------------------------------------------------------------------------------
-- Module Name: tb_spi_slave_core
-- Description:
--    Native VHDL-2008 Testbench for the SPI Slave Core.
--    Verifies basic functionality including:
--    - Clock Domain Crossing
--    - SPI Mode 0 Communication
--    - Register read/write via the internal bus interface
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_slave_core is
end entity tb_spi_slave_core;

architecture sim of tb_spi_slave_core is

    -- Constant Definitions
    constant SPI_CLK_PERIOD : time := 20 ns; -- 50 MHz
    constant SYS_CLK_PERIOD : time := 10 ns; -- 100 MHz

    -- DUT Component
    component spi_slave_core is
        port (
            spi_clk   : in  std_logic;
            spi_cs_n  : in  std_logic;
            spi_mosi  : in  std_logic;
            spi_miso  : out std_logic;
            sys_clk   : in  std_logic;
            sys_rst_n : in  std_logic;
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

    -- Signals
    signal spi_clk   : std_logic := '0';
    signal spi_cs_n  : std_logic := '1';
    signal spi_mosi  : std_logic := '0';
    signal spi_miso  : std_logic;
    
    signal sys_clk   : std_logic := '0';
    signal sys_rst_n : std_logic := '0';
    
    signal bus_req   : std_logic := '0';
    signal bus_addr  : std_logic_vector(31 downto 0) := (others => '0');
    signal bus_we    : std_logic := '0';
    signal bus_wdata : std_logic_vector(31 downto 0) := (others => '0');
    signal bus_be    : std_logic_vector(3 downto 0) := (others => '0');
    signal bus_size  : std_logic_vector(1 downto 0) := (others => '0');
    signal bus_ack   : std_logic := '0';
    signal bus_rdata : std_logic_vector(31 downto 0) := (others => '0');

    -- Test Memory
    type mem_array is array (0 to 255) of std_logic_vector(31 downto 0);
    signal memory : mem_array := (others => (others => '0'));

begin

    -- Clock Generation
    spi_clk <= not spi_clk after SPI_CLK_PERIOD / 2;
    sys_clk <= not sys_clk after SYS_CLK_PERIOD / 2;

    -- DUT Instantiation
    u_dut : spi_slave_core
    port map (
        spi_clk     => spi_clk,
        spi_cs_n    => spi_cs_n,
        spi_mosi    => spi_mosi,
        spi_miso    => spi_miso,
        sys_clk     => sys_clk,
        sys_rst_n   => sys_rst_n,
        bus_req_o   => bus_req,
        bus_addr_o  => bus_addr,
        bus_we_o    => bus_we,
        bus_wdata_o => bus_wdata,
        bus_be_o    => bus_be,
        bus_size_o  => bus_size,
        bus_ack_i   => bus_ack,
        bus_rdata_i => bus_rdata
    );

    -- Bus Responder Process
    process(sys_clk, sys_rst_n)
    begin
        if sys_rst_n = '0' then
            bus_ack <= '0';
            bus_rdata <= (others => '0');
        elsif rising_edge(sys_clk) then
            bus_ack <= '0';
            if bus_req = '1' then
                bus_ack <= '1';
                -- report "TB: Bus Request! Addr=" & to_hstring(bus_addr) & " Write=" & std_logic'image(bus_we);
                if bus_we = '1' then
                    memory(to_integer(unsigned(bus_addr(9 downto 2)))) <= bus_wdata;
                else
                    bus_rdata <= memory(to_integer(unsigned(bus_addr(9 downto 2))));
                end if;
            end if;
        end if;
    end process;

    -- Main Test Process
    process
        procedure spi_transfer(
            constant cmd  : in std_logic_vector(7 downto 0);
            constant addr : in std_logic_vector(31 downto 0);
            constant wdat : in std_logic_vector(31 downto 0);
            variable rdat : out std_logic_vector(31 downto 0)
        ) is
            -- variable i : integer; -- Removed to avoid hiding warning

            variable rx_byte : std_logic_vector(7 downto 0);
        begin
            -- CS Low
            wait until falling_edge(spi_clk);
            spi_cs_n <= '0';
            
            -- Send Command
            for i in 7 downto 0 loop
                 wait for 5 ns;
                 spi_mosi <= cmd(i);
                 -- report "TB: Cmd Bit " & integer'image(i) & "=" & std_logic'image(cmd(i));
                 wait until rising_edge(spi_clk); -- Sample
                 wait until falling_edge(spi_clk); -- Shift
            end loop;

            -- Send Address
            for i in 31 downto 0 loop
                 wait for 5 ns;
                 spi_mosi <= addr(i);
                 -- report "TB: Addr Bit " & integer'image(i) & "=" & std_logic'image(addr(i));
                 wait until rising_edge(spi_clk);
                 wait until falling_edge(spi_clk);
            end loop;

            -- Data Phase
            if cmd(6) = '1' then -- Write
                for i in 31 downto 0 loop
                     wait for 5 ns;
                     spi_mosi <= wdat(i);
                     wait until rising_edge(spi_clk);
                     wait until falling_edge(spi_clk);
                end loop;
            else -- Read
                -- Dummy Bytes (4 Bytes = 32 Cycles)
                for j in 0 to 3 loop
                    for k in 7 downto 0 loop
                        wait for 5 ns;
                        spi_mosi <= '0';
                        wait until rising_edge(spi_clk);
                        wait until falling_edge(spi_clk);
                    end loop;
                end loop;

                for i in 31 downto 0 loop
                     spi_mosi <= '0';
                     wait until rising_edge(spi_clk);
                     rdat(i) := spi_miso; -- Sample MISO
                     -- report "Bit " & integer'image(i) & " MISO: " & std_logic'image(spi_miso);
                     wait until falling_edge(spi_clk);
                end loop;
            end if;

            -- CS High
            spi_cs_n <= '1';
            wait for 100 ns;
        end procedure;

        variable read_val : std_logic_vector(31 downto 0);
        constant DATA_BURST_1 : std_logic_vector(31 downto 0) := x"11223344";
        constant DATA_BURST_2 : std_logic_vector(31 downto 0) := x"55667788";
    begin
        -- Assert Reset
        sys_rst_n <= '0';
        wait for 100 ns;
        sys_rst_n <= '1';
        wait for 100 ns;

        report "Starting SPI Slave VHDL Testbench";

        -- Test 1: Write 0xCAFEBABE to 0x10
        -- Op: 01 (Write), Size: 10 (Word) -> 0x60
        spi_transfer(x"60", x"00000010", x"CAFEBABE", read_val);

        wait for 500 ns;

        -- Test 2: Read from 0x10
        -- Op: 00 (Read), Size: 10 (Word) -> 0x20
        spi_transfer(x"20", x"00000010", x"00000000", read_val);

        if read_val = x"CAFEBABE" then
            report "PASS: Read Data Matches Expected (0xCAFEBABE)";
        else
            report "FAIL: Read Data Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;

        wait for 500 ns;

        -- Test 3: Burst Write (2 Words)
        -- Op: 11 (Burst Write), Size: 10 (Word) -> 0xE0
        report "Starting Burst Write Test...";
        wait until falling_edge(spi_clk);
        spi_cs_n <= '0';
        
        -- Send Command 0xE0
        for i in 7 downto 0 loop 
            wait for 5 ns;
            spi_mosi <= '1' when (i=7 or i=6 or i=5) else '0'; -- 0xE0
            -- report "TB: Cmd Bit " & integer'image(i) & " (Test 3)";
            wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;
        
        -- Send Address 0x20
        for i in 31 downto 0 loop
             wait for 5 ns;
             if i=5 then spi_mosi <= '1'; else spi_mosi <= '0'; end if; -- 0x20
             wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;

        -- Data 1: 0x11223344
        for i in 31 downto 0 loop
             wait for 5 ns;
             spi_mosi <= DATA_BURST_1(i);
             wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;
        -- Data 2: 0x55667788
        for i in 31 downto 0 loop
             wait for 5 ns;
             spi_mosi <= DATA_BURST_2(i);
             wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;

        
        spi_cs_n <= '1';
        wait for 500 ns;

        -- Test 4: Burst Read (2 Words)
        -- Op: 10 (Burst Read), Size: 10 (Word) -> 0xA0
        report "Starting Burst Read Test...";
        wait until falling_edge(spi_clk);
        spi_cs_n <= '0';
        
        -- Send Command 0xA0
        for i in 7 downto 0 loop 
            wait for 5 ns;
            spi_mosi <= '1' when (i=7 or i=5) else '0'; -- 0xA0 (10100000)
            wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;
        
        -- Send Address 0x20
        for i in 31 downto 0 loop
             wait for 5 ns;
             if i=5 then spi_mosi <= '1'; else spi_mosi <= '0'; end if;
             wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;

        -- Dummy (32 cycles)
        for i in 0 to 31 loop
             spi_mosi <= '0';
             wait until rising_edge(spi_clk); wait until falling_edge(spi_clk);
        end loop;

        -- Read Word 1
        for i in 31 downto 0 loop
             spi_mosi <= '0';
             wait until rising_edge(spi_clk);
             read_val(i) := spi_miso;
             wait until falling_edge(spi_clk);
        end loop; 
        
        if read_val = x"11223344" then
            report "PASS: Burst Read Word 1 Matches";
        else
            report "FAIL: Burst Read Word 1 Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;

        -- Read Word 2
        for i in 31 downto 0 loop
             spi_mosi <= '0';
             wait until rising_edge(spi_clk);
             read_val(i) := spi_miso;
             wait until falling_edge(spi_clk);
        end loop;
        
        if read_val = x"55667788" then
            report "PASS: Burst Read Word 2 Matches";
        else
            report "FAIL: Burst Read Word 2 Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;
        
        spi_cs_n <= '1';
        report "Simulation Completed";
        wait;
    end process;

end architecture;
