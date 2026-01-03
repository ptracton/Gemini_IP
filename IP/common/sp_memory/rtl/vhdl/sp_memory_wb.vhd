LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL;

ENTITY sp_memory_wb IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        PIPELINE   : INTEGER := 0;
        PARITY     : INTEGER := 0;
        ECC        : INTEGER := 0;
        TECHNOLOGY : STRING  := "GENERIC"
    );
    PORT (
        clk_i : IN STD_LOGIC;
        rst_i : IN STD_LOGIC;

        -- Sideband Signals
        sleep          : IN  STD_LOGIC := '0';
        bist_en        : IN  STD_LOGIC := '0';
        bist_done      : OUT STD_LOGIC;
        bist_pass      : OUT STD_LOGIC;
        err_parity     : OUT STD_LOGIC;
        err_ecc_single : OUT STD_LOGIC;
        err_ecc_double : OUT STD_LOGIC;
        
        adr_i : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        dat_i : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
        sel_i : IN STD_LOGIC_VECTOR((WIDTH/8)-1 DOWNTO 0);
        we_i  : IN STD_LOGIC;
        cyc_i : IN STD_LOGIC;
        stb_i : IN STD_LOGIC;
        
        dat_o : OUT STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        ack_o : OUT STD_LOGIC;
        err_o : OUT STD_LOGIC
    );
END ENTITY sp_memory_wb;

ARCHITECTURE rtl OF sp_memory_wb IS

    COMPONENT sp_memory
        GENERIC (
            WIDTH      : INTEGER;
            DEPTH      : INTEGER;
            TECHNOLOGY : STRING;
            PIPELINE   : INTEGER;
            PARITY     : INTEGER;
            ECC        : INTEGER
        );
        PORT (
            clk            : IN  STD_LOGIC;
            rst_n          : IN  STD_LOGIC;
            cs             : IN  STD_LOGIC;
            we             : IN  STD_LOGIC;
            addr           : IN  STD_LOGIC_VECTOR;
            wdata          : IN  STD_LOGIC_VECTOR;
            wstrb          : IN  STD_LOGIC_VECTOR;
            rdata          : OUT STD_LOGIC_VECTOR;
            sleep          : IN  STD_LOGIC := '0';
            bist_en        : IN  STD_LOGIC := '0';
            bist_done      : OUT STD_LOGIC;
            bist_pass      : OUT STD_LOGIC;
            err_parity     : OUT STD_LOGIC;
            err_ecc_single : OUT STD_LOGIC;
            err_ecc_double : OUT STD_LOGIC
        );
    END COMPONENT;

    CONSTANT ADDR_LSB : INTEGER := function_log2(WIDTH / 8);
    CONSTANT ADDR_BITS : INTEGER := function_log2(DEPTH);

    SIGNAL mem_cs   : STD_LOGIC;
    SIGNAL mem_we   : STD_LOGIC;
    SIGNAL mem_addr : STD_LOGIC_VECTOR(ADDR_BITS - 1 DOWNTO 0);
    SIGNAL ack_reg  : STD_LOGIC;
    SIGNAL err_reg  : STD_LOGIC;
    SIGNAL rst_n_in : STD_LOGIC;
    SIGNAL addr_ok  : BOOLEAN;

BEGIN

    rst_n_in <= NOT rst_i;

    addr_ok <= unsigned(adr_i) < (to_unsigned(DEPTH, 32) sll ADDR_LSB);
    mem_cs <= cyc_i AND stb_i;
    mem_we <= we_i;
    mem_addr <= adr_i(ADDR_BITS + ADDR_LSB - 1 DOWNTO ADDR_LSB);
    
    ack_o <= ack_reg;
    err_o <= err_reg;

    PROCESS (clk_i, rst_i)
    BEGIN
        IF rst_i = '1' THEN
            ack_reg <= '0';
            err_reg <= '0';
        ELSIF rising_edge(clk_i) THEN
            IF cyc_i = '1' AND stb_i = '1' AND ack_reg = '0' AND err_reg = '0' THEN
                IF addr_ok THEN
                    ack_reg <= '1';
                ELSE
                    err_reg <= '1';
                END IF;
            ELSE
                ack_reg <= '0';
                err_reg <= '0';
            END IF;
        END IF;
    END PROCESS;

    core_inst : sp_memory
    GENERIC MAP (
        WIDTH      => WIDTH,
        DEPTH      => DEPTH,
        TECHNOLOGY => TECHNOLOGY,
        PIPELINE   => PIPELINE,
        PARITY     => PARITY,
        ECC        => ECC
    )
    PORT MAP (
        clk            => clk_i,
        rst_n          => rst_n_in,
        cs             => mem_cs,
        we             => mem_we,
        addr           => mem_addr,
        wdata          => dat_i,
        wstrb          => sel_i,
        rdata          => dat_o,
        sleep          => sleep,
        bist_en        => bist_en,
        bist_done      => bist_done,
        bist_pass      => bist_pass,
        err_parity     => err_parity,
        err_ecc_single => err_ecc_single,
        err_ecc_double => err_ecc_double
    );

END ARCHITECTURE rtl;
