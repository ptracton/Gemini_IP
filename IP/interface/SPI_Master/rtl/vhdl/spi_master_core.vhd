--------------------------------------------------------------------------------
-- SPI Master Core (Enhanced VHDL Version)
--
-- Features:
-- - Integrated TX/RX FIFOs (FWFT Mode)
-- - Programmable word length (4-32 bits)
-- - MSB/LSB first selection
-- - Loopback mode
-- - Baud rate divider
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_master_core is
    generic (
        FIFO_DEPTH : integer := 16
    );
    port (
        clk             : in  std_logic;
        rst_n           : in  std_logic;

        -- SPI Interface
        sclk            : out std_logic;
        mosi            : out std_logic;
        miso            : in  std_logic;

        -- CPU/Wrapper Interface
        tx_data         : in  std_logic_vector(31 downto 0);
        tx_push         : in  std_logic;
        tx_full         : out std_logic;
        tx_almost_full  : out std_logic;

        rx_data         : out std_logic_vector(31 downto 0);
        rx_pop          : in  std_logic;
        rx_empty        : out std_logic;
        rx_almost_empty : out std_logic;

        -- Configuration
        cpol            : in  std_logic;
        cpha            : in  std_logic;
        clk_div         : in  std_logic_vector(7 downto 0);
        word_len        : in  std_logic_vector(5 downto 0);
        lsb_first       : in  std_logic;
        loopback        : in  std_logic;
        enable          : in  std_logic;
        
        -- Status
        busy            : out std_logic;
        done_intr       : out std_logic
    );
end entity spi_master_core;

architecture rtl of spi_master_core is

    type state_t is (IDLE, LOAD, TRANSFER, DONE);
    signal state : state_t;

    -- FIFO Signals
    signal tx_fifo_out   : std_logic_vector(31 downto 0);
    signal tx_fifo_empty : std_logic;
    signal tx_fifo_pop   : std_logic;
    
    signal rx_fifo_in    : std_logic_vector(31 downto 0);
    signal rx_fifo_push  : std_logic;
    
    -- Internal Signals
    signal shift_reg     : std_logic_vector(31 downto 0);
    signal bit_cnt       : unsigned(5 downto 0);
    signal clk_cnt       : unsigned(7 downto 0);
    signal sclk_reg      : std_logic;
    signal mosi_reg      : std_logic;
    signal active_miso   : std_logic;

begin

    busy <= '1' when (state /= IDLE) or (tx_fifo_empty = '0') else '0';
    sclk <= sclk_reg when state = TRANSFER else cpol;
    mosi <= mosi_reg;
    active_miso <= mosi_reg when loopback = '1' else miso;

    -- TX FIFO
    tx_fifo_inst : entity work.sync_fifo
        generic map (
            WIDTH     => 32,
            DEPTH     => FIFO_DEPTH,
            FWFT_MODE => true,
            ALMOST_FULL_THRESH => FIFO_DEPTH - 1,
            ALMOST_EMPTY_THRESH => 1
        )
        port map (
            clk         => clk,
            rst_n       => rst_n,
            flush       => not enable,
            push        => tx_push,
            data_in     => tx_data,
            full        => tx_full,
            almost_full => tx_almost_full,
            pop         => tx_fifo_pop,
            data_out    => tx_fifo_out,
            empty       => tx_fifo_empty
        );

    -- RX FIFO
    rx_fifo_inst : entity work.sync_fifo
        generic map (
            WIDTH     => 32,
            DEPTH     => FIFO_DEPTH,
            FWFT_MODE => true,
            ALMOST_FULL_THRESH => FIFO_DEPTH - 1,
            ALMOST_EMPTY_THRESH => 1
        )
        port map (
            clk          => clk,
            rst_n        => rst_n,
            flush        => not enable,
            push         => rx_fifo_push,
            data_in      => rx_fifo_in,
            full         => open,
            almost_full  => open,
            pop          => rx_pop,
            data_out     => rx_data,
            empty        => rx_empty,
            almost_empty => rx_almost_empty
        );

    process(clk, rst_n)
        variable v_word_len : integer;
    begin
        if rst_n = '0' then
            state <= IDLE;
            bit_cnt <= (others => '0');
            clk_cnt <= (others => '0');
            sclk_reg <= '0';
            mosi_reg <= '1';
            shift_reg <= (others => '0');
            tx_fifo_pop <= '0';
            rx_fifo_push <= '0';
            rx_fifo_in <= (others => '0');
            done_intr <= '0';
        elsif rising_edge(clk) then
            tx_fifo_pop <= '0';
            rx_fifo_push <= '0';
            done_intr <= '0';
            v_word_len := to_integer(unsigned(word_len));

            case state is
                when IDLE =>
                    if enable = '1' and tx_fifo_empty = '0' then
                        state <= LOAD;
                    else
                        mosi_reg <= '1';
                        sclk_reg <= cpol;
                    end if;

                when LOAD =>
                    state <= TRANSFER;
                    shift_reg <= tx_fifo_out;
                    tx_fifo_pop <= '1';
                    bit_cnt <= (others => '0');
                    clk_cnt <= x"01";
                    sclk_reg <= cpol;
                    if lsb_first = '1' then
                        mosi_reg <= tx_fifo_out(0);
                    else
                        mosi_reg <= tx_fifo_out(v_word_len-1);
                    end if;

                when TRANSFER =>
                    if clk_cnt >= unsigned(clk_div) then
                        clk_cnt <= x"01";
                        sclk_reg <= not sclk_reg;

                        if sclk_reg = cpol then
                            -- Sample Edge
                            if cpha = '0' then
                                if lsb_first = '1' then
                                    shift_reg <= active_miso & shift_reg(31 downto 1);
                                else
                                    shift_reg <= shift_reg(30 downto 0) & active_miso;
                                end if;
                            end if;
                        else
                            -- Shift Edge
                            if bit_cnt = unsigned(word_len) - 1 then
                                state <= DONE;
                            else
                                bit_cnt <= bit_cnt + 1;
                                if cpha = '0' then
                                    if lsb_first = '1' then
                                        mosi_reg <= shift_reg(0);
                                    else
                                        mosi_reg <= shift_reg(v_word_len-1);
                                    end if;
                                end if;
                            end if;
                        end if;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when DONE =>
                    if lsb_first = '1' then
                        rx_fifo_in <= std_logic_vector(shift_right(unsigned(shift_reg), 32 - v_word_len) and (shift_left(to_unsigned(1, 32), v_word_len) - 1));
                    else
                        rx_fifo_in <= std_logic_vector(unsigned(shift_reg) and (shift_left(to_unsigned(1, 32), v_word_len) - 1));
                    end if;
                    rx_fifo_push <= '1';
                    done_intr <= '1';
                    mosi_reg <= '1';
                    state <= IDLE;

            end case;
        end if;
    end process;

end architecture rtl;
