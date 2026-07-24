--------------------------------------------------------------------------------
-- Module Name: tb_spi_slave_ahb
-- Description:
--    VHDL-2008 Testbench for the SPI Slave AHB Master Wrapper.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_slave_ahb is
end entity tb_spi_slave_ahb;

architecture sim of tb_spi_slave_ahb is

    constant SPI_CLK_PERIOD : time := 20 ns;
    constant AHB_CLK_PERIOD : time := 10 ns;

    signal spi_clk, spi_cs_n, spi_mosi : std_logic := '0';
    signal spi_miso : std_logic;
    signal hclk : std_logic := '0';
    signal hresetn : std_logic := '0';

    signal haddr     : std_logic_vector(31 downto 0) := (others => '0');
    signal hburst    : std_logic_vector(2 downto 0) := (others => '0');
    signal hmastlock : std_logic;
    signal hprot     : std_logic_vector(3 downto 0);
    signal hsize     : std_logic_vector(2 downto 0) := (others => '0');
    signal htrans    : std_logic_vector(1 downto 0) := "00"; -- Idle
    signal hwdata    : std_logic_vector(31 downto 0) := (others => '0');
    signal hwrite    : std_logic := '0';
    signal hrdata    : std_logic_vector(31 downto 0) := (others => '0');
    signal hready    : std_logic := '1';
    signal hresp     : std_logic := '0';
    signal hreadyout : std_logic := '1';
    signal hsel      : std_logic := '0';

    type mem_array is array (0 to 255) of std_logic_vector(31 downto 0);
    signal memory : mem_array := (others => (others => '0'));
    
    signal haddr_reg : std_logic_vector(31 downto 0);
    signal hwrite_reg : std_logic;
    signal hactive_reg : std_logic := '0';

begin

    spi_clk <= not spi_clk after SPI_CLK_PERIOD / 2;
    hclk    <= not hclk    after AHB_CLK_PERIOD / 2;

    dut : entity work.spi_slave_ahb
    port map (
        spi_clk => spi_clk, spi_cs_n => spi_cs_n, spi_mosi => spi_mosi, spi_miso => spi_miso,
        hclk => hclk, hresetn => hresetn,
        haddr => haddr, hburst => hburst, hmastlock => hmastlock, hprot => hprot,
        hsize => hsize, htrans => htrans, hwdata => hwdata, hwrite => hwrite,
        hrdata => hrdata, hready => hready, hresp => hresp
    );

    -- Slave Model
    hrdata <= memory(to_integer(unsigned(haddr_reg(9 downto 2))));

    process(hclk, hresetn)
    begin
        if hresetn = '0' then
            hready <= '1';
            hactive_reg <= '0';
        elsif rising_edge(hclk) then
            -- Data Phase (Write only)
            if hactive_reg = '1' and hwrite_reg = '1' then
                memory(to_integer(unsigned(haddr_reg(9 downto 2)))) <= hwdata;
                report "AHB Slave: Write Addr=" & to_hstring(haddr_reg) & " Data=" & to_hstring(hwdata);
            end if;
            
            -- Address Phase Capture
            if htrans = "10" then -- NONSEQ
                haddr_reg <= haddr;
                hwrite_reg <= hwrite;
                hactive_reg <= '1';
            else
                hactive_reg <= '0';
            end if;
        end if;
    end process;

    -- Stimulus
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
        hresetn <= '0'; wait for 100 ns; hresetn <= '1'; wait for 100 ns; spi_cs_n <= '1';
        report "Starting SPI Slave AHB VHDL Testbench";
        -- Test 1
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"60", v_byte);
        spi_send_word(x"0000000C", v_word);
        spi_send_word(x"BEEFCAFE", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;

        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"20", v_byte);
        spi_send_word(x"0000000C", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop;
        spi_send_word(x"00000000", read_val);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';

        if read_val = x"BEEFCAFE" then
            report "PASS: AHB Single Match";
        else
            report "FAIL: AHB Read Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;

        -- Test 2: Burst
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"E0", v_byte);
        spi_send_word(x"00000030", v_word);
        spi_send_word(x"12344321", v_word);
        spi_send_word(x"56788765", v_word);
        spi_send_word(x"9ABCDEF0", v_word);
        spi_send_word(x"0FEDCBA9", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;

        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"A0", v_byte);
        spi_send_word(x"00000030", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop;
        spi_send_word(x"00000000", v_burst(0));
        spi_send_word(x"00000000", v_burst(1));
        spi_send_word(x"00000000", v_burst(2));
        spi_send_word(x"00000000", v_burst(3));
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';

        if v_burst(0) = x"12344321" and v_burst(1) = x"56788765" and 
           v_burst(2) = x"9ABCDEF0" and v_burst(3) = x"0FEDCBA9" then
            report "PASS: AHB Burst Match";
        else
            report "FAIL: AHB Burst Mismatch";
            assert false report "Test Failed" severity failure;
        end if;
        report "Simulation Completed"; wait;
    end process;

end architecture;
