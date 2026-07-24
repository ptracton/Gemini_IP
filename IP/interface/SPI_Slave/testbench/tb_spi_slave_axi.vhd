--------------------------------------------------------------------------------
-- Module Name: tb_spi_slave_axi
-- Description:
--    VHDL-2008 Testbench for the SPI Slave AXI4-Lite Wrapper.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_spi_slave_axi is
end entity tb_spi_slave_axi;

architecture sim of tb_spi_slave_axi is

    constant SPI_CLK_PERIOD : time := 20 ns;
    constant AXI_CLK_PERIOD : time := 10 ns;

    signal spi_clk, spi_cs_n, spi_mosi : std_logic := '0';
    signal spi_miso : std_logic;
    signal aclk : std_logic := '0';
    signal aresetn : std_logic := '0';

    signal m_axi_awaddr : std_logic_vector(31 downto 0) := (others => '0');
    signal m_axi_awprot : std_logic_vector(2 downto 0) := (others => '0');
    signal m_axi_awvalid : std_logic := '0';
    signal m_axi_awready : std_logic := '0';
    signal m_axi_wdata : std_logic_vector(31 downto 0) := (others => '0');
    signal m_axi_wstrb : std_logic_vector(3 downto 0) := (others => '0');
    signal m_axi_wvalid : std_logic := '0';
    signal m_axi_wready : std_logic := '0';
    signal m_axi_bresp : std_logic_vector(1 downto 0) := (others => '0');
    signal m_axi_bvalid : std_logic := '0';
    signal m_axi_bready : std_logic := '0';
    signal m_axi_araddr : std_logic_vector(31 downto 0) := (others => '0');
    signal m_axi_arprot : std_logic_vector(2 downto 0) := (others => '0');
    signal m_axi_arvalid : std_logic := '0';
    signal m_axi_arready : std_logic := '0';
    signal m_axi_rdata : std_logic_vector(31 downto 0) := (others => '0');
    signal m_axi_rresp : std_logic_vector(1 downto 0) := (others => '0');
    signal m_axi_rvalid : std_logic := '0';
    signal m_axi_rready : std_logic := '0';

    type mem_array is array (0 to 255) of std_logic_vector(31 downto 0);
    signal memory : mem_array := (others => (others => '0'));

begin

    spi_clk <= not spi_clk after SPI_CLK_PERIOD / 2;
    aclk    <= not aclk    after AXI_CLK_PERIOD / 2;

    dut : entity work.spi_slave_axi
    port map (
        spi_clk => spi_clk, spi_cs_n => spi_cs_n, spi_mosi => spi_mosi, spi_miso => spi_miso,
        aclk => aclk, aresetn => aresetn,
        m_axi_awaddr => m_axi_awaddr, m_axi_awprot => m_axi_awprot, m_axi_awvalid => m_axi_awvalid, m_axi_awready => m_axi_awready,
        m_axi_wdata => m_axi_wdata, m_axi_wstrb => m_axi_wstrb, m_axi_wvalid => m_axi_wvalid, m_axi_wready => m_axi_wready,
        m_axi_bresp => m_axi_bresp, m_axi_bvalid => m_axi_bvalid, m_axi_bready => m_axi_bready,
        m_axi_araddr => m_axi_araddr, m_axi_arprot => m_axi_arprot, m_axi_arvalid => m_axi_arvalid, m_axi_arready => m_axi_arready,
        m_axi_rdata => m_axi_rdata, m_axi_rresp => m_axi_rresp, m_axi_rvalid => m_axi_rvalid, m_axi_rready => m_axi_rready
    );

    -- Slave Model
    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            m_axi_awready <= '0'; m_axi_wready <= '0'; m_axi_bvalid <= '0';
            m_axi_arready <= '0'; m_axi_rvalid <= '0';
        elsif rising_edge(aclk) then
            m_axi_awready <= '1'; m_axi_wready <= '1'; m_axi_arready <= '1';
            
            if m_axi_awvalid = '1' and m_axi_wvalid = '1' then
                memory(to_integer(unsigned(m_axi_awaddr(9 downto 2)))) <= m_axi_wdata;
                m_axi_bvalid <= '1';
                report "AXI Slave: Write Addr=" & to_hstring(m_axi_awaddr) & " Data=" & to_hstring(m_axi_wdata);
            end if;
            if m_axi_bvalid = '1' and m_axi_bready = '1' then m_axi_bvalid <= '0'; end if;

            if m_axi_arvalid = '1' then
                m_axi_rdata <= memory(to_integer(unsigned(m_axi_araddr(9 downto 2))));
                m_axi_rvalid <= '1';
                report "AXI Slave: Read Addr=" & to_hstring(m_axi_araddr) & " Data=" & to_hstring(memory(to_integer(unsigned(m_axi_araddr(9 downto 2)))));
            end if;
            if m_axi_rvalid = '1' and m_axi_rready = '1' then m_axi_rvalid <= '0'; end if;
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
        aresetn <= '0'; wait for 100 ns; aresetn <= '1'; wait for 100 ns; spi_cs_n <= '1';
        report "Starting SPI Slave AXI VHDL Testbench";
        -- Test 1
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"60", v_byte);
        spi_send_word(x"00000004", v_word);
        spi_send_word(x"12345678", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;

        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"20", v_byte);
        spi_send_word(x"00000004", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop;
        spi_send_word(x"00000000", read_val);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';

        if read_val = x"12345678" then
            report "PASS: AXI Single Match";
        else
            report "FAIL: AXI Read Mismatch. Got " & to_hstring(read_val);
            assert false report "Test Failed" severity failure;
        end if;

        -- Test 2: Burst
        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"E0", v_byte);
        spi_send_word(x"00000010", v_word);
        spi_send_word(x"AAAAAAAA", v_word);
        spi_send_word(x"BBBBBBBB", v_word);
        spi_send_word(x"CCCCCCCC", v_word);
        spi_send_word(x"DDDDDDDD", v_word);
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';
        wait for 200 ns;

        wait until falling_edge(spi_clk); spi_cs_n <= '0';
        spi_send_byte(x"A0", v_byte);
        spi_send_word(x"00000010", v_word);
        for i in 0 to 3 loop spi_send_byte(x"00", v_byte); end loop;
        spi_send_word(x"00000000", v_burst(0));
        spi_send_word(x"00000000", v_burst(1));
        spi_send_word(x"00000000", v_burst(2));
        spi_send_word(x"00000000", v_burst(3));
        wait until falling_edge(spi_clk); wait until falling_edge(spi_clk); spi_cs_n <= '1';

        if v_burst(0) = x"AAAAAAAA" and v_burst(1) = x"BBBBBBBB" and 
           v_burst(2) = x"CCCCCCCC" and v_burst(3) = x"DDDDDDDD" then
            report "PASS: AXI Burst Match";
        else
            report "FAIL: AXI Burst Mismatch";
            assert false report "Test Failed" severity failure;
        end if;
        report "Simulation Completed"; wait;
    end process;

end architecture;
