-- uart_core.vhd
--
-- Generic UART Core with Native Register Interface.
-- Supports configurable baud rate, parity, stop bits, and interrupts.
--
-- Register Map:
-- 0x00: DR   - Data Register (Write: TX, Read: RX)
-- 0x04: SR   - Status Register
-- 0x08: CR   - Control Register
-- 0x0C: BAUD - Baud Rate Divisor
-- 0x10: ISR  - Interrupt Status (R/W1C)
-- 0x14: IMR  - Interrupt Mask

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity uart_core is
    generic (
        DEFAULT_BAUD_DIV : integer := 27;
        FIFO_DEPTH       : integer := 16
    );
    port (
        clk      : in  std_logic;
        rst_n    : in  std_logic;

        -- UART Physical Interface
        uart_rxd   : in  std_logic;
        uart_txd   : out std_logic;
        uart_rts_n : out std_logic;
        uart_cts_n : in  std_logic;
        uart_de    : out std_logic;

        -- Native Register Interface
        reg_addr  : in  std_logic_vector(31 downto 0);
        reg_wdata : in  std_logic_vector(31 downto 0);
        reg_rdata : out std_logic_vector(31 downto 0);
        reg_we    : in  std_logic;
        reg_re    : in  std_logic;
        reg_be    : in  std_logic_vector(3 downto 0);

        -- DMA Handshake
        dma_tx_req : out std_logic;
        dma_rx_req : out std_logic;

        -- Interrupt
        intr     : out std_logic
    );
end entity uart_core;

architecture rtl of uart_core is

    -- Register signals
    signal reg_sr        : std_logic_vector(31 downto 0);
    signal reg_cr        : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_baud      : unsigned(15 downto 0) := to_unsigned(DEFAULT_BAUD_DIV, 16);
    signal reg_baud_frac : unsigned(7 downto 0) := (others => '0');
    signal reg_isr       : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_imr       : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_fcr       : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_dcr       : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_abcr      : std_logic_vector(31 downto 0) := (others => '0');

    -- Status bits
    signal tx_busy             : std_logic := '0';
    signal tx_done_internal    : std_logic := '0';
    signal rx_ready_internal   : std_logic := '0';
    signal parity_err_internal : std_logic := '0';
    signal stop_err_internal   : std_logic := '0';
    signal rx_overrun          : std_logic := '0';

    -- Control bits
    signal tx_en         : std_logic;
    signal rx_en         : std_logic;
    signal stop_bits_cfg : std_logic_vector(1 downto 0);
    signal parity_cfg    : std_logic_vector(1 downto 0);
    signal fifo_en       : std_logic;
    signal loopback_en   : std_logic;
    signal auto_rts_en   : std_logic;
    signal auto_cts_en   : std_logic;
    signal rs485_en      : std_logic;
    signal irda_en       : std_logic;
    signal stick_parity  : std_logic;

    -- FIFO Interface Logic
    signal tx_data_in     : std_logic_vector(8 downto 0);
    signal tx_push        : std_logic;
    signal tx_full        : std_logic;
    signal tx_almost_full : std_logic;
    signal tx_data_out    : std_logic_vector(8 downto 0);
    signal tx_pop         : std_logic;
    signal tx_empty       : std_logic;

    signal rx_data_in     : std_logic_vector(8 downto 0);
    signal rx_push        : std_logic;
    signal rx_full        : std_logic;
    signal rx_almost_full : std_logic;
    signal rx_data_out    : std_logic_vector(8 downto 0);
    signal rx_pop         : std_logic;
    signal rx_empty       : std_logic;

    -- Baud Rate signals
    signal tx_baud_cnt  : unsigned(15 downto 0) := (others => '0');
    signal tx_frac_cnt  : unsigned(7 downto 0) := (others => '0');
    signal tx_baud_tick : std_logic := '0';
    signal rx_baud_cnt  : unsigned(15 downto 0) := (others => '0');
    signal rx_frac_cnt  : unsigned(7 downto 0) := (others => '0');
    signal rx_baud_tick : std_logic := '0';

    -- TX Engine signals
    signal tx_tick_cnt   : unsigned(3 downto 0) := (others => '0');
    signal tx_bit_cnt    : unsigned(3 downto 0) := (others => '0');
    signal tx_shift_reg  : std_logic_vector(12 downto 0) := (others => '1');
    signal irda_tx_pulse : std_logic := '0';
    signal uart_txd_internal : std_logic := '1';
    
    type tx_state_t is (ST_TX_IDLE, ST_TX_SEND);
    signal tx_state : tx_state_t := ST_TX_IDLE;

    -- RX Engine signals
    signal rx_tick_cnt   : unsigned(3 downto 0) := (others => '0');
    signal rx_bit_cnt    : unsigned(3 downto 0) := (others => '0');
    signal rx_shifter    : std_logic_vector(8 downto 0) := (others => '0');
    signal rx_parity_bit : std_logic := '0';
    signal rx_in         : std_logic;

    type rx_state_t is (ST_RX_IDLE, ST_RX_START, ST_RX_DATA_BITS, ST_RX_PARITY, ST_RX_STOP, ST_RX_DONE);
    signal rx_state : rx_state_t := ST_RX_IDLE;

    -- Auto Baud signals
    type ab_state_t is (ST_AB_IDLE, ST_AB_MEASURE, ST_AB_CALC);
    signal ab_state : ab_state_t := ST_AB_IDLE;
    signal ab_cnt : unsigned(31 downto 0) := (others => '0');
    signal ab_last_rxd : std_logic := '1';

    component sync_fifo is
        generic (
            WIDTH     : integer := 32;
            DEPTH     : integer := 16;
            FWFT_MODE : boolean := false
        );
        port (
            clk          : in  std_logic;
            rst_n        : in  std_logic;
            flush        : in  std_logic;
            push         : in  std_logic;
            data_in      : in  std_logic_vector(WIDTH-1 downto 0);
            full         : out std_logic;
            almost_full  : out std_logic;
            overflow     : out std_logic;
            pop          : in  std_logic;
            data_out     : out std_logic_vector(WIDTH-1 downto 0);
            empty        : out std_logic;
            almost_empty : out std_logic;
            underflow    : out std_logic;
            level        : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0);
            max_level    : out std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0)
        );
    end component;

begin

    -- Control and Status bit assignment
    tx_en         <= reg_cr(0);
    rx_en         <= reg_cr(1);
    stop_bits_cfg <= reg_cr(5 downto 4);
    parity_cfg    <= reg_cr(7 downto 6);
    fifo_en       <= reg_cr(8);
    loopback_en   <= reg_cr(9);
    auto_rts_en   <= reg_cr(11);
    auto_cts_en   <= reg_cr(12);
    rs485_en      <= reg_cr(13);
    irda_en       <= reg_cr(14);
    stick_parity  <= reg_cr(15);

    process(rx_overrun, tx_full, rx_full, stop_err_internal, parity_err_internal, tx_done_internal, tx_busy, rx_empty)
    begin
        reg_sr <= (others => '0');
        reg_sr(10) <= rx_overrun;
        reg_sr(9)  <= tx_full;
        reg_sr(8)  <= rx_full;
        reg_sr(7)  <= stop_err_internal;
        reg_sr(6)  <= parity_err_internal;
        reg_sr(5)  <= tx_done_internal;
        reg_sr(4)  <= tx_busy;
        reg_sr(3)  <= '0';
        reg_sr(2)  <= '1';
        reg_sr(1)  <= '1';
        reg_sr(0)  <= not rx_empty;
    end process;

    -- FIFO Instantiations
    tx_fifo_inst : sync_fifo
        generic map (
            WIDTH     => 9,
            DEPTH     => FIFO_DEPTH,
            FWFT_MODE => true
        )
        port map (
            clk          => clk,
            rst_n        => rst_n,
            flush        => reg_fcr(0),
            push         => tx_push,
            data_in      => tx_data_in,
            full         => tx_full,
            almost_full  => tx_almost_full,
            overflow     => open,
            pop          => tx_pop,
            data_out     => tx_data_out,
            empty        => tx_empty,
            almost_empty => open,
            underflow    => open,
            level        => open,
            max_level    => open
        );

    rx_fifo_inst : sync_fifo
        generic map (
            WIDTH     => 9,
            DEPTH     => FIFO_DEPTH,
            FWFT_MODE => true
        )
        port map (
            clk          => clk,
            rst_n        => rst_n,
            flush        => reg_fcr(1),
            push         => rx_push,
            data_in      => rx_data_in,
            full         => rx_full,
            almost_full  => rx_almost_full,
            overflow     => rx_overrun,
            pop          => rx_pop,
            data_out     => rx_data_out,
            empty        => rx_empty,
            almost_empty => open,
            underflow    => open,
            level        => open,
            max_level    => open
        );

    -- DMA Handshake Logic
    dma_tx_req <= '1' when (tx_almost_full = '0' and reg_dcr(0) = '1') else '0';
    dma_rx_req <= '1' when (rx_empty = '0' and reg_dcr(1) = '1') else '0';

    -- RTS Logic
    process(rx_en, auto_rts_en, rx_almost_full, reg_cr)
    begin
        uart_rts_n <= '1';
        if rx_en = '1' then
            if auto_rts_en = '1' then
                uart_rts_n <= rx_almost_full;
            else
                uart_rts_n <= not reg_cr(10);
            end if;
        end if;
    end process;

    -- Register Interface Process
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            reg_cr        <= (others => '0');
            reg_baud      <= to_unsigned(DEFAULT_BAUD_DIV, 16);
            reg_baud_frac <= (others => '0');
            reg_imr       <= (others => '0');
            reg_isr       <= (others => '0');
            reg_fcr       <= (others => '0');
            reg_dcr       <= (others => '0');
            reg_abcr      <= (others => '0');
            tx_data_in    <= (others => '0');
            tx_push       <= '0';
            rx_pop        <= '0';
        elsif rising_edge(clk) then
            tx_push <= '0';
            rx_pop  <= '0';
            reg_fcr <= (others => '0'); -- Self-clearing

            -- Interrupt Status Updates
            if rx_empty = '0' then reg_isr(0) <= '1'; end if;
            if tx_empty = '1' then reg_isr(1) <= '1'; end if;

            if reg_we = '1' then
                case reg_addr(7 downto 0) is
                    when x"00" =>
                        tx_data_in <= reg_wdata(8 downto 0);
                        tx_push    <= '1';
                    when x"08" => reg_cr   <= reg_wdata;
                    when x"0C" => 
                        reg_baud <= unsigned(reg_wdata(15 downto 0));
                        reg_baud_frac <= unsigned(reg_wdata(23 downto 16));
                    when x"10" => reg_isr  <= reg_isr and not reg_wdata;
                    when x"14" => reg_imr  <= reg_wdata;
                    when x"18" => reg_fcr  <= reg_wdata;
                    when x"1C" => reg_dcr  <= reg_wdata;
                    when x"20" => reg_abcr <= reg_wdata;
                    when others => null;
                end case;
            end if;

            if reg_re = '1' then
                if reg_addr(7 downto 0) = x"00" then
                    rx_pop <= '1';
                end if;
            end if;

            -- Auto-Baud Status update (minimal logic here, SM handles values)
            if ab_state = ST_AB_CALC then
                reg_abcr(1) <= '1';
            elsif ab_state = ST_AB_IDLE and reg_abcr(0) = '1' then
                reg_abcr(1) <= '0';
                reg_abcr(2) <= '0';
            end if;
        end if;
    end process;

    -- Combinatorial Read Data
    process(reg_addr, rx_data_out, reg_sr, reg_cr, reg_baud, reg_baud_frac, reg_isr, reg_imr, reg_fcr, reg_dcr, reg_abcr)
    begin
        case reg_addr(7 downto 0) is
            when x"00" => reg_rdata <= (31 downto 9 => '0') & rx_data_out;
            when x"04" => reg_rdata <= reg_sr;
            when x"08" => reg_rdata <= reg_cr;
            when x"0C" => reg_rdata <= x"00" & std_logic_vector(reg_baud_frac) & std_logic_vector(reg_baud);
            when x"10" => reg_rdata <= reg_isr;
            when x"14" => reg_rdata <= reg_imr;
            when x"18" => reg_rdata <= (31 downto 12 => '0') & reg_fcr(11 downto 0);
            when x"1C" => reg_rdata <= reg_dcr;
            when x"20" => reg_rdata <= reg_abcr;
            when others => reg_rdata <= x"DEADBEEF";
        end case;
    end process;

    -- TX Baud Rate Generator
    process(clk, rst_n)
        variable v_inc : unsigned(15 downto 0);
    begin
        if rst_n = '0' then
            tx_baud_cnt  <= (others => '0');
            tx_frac_cnt  <= (others => '0');
            tx_baud_tick <= '0';
        elsif rising_edge(clk) then
            tx_baud_tick <= '0';
            if tx_state = ST_TX_IDLE then
                tx_baud_cnt <= (others => '0');
                tx_frac_cnt <= (others => '0');
            elsif reg_baud /= 0 then
                v_inc := reg_baud - 1;
                if tx_frac_cnt < reg_baud_frac then
                    v_inc := v_inc + 1;
                end if;
                if tx_baud_cnt >= v_inc then
                    tx_baud_cnt  <= (others => '0');
                    tx_baud_tick <= '1';
                    tx_frac_cnt  <= tx_frac_cnt + 1;
                else
                    tx_baud_cnt <= tx_baud_cnt + 1;
                end if;
            end if;
        end if;
    end process;

    -- RX Baud Rate Generator
    process(clk, rst_n)
        variable v_inc : unsigned(15 downto 0);
    begin
        if rst_n = '0' then
            rx_baud_cnt  <= (others => '0');
            rx_frac_cnt  <= (others => '0');
            rx_baud_tick <= '0';
        elsif rising_edge(clk) then
            rx_baud_tick <= '0';
            if rx_state = ST_RX_IDLE then
                rx_baud_cnt <= (others => '0');
                rx_frac_cnt <= (others => '0');
            elsif reg_baud /= 0 then
                v_inc := reg_baud - 1;
                if rx_frac_cnt < reg_baud_frac then
                    v_inc := v_inc + 1;
                end if;
                if rx_baud_cnt >= v_inc then
                    rx_baud_cnt  <= (others => '0');
                    rx_baud_tick <= '1';
                    rx_frac_cnt  <= rx_frac_cnt + 1;
                else
                    rx_baud_cnt <= rx_baud_cnt + 1;
                end if;
            end if;
        end if;
    end process;


    process(clk, rst_n)
        variable v_parity : std_logic;
    begin
        if rst_n = '0' then
            tx_state          <= ST_TX_IDLE;
            uart_txd_internal <= '1';
            tx_busy           <= '0';
            tx_done_internal  <= '0';
            tx_tick_cnt       <= (others => '0');
            tx_bit_cnt        <= (others => '0');
            tx_shift_reg      <= (others => '1');
            tx_pop            <= '0';
            uart_de           <= '0';
            irda_tx_pulse     <= '0';
        elsif rising_edge(clk) then
            tx_done_internal <= '0';
            tx_pop           <= '0';
            irda_tx_pulse    <= '0';

            case tx_state is
                when ST_TX_IDLE =>
                    uart_txd_internal <= '1';
                    uart_de           <= '0';
                    tx_busy           <= '0';
                    if tx_empty = '0' and tx_en = '1' and (auto_cts_en = '0' or uart_cts_n = '0') then
                        tx_state          <= ST_TX_SEND;
                        tx_busy           <= '1';
                        tx_pop            <= '1';
                        tx_tick_cnt       <= (others => '0');
                        uart_txd_internal <= '0'; -- Start bit
                        uart_de           <= '1';
                        
                        if stick_parity = '1' then
                            v_parity := not parity_cfg(0);
                        else
                            v_parity := '0';
                            for i in 0 to 7 loop v_parity := v_parity xor tx_data_out(i); end loop;
                            if parity_cfg(0) = '1' then v_parity := not v_parity; end if;
                        end if;

                        if parity_cfg(1) = '1' then
                            tx_shift_reg <= "1111" & v_parity & tx_data_out(7 downto 0);
                            tx_bit_cnt   <= to_unsigned(9, 4) + unsigned(stop_bits_cfg(0 downto 0));
                            if rs485_en = '1' then
                                tx_shift_reg <= "111" & v_parity & tx_data_out;
                                tx_bit_cnt   <= to_unsigned(10, 4) + unsigned(stop_bits_cfg(0 downto 0));
                            end if;
                        else
                            tx_shift_reg <= "11111" & tx_data_out(7 downto 0);
                            tx_bit_cnt   <= to_unsigned(8, 4) + unsigned(stop_bits_cfg(0 downto 0));
                            if rs485_en = '1' then
                                tx_shift_reg <= "1111" & tx_data_out;
                                tx_bit_cnt   <= to_unsigned(9, 4) + unsigned(stop_bits_cfg(0 downto 0));
                            end if;
                        end if;
                    end if;

                when ST_TX_SEND =>
                    uart_de <= '1';
                    if tx_baud_tick = '1' then
                        if tx_tick_cnt = 15 then
                            tx_tick_cnt <= (others => '0');
                            uart_txd_internal <= tx_shift_reg(0);
                            tx_shift_reg <= '1' & tx_shift_reg(tx_shift_reg'left downto 1);
                            if tx_bit_cnt = 0 then
                                tx_state         <= ST_TX_IDLE;
                                tx_done_internal <= '1';
                            else
                                tx_bit_cnt <= tx_bit_cnt - 1;
                            end if;
                        else
                            tx_tick_cnt <= tx_tick_cnt + 1;
                            if irda_en = '1' and tx_shift_reg(0) = '0' and tx_tick_cnt < 3 then
                                irda_tx_pulse <= '1';
                            end if;
                        end if;
                    end if;
            end case;
        end if;
    end process;

    uart_txd <= not irda_tx_pulse when irda_en = '1' else uart_txd_internal;

    -- RX Logic
    rx_in <= uart_txd_internal when loopback_en = '1' else uart_rxd;

    process(clk, rst_n)
        variable v_xor : std_logic;
    begin
        if rst_n = '0' then
            rx_state            <= ST_RX_IDLE;
            rx_data_in          <= (others => '0');
            rx_push             <= '0';
            rx_tick_cnt         <= (others => '0');
            rx_bit_cnt          <= (others => '0');
            parity_err_internal <= '0';
            stop_err_internal   <= '0';
            rx_shifter          <= (others => '0');
            rx_parity_bit       <= '0';
        elsif rising_edge(clk) then
            rx_push <= '0';

            case rx_state is
                when ST_RX_IDLE =>
                    if rx_in = '0' and rx_en = '1' then
                        rx_state    <= ST_RX_START;
                        rx_tick_cnt <= (others => '0');
                    end if;

                when others =>
                    if rx_baud_tick = '1' then
                        case rx_state is
                            when ST_RX_START =>
                                if rx_tick_cnt = 7 then
                                    if rx_in = '0' then
                                        rx_tick_cnt <= (others => '0');
                                        rx_bit_cnt  <= (others => '0');
                                        rx_state    <= ST_RX_DATA_BITS;
                                    else
                                        rx_state <= ST_RX_IDLE;
                                    end if;
                                else
                                    rx_tick_cnt <= rx_tick_cnt + 1;
                                end if;

                            when ST_RX_DATA_BITS =>
                                if rx_tick_cnt = 15 then
                                    rx_tick_cnt <= (others => '0');
                                    rx_shifter  <= rx_in & rx_shifter(8 downto 1);
                                    if (rs485_en = '1' and rx_bit_cnt = 8) or (rs485_en = '0' and rx_bit_cnt = 7) then
                                        if parity_cfg(1) = '1' then
                                            rx_state <= ST_RX_PARITY;
                                        else
                                            rx_state <= ST_RX_STOP;
                                        end if;
                                        rx_bit_cnt <= (others => '0');
                                    else
                                        rx_bit_cnt <= rx_bit_cnt + 1;
                                    end if;
                                else
                                    rx_tick_cnt <= rx_tick_cnt + 1;
                                end if;

                            when ST_RX_PARITY =>
                                if rx_tick_cnt = 15 then
                                    rx_tick_cnt   <= (others => '0');
                                    rx_parity_bit <= rx_in;
                                    rx_state      <= ST_RX_STOP;
                                  else
                                    rx_tick_cnt <= rx_tick_cnt + 1;
                                end if;

                            when ST_RX_STOP =>
                                if rx_tick_cnt = 15 then
                                    rx_tick_cnt <= (others => '0');
                                    if rx_in = '1' then
                                        if stop_bits_cfg(0) = '1' and rx_bit_cnt = 0 then
                                            rx_bit_cnt <= to_unsigned(1, 4);
                                        else
                                            rx_state <= ST_RX_DONE;
                                        end if;
                                    else
                                        stop_err_internal <= '1';
                                        rx_state          <= ST_RX_DONE;
                                    end if;
                                else
                                    rx_tick_cnt <= rx_tick_cnt + 1;
                                end if;

                            when ST_RX_DONE =>
                                if rs485_en = '1' then
                                    rx_data_in <= rx_shifter;
                                else
                                    rx_data_in <= '0' & rx_shifter(8 downto 1);
                                end if;
                                rx_push <= '1';
                                
                                v_xor := '0';
                                for i in 0 to 7 loop v_xor := v_xor xor rx_shifter(i); end loop;
                                
                                if parity_cfg(1) = '1' then
                                    if stick_parity = '1' then
                                        if parity_cfg(0) = '1' then -- forced 1?
                                            if rx_parity_bit /= '1' then parity_err_internal <= '1'; else parity_err_internal <= '0'; end if;
                                        else
                                            if rx_parity_bit /= '0' then parity_err_internal <= '1'; else parity_err_internal <= '0'; end if;
                                        end if;
                                    else
                                        if parity_cfg(0) = '1' then -- Odd
                                            if rx_parity_bit = v_xor then parity_err_internal <= '1'; else parity_err_internal <= '0'; end if;
                                        else -- Even
                                            if rx_parity_bit /= v_xor then parity_err_internal <= '1'; else parity_err_internal <= '0'; end if;
                                        end if;
                                    end if;
                                else
                                    parity_err_internal <= '0';
                                end if;
                                rx_state <= ST_RX_IDLE;

                            when others =>
                                rx_state <= ST_RX_IDLE;
                        end case;
                    end if;
            end case;
        end if;
    end process;

    -- Auto-Baud Logic
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            ab_state <= ST_AB_IDLE;
            ab_cnt <= (others => '0');
            ab_last_rxd <= '1';
        elsif rising_edge(clk) then
            ab_last_rxd <= rx_in;
            case ab_state is
                when ST_AB_IDLE =>
                    if reg_abcr(0) = '1' then
                        ab_state <= ST_AB_MEASURE;
                        ab_cnt <= (others => '0');
                    end if;
                when ST_AB_MEASURE =>
                    if ab_last_rxd = '1' and rx_in = '0' then
                        ab_cnt <= (others => '0');
                    elsif rx_in = '0' then
                        ab_cnt <= ab_cnt + 1;
                    elsif ab_last_rxd = '0' and rx_in = '1' then
                        ab_state <= ST_AB_CALC;
                    end if;
                    if ab_cnt > x"00FFFFFF" then
                        ab_state <= ST_AB_IDLE;
                    end if;
                when ST_AB_CALC =>
                    ab_state <= ST_AB_IDLE;
                when others => ab_state <= ST_AB_IDLE;
            end case;
        end if;
    end process;

    -- Interrupt signal
    intr <= '1' when (reg_isr and reg_imr) /= x"00000000" else '0';

end architecture rtl;
