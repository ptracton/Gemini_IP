--------------------------------------------------------------------------------
-- File: bus_matrix_ahb.vhd
-- Module: bus_matrix_ahb
-- Description:
--   VHDL AHB-Lite Wrapper for the Bus Matrix.
--   Handles AHB protocol adaptation, including HREADYOUT generation and stalling.
--
-- Generics:
--   - N_MASTERS, M_SLAVES: Matrix dimensions.
--   - DATA_WIDTH, ADDR_WIDTH: Bus configuration.
--   - MASTER_SECURE_MASK: Security configuration.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.bus_matrix_pkg.all;

entity bus_matrix_ahb is
  generic (
    N_MASTERS          : integer := 2;
    M_SLAVES           : integer := 2;
    DATA_WIDTH         : integer := 32;
    ADDR_WIDTH         : integer := 32;
    REGION_MAP         : region_map_array_t(0 to M_SLAVES - 1);
    USE_DEFAULT_SLAVE  : boolean := false;
    DEFAULT_SLAVE_IDX  : integer := 0;
    INPUT_PIPE_STAGES  : boolean := false;
    OUTPUT_PIPE_STAGES : boolean := false
  );
  port (
    HCLK    : in std_logic;
    HRESETn : in std_logic;

    -- Master Interfaces
    HSEL_i   : in std_logic_vector(N_MASTERS - 1 downto 0);
    HADDR_i  : in std_logic_vector(N_MASTERS * ADDR_WIDTH - 1 downto 0);
    HTRANS_i : in std_logic_vector(N_MASTERS * 2 - 1 downto 0);
    HWRITE_i : in std_logic_vector(N_MASTERS - 1 downto 0);
    HSIZE_i  : in std_logic_vector(N_MASTERS * 3 - 1 downto 0);
    HBURST_i : in std_logic_vector(N_MASTERS * 3 - 1 downto 0);
    HPROT_i  : in std_logic_vector(N_MASTERS * 4 - 1 downto 0);
    HWDATA_i : in std_logic_vector(N_MASTERS * DATA_WIDTH - 1 downto 0);

    HREADYOUT_o : out std_logic_vector(N_MASTERS - 1 downto 0);
    HRESP_o     : out std_logic_vector(N_MASTERS * 2 - 1 downto 0);
    HRDATA_o    : out std_logic_vector(N_MASTERS * DATA_WIDTH - 1 downto 0);

    -- Slave Interfaces
    HSEL_o   : out std_logic_vector(M_SLAVES - 1 downto 0);
    HADDR_o  : out std_logic_vector(M_SLAVES * ADDR_WIDTH - 1 downto 0);
    HTRANS_o : out std_logic_vector(M_SLAVES * 2 - 1 downto 0);
    HWRITE_o : out std_logic_vector(M_SLAVES - 1 downto 0);
    HSIZE_o  : out std_logic_vector(M_SLAVES * 3 - 1 downto 0);
    HBURST_o : out std_logic_vector(M_SLAVES * 3 - 1 downto 0);
    HPROT_o  : out std_logic_vector(M_SLAVES * 4 - 1 downto 0);
    HWDATA_o : out std_logic_vector(M_SLAVES * DATA_WIDTH - 1 downto 0);

    HREADY_i : in std_logic_vector(M_SLAVES - 1 downto 0);
    HRESP_i  : in std_logic_vector(M_SLAVES * 2 - 1 downto 0);
    HRDATA_i : in std_logic_vector(M_SLAVES * DATA_WIDTH - 1 downto 0)
  );
end entity bus_matrix_ahb;

architecture rtl of bus_matrix_ahb is

  signal m_adr   : std_logic_vector(N_MASTERS * ADDR_WIDTH - 1 downto 0);
  signal m_trans : std_logic_vector(N_MASTERS * 2 - 1 downto 0);
  signal m_prot  : std_logic_vector(N_MASTERS * 4 - 1 downto 0);

  type matrix_nm_t is array(0 to N_MASTERS - 1) of std_logic_vector(M_SLAVES - 1 downto 0);
  type matrix_mn_t is array(0 to M_SLAVES - 1) of std_logic_vector(N_MASTERS - 1 downto 0);

  signal master_req_matrix                                              : matrix_nm_t;
  signal master_decode_err                                              : std_logic_vector(N_MASTERS - 1 downto 0);
  signal slave_req_vector, slave_gnt_vector_addr, slave_gnt_vector_data : matrix_mn_t;

begin

  m_adr   <= HADDR_i;
  m_trans <= HTRANS_i;
  m_prot  <= HPROT_i;

  -- 1. Decode Stage
  GEN_DECODERS : for m in 0 to N_MASTERS - 1 generate
    signal s_sel            : std_logic_vector(M_SLAVES - 1 downto 0);
    signal dec_err, sec_err : std_logic;
  begin
    u_dec : entity work.bus_matrix_decoder
      generic map(
        M_SLAVES => M_SLAVES, ADDR_WIDTH => ADDR_WIDTH, REGION_MAP => REGION_MAP,
        USE_DEFAULT_SLAVE => USE_DEFAULT_SLAVE, DEFAULT_SLAVE_IDX => DEFAULT_SLAVE_IDX)
      port map
      (
        addr_i   => m_adr((m + 1) * ADDR_WIDTH - 1 downto m * ADDR_WIDTH),
        valid_i  => m_trans(m * 2 + 1), -- HTRANS[1]
        secure_i => not m_prot(m * 4 + 1), -- HPROT[1]=0 is Secure
        slave_sel_o => s_sel, dec_error_o => dec_err, sec_error_o => sec_err);

    master_req_matrix(m) <= s_sel;
    master_decode_err(m) <= dec_err or sec_err;
  end generate;

  process (master_req_matrix) begin
    for s in 0 to M_SLAVES - 1 loop
      for m in 0 to N_MASTERS - 1 loop
        slave_req_vector(s)(m) <= master_req_matrix(m)(s);
      end loop;
    end loop;
  end process;

  -- 2. Arbiter
  GEN_ARBITERS : for s in 0 to M_SLAVES - 1 generate
    signal s_gnt : std_logic_vector(N_MASTERS - 1 downto 0);
  begin
    u_arb : entity work.bus_matrix_arbiter
      generic map(N_REQ => N_MASTERS, SCHEME => 0)
      port map
      (
        clk => HCLK, rst_n => HRESETn, req_i => slave_req_vector(s),
        hold_i => not HREADY_i(s), gnt_o => s_gnt);
    slave_gnt_vector_addr(s) <= s_gnt;
  end generate;

  -- 3. Pipeline Register
  process (HCLK, HRESETn) begin
    if HRESETn = '0' then
      slave_gnt_vector_data <= (others => (others => '0'));
    elsif rising_edge(HCLK) then
      for s in 0 to M_SLAVES - 1 loop
        if HREADY_i(s) = '1' then
          slave_gnt_vector_data(s) <= slave_gnt_vector_addr(s);
        end if;
      end loop;
    end if;
  end process;

  -- 4. Address Mux
  GEN_SLAVE_ADDR_MUX : for s in 0 to M_SLAVES - 1 generate
  begin
    process (slave_gnt_vector_addr(s), HADDR_i, HTRANS_i, HWRITE_i, HSIZE_i, HBURST_i, HPROT_i)
    begin
      HSEL_o(s)                                               <= '0';
      HADDR_o((s + 1) * ADDR_WIDTH - 1 downto s * ADDR_WIDTH) <= (others => '0');
      HTRANS_o((s + 1) * 2 - 1 downto s * 2)                  <= "00";
      HWRITE_o(s)                                             <= '0';
      HSIZE_o((s + 1) * 3 - 1 downto s * 3)                   <= "000";
      HBURST_o((s + 1) * 3 - 1 downto s * 3)                  <= "000";
      HPROT_o((s + 1) * 4 - 1 downto s * 4)                   <= "0000";

      for i in 0 to N_MASTERS - 1 loop
        if slave_gnt_vector_addr(s)(i) = '1' then
          HSEL_o(s)                                               <= '1';
          HADDR_o((s + 1) * ADDR_WIDTH - 1 downto s * ADDR_WIDTH) <= HADDR_i((i + 1) * ADDR_WIDTH - 1 downto i * ADDR_WIDTH);
          HTRANS_o((s + 1) * 2 - 1 downto s * 2)                  <= HTRANS_i((i + 1) * 2 - 1 downto i * 2);
          HWRITE_o(s)                                             <= HWRITE_i(i);
          HSIZE_o((s + 1) * 3 - 1 downto s * 3)                   <= HSIZE_i((i + 1) * 3 - 1 downto i * 3);
          HBURST_o((s + 1) * 3 - 1 downto s * 3)                  <= HBURST_i((i + 1) * 3 - 1 downto i * 3);
          HPROT_o((s + 1) * 4 - 1 downto s * 4)                   <= HPROT_i((i + 1) * 4 - 1 downto i * 4);
        end if;
      end loop;
    end process;
  end generate;

  -- 5. Data Mux
  GEN_SLAVE_DATA_MUX : for s in 0 to M_SLAVES - 1 generate
  begin
    process (slave_gnt_vector_data(s), HWDATA_i)
    begin
      HWDATA_o((s + 1) * DATA_WIDTH - 1 downto s * DATA_WIDTH) <= (others => '0');
      for i in 0 to N_MASTERS - 1 loop
        if slave_gnt_vector_data(s)(i) = '1' then
          HWDATA_o((s + 1) * DATA_WIDTH - 1 downto s * DATA_WIDTH) <= HWDATA_i((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH);
        end if;
      end loop;
    end process;
  end generate;

  -- 6. Return Path Mux (With HREADY Fix)
  GEN_MASTER_MUX : for m in 0 to N_MASTERS - 1 generate
  begin
    process (master_decode_err, slave_gnt_vector_data, slave_gnt_vector_addr, m_trans, HRDATA_i, HRESP_i, HREADY_i)
      variable grant_active : std_logic;
    begin
      HRDATA_o((m + 1) * DATA_WIDTH - 1 downto m * DATA_WIDTH) <= (others => '0');
      HRESP_o((m + 1) * 2 - 1 downto m * 2)                    <= "00";
      HREADYOUT_o(m)                                           <= '1';

      if master_decode_err(m) = '1' then
        HRESP_o((m + 1) * 2 - 1 downto m * 2) <= "01"; -- ERROR
      else
        for i in 0 to M_SLAVES - 1 loop
          if slave_gnt_vector_data(i)(m) = '1' then
            HRDATA_o((m + 1) * DATA_WIDTH - 1 downto m * DATA_WIDTH) <= HRDATA_i((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH);
            HRESP_o((m + 1) * 2 - 1 downto m * 2)                    <= HRESP_i((i + 1) * 2 - 1 downto i * 2);
            HREADYOUT_o(m)                                           <= HREADY_i(i);
          end if;
        end loop;

        -- Address Phase Stalling
        if (m_trans(m * 2 + 1) = '1') then -- NONSEQ/SEQ
          grant_active := '0';
          for i in 0 to M_SLAVES - 1 loop
            if slave_gnt_vector_addr(i)(m) = '1' then
              grant_active := '1';
            end if;
          end loop;

          if grant_active = '0' then
            HREADYOUT_o(m) <= '0';
          end if;
        end if;
      end if;
    end process;
  end generate;

end architecture rtl;
