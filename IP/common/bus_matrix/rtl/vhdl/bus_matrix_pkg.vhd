--------------------------------------------------------------------------------
-- File: bus_matrix_pkg.vhd
-- Module: bus_matrix_pkg
-- Description:
--   VHDL package defining common types and records for the Bus Matrix IP.
--   Provides equivalent definitions to valid `bus_matrix_pkg.sv`.
--
-- Types:
--   - addr_range_t: Record defining start and end addresses.
--   - region_attr_t: Record defining security attributes (secure_only, read_only).
--   - region_map_array_t: Array of region attributes for configuration.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bus_matrix_pkg is

  -- Address Map Structure
  type addr_range_t is record
    start_addr : std_logic_vector(31 downto 0);
    end_addr   : std_logic_vector(31 downto 0);
  end record;

  type addr_map_array_t is array (natural range <>) of addr_range_t;

  type region_attr_t is record
    start_addr  : std_logic_vector(31 downto 0);
    end_addr    : std_logic_vector(31 downto 0);
    secure_only : std_logic;
    read_only   : std_logic;
  end record;

  type region_map_array_t is array (natural range <>) of region_attr_t;

end package bus_matrix_pkg;
