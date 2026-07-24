--------------------------------------------------------------------------------
-- Module Name: spi_slave_core
-- Description:
--    Core Logic for the SPI Slave IP (VHDL-2008).
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_slave_core is
    port (
        -- SPI Interface
        spi_clk   : in  std_logic;
        spi_cs_n  : in  std_logic;
        spi_mosi  : in  std_logic;
        spi_miso  : out std_logic;

        -- System Interface
        sys_clk   : in  std_logic;
        sys_rst_n : in  std_logic;

        -- Generic Bus Master Interface
        bus_req_o   : out std_logic;
        bus_addr_o  : out std_logic_vector(31 downto 0);
        bus_we_o    : out std_logic;
        bus_wdata_o : out std_logic_vector(31 downto 0);
        bus_be_o    : out std_logic_vector(3 downto 0);
        bus_size_o  : out std_logic_vector(1 downto 0);
        bus_ack_i   : in  std_logic;
        bus_rdata_i : in  std_logic_vector(31 downto 0)
    );
end entity spi_slave_core;

architecture rtl of spi_slave_core is

    component spi_async_fifo is
        generic (
            DATA_WIDTH : integer := 32;
            ADDR_WIDTH : integer := 4;
            NAME       : string  := "FIFO"
        );
        port (
            wclk   : in  std_logic;
            wrst_n : in  std_logic;
            winc   : in  std_logic;
            wdata  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            wfull  : out std_logic;
            rclk   : in  std_logic;
            rrst_n : in  std_logic;
            rinc   : in  std_logic;
            rdata  : out std_logic_vector(DATA_WIDTH-1 downto 0);
            rempty : out std_logic
        );
    end component;

    constant CTRL_CMD  : std_logic_vector(1 downto 0) := "10";
    constant CTRL_DATA : std_logic_vector(1 downto 0) := "00";

    signal rx_fifo_winc : std_logic;
    signal rx_fifo_wdata : std_logic_vector(33 downto 0);
    signal rx_fifo_rinc, rx_fifo_rempty : std_logic;
    signal rx_fifo_rdata : std_logic_vector(33 downto 0);

    signal tx_fifo_winc, tx_fifo_wfull : std_logic;
    signal tx_fifo_wdata : std_logic_vector(31 downto 0);
    signal tx_fifo_rinc, tx_fifo_rempty : std_logic;
    signal tx_fifo_rdata : std_logic_vector(31 downto 0);

    type spi_state_t is (S_IDLE, S_CMD, S_ADDR, S_DUMMY, S_DATA_RX, S_DATA_TX);
    signal spi_state : spi_state_t;
    
    signal spi_shift_reg : std_logic_vector(31 downto 0);
    signal spi_cmd_reg   : std_logic_vector(7 downto 0);
    signal spi_addr_reg  : std_logic_vector(31 downto 0);
    signal spi_tx_holding_reg : std_logic_vector(31 downto 0);
    signal spi_tx_valid  : std_logic;
    signal bit_cnt       : unsigned(5 downto 0);
    signal tx_fifo_rinc_d : std_logic;

    signal spi_rst_n_sync1, spi_rst_n_sync2 : std_logic;

    type master_state_t is (M_IDLE, M_FETCH_CMD, M_GET_CMD, M_WAIT_ADDR, M_FETCH_ADDR, M_GET_ADDR, M_CHECK_OP, M_WAIT_DATA, M_FETCH_DATA, M_GET_DATA, M_WRITE_EXEC, M_READ_EXEC, M_NEXT_ADDR);
    signal m_state : master_state_t;
    signal sys_cmd : std_logic_vector(7 downto 0);
    signal sys_addr : unsigned(31 downto 0);
    signal sys_data_out : std_logic_vector(31 downto 0);
    signal sys_size : std_logic_vector(1 downto 0);
    signal sys_is_burst : std_logic;

    function get_limit(sz : std_logic_vector(1 downto 0)) return unsigned is
    begin
        case sz is
            when "00" => return to_unsigned(7, 6);
            when "01" => return to_unsigned(15, 6);
            when "10" => return to_unsigned(31, 6);
            when others => return to_unsigned(31, 6);
        end case;
    end function;

begin

    -- Reset Sync
    process(spi_clk, sys_rst_n)
    begin
        if sys_rst_n = '0' then
            spi_rst_n_sync1 <= '0'; spi_rst_n_sync2 <= '0';
        elsif rising_edge(spi_clk) then
            spi_rst_n_sync1 <= '1'; spi_rst_n_sync2 <= spi_rst_n_sync1;
        end if;
    end process;

    u_rx_fifo : spi_async_fifo
    generic map (
        DATA_WIDTH => 34,
        ADDR_WIDTH => 4,
        NAME       => "RX"
    )
    port map (
        wclk   => spi_clk,
        wrst_n => spi_rst_n_sync2,
        winc   => rx_fifo_winc,
        wdata  => rx_fifo_wdata,
        wfull  => open,
        rclk   => sys_clk,
        rrst_n => sys_rst_n,
        rinc   => rx_fifo_rinc,
        rdata  => rx_fifo_rdata,
        rempty => rx_fifo_rempty
    );

    u_tx_fifo : spi_async_fifo
    generic map (
        DATA_WIDTH => 32,
        ADDR_WIDTH => 4,
        NAME       => "TX"
    )
    port map (
        wclk   => sys_clk,
        wrst_n => sys_rst_n,
        winc   => tx_fifo_winc,
        wdata  => tx_fifo_wdata,
        wfull  => tx_fifo_wfull,
        rclk   => spi_clk,
        rrst_n => spi_rst_n_sync2,
        rinc   => tx_fifo_rinc,
        rdata  => tx_fifo_rdata,
        rempty => tx_fifo_rempty
    );

    -- SPI Domain
    process(spi_clk, spi_cs_n)
    begin
        if spi_cs_n = '1' then
            spi_state <= S_IDLE;
            bit_cnt <= (others => '0');
            rx_fifo_winc <= '0';
            tx_fifo_rinc <= '0';
            spi_tx_valid <= '0';
            spi_tx_holding_reg <= (others => '0');
            spi_cmd_reg <= (others => '0');
            spi_addr_reg <= (others => '0');
            spi_shift_reg <= (others => '0');
        elsif rising_edge(spi_clk) then
            rx_fifo_winc <= '0';
            tx_fifo_rinc <= '0';

            if tx_fifo_rinc = '1' then
                spi_tx_holding_reg <= tx_fifo_rdata;
                spi_tx_valid <= '1';
            end if;

            case spi_state is
                when S_IDLE =>
                    spi_state <= S_CMD;
                    bit_cnt <= to_unsigned(1, 6);
                    spi_cmd_reg <= spi_cmd_reg(6 downto 0) & spi_mosi;

                when S_CMD =>
                    spi_cmd_reg <= spi_cmd_reg(6 downto 0) & spi_mosi;
                    if bit_cnt = 7 then
                        spi_state <= S_ADDR;
                        bit_cnt <= (others => '0');
                        rx_fifo_wdata <= CTRL_CMD & x"000000" & spi_cmd_reg(6 downto 0) & spi_mosi;
                        rx_fifo_winc <= '1';
                        spi_addr_reg <= (others => '0');
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;

                when S_ADDR =>
                    spi_addr_reg <= spi_addr_reg(30 downto 0) & spi_mosi;
                    if bit_cnt = 31 then
                        bit_cnt <= (others => '0');
                        rx_fifo_wdata <= CTRL_CMD & spi_addr_reg(30 downto 0) & spi_mosi;
                        rx_fifo_winc <= '1';
                        if spi_cmd_reg(6) = '1' then
                            spi_state <= S_DATA_RX;
                        else
                            spi_state <= S_DUMMY;
                        end if;
                        spi_shift_reg <= (others => '0');
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;

                when S_DUMMY =>
                    if tx_fifo_rempty = '0' and spi_tx_valid = '0' and tx_fifo_rinc = '0' then
                        tx_fifo_rinc <= '1';
                    end if;
                    if bit_cnt = 31 then
                        bit_cnt <= (others => '0');
                        spi_state <= S_DATA_TX;
                        if spi_tx_valid = '1' then
                            spi_shift_reg <= spi_tx_holding_reg;
                            spi_tx_valid <= '0';
                        elsif tx_fifo_rinc = '1' then
                            spi_shift_reg <= tx_fifo_rdata;
                        end if;
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;

                when S_DATA_RX =>
                    if bit_cnt = get_limit(spi_cmd_reg(5 downto 4)) then
                        bit_cnt <= (others => '0');
                        rx_fifo_wdata <= CTRL_DATA & spi_shift_reg(30 downto 0) & spi_mosi;
                        rx_fifo_winc <= '1';
                        if spi_cmd_reg(7) = '0' then
                            spi_state <= S_IDLE;
                        end if;
                    else
                        spi_shift_reg <= spi_shift_reg(30 downto 0) & spi_mosi;
                        bit_cnt <= bit_cnt + 1;
                    end if;

                when S_DATA_TX =>
                    if tx_fifo_rempty = '0' and spi_tx_valid = '0' and tx_fifo_rinc = '0' then
                        tx_fifo_rinc <= '1';
                    end if;
                    if bit_cnt = get_limit(spi_cmd_reg(5 downto 4)) then
                        bit_cnt <= (others => '0');
                        if spi_tx_valid = '1' then
                            spi_shift_reg <= spi_tx_holding_reg;
                            spi_tx_valid <= '0';
                        elsif tx_fifo_rinc = '1' then
                            spi_shift_reg <= tx_fifo_rdata;
                        end if;
                        if spi_cmd_reg(7) = '0' then
                            spi_state <= S_IDLE;
                        end if;
                    else
                        spi_shift_reg <= spi_shift_reg(30 downto 0) & '0';
                        bit_cnt <= bit_cnt + 1;
                    end if;
            end case;
        end if;
    end process;

    -- MISO Driver (Drive on Falling Edge)
    process(spi_clk, spi_cs_n)
    begin
        if spi_cs_n = '1' then
            spi_miso <= 'Z';
        elsif falling_edge(spi_clk) then
            if spi_state = S_DATA_TX then
                case spi_cmd_reg(5 downto 4) is
                    when "00" => spi_miso <= spi_shift_reg(7);
                    when "01" => spi_miso <= spi_shift_reg(15);
                    when others => spi_miso <= spi_shift_reg(31);
                end case;
            else
                spi_miso <= '0';
            end if;
        end if;
    end process;

    -- System Domain
    bus_req_o <= '1' when (m_state = M_WRITE_EXEC or m_state = M_READ_EXEC) and bus_ack_i = '0' else '0';
    bus_addr_o <= std_logic_vector(sys_addr);
    bus_we_o <= '1' when m_state = M_WRITE_EXEC else '0';
    bus_wdata_o <= sys_data_out;
    bus_size_o <= sys_size;

    process(sys_size, sys_addr)
    begin
        bus_be_o <= "1111";
        if sys_size = "01" then 
            if sys_addr(1) = '1' then bus_be_o <= "1100"; else bus_be_o <= "0011"; end if;
        elsif sys_size = "00" then
            case sys_addr(1 downto 0) is
                when "00" => bus_be_o <= "0001"; when "01" => bus_be_o <= "0010"; when "10" => bus_be_o <= "0100"; when others => bus_be_o <= "1000";
            end case;
        end if;
    end process;

    -- Sequential State Machine (Robust Sequencer)
    process(sys_clk, sys_rst_n)
    begin
        if sys_rst_n = '0' then
            m_state <= M_IDLE;
            sys_cmd <= (others => '0');
            sys_addr <= (others => '0');
            sys_data_out <= (others => '0');
            sys_size <= (others => '0');
            sys_is_burst <= '0';
            rx_fifo_rinc <= '0';
            tx_fifo_winc <= '0';
            tx_fifo_wdata <= (others => '0');
        elsif rising_edge(sys_clk) then
            rx_fifo_rinc <= '0';
            tx_fifo_winc <= '0';

            case m_state is
                when M_IDLE =>
                    if rx_fifo_rempty = '0' then
                        rx_fifo_rinc <= '1';
                        m_state <= M_FETCH_CMD;
                    end if;

                when M_FETCH_CMD =>
                    m_state <= M_GET_CMD;

                when M_GET_CMD =>
                    -- CMD Word: [7:0]=Cmd
                    sys_cmd <= rx_fifo_rdata(7 downto 0);
                    sys_size <= rx_fifo_rdata(5 downto 4);
                    sys_is_burst <= rx_fifo_rdata(7);
                    m_state <= M_WAIT_ADDR;

                when M_WAIT_ADDR =>
                    if rx_fifo_rempty = '0' then
                        rx_fifo_rinc <= '1';
                        m_state <= M_FETCH_ADDR;
                    end if;

                when M_FETCH_ADDR =>
                    m_state <= M_GET_ADDR;

                when M_GET_ADDR =>
                    -- ADDR Word: [31:0]=Addr
                    sys_addr <= unsigned(rx_fifo_rdata(31 downto 0));
                    m_state <= M_CHECK_OP;

                when M_CHECK_OP =>
                    if sys_cmd(6) = '1' then
                        m_state <= M_WAIT_DATA;
                    else
                        m_state <= M_READ_EXEC;
                    end if;

                when M_WAIT_DATA =>
                    if rx_fifo_rempty = '0' then
                        rx_fifo_rinc <= '1';
                        m_state <= M_FETCH_DATA;
                    end if;

                when M_FETCH_DATA =>
                    m_state <= M_GET_DATA;

                when M_GET_DATA =>
                    if rx_fifo_rdata(33 downto 32) = CTRL_CMD then
                        -- Abort burst, process new command
                        sys_cmd <= rx_fifo_rdata(7 downto 0);
                        sys_size <= rx_fifo_rdata(5 downto 4);
                        sys_is_burst <= rx_fifo_rdata(7);
                        m_state <= M_WAIT_ADDR; 
                    else
                        sys_data_out <= rx_fifo_rdata(31 downto 0);
                        m_state <= M_WRITE_EXEC;
                    end if;

                when M_WRITE_EXEC =>
                    if bus_ack_i = '1' then
                        if sys_is_burst = '1' then
                            m_state <= M_NEXT_ADDR;
                        else
                            m_state <= M_IDLE;
                        end if;
                    end if;

                when M_READ_EXEC =>
                    if bus_ack_i = '1' then
                        tx_fifo_winc <= '1';
                        tx_fifo_wdata <= bus_rdata_i;
                        if sys_is_burst = '1' then
                            m_state <= M_NEXT_ADDR;
                        else
                            m_state <= M_IDLE;
                        end if;
                    end if;

                when M_NEXT_ADDR =>
                    if rx_fifo_rempty = '0' and rx_fifo_rdata(33 downto 32) = CTRL_CMD then
                        rx_fifo_rinc <= '1';
                        m_state <= M_FETCH_CMD;
                    else
                        if sys_cmd(6) = '1' then
                            sys_addr <= sys_addr + shift_left(to_unsigned(1, 32), to_integer(unsigned(sys_size)));
                            m_state <= M_WAIT_DATA;
                        else
                            if tx_fifo_wfull = '0' then
                                sys_addr <= sys_addr + shift_left(to_unsigned(1, 32), to_integer(unsigned(sys_size)));
                                m_state <= M_READ_EXEC;
                            end if;
                        end if;
                    end if;

                when others => m_state <= M_IDLE;
            end case;
        end if;
    end process;

end architecture;
