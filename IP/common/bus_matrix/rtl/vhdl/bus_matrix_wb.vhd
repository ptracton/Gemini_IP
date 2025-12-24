--------------------------------------------------------------------------------
-- File: bus_matrix_wb.vhd
-- Module: bus_matrix_wb
-- Description:
--   VHDL Wishbone Wrapper for the Bus Matrix.
--   Implements the full crossbar logic for Wishbone B4 interfaces.
--
-- Generics:
--   - N_MASTERS, M_SLAVES: Matrix dimensions.
--   - DATA_WIDTH, ADDR_WIDTH: Bus configuration.
--   - INPUT/OUTPUT_PIPE_STAGES: Pipeline configuration.
--   - MASTER_SECURE_MASK: Static security configuration.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.bus_matrix_pkg.all;

entity bus_matrix_wb is
  generic (
    N_MASTERS          : integer := 2;
    M_SLAVES           : integer := 2;
    DATA_WIDTH         : integer := 32;
    ADDR_WIDTH         : integer := 32;
    REGION_MAP         : region_map_array_t(0 to M_SLAVES - 1);
    USE_DEFAULT_SLAVE  : boolean                       := false;
    DEFAULT_SLAVE_IDX  : integer                       := 0;
    MASTER_SECURE_MASK : std_logic_vector(31 downto 0) := (others => '0'); -- Up to 32 masters mask support
    INPUT_PIPE_STAGES  : boolean                       := false;
    OUTPUT_PIPE_STAGES : boolean                       := false
  );
  port (
    clk   : in std_logic;
    rst_n : in std_logic;

    -- Master Interfaces
    wb_cyc_i : in std_logic_vector(N_MASTERS - 1 downto 0);
    wb_stb_i : in std_logic_vector(N_MASTERS - 1 downto 0);
    wb_we_i  : in std_logic_vector(N_MASTERS - 1 downto 0);
    wb_adr_i : in std_logic_vector(N_MASTERS * ADDR_WIDTH - 1 downto 0);
    wb_dat_i : in std_logic_vector(N_MASTERS * DATA_WIDTH - 1 downto 0);
    wb_sel_i : in std_logic_vector(N_MASTERS * (DATA_WIDTH/8) - 1 downto 0);
    wb_ack_o : out std_logic_vector(N_MASTERS - 1 downto 0);
    wb_dat_o : out std_logic_vector(N_MASTERS * DATA_WIDTH - 1 downto 0);
    wb_err_o : out std_logic_vector(N_MASTERS - 1 downto 0);

    -- Slave Interfaces
    slv_cyc_o : out std_logic_vector(M_SLAVES - 1 downto 0);
    slv_stb_o : out std_logic_vector(M_SLAVES - 1 downto 0);
    slv_we_o  : out std_logic_vector(M_SLAVES - 1 downto 0);
    slv_adr_o : out std_logic_vector(M_SLAVES * ADDR_WIDTH - 1 downto 0);
    slv_dat_o : out std_logic_vector(M_SLAVES * DATA_WIDTH - 1 downto 0);
    slv_sel_o : out std_logic_vector(M_SLAVES * (DATA_WIDTH/8) - 1 downto 0);
    slv_ack_i : in std_logic_vector(M_SLAVES - 1 downto 0);
    slv_dat_i : in std_logic_vector(M_SLAVES * DATA_WIDTH - 1 downto 0);
    slv_err_i : in std_logic_vector(M_SLAVES - 1 downto 0)
  );
end entity bus_matrix_wb;

architecture rtl of bus_matrix_wb is

  -- Internal Signals (Post-Input Pipe, Pre-Output Pipe)
  signal m_cyc, m_stb, m_we, m_ack, m_err : std_logic_vector(N_MASTERS - 1 downto 0);
  signal m_adr                            : std_logic_vector(N_MASTERS * ADDR_WIDTH - 1 downto 0);
  signal m_wdat, m_rdat                   : std_logic_vector(N_MASTERS * DATA_WIDTH - 1 downto 0);
  signal m_sel                            : std_logic_vector(N_MASTERS * (DATA_WIDTH/8) - 1 downto 0);

  signal s_cyc_int, s_stb_int, s_we_int, s_ack_int, s_err_int : std_logic_vector(M_SLAVES - 1 downto 0);
  signal s_adr_int                                            : std_logic_vector(M_SLAVES * ADDR_WIDTH - 1 downto 0);
  signal s_wdat_int, s_rdat_int                               : std_logic_vector(M_SLAVES * DATA_WIDTH - 1 downto 0);
  signal s_sel_int                                            : std_logic_vector(M_SLAVES * (DATA_WIDTH/8) - 1 downto 0);

  type matrix_nm_t is array(0 to N_MASTERS - 1) of std_logic_vector(M_SLAVES - 1 downto 0);
  type matrix_mn_t is array(0 to M_SLAVES - 1) of std_logic_vector(N_MASTERS - 1 downto 0);

  signal master_req_matrix                  : matrix_nm_t;
  signal master_err_vec                     : std_logic_vector(N_MASTERS - 1 downto 0);
  signal slave_req_vector, slave_gnt_vector : matrix_mn_t;

  -- Resize mask helper
  signal secure_mask_internal : std_logic_vector(N_MASTERS - 1 downto 0);

begin

  secure_mask_internal <= MASTER_SECURE_MASK(N_MASTERS - 1 downto 0);

  -- 1. Input Registers
  GEN_IN_PIPE : if INPUT_PIPE_STAGES generate
    process (clk, rst_n)
    begin
      if rst_n = '0' then
        m_cyc    <= (others => '0');
        m_stb    <= (others => '0');
        m_we     <= (others => '0');
        m_adr    <= (others => '0');
        m_wdat   <= (others => '0');
        m_sel    <= (others => '0');
        wb_ack_o <= (others => '0');
        wb_err_o <= (others => '0');
        wb_dat_o <= (others => '0');
      elsif rising_edge(clk) then
        m_cyc  <= wb_cyc_i;
        m_stb  <= wb_stb_i;
        m_we   <= wb_we_i;
        m_adr  <= wb_adr_i;
        m_wdat <= wb_dat_i;
        m_sel  <= wb_sel_i;

        wb_ack_o <= m_ack;
        wb_err_o <= m_err;
        wb_dat_o <= m_rdat;
      end if;
    end process;
  end generate;

  GEN_NO_IN_PIPE : if not INPUT_PIPE_STAGES generate
    m_cyc    <= wb_cyc_i;
    m_stb    <= wb_stb_i;
    m_we     <= wb_we_i;
    m_adr    <= wb_adr_i;
    m_wdat   <= wb_dat_i;
    m_sel    <= wb_sel_i;
    wb_ack_o <= m_ack;
    wb_err_o <= m_err;
    wb_dat_o <= m_rdat;
  end generate;

  -- 2. Core Matrix
  GEN_MATRIX : for m in 0 to N_MASTERS - 1 generate
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
        valid_i  => m_cyc(m) and m_stb(m),
        secure_i => secure_mask_internal(m),
        slave_sel_o => s_sel, dec_error_o => dec_err, sec_error_o => sec_err);

    master_req_matrix(m) <= s_sel;
    master_err_vec(m)    <= dec_err or sec_err;
  end generate;

  process (master_req_matrix) begin
    for s in 0 to M_SLAVES - 1 loop
      for m in 0 to N_MASTERS - 1 loop
        slave_req_vector(s)(m) <= master_req_matrix(m)(s);
      end loop;
    end loop;
  end process;

  GEN_ARBITERS : for s in 0 to M_SLAVES - 1 generate
    signal s_grant : std_logic_vector(N_MASTERS - 1 downto 0);
  begin
    u_arb : entity work.bus_matrix_arbiter
      generic map(N_REQ => N_MASTERS, SCHEME => 0)
      port map
      (
        clk => clk, rst_n => rst_n, req_i => slave_req_vector(s),
        hold_i => slv_cyc_o(s) and (not slv_ack_i(s)), gnt_o => s_grant);
    slave_gnt_vector(s) <= s_grant;
  end generate;

  -- 3. Output Mux & Registers
  GEN_S_OPS : for s in 0 to M_SLAVES - 1 generate
  begin
    process (slave_gnt_vector(s), m_cyc, m_stb, m_we, m_adr, m_wdat, m_sel)
    begin
      s_cyc_int(s)                                                      <= '0';
      s_stb_int(s)                                                      <= '0';
      s_we_int(s)                                                       <= '0';
      s_adr_int((s + 1) * ADDR_WIDTH - 1 downto s * ADDR_WIDTH)         <= (others => '0');
      s_wdat_int((s + 1) * DATA_WIDTH - 1 downto s * DATA_WIDTH)        <= (others => '0');
      s_sel_int((s + 1) * (DATA_WIDTH/8) - 1 downto s * (DATA_WIDTH/8)) <= (others => '0');

      for i in 0 to N_MASTERS - 1 loop
        if slave_gnt_vector(s)(i) = '1' then
          s_cyc_int(s)                                                      <= m_cyc(i);
          s_stb_int(s)                                                      <= m_stb(i);
          s_we_int(s)                                                       <= m_we(i);
          s_adr_int((s + 1) * ADDR_WIDTH - 1 downto s * ADDR_WIDTH)         <= m_adr((i + 1) * ADDR_WIDTH - 1 downto i * ADDR_WIDTH);
          s_wdat_int((s + 1) * DATA_WIDTH - 1 downto s * DATA_WIDTH)        <= m_wdat((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH);
          s_sel_int((s + 1) * (DATA_WIDTH/8) - 1 downto s * (DATA_WIDTH/8)) <= m_sel((i + 1) * (DATA_WIDTH/8) - 1 downto i * (DATA_WIDTH/8));
        end if;
      end loop;
    end process;
  end generate;

  GEN_OUT_PIPE : if OUTPUT_PIPE_STAGES generate
    process (clk, rst_n) begin
      if rst_n = '0' then
        slv_cyc_o  <= (others => '0');
        slv_stb_o  <= (others => '0');
        slv_we_o   <= (others => '0');
        slv_adr_o  <= (others => '0');
        slv_dat_o  <= (others => '0');
        slv_sel_o  <= (others => '0');
        s_ack_int  <= (others => '0');
        s_err_int  <= (others => '0');
        s_rdat_int <= (others => '0');
      elsif rising_edge(clk) then
        slv_cyc_o  <= s_cyc_int;
        slv_stb_o  <= s_stb_int;
        slv_we_o   <= s_we_int;
        slv_adr_o  <= s_adr_int;
        slv_dat_o  <= s_wdat_int;
        slv_sel_o  <= s_sel_int;
        s_ack_int  <= slv_ack_i;
        s_err_int  <= slv_err_i;
        s_rdat_int <= slv_dat_i;
      end if;
    end process;
  end generate;

  GEN_NO_OUT_PIPE : if not OUTPUT_PIPE_STAGES generate
    slv_cyc_o  <= s_cyc_int;
    slv_stb_o  <= s_stb_int;
    slv_we_o   <= s_we_int;
    slv_adr_o  <= s_adr_int;
    slv_dat_o  <= s_wdat_int;
    slv_sel_o  <= s_sel_int;
    s_ack_int  <= slv_ack_i;
    s_err_int  <= slv_err_i;
    s_rdat_int <= slv_dat_i;
  end generate;

  GEN_M_RET : for m in 0 to N_MASTERS - 1 generate
  begin
    process (master_err_vec(m), slave_gnt_vector, s_ack_int, s_err_int, s_rdat_int)
    begin
      m_ack(m)                                               <= '0';
      m_err(m)                                               <= '0';
      m_rdat((m + 1) * DATA_WIDTH - 1 downto m * DATA_WIDTH) <= (others => '0');
      if master_err_vec(m) = '1' then
        m_err(m) <= '1';
        m_ack(m) <= '1';
      else
        for i in 0 to M_SLAVES - 1 loop
          if slave_gnt_vector(i)(m) = '1' then
            m_ack(m)                                               <= s_ack_int(i);
            m_err(m)                                               <= s_err_int(i);
            m_rdat((m + 1) * DATA_WIDTH - 1 downto m * DATA_WIDTH) <= s_rdat_int((i + 1) * DATA_WIDTH - 1 downto i * DATA_WIDTH);
          end if;
        end loop;
      end if;
    end process;
  end generate;

end architecture rtl;
