LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE sp_memory_util_pkg IS
    FUNCTION function_log2(n : NATURAL) RETURN NATURAL;
END PACKAGE;

PACKAGE BODY sp_memory_util_pkg IS
    FUNCTION function_log2(n : NATURAL) RETURN NATURAL IS
        VARIABLE i : NATURAL := 0;
        VARIABLE m : NATURAL := 1;
    BEGIN
        WHILE m < n LOOP
            i := i + 1;
            m := m * 2;
        END LOOP;
        RETURN i;
    END FUNCTION;
END PACKAGE BODY;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.sp_memory_util_pkg.ALL;

ENTITY sp_memory IS
    GENERIC (
        WIDTH      : INTEGER := 32;
        DEPTH      : INTEGER := 1024;
        TECHNOLOGY : STRING  := "GENERIC";
        PIPELINE   : INTEGER := 0;
        PARITY     : INTEGER := 0;
        ECC        : INTEGER := 0
    );
    PORT (
        clk            : IN  STD_LOGIC;
        rst_n          : IN  STD_LOGIC;
        cs             : IN  STD_LOGIC;
        we             : IN  STD_LOGIC;
        addr           : IN  STD_LOGIC_VECTOR((function_log2(DEPTH) - 1) DOWNTO 0);
        wdata          : IN  STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        wstrb          : IN  STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
        rdata          : OUT STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
        sleep          : IN  STD_LOGIC := '0';
        bist_en        : IN  STD_LOGIC := '0';
        bist_done      : OUT STD_LOGIC;
        bist_pass      : OUT STD_LOGIC;
        err_parity     : OUT STD_LOGIC;
        err_ecc_single : OUT STD_LOGIC;
        err_ecc_double : OUT STD_LOGIC
    );
END ENTITY sp_memory;

ARCHITECTURE rtl OF sp_memory IS

    -- Memory Array
    TYPE mem_type IS ARRAY (0 TO DEPTH - 1) OF STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
    SIGNAL mem : mem_type := (OTHERS => (OTHERS => '0'));
    
    -- Xilinx/Altera attributes
    ATTRIBUTE ram_style : STRING;
    ATTRIBUTE ram_style OF mem : SIGNAL IS "block";
    ATTRIBUTE ramstyle  : STRING;
    ATTRIBUTE ramstyle  OF mem : SIGNAL IS "M10K";

    -- Extra storage for Parity
    TYPE parity_mem_type IS ARRAY (0 TO DEPTH - 1) OF STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
    SIGNAL mem_parity : parity_mem_type := (OTHERS => (OTHERS => '0'));

    SIGNAL rdata_raw   : STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
    SIGNAL rdata_reg   : STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);
    SIGNAL rparity_raw : STD_LOGIC_VECTOR((WIDTH / 8) - 1 DOWNTO 0);
    SIGNAL err_parity_int : STD_LOGIC;
    SIGNAL err_parity_reg : STD_LOGIC;

    SIGNAL cs_int : STD_LOGIC;

    FUNCTION calc_parity(word : STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
        VARIABLE p : STD_LOGIC := '0';
    BEGIN
        FOR i IN word'RANGE LOOP
            p := p XOR word(i);
        END LOOP;
        RETURN p;
    END FUNCTION;

    -- BIST Controller Signals
    TYPE bist_state_type IS (BIST_S_IDLE, BIST_S_WRITE, BIST_S_READ, BIST_S_DONE);
    SIGNAL bist_state     : bist_state_type := BIST_S_IDLE;
    SIGNAL bist_addr_cnt  : UNSIGNED(addr'RANGE) := (OTHERS => '0');
    SIGNAL bist_active    : STD_LOGIC;
    SIGNAL bist_fail_reg  : STD_LOGIC := '0';

    FUNCTION get_pattern(w : INTEGER) RETURN STD_LOGIC_VECTOR IS
        VARIABLE p : STD_LOGIC_VECTOR(w - 1 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO w - 1 LOOP
            IF (i MOD 2) = 0 THEN
                p(i) := '1';
            ELSE
                p(i) := '0';
            END IF;
        END LOOP;
        RETURN p;
    END FUNCTION;
    CONSTANT B_PATTERN    : STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) := get_pattern(WIDTH);

    -- Muxed signals
    SIGNAL we_mux    : STD_LOGIC;
    SIGNAL addr_mux  : STD_LOGIC_VECTOR(addr'RANGE);
    SIGNAL wdata_mux : STD_LOGIC_VECTOR(wdata'RANGE);
    SIGNAL wstrb_mux : STD_LOGIC_VECTOR(wstrb'RANGE);

    -- ECC Signals
    CONSTANT ECC_BITS : INTEGER := 7; -- For 32-bit width
    TYPE ecc_array IS ARRAY (0 TO DEPTH - 1) OF STD_LOGIC_VECTOR(ECC_BITS - 1 DOWNTO 0);
    SIGNAL mem_ecc : ecc_array := (OTHERS => (OTHERS => '0'));
    SIGNAL recc_raw : STD_LOGIC_VECTOR(ECC_BITS - 1 DOWNTO 0);
    SIGNAL ecc_code_in : STD_LOGIC_VECTOR(ECC_BITS - 1 DOWNTO 0);
    SIGNAL syndrome : STD_LOGIC_VECTOR(5 DOWNTO 0);
    SIGNAL overall_parity_calc : STD_LOGIC;
    SIGNAL ecc_single_int : STD_LOGIC;
    SIGNAL ecc_double_int : STD_LOGIC;
    SIGNAL ecc_single_reg : STD_LOGIC := '0';
    SIGNAL ecc_double_reg : STD_LOGIC := '0';

BEGIN

    bist_active <= '1' WHEN (bist_state = BIST_S_WRITE OR bist_state = BIST_S_READ) ELSE '0';
    bist_done   <= '1' WHEN bist_state = BIST_S_DONE ELSE '0';
    bist_pass   <= NOT bist_fail_reg;

    cs_int <= (cs OR bist_active) AND (NOT sleep);

    we_mux    <= '1' WHEN (bist_state = BIST_S_WRITE) ELSE we        WHEN bist_active = '0' ELSE '0';
    addr_mux  <= STD_LOGIC_VECTOR(bist_addr_cnt)    WHEN bist_active = '1' ELSE addr;
    wdata_mux <= B_PATTERN                          WHEN bist_active = '1' ELSE wdata;
    wstrb_mux <= (OTHERS => '1')                    WHEN bist_active = '1' ELSE wstrb;

    -- ECC Encoding (32-bit)
    PROCESS(wdata_mux)
        VARIABLE ecc : STD_LOGIC_VECTOR(6 DOWNTO 0);
        VARIABLE p_all : STD_LOGIC;
    BEGIN
        ecc := (OTHERS => '0');
        IF WIDTH = 32 THEN
            ecc(0) := wdata_mux(0) XOR wdata_mux(1) XOR wdata_mux(3) XOR wdata_mux(4) XOR wdata_mux(6) XOR wdata_mux(8) XOR wdata_mux(10) XOR wdata_mux(11) XOR wdata_mux(13) XOR wdata_mux(15) XOR wdata_mux(17) XOR wdata_mux(19) XOR wdata_mux(21) XOR wdata_mux(23) XOR wdata_mux(25) XOR wdata_mux(26) XOR wdata_mux(28) XOR wdata_mux(30);
            ecc(1) := wdata_mux(0) XOR wdata_mux(2) XOR wdata_mux(3) XOR wdata_mux(5) XOR wdata_mux(6) XOR wdata_mux(9) XOR wdata_mux(10) XOR wdata_mux(12) XOR wdata_mux(13) XOR wdata_mux(16) XOR wdata_mux(17) XOR wdata_mux(20) XOR wdata_mux(21) XOR wdata_mux(24) XOR wdata_mux(25) XOR wdata_mux(27) XOR wdata_mux(28) XOR wdata_mux(31);
            ecc(2) := wdata_mux(1) XOR wdata_mux(2) XOR wdata_mux(3) XOR wdata_mux(7) XOR wdata_mux(8) XOR wdata_mux(9) XOR wdata_mux(10) XOR wdata_mux(14) XOR wdata_mux(15) XOR wdata_mux(16) XOR wdata_mux(17) XOR wdata_mux(22) XOR wdata_mux(23) XOR wdata_mux(24) XOR wdata_mux(25) XOR wdata_mux(29) XOR wdata_mux(30) XOR wdata_mux(31);
            ecc(3) := wdata_mux(4) XOR wdata_mux(5) XOR wdata_mux(6) XOR wdata_mux(7) XOR wdata_mux(8) XOR wdata_mux(9) XOR wdata_mux(10) XOR wdata_mux(18) XOR wdata_mux(19) XOR wdata_mux(20) XOR wdata_mux(21) XOR wdata_mux(22) XOR wdata_mux(23) XOR wdata_mux(24) XOR wdata_mux(25);
            ecc(4) := wdata_mux(11) XOR wdata_mux(12) XOR wdata_mux(13) XOR wdata_mux(14) XOR wdata_mux(15) XOR wdata_mux(16) XOR wdata_mux(17) XOR wdata_mux(18) XOR wdata_mux(19) XOR wdata_mux(20) XOR wdata_mux(21) XOR wdata_mux(22) XOR wdata_mux(23) XOR wdata_mux(24) XOR wdata_mux(25);
            ecc(5) := wdata_mux(26) XOR wdata_mux(27) XOR wdata_mux(28) XOR wdata_mux(29) XOR wdata_mux(30) XOR wdata_mux(31);
            
            p_all := '0';
            FOR i IN 0 TO 31 LOOP p_all := p_all XOR wdata_mux(i); END LOOP;
            FOR i IN 0 TO 5 LOOP p_all := p_all XOR ecc(i); END LOOP;
            ecc(6) := p_all;
        END IF;
        ecc_code_in <= ecc;
    END PROCESS;

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst_n = '0' THEN
                bist_state    <= BIST_S_IDLE;
                bist_addr_cnt <= (OTHERS => '0');
                bist_fail_reg <= '0';
            ELSE
                CASE bist_state IS
                    WHEN BIST_S_IDLE =>
                        IF bist_en = '1' THEN
                            bist_state    <= BIST_S_WRITE;
                            bist_addr_cnt <= (OTHERS => '0');
                            bist_fail_reg <= '0';
                        END IF;

                    WHEN BIST_S_WRITE =>
                        IF bist_addr_cnt = (DEPTH - 1) THEN
                            bist_state    <= BIST_S_READ;
                            bist_addr_cnt <= (OTHERS => '0');
                        ELSE
                            bist_addr_cnt <= bist_addr_cnt + 1;
                        END IF;

                    WHEN BIST_S_READ =>
                        IF rdata_raw /= B_PATTERN THEN
                            bist_fail_reg <= '1';
                        END IF;
                        IF bist_addr_cnt = (DEPTH - 1) THEN
                            bist_state <= BIST_S_DONE;
                        ELSE
                            bist_addr_cnt <= bist_addr_cnt + 1;
                        END IF;

                    WHEN BIST_S_DONE =>
                        IF bist_en = '0' THEN
                            bist_state <= BIST_S_IDLE;
                        END IF;
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF cs_int = '1' THEN
                -- Write Logic with Byte Enables
                IF we_mux = '1' THEN
                    FOR i IN 0 TO (WIDTH / 8) - 1 LOOP
                        IF wstrb_mux(i) = '1' THEN
                            mem(to_integer(unsigned(addr_mux)))((i * 8) + 7 DOWNTO i * 8) <= wdata_mux((i * 8) + 7 DOWNTO i * 8);
                            IF PARITY /= 0 THEN
                                mem_parity(to_integer(unsigned(addr_mux)))(i) <= calc_parity(wdata_mux((i * 8) + 7 DOWNTO i * 8));
                            END IF;
                        END IF;
                    END LOOP;
                    -- ECC is full word
                    IF ECC /= 0 AND wstrb_mux = (wstrb_mux'range => '1') THEN
                        mem_ecc(to_integer(unsigned(addr_mux))) <= ecc_code_in;
                    END IF;
                ELSE
                    -- Read Logic (Synchronous)
                    rdata_raw <= mem(to_integer(unsigned(addr_mux)));
                    IF PARITY /= 0 THEN
                        rparity_raw <= mem_parity(to_integer(unsigned(addr_mux)));
                    END IF;
                    IF ECC /= 0 THEN
                        recc_raw <= mem_ecc(to_integer(unsigned(addr_mux)));
                    END IF;
                END IF;
            END IF;

            -- Pipeline register
            IF rst_n = '0' THEN
                rdata_reg <= (OTHERS => '0');
                err_parity_reg <= '0';
                ecc_single_reg <= '0';
                ecc_double_reg <= '0';
            ELSE
                rdata_reg <= rdata_raw;
                err_parity_reg <= err_parity_int;
                ecc_single_reg <= ecc_single_int;
                ecc_double_reg <= ecc_double_int;
            END IF;
        END IF;
    END PROCESS;

    -- ECC Decoding
    PROCESS(rdata_raw, recc_raw)
        VARIABLE syn : STD_LOGIC_VECTOR(5 DOWNTO 0);
        VARIABLE p_all : STD_LOGIC;
    BEGIN
        syn := (OTHERS => '0');
        ecc_single_int <= '0';
        ecc_double_int <= '0';
        IF WIDTH = 32 AND ECC /= 0 THEN
            syn(0) := rdata_raw(0) XOR rdata_raw(1) XOR rdata_raw(3) XOR rdata_raw(4) XOR rdata_raw(6) XOR rdata_raw(8) XOR rdata_raw(10) XOR rdata_raw(11) XOR rdata_raw(13) XOR rdata_raw(15) XOR rdata_raw(17) XOR rdata_raw(19) XOR rdata_raw(21) XOR rdata_raw(23) XOR rdata_raw(25) XOR rdata_raw(26) XOR rdata_raw(28) XOR rdata_raw(30) XOR recc_raw(0);
            syn(1) := rdata_raw(0) XOR rdata_raw(2) XOR rdata_raw(3) XOR rdata_raw(5) XOR rdata_raw(6) XOR rdata_raw(9) XOR rdata_raw(10) XOR rdata_raw(12) XOR rdata_raw(13) XOR rdata_raw(16) XOR rdata_raw(17) XOR rdata_raw(20) XOR rdata_raw(21) XOR rdata_raw(24) XOR rdata_raw(25) XOR rdata_raw(27) XOR rdata_raw(28) XOR rdata_raw(31) XOR recc_raw(1);
            syn(2) := rdata_raw(1) XOR rdata_raw(2) XOR rdata_raw(3) XOR rdata_raw(7) XOR rdata_raw(8) XOR rdata_raw(9) XOR rdata_raw(10) XOR rdata_raw(14) XOR rdata_raw(15) XOR rdata_raw(16) XOR rdata_raw(17) XOR rdata_raw(22) XOR rdata_raw(23) XOR rdata_raw(24) XOR rdata_raw(25) XOR rdata_raw(29) XOR rdata_raw(30) XOR rdata_raw(31) XOR recc_raw(2);
            syn(3) := rdata_raw(4) XOR rdata_raw(5) XOR rdata_raw(6) XOR rdata_raw(7) XOR rdata_raw(8) XOR rdata_raw(9) XOR rdata_raw(10) XOR rdata_raw(18) XOR rdata_raw(19) XOR rdata_raw(20) XOR rdata_raw(21) XOR rdata_raw(22) XOR rdata_raw(23) XOR rdata_raw(24) XOR rdata_raw(25) XOR recc_raw(3);
            syn(4) := rdata_raw(11) XOR rdata_raw(12) XOR rdata_raw(13) XOR rdata_raw(14) XOR rdata_raw(15) XOR rdata_raw(16) XOR rdata_raw(17) XOR rdata_raw(18) XOR rdata_raw(19) XOR rdata_raw(20) XOR rdata_raw(21) XOR rdata_raw(22) XOR rdata_raw(23) XOR rdata_raw(24) XOR rdata_raw(25) XOR recc_raw(4);
            syn(5) := rdata_raw(26) XOR rdata_raw(27) XOR rdata_raw(28) XOR rdata_raw(29) XOR rdata_raw(30) XOR rdata_raw(31) XOR recc_raw(5);
            
            p_all := '0';
            FOR i IN 0 TO 31 LOOP p_all := p_all XOR rdata_raw(i); END LOOP;
            FOR i IN 0 TO 6 LOOP p_all := p_all XOR recc_raw(i); END LOOP;
            
            IF syn /= "000000" THEN
                IF p_all = '1' THEN
                    ecc_single_int <= '1';
                ELSE
                    ecc_double_int <= '1';
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- Parity check
    GEN_PAR : IF PARITY /= 0 GENERATE
        PCHK : PROCESS(rdata_raw, rparity_raw)
        BEGIN
            err_parity_int <= '0';
            FOR i IN 0 TO (WIDTH / 8) - 1 LOOP
                IF calc_parity(rdata_raw((i * 8) + 7 DOWNTO i * 8)) /= rparity_raw(i) THEN
                    err_parity_int <= '1';
                END IF;
            END LOOP;
        END PROCESS;
    ELSE GENERATE
        err_parity_int <= '0';
    END GENERATE;

    -- Output selection
    rdata <= rdata_reg WHEN PIPELINE /= 0 ELSE rdata_raw;
    err_parity <= err_parity_reg WHEN PIPELINE /= 0 ELSE err_parity_int;
    err_ecc_single <= ecc_single_reg WHEN PIPELINE /= 0 ELSE ecc_single_int;
    err_ecc_double <= ecc_double_reg WHEN PIPELINE /= 0 ELSE ecc_double_int;

END ARCHITECTURE rtl;
