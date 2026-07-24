--------------------------------------------------------------------------------
-- Module Name: tb_spi_slave_wb
-- Description:
--    VHDL-2008 Testbench for the SPI Slave Wishbone Wrapper.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_spi_slave_wb is
end entity tb_spi_slave_wb;

architecture sim of tb_spi_slave_wb is

    -- Constant Definitions
    constant SPI_CLK_PERIOD : time := 20 ns; -- 50 MHz
    constant WB_CLK_PERIOD  : time := 10 ns; -- 100 MHz

    -- DUT Component
    component spi_slave_wb is
        port (
            spi_clk   : in  std_logic;
            spi_cs_n  : in  std_logic;
            spi_mosi  : in  std_logic;
            spi_miso  : out std_logic;
            wb_clk_i  : in  std_logic;
            wb_rst_i  : in  std_logic;
            wb_cyc_o  : out std_logic;
            wb_stb_o  : out std_logic;
            wb_we_o   : out std_logic;
            wb_addr_o : out std_logic_vector(31 downto 0);
            wb_data_o : out std_logic_vector(31 downto 0);
            wb_sel_o  : out std_logic_vector(3 downto 0);
            wb_ack_i  : in  std_logic;
            wb_data_i : in  std_logic_vector(31 downto 0)
        );
    end component;

    -- Signals
    signal spi_clk   : std_logic := '0';
    signal spi_cs_n  : std_logic := '1';
    signal spi_mosi  : std_logic := '0';
    signal spi_miso  : std_logic;
    
    signal wb_clk    : std_logic := '0';
    signal wb_rst    : std_logic := '1'; -- Active High
    
    signal wb_cyc    : std_logic;
    signal wb_stb    : std_logic;
    signal wb_we     : std_logic;
    signal wb_addr   : std_logic_vector(31 downto 0);
    signal wb_data_o : std_logic_vector(31 downto 0); -- From Master
    signal wb_sel    : std_logic_vector(3 downto 0);
    signal wb_ack    : std_logic := '0';
    signal wb_data_i : std_logic_vector(31 downto 0) := (others => '0'); -- From Slave

    -- Test Memory
    type mem_array is array (0 to 255) of std_logic_vector(31 downto 0);
    signal memory : mem_array := (others => (others => '0'));

begin

    -- Clock Generation
    spi_clk <= not spi_clk after SPI_CLK_PERIOD / 2;
    wb_clk  <= not wb_clk  after WB_CLK_PERIOD / 2;

    -- DUT Instantiation
    u_dut : spi_slave_wb
    port map (
        spi_clk     => spi_clk,
        spi_cs_n    => spi_cs_n,
        spi_mosi    => spi_mosi,
        spi_miso    => spi_miso,
        wb_clk_i    => wb_clk,
        wb_rst_i    => wb_rst,
        wb_cyc_o    => wb_cyc,
        wb_stb_o    => wb_stb,
        wb_we_o     => wb_we,
        wb_addr_o   => wb_addr,
        wb_data_o   => wb_data_o,
        wb_sel_o    => wb_sel,
        wb_ack_i    => wb_ack,
        wb_data_i   => wb_data_i
    );

    -- Bus Responder Process (Wishbone Slave)
    process(wb_clk, wb_rst)
    begin
        if wb_rst = '1' then
            wb_ack <= '0';
            wb_data_i <= (others => '0');
        elsif rising_edge(wb_clk) then
            wb_ack <= '0';
            if wb_cyc = '1' and wb_stb = '1' then
                wb_ack <= '1';
                if wb_we = '1' then
                    memory(to_integer(unsigned(wb_addr(9 downto 2)))) <= wb_data_o;
                    report "WB Slave: Write Addr=" & to_hstring(wb_addr) & " Data=" & to_hstring(wb_data_o);
                else
                    wb_data_i <= memory(to_integer(unsigned(wb_addr(9 downto 2))));
                    report "WB Slave: Read Addr=" & to_hstring(wb_addr) & " Data=" & to_hstring(memory(to_integer(unsigned(wb_addr(9 downto 2)))));
                end if;
            end if;
        end if;
    end process;

    -- Main Test Process
    process
        procedure spi_send_byte(
            constant data : in std_logic_vector(7 downto 0);
            variable rdat : out std_logic_vector(7 downto 0)
        ) is
        begin
            for i in 7 downto 0 loop
                wait until falling_edge(spi_clk);
                spi_mosi <= data(i);
                wait until rising_edge(spi_clk);
                rdat(i) := spi_miso;
            end loop;
        end procedure;

        procedure spi_send_word(
            constant data : in std_logic_vector(31 downto 0);
            variable rdat : out std_logic_vector(31 downto 0)
        ) is
            variable b_in : std_logic_vector(7 downto 0);
        begin
            spi_send_byte(data(31 downto 24), b_in); rdat(31 downto 24) := b_in;
            spi_send_byte(data(23 downto 16), b_in); rdat(23 downto 16) := b_in;
            spi_send_byte(data(15 downto  8), b_in); rdat(15 downto  8) := b_in;
            spi_send_byte(data( 7 downto  0), b_in); rdat( 7 downto  0) := b_in;
        end procedure;

        variable read_val : std_logic_vector(31 downto 0);
        variable v_word   : std_logic_vector(31 downto 0);
        variable v_byte   : std_logic_vector(7 downto 0);
        type burst_t is array (0 to 3) of std_logic_vector(31 downto 0);
        variable v_burst  : burst_t;
    begin
        wb_rst <= '1';
        wait for 100 ns;
        wb_rst <= '0';
        wait for 100 ns;

        report "Starting SPI Slave Wishbone VHDL Testbench";

        -- Test 1: Single Write 0xCAFEBABE to 0x10
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"60", v_byte);
        spi_send_word(x"00000010", v_word);
        spi_send_word(x"CAFEBABE", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;
 
        -- Test 2: Single Read from 0x10
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"20", v_byte);
        spi_send_word(x"00000010", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop; -- Dummies
        spi_send_word(x"00000000", read_val);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
 
        if read_val = x"CAFEBABE" then
            report "PASS: Wishbone Single Read Match";
        else
            report "FAIL: Wishbone Read Data Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;

        -- Test 3: Burst Write
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"E0", v_byte);
        spi_send_word(x"00000020", v_word);
        spi_send_word(x"11111111", v_word);
        spi_send_word(x"22222222", v_word);
        spi_send_word(x"33333333", v_word);
        spi_send_word(x"44444444", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;

        -- Test 4: Burst Read
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"A0", v_byte);
        spi_send_word(x"00000020", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop; -- Dummies
        spi_send_word(x"00000000", v_burst(0));
        spi_send_word(x"00000000", v_burst(1));
        spi_send_word(x"00000000", v_burst(2));
        spi_send_word(x"00000000", v_burst(3));
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';

        if v_burst(0) = x"11111111" and v_burst(1) = x"22222222" and 
           v_burst(2) = x"33333333" and v_burst(3) = x"44444444" then
            report "PASS: Wishbone Burst Match";
        else
            report "FAIL: Wishbone Burst Mismatch";
            assert false report "Test Failed" severity failure;
        end if;

        report "Simulation Completed";
        wait;
    end process;

end architecture;
