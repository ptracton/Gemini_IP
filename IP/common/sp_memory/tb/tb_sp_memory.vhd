-- File: tb_sp_memory.vhd
-- Description: Native VHDL Testbench for sp_memory Core

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sp_memory is
end entity;

architecture bhv of tb_sp_memory is

    constant WIDTH      : integer := 32;
    constant DEPTH      : integer := 1024;
    constant TECHNOLOGY : string := "GENERIC";

    signal clk   : std_logic := '0';
    signal rst_n : std_logic := '0';
    signal cs    : std_logic := '0';
    signal we    : std_logic := '0';
    signal addr  : std_logic_vector(31 downto 0) := (others => '0');
    signal wdata : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal wstrb : std_logic_vector((WIDTH/8)-1 downto 0) := (others => '0');
    signal rdata : std_logic_vector(WIDTH-1 downto 0);

begin
    -- Clock process
    clk <= not clk after 5 ns;

    -- DUT Instantiation
    dut: entity work.sp_memory
        generic map (
            WIDTH      => WIDTH,
            DEPTH      => DEPTH,
            TECHNOLOGY => TECHNOLOGY,
            PIPELINE   => 0,
            PARITY     => 0,
            ECC        => 0
        )
        port map (
            clk            => clk,
            rst_n          => rst_n,
            cs             => cs,
            we             => we,
            addr           => addr(9 downto 0), -- Match DEPTH=1024 (2^10)
            wdata          => wdata,
            wstrb          => wstrb,
            rdata          => rdata,
            sleep          => '0',
            bist_en        => '0',
            bist_done      => open,
            bist_pass      => open,
            err_parity     => open,
            err_ecc_single => open,
            err_ecc_double => open
        );

    -- Stimulus process
    process
        procedure write_word(a: in integer; d: in std_logic_vector(WIDTH-1 downto 0)) is
        begin
            wait until rising_edge(clk);
            cs    <= '1';
            we    <= '1';
            addr  <= std_logic_vector(to_unsigned(a, 32));
            wdata <= d;
            wstrb <= (others => '1');
            wait until rising_edge(clk);
            cs    <= '0';
            we    <= '0';
            wdata <= (others => '0');
            wstrb <= (others => '0');
        end procedure;

        procedure read_check(a: in integer; exp: in std_logic_vector(WIDTH-1 downto 0)) is
        begin
            wait until rising_edge(clk);
            cs   <= '1';
            we   <= '0';
            addr <= std_logic_vector(to_unsigned(a, 32));
            wait until rising_edge(clk);
            wait for 1 ns; -- Signal update
            -- Read data is valid now
            if rdata /= exp then
                report "ERROR: Read mismatch at " & integer'image(a) & 
                       " Exp=" & to_hstring(exp) & " Got=" & to_hstring(rdata)
                       severity failure;
            else
                report "PASS: Read match at " & integer'image(a) & " Got=" & to_hstring(rdata);
            end if;
            cs <= '0';
        end procedure;

    begin
        rst_n <= '0';
        wait for 20 ns;
        rst_n <= '1';
        wait for 20 ns;

        report "Starting Native VHDL Core Test...";

        write_word(16#10#, x"DEADBEEF");
        write_word(16#20#, x"CAFEBABE");

        read_check(16#10#, x"DEADBEEF");
        read_check(16#20#, x"CAFEBABE");

        report "ALL TESTS PASSED.";
        wait;
    end process;

end architecture;
