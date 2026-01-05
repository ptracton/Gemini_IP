--------------------------------------------------------------------------------
-- Module Name: spi_slave_core
-- Description:
--    Core Logic for the SPI Slave IP (VHDL-2008). Handles the SPI Protocol,
--    Clock Domain Crossing (CDC), and System Bus Master FSM.
--    Supports Single, Burst, Read, and Write operations.
--
-- Author: Gemini-3 AI
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_slave_core is
    port (
        -- SPI Interface
        spi_clk   : in  std_logic; -- SPI Clock (SCK)
        spi_cs_n  : in  std_logic; -- Chip Select (Active Low)
        spi_mosi  : in  std_logic; -- Master Out Slave In
        spi_miso  : out std_logic; -- Master In Slave Out

        -- System Interface
        sys_clk   : in  std_logic; -- System Clock
        sys_rst_n : in  std_logic; -- System Reset (Active Low)

        -- Generic Bus Master Interface (Sys Domain)
        bus_req_o   : out std_logic := '0'; -- Bus Request/Start
        bus_addr_o  : out std_logic_vector(31 downto 0) := (others => '0'); -- Address
        bus_we_o    : out std_logic := '0'; -- Write Enable
        bus_wdata_o : out std_logic_vector(31 downto 0) := (others => '0'); -- Write Data
        bus_be_o    : out std_logic_vector(3 downto 0) := (others => '0');  -- Byte Enable
        bus_size_o  : out std_logic_vector(1 downto 0) := (others => '0');  -- Size (00=Byte, 01=Half, 10=Word)
        bus_ack_i   : in  std_logic; -- Transfer Acknowledge
        bus_rdata_i : in  std_logic_vector(31 downto 0)  -- Read Data
    );
end entity spi_slave_core;

architecture rtl of spi_slave_core is

    -- Component Declaration
    component spi_async_fifo is
        generic (
            DATA_WIDTH : integer := 32;
            ADDR_WIDTH : integer := 4
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

    -- Constants
    constant CTRL_CMD  : std_logic_vector(1 downto 0) := "10"; -- Command Tag
    constant CTRL_DATA : std_logic_vector(1 downto 0) := "00"; -- Data Tag
    
    -- FIFO Signals
    signal rx_fifo_winc, rx_fifo_wfull   : std_logic;
    signal rx_fifo_wdata                 : std_logic_vector(33 downto 0);
    signal rx_fifo_rinc, rx_fifo_rempty  : std_logic;
    signal rx_fifo_rdata                 : std_logic_vector(33 downto 0);
    
    signal tx_fifo_winc, tx_fifo_wfull   : std_logic;
    signal tx_fifo_wdata                 : std_logic_vector(31 downto 0);
    signal tx_fifo_rinc, tx_fifo_rempty  : std_logic;
    signal tx_fifo_rdata                 : std_logic_vector(31 downto 0);

    -- SPI Domain State Machine and Registers
    type spi_state_t is (S_IDLE, S_CMD, S_ADDR, S_DUMMY, S_DATA_RX, S_DATA_TX);
    signal spi_state : spi_state_t;
    
    signal spi_cmd_reg        : std_logic_vector(7 downto 0);
    signal spi_addr_reg       : std_logic_vector(31 downto 0);
    signal spi_shift_reg      : std_logic_vector(31 downto 0);
    signal spi_tx_holding_reg : std_logic_vector(31 downto 0);
    signal spi_tx_valid       : std_logic;
    signal bit_cnt            : unsigned(5 downto 0);
    
    signal spi_cs_n_inv       : std_logic;
    signal tx_fifo_rinc_d     : std_logic;

    -- System Domain State Machine and Registers
    type master_state_t is (M_IDLE, M_GET_ADDR, M_CHECK_OP, M_WRITE_FETCH_DATA, M_WRITE_EXEC, M_READ_EXEC, M_NEXT_ADDR);
    signal m_state : master_state_t;
    
    signal sys_cmd      : std_logic_vector(7 downto 0);
    signal sys_addr     : unsigned(31 downto 0);
    signal sys_data_out : std_logic_vector(31 downto 0);
    signal sys_size     : std_logic_vector(1 downto 0);
    signal sys_is_burst : std_logic;

    -- Helper Function for Bit Limits
    function get_limit(sz : std_logic_vector(1 downto 0)) return unsigned is
    begin
        case sz is
            when "00" => return to_unsigned(7, 6);  -- Byte
            when "01" => return to_unsigned(15, 6); -- Half
            when "10" => return to_unsigned(31, 6); -- Word
            when others => return to_unsigned(31, 6);
        end case;
    end function;

begin

    spi_cs_n_inv <= not spi_cs_n;

    -- RX FIFO: Transfers Cmd/Addr/WriteData from SPI -> Sys
    u_rx_fifo : spi_async_fifo
        generic map (DATA_WIDTH => 34, ADDR_WIDTH => 4)
        port map (
            wclk   => spi_clk,
            wrst_n => spi_cs_n_inv, -- Reset on CS_n High
            winc   => rx_fifo_winc,
            wdata  => rx_fifo_wdata,
            wfull  => rx_fifo_wfull,
            rclk   => sys_clk,
            rrst_n => sys_rst_n,
            rinc   => rx_fifo_rinc,
            rdata  => rx_fifo_rdata,
            rempty => rx_fifo_rempty
        );

    -- TX FIFO: Transfers ReadData from Sys -> SPI
    u_tx_fifo : spi_async_fifo
        generic map (DATA_WIDTH => 32, ADDR_WIDTH => 4)
        port map (
            wclk   => sys_clk,
            wrst_n => sys_rst_n,
            winc   => tx_fifo_winc,
            wdata  => tx_fifo_wdata,
            wfull  => tx_fifo_wfull,
            rclk   => spi_clk,
            rrst_n => spi_cs_n_inv,
            rinc   => tx_fifo_rinc,
            rdata  => tx_fifo_rdata,
            rempty => tx_fifo_rempty
        );

    ----------------------------------------------------------------------------
    -- SPI Domain Logic
    ----------------------------------------------------------------------------
    process(spi_clk, spi_cs_n)
    begin
        if spi_cs_n = '1' then
            -- Reset SPI State on CS_n High
            spi_state       <= S_IDLE;
            bit_cnt         <= (others => '0');
            rx_fifo_winc    <= '0';
            rx_fifo_wdata   <= (others => '0');
            tx_fifo_rinc    <= '0';
            spi_miso        <= 'Z';
            spi_cmd_reg     <= (others => '0');
            spi_addr_reg    <= (others => '0');
            spi_shift_reg   <= (others => '0');
            spi_tx_holding_reg <= (others => '0');
            spi_tx_valid    <= '0';
            tx_fifo_rinc_d  <= '0';
        elsif rising_edge(spi_clk) then
            -- Defaults
            rx_fifo_winc <= '0';
            tx_fifo_rinc <= '0';
            
            -- TX FIFO Capture Logic
            tx_fifo_rinc_d <= tx_fifo_rinc;
            if tx_fifo_rinc = '1' then
                spi_tx_holding_reg <= tx_fifo_rdata;
                spi_tx_valid <= '1';
            elsif (bit_cnt = 0 and spi_state = S_DATA_TX) then
                 -- Data Consumed
            end if;

            -- Main FSM
            case spi_state is
                when S_IDLE =>
                    spi_state   <= S_CMD;
                    bit_cnt     <= (others => '0');
                    spi_miso    <= '0';
                    spi_cmd_reg <= spi_cmd_reg(6 downto 0) & spi_mosi;
                
                when S_CMD =>
                    spi_cmd_reg <= spi_cmd_reg(6 downto 0) & spi_mosi;
                    if bit_cnt = 7 then
                        spi_state <= S_ADDR;
                        bit_cnt   <= (others => '0');
                        rx_fifo_wdata <= CTRL_CMD & x"000000" & spi_cmd_reg(6 downto 0) & spi_mosi; -- Fix Shift-by-1
                        rx_fifo_winc  <= '1';
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;
                
                when S_ADDR =>
                    spi_addr_reg <= spi_addr_reg(30 downto 0) & spi_mosi;
                    if bit_cnt = 31 then
                        bit_cnt <= (others => '0');
                        rx_fifo_wdata <= CTRL_CMD & spi_addr_reg(30 downto 0) & spi_mosi; -- Fix Shift-by-1
                        rx_fifo_winc  <= '1';
                        
                        if spi_cmd_reg(6) = '1' then -- Write
                            spi_state <= S_DATA_RX;
                        else -- Read
                            spi_state <= S_DUMMY;
                        end if;
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;

                when S_DUMMY =>
                     -- Prefetch Data during Dummy Cycles
                     if bit_cnt = 0 then
                        -- report "RTL: S_DUMMY Start. rempty=" & std_logic'image(tx_fifo_rempty);
                     end if;
                     
                     if tx_fifo_rempty = '0' and spi_tx_valid = '0' and tx_fifo_rinc = '0' and tx_fifo_rinc_d = '0' then
                         tx_fifo_rinc <= '1';
                         -- report "RTL: S_DUMMY Requesting Data";
                     end if;

                     if bit_cnt = 31 then
                         bit_cnt <= (others => '0');
                         spi_state <= S_DATA_TX;
                     else
                         bit_cnt <= bit_cnt + 1;
                     end if;
                
                when S_DATA_RX =>
                    spi_shift_reg <= spi_shift_reg(30 downto 0) & spi_mosi;
                    
                    if bit_cnt = get_limit(spi_cmd_reg(5 downto 4)) then
                        bit_cnt <= (others => '0');
                        rx_fifo_wdata <= CTRL_DATA & spi_shift_reg(30 downto 0) & spi_mosi; -- Fix Shift-by-1
                        rx_fifo_winc  <= '1';
                        
                        if spi_cmd_reg(7) = '0' then -- Single Write
                            spi_state <= S_IDLE;
                        end if;
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;
                
                when S_DATA_TX =>
                    -- Load Shifter
                    if bit_cnt = 0 then
                        if spi_tx_valid = '1' then
                            spi_shift_reg <= spi_tx_holding_reg;
                            report "RTL: Loaded Shift Reg: " & to_hstring(spi_tx_holding_reg);
                            spi_tx_valid <= '0';
                        end if;
                    end if;
                    
                    -- Shift out
                    case spi_cmd_reg(5 downto 4) is
                        when "00"   => spi_miso <= spi_shift_reg(7);
                        when "01"   => spi_miso <= spi_shift_reg(15);
                        when others => spi_miso <= spi_shift_reg(31);
                    end case;
                    
                    spi_shift_reg <= spi_shift_reg(30 downto 0) & '0';
                    
                    if bit_cnt = get_limit(spi_cmd_reg(5 downto 4)) then
                        bit_cnt <= (others => '0');
                        if tx_fifo_rempty = '0' then
                            tx_fifo_rinc <= '1'; -- Legacy/Prefetch next
                        end if;
                        
                        if spi_cmd_reg(7) = '0' then -- Single Read
                            spi_state <= S_IDLE;
                            spi_miso <= '0';
                        end if;
                    else
                        bit_cnt <= bit_cnt + 1;
                    end if;
            end case;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- Sys Domain Logic
    ----------------------------------------------------------------------------
    bus_req_o   <= '1' when (m_state = M_WRITE_EXEC or m_state = M_READ_EXEC) else '0';
    bus_addr_o  <= std_logic_vector(sys_addr);
    bus_we_o    <= '1' when m_state = M_WRITE_EXEC else '0';
    bus_wdata_o <= sys_data_out;
    bus_size_o  <= sys_size;

    -- Byte Enable Comb Logic
    process(sys_size, sys_addr)
    begin
        bus_be_o <= "0000";
        if sys_size = "10" then -- Word
            bus_be_o <= "1111";
        elsif sys_size = "01" then -- Half
            if sys_addr(1) = '1' then
                bus_be_o <= "1100";
            else
                bus_be_o <= "0011";
            end if;
        else -- Byte
            case sys_addr(1 downto 0) is
                when "00" => bus_be_o <= "0001";
                when "01" => bus_be_o <= "0010";
                when "10" => bus_be_o <= "0100";
                when "11" => bus_be_o <= "1000";
                when others => bus_be_o <= "0000";
            end case;
        end if;
    end process;

    -- Master FSM
    process(sys_clk, sys_rst_n)
    begin
        if sys_rst_n = '0' then
            m_state      <= M_IDLE;
            sys_cmd      <= (others => '0');
            sys_addr     <= (others => '0');
            sys_data_out <= (others => '0');
            sys_size     <= (others => '0');
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
                        m_state      <= M_GET_ADDR;
                    end if;
                
                when M_GET_ADDR =>
                    sys_cmd      <= rx_fifo_rdata(7 downto 0);
                    sys_size     <= rx_fifo_rdata(5 downto 4);
                    sys_is_burst <= rx_fifo_rdata(7);
                    
                    if rx_fifo_rempty = '0' then
                        rx_fifo_rinc <= '1';
                        m_state      <= M_CHECK_OP;
                    end if;
                
                when M_CHECK_OP =>
                    sys_addr <= unsigned(rx_fifo_rdata(31 downto 0));
                    
                    if sys_cmd(6) = '1' then -- Write
                        m_state <= M_WRITE_FETCH_DATA;
                    else -- Read
                        m_state <= M_READ_EXEC;
                    end if;
                
                when M_WRITE_FETCH_DATA =>
                    if rx_fifo_rempty = '0' then
                        if rx_fifo_rdata(33 downto 32) = CTRL_CMD then
                            -- Abort Burst, New Command detected
                            sys_cmd      <= rx_fifo_rdata(7 downto 0);
                            sys_size     <= rx_fifo_rdata(5 downto 4);
                            sys_is_burst <= rx_fifo_rdata(7);
                            rx_fifo_rinc <= '1';
                            m_state      <= M_GET_ADDR;
                        else
                            rx_fifo_rinc <= '1';
                            m_state      <= M_WRITE_EXEC;
                        end if;
                    end if;
                
                when M_WRITE_EXEC =>
                    sys_data_out <= rx_fifo_rdata(31 downto 0);
                    if bus_ack_i = '1' then
                        if sys_is_burst = '1' then
                            m_state <= M_NEXT_ADDR;
                        else
                            m_state <= M_IDLE;
                        end if;
                    end if;
                
                when M_READ_EXEC =>
                    if bus_ack_i = '1' then
                        tx_fifo_wdata <= bus_rdata_i;
                        tx_fifo_winc  <= '1';
                        if sys_is_burst = '1' then
                            m_state <= M_NEXT_ADDR;
                        else
                            m_state <= M_IDLE;
                        end if;
                    end if;
                
                when M_NEXT_ADDR =>
                    if rx_fifo_rempty = '0' and rx_fifo_rdata(33 downto 32) = CTRL_CMD then
                        -- Abort Burst Loop on New Command
                        sys_cmd      <= rx_fifo_rdata(7 downto 0);
                        sys_size     <= rx_fifo_rdata(5 downto 4);
                        sys_is_burst <= rx_fifo_rdata(7);
                        rx_fifo_rinc <= '1';
                        m_state      <= M_GET_ADDR;
                    else
                        -- Continue Burst
                        sys_addr <= sys_addr + shift_left(to_unsigned(1, 32), to_integer(unsigned(sys_size)));
                        if sys_cmd(6) = '1' then
                            m_state <= M_WRITE_FETCH_DATA;
                        else
                            m_state <= M_READ_EXEC;
                        end if;
                    end if;
            end case;
        end if;
    end process;

end architecture;
