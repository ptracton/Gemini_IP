--------------------------------------------------------------------------------
-- File: bus_matrix_arbiter.vhd
-- Module: bus_matrix_arbiter
-- Description:
--   VHDL implementation of the Bus Matrix Arbiter.
--   Resolves contention for shared resources using a configurable priority scheme.
--
-- Generics:
--   - N_REQ: Number of requestors.
--   - SCHEME: Arbitration scheme (0 = Fixed, 1 = Round Robin [ToDo]).
--
-- Ports:
--   - req_i: Request vector.
--   - hold_i: Hold current grant.
--   - gnt_o: One-hot grant vector.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bus_matrix_arbiter is
  generic (
    N_REQ  : integer := 2;
    SCHEME : integer := 0 -- 0 = Fixed Priority, 1 = Round Robin
  );
  port (
    clk    : in std_logic;
    rst_n  : in std_logic;
    req_i  : in std_logic_vector(N_REQ - 1 downto 0);
    hold_i : in std_logic;
    gnt_o  : out std_logic_vector(N_REQ - 1 downto 0)
  );
end entity bus_matrix_arbiter;

architecture rtl of bus_matrix_arbiter is

  signal gnt_reg : std_logic_vector(N_REQ - 1 downto 0);

  -- Fixed Priority Function
  function fixed_pri_arb(req : std_logic_vector) return std_logic_vector is
    variable gnt               : std_logic_vector(req'range);
    variable found             : boolean := false;
  begin
    gnt := (others => '0');
    for i in 0 to req'length - 1 loop
      if req(i) = '1' and not found then
        gnt(i) := '1';
        found  := true;
      end if;
    end loop;
    return gnt;
  end function;

begin

  process (clk, rst_n)
  begin
    if rst_n = '0' then
      gnt_reg <= (others => '0');
    elsif rising_edge(clk) then
      if (hold_i = '1') and ((or gnt_reg) = '1') then
        -- Hold current grant
        gnt_reg <= gnt_reg;
      else
        -- Simple implementation: Always fixed priority for now unless expanded
        gnt_reg <= fixed_pri_arb(req_i);
      end if;
    end if;
  end process;

  gnt_o <= gnt_reg;

end architecture rtl;
