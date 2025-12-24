--------------------------------------------------------------------------------
-- File: bus_matrix_register_slice.vhd
-- Module: bus_matrix_register_slice
-- Description:
--   VHDL implementation of a Register Slice / Skid Buffer.
--   Provides timing isolation for streaming or handshake interfaces.
--
-- Generics:
--   - WIDTH: Data width.
--   - FORWARD_REGISTER: Register the forward path (Valid/Data).
--   - BACKWARD_REGISTER: Register the backward path (Ready).
--
-- Ports:
--   - valid_i/ready_o: Input side.
--   - valid_o/ready_i: Output side.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity bus_matrix_register_slice is
  generic (
    WIDTH             : integer := 32;
    FORWARD_REGISTER  : boolean := false;
    BACKWARD_REGISTER : boolean := false
  );
  port (
    clk   : in std_logic;
    rst_n : in std_logic;

    data_i  : in std_logic_vector(WIDTH - 1 downto 0);
    valid_i : in std_logic;
    ready_o : out std_logic;

    data_o  : out std_logic_vector(WIDTH - 1 downto 0);
    valid_o : out std_logic;
    ready_i : in std_logic
  );
end entity bus_matrix_register_slice;

architecture rtl of bus_matrix_register_slice is

  signal s_valid : std_logic;
  signal s_ready : std_logic;
  signal s_data  : std_logic_vector(WIDTH - 1 downto 0);

begin

  -- Forward Register Logic
  GEN_FWD : if FORWARD_REGISTER generate
    signal fwd_valid_reg : std_logic;
    signal fwd_data_reg  : std_logic_vector(WIDTH - 1 downto 0);
    signal fwd_ready     : std_logic;
  begin
    process (clk, rst_n)
    begin
      if rst_n = '0' then
        fwd_valid_reg <= '0';
        fwd_data_reg  <= (others => '0');
      elsif rising_edge(clk) then
        if fwd_ready = '1' then
          fwd_valid_reg <= valid_i;
          fwd_data_reg  <= data_i;
        end if;
      end if;
    end process;

    fwd_ready <= (not fwd_valid_reg) or s_ready;
    ready_o   <= fwd_ready;
    s_valid   <= fwd_valid_reg;
    s_data    <= fwd_data_reg;
  end generate;

  GEN_NO_FWD : if not FORWARD_REGISTER generate
    ready_o <= s_ready;
    s_valid <= valid_i;
    s_data  <= data_i;
  end generate;

  -- Backward Register Logic (Skid Buffer)
  GEN_BWD : if BACKWARD_REGISTER generate
    signal buf_valid : std_logic;
    signal buf_data  : std_logic_vector(WIDTH - 1 downto 0);
  begin
    process (clk, rst_n)
    begin
      if rst_n = '0' then
        buf_valid <= '0';
        buf_data  <= (others => '0');
      elsif rising_edge(clk) then
        if (s_valid = '1' and ready_i = '0' and buf_valid = '0') then
          buf_valid <= '1';
          buf_data  <= s_data;
        elsif ready_i = '1' then
          buf_valid <= '0';
        end if;
      end if;
    end process;

    s_ready <= not buf_valid;
    valid_o <= '1' when buf_valid = '1' else
      s_valid;
    data_o <= buf_data when buf_valid = '1' else
      s_data;
  end generate;

  GEN_NO_BWD : if not BACKWARD_REGISTER generate
    s_ready <= ready_i;
    valid_o <= s_valid;
    data_o  <= s_data;
  end generate;

end architecture rtl;
