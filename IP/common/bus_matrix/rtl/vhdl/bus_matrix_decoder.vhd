--------------------------------------------------------------------------------
-- File: bus_matrix_decoder.vhd
-- Module: bus_matrix_decoder
-- Description:
--   VHDL implementation of the Address Decoder and Security Firewall.
--   Maps input addresses to specific slave indices and validates security access.
--
-- Generics:
--   - M_SLAVES: Number of slaves.
--   - ADDR_WIDTH: Address bus width.
--   - USE_DEFAULT_SLAVE: Enable default route.
--   - DEFAULT_SLAVE_INDEX: Index for default route.
--
-- Ports:
--   - addr_i: Input address.
--   - valid_i: Input valid signal.
--   - secure_i: Transaction security level.
--   - slave_sel_o: One-hot slave select.
--   - dec_error_o: Decode error flag.
--   - sec_error_o: Security error flag.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.bus_matrix_pkg.all;

entity bus_matrix_decoder is
  generic (
    M_SLAVES          : integer := 2;
    ADDR_WIDTH        : integer := 32;
    REGION_MAP        : region_map_array_t(0 to M_SLAVES - 1);
    USE_DEFAULT_SLAVE : boolean := false;
    DEFAULT_SLAVE_IDX : integer := 0
  );
  port (
    addr_i      : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    valid_i     : in std_logic;
    secure_i    : in std_logic;
    slave_sel_o : out std_logic_vector(M_SLAVES - 1 downto 0);
    dec_error_o : out std_logic;
    sec_error_o : out std_logic
  );
end entity bus_matrix_decoder;

architecture rtl of bus_matrix_decoder is
begin

  process (addr_i, valid_i, secure_i)
    variable match : boolean;
    variable u_val : unsigned(ADDR_WIDTH - 1 downto 0);
  begin
    slave_sel_o <= (others => '0');
    dec_error_o <= '0';
    sec_error_o <= '0';
    match := false;
    u_val := unsigned(addr_i);

    if valid_i = '1' then
      for i in 0 to M_SLAVES - 1 loop
        if (u_val >= unsigned(REGION_MAP(i).start_addr)) and
          (u_val <= unsigned(REGION_MAP(i).end_addr)) then

          match := true;

          if (REGION_MAP(i).secure_only = '1') and (secure_i = '0') then
            sec_error_o <= '1';
          else
            slave_sel_o(i) <= '1';
          end if;
          exit;
        end if;
      end loop;

      if not match then
        if USE_DEFAULT_SLAVE then
          slave_sel_o(DEFAULT_SLAVE_IDX) <= '1';
        else
          dec_error_o <= '1';
        end if;
      end if;
    end if;
  end process;

end architecture rtl;
